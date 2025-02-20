/**
 * @author HonestLiu
 * @date 2025.2.20
 * */
#include "gui_data_update.h"
#include "lv_lib_100ask.h"
#include "tim.h"


/**
 * @brief 更新离线下载数据,数据来源于离线下载线程
 * */
extern struct offline_download_info_t offline_download_info;
extern char choose_device_path[LV_100ASK_FILE_EXPLORER_PATH_MAX_LEN];
extern char choose_firmware_bin_path[LV_100ASK_FILE_EXPLORER_PATH_MAX_LEN];
extern uint8_t choose_device_path_flag;
extern uint8_t choose_firmware_bin_path_flag;

void update_offline_download_info(void)//更新离线下载数据
{
    static struct offline_download_info_t last_offline_download_info;
    char _temp_char[10] = {0};
    if (choose_device_path_flag == 1) {
        if (strcmp(lv_label_get_text(ui_ChipLabel), "Select Chip") == 0) {//如果其未更新，对其进行更新
            lv_label_set_text(ui_ChipLabel, choose_device_path);
        }
    }
    if (choose_firmware_bin_path_flag == 1) {
        if (strcmp(lv_label_get_text(ui_FirmWareLabel), "Select firmware") == 0) {
            lv_label_set_text(ui_FirmWareLabel, choose_firmware_bin_path);
        }
    }

    if (last_offline_download_info.progress != offline_download_info.progress) {
        lv_bar_set_value(ui_DownBar, offline_download_info.progress, LV_ANIM_ON);
        snprintf(_temp_char,
                 sizeof(_temp_char), "%d%%",
                 offline_download_info.progress);
        lv_label_set_text(ui_DownProgress, _temp_char);
    }

    if (strncmp(last_offline_download_info.info_message, offline_download_info.info_message,
                sizeof(offline_download_info.info_message)) != 0) {
        lv_label_set_text(ui_DownInfo, offline_download_info.info_message);
    }
    memcpy(&last_offline_download_info, &offline_download_info, sizeof(last_offline_download_info));
}

uint16_t ui_period = 0;//PWM周期
uint16_t ui_pulse = 0; //PWM脉宽
void update_pwd(void) {
    static uint16_t last_ui_period = 0;
    static uint16_t last_ui_pulse = 0;
    uint32_t freq;
    uint32_t pwm_duty;
    char _temp_char[10] = {0};

    if (ui_period != 0 && ui_pulse != 0) {
        if (last_ui_period != ui_period) {
            freq = HAL_RCC_GetPCLK1Freq() / (htim9.Init.Prescaler + 1) / (ui_period + 1);
            snprintf(_temp_char, sizeof(_temp_char), "%luMHz", freq);
            lv_label_set_text(ui_PWMFreqLabel, _temp_char);
            last_ui_period = ui_period;

            // 更新TIM9的PWM周期
            __HAL_TIM_SET_AUTORELOAD(&htim9, ui_period - 1);
        }
        if (last_ui_pulse != ui_pulse) {
            pwm_duty = (ui_pulse * 100) / ui_period;
            snprintf(_temp_char, sizeof(_temp_char), "%lu%%", pwm_duty);
            lv_label_set_text(ui_PWMDutyLabel, _temp_char);
            last_ui_pulse = ui_pulse;

            // 更新TIM9的PWM脉宽
            __HAL_TIM_SET_COMPARE(&htim9, TIM_CHANNEL_1, ui_pulse);
        }

        // 仅在首次调用时启动定时器
        static uint8_t timer_started = 0;
        if (!timer_started) {
            HAL_TIM_PWM_Start(&htim9, TIM_CHANNEL_1);
            timer_started = 1;
        }
    }
}



