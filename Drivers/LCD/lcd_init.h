/**
 * @author HonestLiu
 * @Date 2025/2/8
 * @note CubeMX配置SPI1为高速模式，分频配置为1
 * */

#ifndef STM32F4_ST7789_LCD_INIT_H
#define STM32F4_ST7789_LCD_INIT_H

#include "main.h"
#include "gpio.h"

#define USE_HORIZONTAL 1  //设置横屏或者竖屏显示 0或1为竖屏 2或3为横屏
#define HW_SPI 1//使用硬件spi的时候就有把这取消注释
#define SUPPORT_DMA 1//支持DMA
#define SUPPORT_LVGL 1//是否LVGL专用函数支持


#if USE_HORIZONTAL == 0 || USE_HORIZONTAL == 1
#define LCD_W 240
#define LCD_H 280
#else
#define LCD_W 280
#define LCD_H 240
#endif

#if HW_SPI == 1

#include "spi.h"

#define usr_lcd_spi hspi1

#endif

#define u8 uint8_t
#define u16 uint16_t
#define u32 uint32_t

//-----------------LCD端口定义----------------
#define LCD_RST           RST_GPIO_Port,RST_Pin   //PA9
#define LCD_DC           DC_GPIO_Port,DC_Pin     //PA8
#define LCD_CS           CS_GPIO_Port,CS_Pin     //PB6
#define LCD_BL           TIM3->CCR2              //PC7


#define LCD_RES_Clr()  HAL_GPIO_WritePin(LCD_RST, GPIO_PIN_RESET)
#define LCD_RES_Set()  HAL_GPIO_WritePin(LCD_RST, GPIO_PIN_SET)

#define LCD_DC_Clr()   HAL_GPIO_WritePin(LCD_DC, GPIO_PIN_RESET)
#define LCD_DC_Set()   HAL_GPIO_WritePin(LCD_DC, GPIO_PIN_SET)

#define LCD_CS_Clr()   HAL_GPIO_WritePin(LCD_CS, GPIO_PIN_RESET)
#define LCD_CS_Set()   HAL_GPIO_WritePin(LCD_CS, GPIO_PIN_SET)

#define LCD_Set_PWM(_Value)     LCD_BL = _Value


void LCD_GPIO_Init(void);//初始化GPIO
void LCD_Writ_Bus(u8 *dat, uint16_t length);//模拟SPI时序
void LCD_WR_DATA8(u8 dat);//写入一个字节
void LCD_WR_DATA(u16 dat);//写入两个字节
void LCD_WR_REG(u8 dat);//写入一个指令
void LCD_Address_Set(u16 x1, u16 y1, u16 x2, u16 y2);//设置坐标函数
void LCD_Init(void);//LCD初始化

#endif //STM32F4_ST7789_LCD_INIT_H
