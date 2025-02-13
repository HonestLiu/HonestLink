/**
 * @author HonestLiu
 * @Date 2025/2/13
 * */

#include "lcd_init.h"
#include "tim.h"


#if SUPPORT_DMA == 1
// DMA完成标志
volatile uint8_t dma_transfer_complete = 0;

// DMA传输完成回调函数
void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi) {
    if (hspi == &usr_lcd_spi) {
        dma_transfer_complete = 1;
    }
}

#endif

void LCD_GPIO_Init(void) {
    // 初始化GPIO
}

void LCD_Writ_Bus(u8 *dat, uint16_t length) {
    LCD_CS_Clr();
#if SUPPORT_DMA == 1
    dma_transfer_complete = 0;
    HAL_SPI_Transmit_DMA(&usr_lcd_spi, dat, length);
    while (!dma_transfer_complete); // 等待DMA传输完成
#else
    HAL_SPI_Transmit(&usr_lcd_spi, dat, length, 0x1000);
#endif
    LCD_CS_Set();
}

void LCD_WR_DATA8(u8 dat) {
#if SUPPORT_DMA == 1
    LCD_Writ_Bus(&dat, 1);
#else
    LCD_Writ_Bus(&dat,1);
#endif
}

void LCD_WR_DATA(u16 dat) {
    u8 data[2] = {dat >> 8, dat};
    LCD_Writ_Bus(data, 2);
}

void LCD_WR_REG(u8 dat) {
    LCD_DC_Clr();
    LCD_Writ_Bus(&dat, 1);
    LCD_DC_Set();
}

void LCD_Address_Set(u16 x1, u16 y1, u16 x2, u16 y2) {
    if (USE_HORIZONTAL == 0) {
        LCD_WR_REG(0x2a); // 列地址设置
        LCD_WR_DATA(x1);
        LCD_WR_DATA(x2);
        LCD_WR_REG(0x2b); // 行地址设置
        LCD_WR_DATA(y1 + 20);
        LCD_WR_DATA(y2 + 20);
        LCD_WR_REG(0x2c); // 储存器写
    } else if (USE_HORIZONTAL == 1) {
        LCD_WR_REG(0x2a); // 列地址设置
        LCD_WR_DATA(x1);
        LCD_WR_DATA(x2);
        LCD_WR_REG(0x2b); // 行地址设置
        LCD_WR_DATA(y1 + 20);
        LCD_WR_DATA(y2 + 20);
        LCD_WR_REG(0x2c); // 储存器写
    } else if (USE_HORIZONTAL == 2) {
        LCD_WR_REG(0x2a); // 列地址设置
        LCD_WR_DATA(x1 + 20);
        LCD_WR_DATA(x2 + 20);
        LCD_WR_REG(0x2b); // 行地址设置
        LCD_WR_DATA(y1);
        LCD_WR_DATA(y2);
        LCD_WR_REG(0x2c); // 储存器写
    } else {
        LCD_WR_REG(0x2a); // 列地址设置
        LCD_WR_DATA(x1 + 20);
        LCD_WR_DATA(x2 + 20);
        LCD_WR_REG(0x2b); // 行地址设置
        LCD_WR_DATA(y1);
        LCD_WR_DATA(y2);
        LCD_WR_REG(0x2c); // 储存器写
    }
}

void LCD_SetBackLight(uint16_t Value) {
    LCD_Set_PWM(Value);
}

void LCD_Init(void) {
    LCD_GPIO_Init(); // 初始化GPIO

    LCD_RES_Clr(); // 复位
    HAL_Delay(100);
    LCD_RES_Set();
    HAL_Delay(100);

    // 打开背光
    HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2);

    // 设置背光
    LCD_SetBackLight(80);
    HAL_Delay(100);

    //************* Start Initial Sequence **********//
    LCD_WR_REG(0x11); // Sleep out
    HAL_Delay(120); // Delay 120ms

    //************* Start Initial Sequence **********//
    LCD_WR_REG(0x36);
    if (USE_HORIZONTAL == 0) LCD_WR_DATA8(0x00);
    else if (USE_HORIZONTAL == 1) LCD_WR_DATA8(0xC0);
    else if (USE_HORIZONTAL == 2) LCD_WR_DATA8(0x70);
    else LCD_WR_DATA8(0xA0);

    LCD_WR_REG(0x3A);
    LCD_WR_DATA8(0x05);

    LCD_WR_REG(0xB2);
    LCD_WR_DATA8(0x0C);
    LCD_WR_DATA8(0x0C);
    LCD_WR_DATA8(0x00);
    LCD_WR_DATA8(0x33);
    LCD_WR_DATA8(0x33);

    LCD_WR_REG(0xB7);
    LCD_WR_DATA8(0x35);

    LCD_WR_REG(0xBB);
    LCD_WR_DATA8(0x32); // Vcom=1.35V

    LCD_WR_REG(0xC2);
    LCD_WR_DATA8(0x01);

    LCD_WR_REG(0xC3);
    LCD_WR_DATA8(0x15); // GVDD=4.8V  颜色深度

    LCD_WR_REG(0xC4);
    LCD_WR_DATA8(0x20); // VDV, 0x20:0v

    LCD_WR_REG(0xC6);
    LCD_WR_DATA8(0x0F); // 0x0F:60Hz

    LCD_WR_REG(0xD0);
    LCD_WR_DATA8(0xA4);
    LCD_WR_DATA8(0xA1);

    LCD_WR_REG(0xE0);
    LCD_WR_DATA8(0xD0);
    LCD_WR_DATA8(0x08);
    LCD_WR_DATA8(0x0E);
    LCD_WR_DATA8(0x09);
    LCD_WR_DATA8(0x09);
    LCD_WR_DATA8(0x05);
    LCD_WR_DATA8(0x31);
    LCD_WR_DATA8(0x33);
    LCD_WR_DATA8(0x48);
    LCD_WR_DATA8(0x17);
    LCD_WR_DATA8(0x14);
    LCD_WR_DATA8(0x15);
    LCD_WR_DATA8(0x31);
    LCD_WR_DATA8(0x34);

    LCD_WR_REG(0xE1);
    LCD_WR_DATA8(0xD0);
    LCD_WR_DATA8(0x08);
    LCD_WR_DATA8(0x0E);
    LCD_WR_DATA8(0x09);
    LCD_WR_DATA8(0x09);
    LCD_WR_DATA8(0x15);
    LCD_WR_DATA8(0x31);
    LCD_WR_DATA8(0x33);
    LCD_WR_DATA8(0x48);
    LCD_WR_DATA8(0x17);
    LCD_WR_DATA8(0x14);
    LCD_WR_DATA8(0x15);
    LCD_WR_DATA8(0x31);
    LCD_WR_DATA8(0x34);
    LCD_WR_REG(0x21);

    LCD_WR_REG(0x29);
}