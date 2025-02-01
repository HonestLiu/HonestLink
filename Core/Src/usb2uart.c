/**
 * @brief USB转串口的处理
 * @author HonestLiu
 * @date 2025.2.1 15:22
 * */

#include "main.h"
#include "dap_main.h"
#include "usart.h"

// CDC UART通过DMA发送数据函数
void chry_dap_usb2uart_uart_send_bydma(uint8_t *data, uint16_t len) {
    HAL_UART_Transmit_DMA(&huart3, data, len);//通过DMA发送数据
    // 记录要发送的数据长度
    g_uart_tx_transfer_length = len;
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart) {
    if (huart->Instance == USART3) {
        chry_dap_usb2uart_uart_send_complete(g_uart_tx_transfer_length);
    }
}





