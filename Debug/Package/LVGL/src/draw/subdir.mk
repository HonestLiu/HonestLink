################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/draw/lv_draw.c \
../Package/LVGL/src/draw/lv_draw_arc.c \
../Package/LVGL/src/draw/lv_draw_img.c \
../Package/LVGL/src/draw/lv_draw_label.c \
../Package/LVGL/src/draw/lv_draw_layer.c \
../Package/LVGL/src/draw/lv_draw_line.c \
../Package/LVGL/src/draw/lv_draw_mask.c \
../Package/LVGL/src/draw/lv_draw_rect.c \
../Package/LVGL/src/draw/lv_draw_transform.c \
../Package/LVGL/src/draw/lv_draw_triangle.c \
../Package/LVGL/src/draw/lv_img_buf.c \
../Package/LVGL/src/draw/lv_img_cache.c \
../Package/LVGL/src/draw/lv_img_decoder.c 

OBJS += \
./Package/LVGL/src/draw/lv_draw.o \
./Package/LVGL/src/draw/lv_draw_arc.o \
./Package/LVGL/src/draw/lv_draw_img.o \
./Package/LVGL/src/draw/lv_draw_label.o \
./Package/LVGL/src/draw/lv_draw_layer.o \
./Package/LVGL/src/draw/lv_draw_line.o \
./Package/LVGL/src/draw/lv_draw_mask.o \
./Package/LVGL/src/draw/lv_draw_rect.o \
./Package/LVGL/src/draw/lv_draw_transform.o \
./Package/LVGL/src/draw/lv_draw_triangle.o \
./Package/LVGL/src/draw/lv_img_buf.o \
./Package/LVGL/src/draw/lv_img_cache.o \
./Package/LVGL/src/draw/lv_img_decoder.o 

C_DEPS += \
./Package/LVGL/src/draw/lv_draw.d \
./Package/LVGL/src/draw/lv_draw_arc.d \
./Package/LVGL/src/draw/lv_draw_img.d \
./Package/LVGL/src/draw/lv_draw_label.d \
./Package/LVGL/src/draw/lv_draw_layer.d \
./Package/LVGL/src/draw/lv_draw_line.d \
./Package/LVGL/src/draw/lv_draw_mask.d \
./Package/LVGL/src/draw/lv_draw_rect.d \
./Package/LVGL/src/draw/lv_draw_transform.d \
./Package/LVGL/src/draw/lv_draw_triangle.d \
./Package/LVGL/src/draw/lv_img_buf.d \
./Package/LVGL/src/draw/lv_img_cache.d \
./Package/LVGL/src/draw/lv_img_decoder.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/draw/%.o Package/LVGL/src/draw/%.su Package/LVGL/src/draw/%.cyclo: ../Package/LVGL/src/draw/%.c Package/LVGL/src/draw/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -I../Package/PageManager -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-draw

clean-Package-2f-LVGL-2f-src-2f-draw:
	-$(RM) ./Package/LVGL/src/draw/lv_draw.cyclo ./Package/LVGL/src/draw/lv_draw.d ./Package/LVGL/src/draw/lv_draw.o ./Package/LVGL/src/draw/lv_draw.su ./Package/LVGL/src/draw/lv_draw_arc.cyclo ./Package/LVGL/src/draw/lv_draw_arc.d ./Package/LVGL/src/draw/lv_draw_arc.o ./Package/LVGL/src/draw/lv_draw_arc.su ./Package/LVGL/src/draw/lv_draw_img.cyclo ./Package/LVGL/src/draw/lv_draw_img.d ./Package/LVGL/src/draw/lv_draw_img.o ./Package/LVGL/src/draw/lv_draw_img.su ./Package/LVGL/src/draw/lv_draw_label.cyclo ./Package/LVGL/src/draw/lv_draw_label.d ./Package/LVGL/src/draw/lv_draw_label.o ./Package/LVGL/src/draw/lv_draw_label.su ./Package/LVGL/src/draw/lv_draw_layer.cyclo ./Package/LVGL/src/draw/lv_draw_layer.d ./Package/LVGL/src/draw/lv_draw_layer.o ./Package/LVGL/src/draw/lv_draw_layer.su ./Package/LVGL/src/draw/lv_draw_line.cyclo ./Package/LVGL/src/draw/lv_draw_line.d ./Package/LVGL/src/draw/lv_draw_line.o ./Package/LVGL/src/draw/lv_draw_line.su ./Package/LVGL/src/draw/lv_draw_mask.cyclo ./Package/LVGL/src/draw/lv_draw_mask.d ./Package/LVGL/src/draw/lv_draw_mask.o ./Package/LVGL/src/draw/lv_draw_mask.su ./Package/LVGL/src/draw/lv_draw_rect.cyclo ./Package/LVGL/src/draw/lv_draw_rect.d ./Package/LVGL/src/draw/lv_draw_rect.o ./Package/LVGL/src/draw/lv_draw_rect.su ./Package/LVGL/src/draw/lv_draw_transform.cyclo ./Package/LVGL/src/draw/lv_draw_transform.d ./Package/LVGL/src/draw/lv_draw_transform.o ./Package/LVGL/src/draw/lv_draw_transform.su ./Package/LVGL/src/draw/lv_draw_triangle.cyclo ./Package/LVGL/src/draw/lv_draw_triangle.d ./Package/LVGL/src/draw/lv_draw_triangle.o ./Package/LVGL/src/draw/lv_draw_triangle.su ./Package/LVGL/src/draw/lv_img_buf.cyclo ./Package/LVGL/src/draw/lv_img_buf.d ./Package/LVGL/src/draw/lv_img_buf.o ./Package/LVGL/src/draw/lv_img_buf.su ./Package/LVGL/src/draw/lv_img_cache.cyclo ./Package/LVGL/src/draw/lv_img_cache.d ./Package/LVGL/src/draw/lv_img_cache.o ./Package/LVGL/src/draw/lv_img_cache.su ./Package/LVGL/src/draw/lv_img_decoder.cyclo ./Package/LVGL/src/draw/lv_img_decoder.d ./Package/LVGL/src/draw/lv_img_decoder.o ./Package/LVGL/src/draw/lv_img_decoder.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-draw

