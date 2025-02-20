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
#include "lvgl.h"
#include "lv_port_disp.h"
#include "lv_port_indev.h"
#include "cst816.h"
#include "fatfs.h"
#include "ui.h"
#include "lv_lib_100ask.h"
#include "swd_download_file.h"
#include "pageManager.h"
#include "gui_data_update.h"
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


QueueHandle_t offline_download_sem;//离线下载二值信号量句柄
extern char choose_device_path[LV_100ASK_FILE_EXPLORER_PATH_MAX_LEN];
extern char choose_firmware_bin_path[LV_100ASK_FILE_EXPLORER_PATH_MAX_LEN];

extern int32_t swd_download_from_file(char *_file_path);

extern int8_t swd_download_update_flash_algo(char *_file_path);

/* USER CODE END Variables */
osThreadId DAPTaskHandle;
osThreadId LEDTaskHandle;
osThreadId LVGLTaskHandle;
osThreadId OfflineDownloadHandle;
osThreadId ToolsTaskHandle;

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


void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName) {
    // 堆栈溢出处理代码
    printf("Stack overflow in task: %s\n", pcTaskName);
    while (1);
}

/* USER CODE END FunctionPrototypes */

void DAPFun(void const * argument);
void LEDTaskFun(void const * argument);
void LvglStartTask(void const * argument);
void OfflineDownloadStartTask(void const * argument);
void ToolsStartTask(void const * argument);

void MX_FREERTOS_Init(void); /* (MISRA C 2004 rule 8.1) */

