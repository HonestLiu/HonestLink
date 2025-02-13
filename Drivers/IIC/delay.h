/**
 * @author HonestLiu
 * @Date 2025/2/9
 * */

#ifndef STM32F4_ST7789_DELAY_H
#define STM32F4_ST7789_DELAY_H

#ifndef _DELAY_H
#define _DELAY_H
#include "sys.h"

#define D_OS_SUPPORT 1

void delay_init(void);
void delay_ms(u16 nms);
void delay_us(u32 nus);
#endif

#endif //STM32F4_ST7789_DELAY_H
