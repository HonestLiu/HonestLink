/**
 * @brief DAPLink的主函数
 * @author HonestLiu
 * @date 2025.2.1 15:22
 * */
#ifndef F4_CHERRYDAP_DAP_MAIN_H
#define F4_CHERRYDAP_DAP_MAIN_H

#include "usbd_core.h"
#include "usbd_cdc.h"
#include "usbd_msc.h"
#include "chry_ringbuffer.h"

#include "swd_host.h"
#include "DAP_config.h"
#include "DAP.h"

#define HONEST_LINK_VERSION_MAJOR '1'
#define HONEST_LINK_VERSION_MINOR '0'
#define HONEST_LINK_VERSION_PATCH '1'

extern chry_ringbuffer_t g_uartrx;//串口接收环形缓冲区
extern chry_ringbuffer_t g_usbrx;//USB接收环形缓冲区

void chry_dap_usb2uart_handle(void);//USB转串口处理函数
void chry_dap_handle(void);//DAP处理函数

void chry_dap_init(uint8_t busid, uintptr_t reg_base);//DAP初始化函数,在board.c中初始化

void serial_send_data(uint8_t *data, uint16_t len);

void chry_dap_usb2uart_uart_send_complete(uint32_t size);

void chry_dap_usb2uart_uart_config_callback(struct cdc_line_coding *line_coding);

#endif