/* GetIdleTaskMemory prototype (linked to static allocation support) */
void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize );

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
    HAL_Delay_us_init(168);
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
  osThreadDef(DAPTask, DAPFun, osPriorityNormal, 0, 1024);
  DAPTaskHandle = osThreadCreate(osThread(DAPTask), NULL);

  /* definition and creation of LEDTask */
  osThreadDef(LEDTask, LEDTaskFun, osPriorityIdle, 0, 128);
  LEDTaskHandle = osThreadCreate(osThread(LEDTask), NULL);

  /* definition and creation of LVGLTask */
  osThreadDef(LVGLTask, LvglStartTask, osPriorityNormal, 0, 3072);
  LVGLTaskHandle = osThreadCreate(osThread(LVGLTask), NULL);

  /* definition and creation of OfflineDownload */
  osThreadDef(OfflineDownload, OfflineDownloadStartTask, osPriorityNormal, 0, 2048);
  OfflineDownloadHandle = osThreadCreate(osThread(OfflineDownload), NULL);

  /* definition and creation of ToolsTask */
  osThreadDef(ToolsTask, ToolsStartTask, osPriorityNormal, 0, 1024);
  ToolsTaskHandle = osThreadCreate(osThread(ToolsTask), NULL);

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
void DAPFun(void const * argument)
{
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

/* USER CODE BEGIN Header_LEDTaskFun */
/**
* @brief Function implementing the LEDTask thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_LEDTaskFun */
void LEDTaskFun(void const * argument)
{
  /* USER CODE BEGIN LEDTaskFun */
    /* Infinite loop */
    for (;;) {
        HAL_GPIO_TogglePin(LED1_GPIO_Port, LED_Pin);
        osDelay(1000);
    }
  /* USER CODE END LEDTaskFun */
}

/* USER CODE BEGIN Header_LvglStartTask */
/*
void lv_list_demo() {
    lv_obj_t *list_obj = lv_obj_create(lv_scr_act()); // 创建列表部件背景
    lv_obj_t *list = lv_list_create(list_obj);        // 创建列表

    lv_obj_set_size(list_obj, 250, 300);
    lv_obj_center(list_obj);        // 设置部件居中
    lv_obj_update_layout(list_obj); // 手动更新部件参数

    lv_obj_set_align(list, LV_ALIGN_CENTER);
    lv_list_add_text(list, "Setting"); // 为列表添加文本
    lv_obj_set_size(list, 200, 200);

    lv_obj_t *btn1 = lv_list_add_btn(list, LV_SYMBOL_WIFI, "WiFi");
    lv_obj_add_event_cb(btn1, NULL, LV_EVENT_CLICKED, NULL);
    lv_obj_t *btn2 = lv_list_add_btn(list, LV_SYMBOL_BLUETOOTH, "BlueTooth");
    lv_obj_add_event_cb(btn2, NULL, LV_EVENT_CLICKED, NULL);
    lv_obj_t *btn3 = lv_list_add_btn(list, LV_SYMBOL_IMAGE, "Image");
    lv_obj_add_event_cb(btn3, NULL, LV_EVENT_CLICKED, NULL);
    lv_obj_t *btn4 = lv_list_add_btn(list, LV_SYMBOL_KEYBOARD, "KeyBoard");
    lv_obj_add_event_cb(btn4, NULL, LV_EVENT_CLICKED, NULL);
    lv_obj_t *btn5 = lv_list_add_btn(list, LV_SYMBOL_DIRECTORY, "Directory");
    lv_obj_add_event_cb(btn5, NULL, LV_EVENT_CLICKED, NULL);
}

*/

FATFS fs; //工作空间
void InitFatFas(void) {
    int retSD = f_mount(&fs, "0:", 1);
    if (retSD) {
        printf("mount error : %d \r\n", retSD);
    } else
        printf("mount success!!! \r\n");
}

/**
* @brief LVGL thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_LvglStartTask */
void LvglStartTask(void const * argument)
{
  /* USER CODE BEGIN LvglStartTask */
    CST816_GPIO_Init();//触控初始化
    CST816_RESET();//触控复位
    lv_init();
    lv_port_disp_init();
    lv_port_indev_init();

    //lv_list_demo();
    SD_Driver.disk_initialize(0);//初始化SD卡
    InitFatFas();//初始化FATFS

    ui_init();

    /* Infinite loop */
    //获取当前页面的ID，判断处于什么页面，然后对应更新什么数据，处于什么页面干什么事，节省资源
    for (;;) {
        lv_task_handler();
        switch (Page_Get_NowPage()->id) {
            case HomePage:
                break;
            case PinMapPage:
                break;
            case OfflineDAPPage: {
                update_offline_download_info();//更新离线下载的信息
                break;
            }
            case PWMPage: {
                update_pwd();
                break;
            }
            case ElectricPage:
                break;
            case ServosPage: {
                update_Servo();
                break;
            }
            case LogicPage:
                break;
            case DACPage:
                break;
            case FilePage:
                break;
            default:
                break;
        }
        osDelay(1);
    }
  /* USER CODE END LvglStartTask */
}

/* USER CODE BEGIN Header_OfflineDownloadStartTask */

/**
* @brief Function implementing the OfflineDownload thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_OfflineDownloadStartTask */
void OfflineDownloadStartTask(void const * argument)
{
  /* USER CODE BEGIN OfflineDownloadStartTask */
    offline_download_sem = xSemaphoreCreateBinary();//创建二至信号量
    _offline_download_info_init();//初始化下载信息
    if (offline_download_sem != NULL) {
        printf("Semaphore Create Succeed!!\r\n");
    } else {
        printf("Semaphore Create Error!!\r\n");
        return;
    }
    /* Infinite loop */
    for (;;) {
        xSemaphoreTake(offline_download_sem, portMAX_DELAY);//永久方式等待信号量
        printf("Start Offline Download!!\r\n");
        printf("Choose Device Path: %s\r\n", choose_device_path);
        printf("Choose Firmware Bin Path: %s\r\n", choose_firmware_bin_path);
        osDelay(100);
        swd_download_update_flash_algo(choose_device_path);//根据选择的设备地址更新SWD下载的Flash算法
        if (swd_download_from_file(choose_firmware_bin_path) == -1) {//根据选择的固件进行离线下载
            printf("Download Error!!\r\n");
        } else {
            printf("Download Succeed!!\r\n");
        }
        osDelay(1);
    }
  /* USER CODE END OfflineDownloadStartTask */
}

/* USER CODE BEGIN Header_ToolsStartTask */
/**
* @brief Function implementing the ToolsTask thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_ToolsStartTask */
void ToolsStartTask(void const * argument)
{
  /* USER CODE BEGIN ToolsStartTask */
    /* Infinite loop */
    for (;;) {
        osDelay(1);
    }
  /* USER CODE END ToolsStartTask */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */

/* USER CODE END Application */
