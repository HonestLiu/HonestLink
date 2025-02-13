/**
 * @author HonestLiu
 * @Date 2025/2/8
 * @brief LCD逻辑层
 * */

#include "lcd.h"

/******************************************************************************
      函数说明：在指定区域填充颜色
      入口数据：xsta,ysta   起始坐标
                xend,yend   终止坐标
								color       要填充的颜色
      返回值：  无
******************************************************************************/
void LCD_Fill(u16 xsta, u16 ysta, u16 xend, u16 yend, u16 color) {
    u16 i, j;
#if SUPPORT_DMA == 1
    u16 buffer[(xend - xsta) * (yend - ysta)];
    for (i = 0; i < (xend - xsta) * (yend - ysta); i++) {
        buffer[i] = color;
    }

    LCD_Address_Set(xsta, ysta, xend - 1, yend - 1); // 设置显示范围
    LCD_Writ_Bus((u8*)buffer, (xend - xsta) * (yend - ysta) * 2); // 使用DMA传输数据
#else
    LCD_Address_Set(xsta, ysta, xend - 1, yend - 1);//设置显示范围
    for (i = ysta; i < yend; i++) {
        for (j = xsta; j < xend; j++) {
            LCD_WR_DATA(color);
        }
    }
#endif
}

void LCD_Color_Fill(u16 sx, u16 sy, u16 ex, u16 ey, lv_color_t *color) {
    u32 total_pixels = (ex - sx + 1) * (ey - sy + 1);
    LCD_Address_Set(sx, sy, ex, ey);
    LCD_Writ_Bus((u8 *) color, total_pixels * 2); // 使用DMA传输颜色数据
}

/******************************************************************************
      函数说明：在指定位置画点
      入口数据：x,y 画点坐标
                color 点的颜色
      返回值：  无
******************************************************************************/
void LCD_DrawPoint(u16 x, u16 y, u16 color) {
    LCD_Address_Set(x, y, x, y); // 设置光标位置
    LCD_WR_DATA(color);
}

/******************************************************************************
      函数说明：画线
      入口数据：x1,y1   起始坐标
                x2,y2   终止坐标
                color   线的颜色
      返回值：  无
******************************************************************************/
void LCD_DrawLine(u16 x1, u16 y1, u16 x2, u16 y2, u16 color) {
    u16 t;
    int xerr = 0, yerr = 0, delta_x, delta_y, distance;
    int incx, incy, uRow, uCol;
    delta_x = x2 - x1; // 计算坐标增量
    delta_y = y2 - y1;
    uRow = x1; // 画线起点坐标
    uCol = y1;
    if (delta_x > 0) incx = 1; // 设置单步方向
    else if (delta_x == 0) incx = 0; // 垂直线
    else {
        incx = -1;
        delta_x = -delta_x;
    }
    if (delta_y > 0) incy = 1;
    else if (delta_y == 0) incy = 0; // 水平线
    else {
        incy = -1;
        delta_y = -delta_y;
    }
    if (delta_x > delta_y) distance = delta_x; // 选取基本增量坐标轴
    else distance = delta_y;
    for (t = 0; t < distance + 1; t++) {
        LCD_DrawPoint(uRow, uCol, color); // 画点
        xerr += delta_x;
        yerr += delta_y;
        if (xerr > distance) {
            xerr -= distance;
            uRow += incx;
        }
        if (yerr > distance) {
            yerr -= distance;
            uCol += incy;
        }
    }
}

/******************************************************************************
      函数说明：画矩形
      入口数据：x1,y1   起始坐标
                x2,y2   终止坐标
                color   矩形的颜色
      返回值：  无
******************************************************************************/
void LCD_DrawRectangle(u16 x1, u16 y1, u16 x2, u16 y2, u16 color) {
    LCD_DrawLine(x1, y1, x2, y1, color);
    LCD_DrawLine(x1, y1, x1, y2, color);
    LCD_DrawLine(x1, y2, x2, y2, color);
    LCD_DrawLine(x2, y1, x2, y2, color);
}

/******************************************************************************
      函数说明：画圆
      入口数据：x0,y0   圆心坐标
                r       半径
                color   圆的颜色
      返回值：  无
******************************************************************************/
void Draw_Circle(u16 x0, u16 y0, u8 r, u16 color) {
    int a, b;
    a = 0;
    b = r;
    while (a <= b) {
        LCD_DrawPoint(x0 - b, y0 - a, color); // 3
        LCD_DrawPoint(x0 + b, y0 - a, color); // 0
        LCD_DrawPoint(x0 - a, y0 + b, color); // 1
        LCD_DrawPoint(x0 - a, y0 - b, color); // 2
        LCD_DrawPoint(x0 + b, y0 + a, color); // 4
        LCD_DrawPoint(x0 + a, y0 - b, color); // 5
        LCD_DrawPoint(x0 + a, y0 + b, color); // 6
        LCD_DrawPoint(x0 - b, y0 + a, color); // 7
        a++;
        if ((a * a + b * b) > (r * r)) { // 判断要画的点是否过远
            b--;
        }
    }
}

/******************************************************************************
      函数说明：显示数字
      入口数据：m底数，n指数
      返回值：  无
******************************************************************************/
u32 mypow(u8 m, u8 n) {
    u32 result = 1;
    while (n--) result *= m;
    return result;
}







