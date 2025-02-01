/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * File Name          : freertos.c
  * Description        : Code for freertos applications
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "dap_main.h"
#include "DAP.h"
//#include "swd_download_file.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */
#define DAP_THREAD_PRIORITY         30
#define DAP_THREAD_TIMESLICE        20

static uint32_t IDCODE = 0x00000000;
char volatile current_dap_mode = 0;//DAP当前的模式

extern DAP_Data_t DAP_Data;//DAP数据结构体
extern chry_ringbuffer_t g_uartrx;

extern uint8_t swd_read_idcode(uint32_t *id);

void soft_reset_target(void);

/* USER CODE END Variables */
osThreadId DAPTaskHandle;
osThreadId UartTaskHandle;

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */

/**
 * @brief 用于处理ID超时的情况的函数
 * */
static void ID_timeout(void) {
    static uint32_t id = 0;
    if (current_dap_mode == 1) {
        //当mode为SWD时，尝试读取IDCODE
        if (swd_read_idcode(&id) == 0) {
            if (id != IDCODE) {
                //IDCODE发生变化，说明目标芯片被重新上电，更新存储IDCODE
                IDCODE = id;
            } else {
                //读取的ID代码与当前存储的ID代码相同，将ID代码清零并重新初始化SWD调试接口
                IDCODE = 0x00000000;
                swd_init_debug();
            }
        }
    }
}

/*
 * @brief 用于对目标芯片执行软复位操作
 * */
void soft_reset_target(void) {
    //软复位目标芯片
    static uint32_t val;
    if (current_dap_mode == 1) {
        //当mode为1时，尝试从地址 0xe000e000 + 0x0D0C 读取一个32位的值到val变量中
        if (!swd_read_word((0xe000e000) + 0x0D0C, &val)) {
            //如果读取失败，返回
            return;
        }

        if (!swd_write_word((0xe000e000) + 0x0D0C,
                            0x05FA0000 | (val & SCB_AIRCR_PRIGROUP_Msk)
                            | 0x00000004)) {
            return;
        }
    }
}

/* USER CODE END FunctionPrototypes */

void DAPFun(void const *argument);

void UartTaskFun(void const *argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/* GetIdleTaskMemory prototype (linked to static allocation support) */
void vApplicationGetIdleTaskMemory(StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer,
                                   uint32_t *pulIdleTaskStackSize);

/* USER CODE BEGIN GET_IDLE_TASK_MEMORY */
static StaticTask_t xIdleTaskTCBBuffer;
static StackType_t xIdleStack[configMINIMAL_STACK_SIZE];

void vApplicationGetIdleTaskMemory(StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer,
                                   uint32_t *pulIdleTaskStackSize) {
    *ppxIdleTaskTCBBuffer = &xIdleTaskTCBBuffer;
    *ppxIdleTaskStackBuffer = &xIdleStack[0];
    *pulIdleTaskStackSize = configMINIMAL_STACK_SIZE;
    /* place for user code */
}
/* USER CODE END GET_IDLE_TASK_MEMORY */

/**
  * @brief  FreeRTOS initialization
  * @param  None
  * @retval None
  */
void MX_FREERTOS_Init(void) {
    /* USER CODE BEGIN Init */
    chry_dap_init(0, USB_OTG_FS_PERIPH_BASE);//初始化DAP
    /* USER CODE END Init */

    /* USER CODE BEGIN RTOS_MUTEX */
    /* add mutexes, ... */
    /* USER CODE END RTOS_MUTEX */

    /* USER CODE BEGIN RTOS_SEMAPHORES */
    /* add semaphores, ... */
    /* USER CODE END RTOS_SEMAPHORES */

    /* USER CODE BEGIN RTOS_TIMERS */
    /* start timers, add new ones, ... */
    /* USER CODE END RTOS_TIMERS */

    /* USER CODE BEGIN RTOS_QUEUES */
    /* add queues, ... */
    /* USER CODE END RTOS_QUEUES */

    /* Create the thread(s) */
    /* definition and creation of DAPTask */
    osThreadDef(DAPTask, DAPFun, osPriorityNormal, 0, 128);
    DAPTaskHandle = osThreadCreate(osThread(DAPTask), NULL);

    /* definition and creation of UartTask */
    osThreadDef(UartTask, UartTaskFun, osPriorityIdle, 0, 128);
    UartTaskHandle = osThreadCreate(osThread(UartTask), NULL);

    /* USER CODE BEGIN RTOS_THREADS */
    /* add threads, ... */
    /* USER CODE END RTOS_THREADS */

}

/* USER CODE BEGIN Header_DAPFun */
/**
  * @brief  DAPLink线程的处理函数
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_DAPFun */
void DAPFun(void const *argument) {
    /* USER CODE BEGIN DAPFun */
    /* Infinite loop */
    for (;;) {
        chry_dap_handle();//处理DAP数据的函数
        chry_dap_usb2uart_handle();//处理USB转串口数据的函数
        if (xTaskGetTickCount() % 300 == 0) {
            //每300ms检查一次IDCODE
            ID_timeout();
        }
    }
    /* USER CODE END DAPFun */
}

/* USER CODE BEGIN Header_UartTaskFun */
/**
* @brief Function implementing the UartTask thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_UartTaskFun */
void UartTaskFun(void const *argument) {
    /* USER CODE BEGIN UartTaskFun */
    /* Infinite loop */
    for (;;) {
        osDelay(1);
    }
    /* USER CODE END UartTaskFun */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

/* USER CODE END Application */
