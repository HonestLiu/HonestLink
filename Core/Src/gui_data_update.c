//
// Created by Hones on 25-2-20.
//
#include "gui_data_update.h"
#include "lv_lib_100ask.h"


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
        if (strcmp(lv_label_get_text(ui_ChipLabel), "Select Chip") == 0){//如果其未更新，对其进行更新
            lv_label_set_text(ui_ChipLabel, choose_device_path);
        }
    }
    if (choose_firmware_bin_path_flag == 1) {
        if (strcmp(lv_label_get_text(ui_FirmWareLabel), "Select firmware") == 0) {
            lv_label_set_text(ui_FirmWareLabel, choose_firmware_bin_path);
        }
    }

/*    if (last_offline_download_info.success_download_count
        != offline_download_info.success_download_count)
    {
        snprintf(_temp_char,
                 sizeof(_temp_char), "%d",
                 offline_download_info.success_download_count);
        lv_label_set_text(ui_SuccessCount, _temp_char);
    }*/
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



