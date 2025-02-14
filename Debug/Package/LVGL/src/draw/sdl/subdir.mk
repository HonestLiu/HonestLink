################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/draw/sdl/lv_draw_sdl.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_arc.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_bg.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_composite.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_img.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_label.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_layer.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_line.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_mask.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_polygon.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_rect.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_stack_blur.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_texture_cache.c \
../Package/LVGL/src/draw/sdl/lv_draw_sdl_utils.c 

OBJS += \
./Package/LVGL/src/draw/sdl/lv_draw_sdl.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_arc.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_bg.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_composite.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_img.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_label.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_layer.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_line.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_mask.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_polygon.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_rect.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_stack_blur.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_texture_cache.o \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_utils.o 

C_DEPS += \
./Package/LVGL/src/draw/sdl/lv_draw_sdl.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_arc.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_bg.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_composite.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_img.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_label.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_layer.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_line.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_mask.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_polygon.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_rect.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_stack_blur.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_texture_cache.d \
./Package/LVGL/src/draw/sdl/lv_draw_sdl_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/draw/sdl/%.o Package/LVGL/src/draw/sdl/%.su Package/LVGL/src/draw/sdl/%.cyclo: ../Package/LVGL/src/draw/sdl/%.c Package/LVGL/src/draw/sdl/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-draw-2f-sdl

clean-Package-2f-LVGL-2f-src-2f-draw-2f-sdl:
	-$(RM) ./Package/LVGL/src/draw/sdl/lv_draw_sdl.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_arc.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_arc.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_arc.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_arc.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_bg.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_bg.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_bg.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_bg.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_composite.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_composite.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_composite.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_composite.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_img.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_img.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_img.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_img.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_label.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_label.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_label.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_label.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_layer.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_layer.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_layer.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_layer.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_line.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_line.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_line.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_line.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_mask.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_mask.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_mask.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_mask.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_polygon.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_polygon.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_polygon.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_polygon.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_rect.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_rect.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_rect.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_rect.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_stack_blur.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_stack_blur.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_stack_blur.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_stack_blur.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_texture_cache.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_texture_cache.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_texture_cache.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_texture_cache.su ./Package/LVGL/src/draw/sdl/lv_draw_sdl_utils.cyclo ./Package/LVGL/src/draw/sdl/lv_draw_sdl_utils.d ./Package/LVGL/src/draw/sdl/lv_draw_sdl_utils.o ./Package/LVGL/src/draw/sdl/lv_draw_sdl_utils.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-draw-2f-sdl

