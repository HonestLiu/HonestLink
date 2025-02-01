/*
* Change Logs:
* Date           Author       Notes
* 2024-04-23     LCKFB-yzh    first version
*/

#ifndef __SWD_DOWLNLOAD_FILE_H__
#define __SWD_DOWLNLOAD_FILE_H__


// 定义结构体来存储脱机下载信息
struct offline_download_info_t {
    uint16_t success_download_count; // 成功下载次数
    char info_message[20]; // 错误提示信息，最多20个字符
    uint8_t progress; // 进度指示，以百分比为单位
};


uint16_t get_offline_success_download_count(void);
char *get_offline_info_message(void);
uint8_t get_offline_progress(void);

int8_t is_on_offline_swd_downloading(void);

#endif /* __SWD_DOWLNLOAD_FILE_H__ */
