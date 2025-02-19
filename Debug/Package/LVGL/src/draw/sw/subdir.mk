################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/draw/sw/lv_draw_sw.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_arc.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_blend.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_dither.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_gradient.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_img.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_layer.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_letter.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_line.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_polygon.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_rect.c \
../Package/LVGL/src/draw/sw/lv_draw_sw_transform.c 

OBJS += \
./Package/LVGL/src/draw/sw/lv_draw_sw.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_arc.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_blend.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_dither.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_gradient.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_img.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_layer.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_letter.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_line.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_polygon.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_rect.o \
./Package/LVGL/src/draw/sw/lv_draw_sw_transform.o 

C_DEPS += \
./Package/LVGL/src/draw/sw/lv_draw_sw.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_arc.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_blend.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_dither.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_gradient.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_img.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_layer.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_letter.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_line.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_polygon.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_rect.d \
./Package/LVGL/src/draw/sw/lv_draw_sw_transform.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/draw/sw/%.o Package/LVGL/src/draw/sw/%.su Package/LVGL/src/draw/sw/%.cyclo: ../Package/LVGL/src/draw/sw/%.c Package/LVGL/src/draw/sw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -I../Package/PageManager -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-draw-2f-sw

clean-Package-2f-LVGL-2f-src-2f-draw-2f-sw:
	-$(RM) ./Package/LVGL/src/draw/sw/lv_draw_sw.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw.d ./Package/LVGL/src/draw/sw/lv_draw_sw.o ./Package/LVGL/src/draw/sw/lv_draw_sw.su ./Package/LVGL/src/draw/sw/lv_draw_sw_arc.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_arc.d ./Package/LVGL/src/draw/sw/lv_draw_sw_arc.o ./Package/LVGL/src/draw/sw/lv_draw_sw_arc.su ./Package/LVGL/src/draw/sw/lv_draw_sw_blend.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_blend.d ./Package/LVGL/src/draw/sw/lv_draw_sw_blend.o ./Package/LVGL/src/draw/sw/lv_draw_sw_blend.su ./Package/LVGL/src/draw/sw/lv_draw_sw_dither.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_dither.d ./Package/LVGL/src/draw/sw/lv_draw_sw_dither.o ./Package/LVGL/src/draw/sw/lv_draw_sw_dither.su ./Package/LVGL/src/draw/sw/lv_draw_sw_gradient.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_gradient.d ./Package/LVGL/src/draw/sw/lv_draw_sw_gradient.o ./Package/LVGL/src/draw/sw/lv_draw_sw_gradient.su ./Package/LVGL/src/draw/sw/lv_draw_sw_img.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_img.d ./Package/LVGL/src/draw/sw/lv_draw_sw_img.o ./Package/LVGL/src/draw/sw/lv_draw_sw_img.su ./Package/LVGL/src/draw/sw/lv_draw_sw_layer.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_layer.d ./Package/LVGL/src/draw/sw/lv_draw_sw_layer.o ./Package/LVGL/src/draw/sw/lv_draw_sw_layer.su ./Package/LVGL/src/draw/sw/lv_draw_sw_letter.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_letter.d ./Package/LVGL/src/draw/sw/lv_draw_sw_letter.o ./Package/LVGL/src/draw/sw/lv_draw_sw_letter.su ./Package/LVGL/src/draw/sw/lv_draw_sw_line.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_line.d ./Package/LVGL/src/draw/sw/lv_draw_sw_line.o ./Package/LVGL/src/draw/sw/lv_draw_sw_line.su ./Package/LVGL/src/draw/sw/lv_draw_sw_polygon.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_polygon.d ./Package/LVGL/src/draw/sw/lv_draw_sw_polygon.o ./Package/LVGL/src/draw/sw/lv_draw_sw_polygon.su ./Package/LVGL/src/draw/sw/lv_draw_sw_rect.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_rect.d ./Package/LVGL/src/draw/sw/lv_draw_sw_rect.o ./Package/LVGL/src/draw/sw/lv_draw_sw_rect.su ./Package/LVGL/src/draw/sw/lv_draw_sw_transform.cyclo ./Package/LVGL/src/draw/sw/lv_draw_sw_transform.d ./Package/LVGL/src/draw/sw/lv_draw_sw_transform.o ./Package/LVGL/src/draw/sw/lv_draw_sw_transform.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-draw-2f-sw

