################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/core/lv_disp.c \
../Package/LVGL/src/core/lv_event.c \
../Package/LVGL/src/core/lv_group.c \
../Package/LVGL/src/core/lv_indev.c \
../Package/LVGL/src/core/lv_indev_scroll.c \
../Package/LVGL/src/core/lv_obj.c \
../Package/LVGL/src/core/lv_obj_class.c \
../Package/LVGL/src/core/lv_obj_draw.c \
../Package/LVGL/src/core/lv_obj_pos.c \
../Package/LVGL/src/core/lv_obj_scroll.c \
../Package/LVGL/src/core/lv_obj_style.c \
../Package/LVGL/src/core/lv_obj_style_gen.c \
../Package/LVGL/src/core/lv_obj_tree.c \
../Package/LVGL/src/core/lv_refr.c \
../Package/LVGL/src/core/lv_theme.c 

OBJS += \
./Package/LVGL/src/core/lv_disp.o \
./Package/LVGL/src/core/lv_event.o \
./Package/LVGL/src/core/lv_group.o \
./Package/LVGL/src/core/lv_indev.o \
./Package/LVGL/src/core/lv_indev_scroll.o \
./Package/LVGL/src/core/lv_obj.o \
./Package/LVGL/src/core/lv_obj_class.o \
./Package/LVGL/src/core/lv_obj_draw.o \
./Package/LVGL/src/core/lv_obj_pos.o \
./Package/LVGL/src/core/lv_obj_scroll.o \
./Package/LVGL/src/core/lv_obj_style.o \
./Package/LVGL/src/core/lv_obj_style_gen.o \
./Package/LVGL/src/core/lv_obj_tree.o \
./Package/LVGL/src/core/lv_refr.o \
./Package/LVGL/src/core/lv_theme.o 

C_DEPS += \
./Package/LVGL/src/core/lv_disp.d \
./Package/LVGL/src/core/lv_event.d \
./Package/LVGL/src/core/lv_group.d \
./Package/LVGL/src/core/lv_indev.d \
./Package/LVGL/src/core/lv_indev_scroll.d \
./Package/LVGL/src/core/lv_obj.d \
./Package/LVGL/src/core/lv_obj_class.d \
./Package/LVGL/src/core/lv_obj_draw.d \
./Package/LVGL/src/core/lv_obj_pos.d \
./Package/LVGL/src/core/lv_obj_scroll.d \
./Package/LVGL/src/core/lv_obj_style.d \
./Package/LVGL/src/core/lv_obj_style_gen.d \
./Package/LVGL/src/core/lv_obj_tree.d \
./Package/LVGL/src/core/lv_refr.d \
./Package/LVGL/src/core/lv_theme.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/core/%.o Package/LVGL/src/core/%.su Package/LVGL/src/core/%.cyclo: ../Package/LVGL/src/core/%.c Package/LVGL/src/core/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-core

clean-Package-2f-LVGL-2f-src-2f-core:
	-$(RM) ./Package/LVGL/src/core/lv_disp.cyclo ./Package/LVGL/src/core/lv_disp.d ./Package/LVGL/src/core/lv_disp.o ./Package/LVGL/src/core/lv_disp.su ./Package/LVGL/src/core/lv_event.cyclo ./Package/LVGL/src/core/lv_event.d ./Package/LVGL/src/core/lv_event.o ./Package/LVGL/src/core/lv_event.su ./Package/LVGL/src/core/lv_group.cyclo ./Package/LVGL/src/core/lv_group.d ./Package/LVGL/src/core/lv_group.o ./Package/LVGL/src/core/lv_group.su ./Package/LVGL/src/core/lv_indev.cyclo ./Package/LVGL/src/core/lv_indev.d ./Package/LVGL/src/core/lv_indev.o ./Package/LVGL/src/core/lv_indev.su ./Package/LVGL/src/core/lv_indev_scroll.cyclo ./Package/LVGL/src/core/lv_indev_scroll.d ./Package/LVGL/src/core/lv_indev_scroll.o ./Package/LVGL/src/core/lv_indev_scroll.su ./Package/LVGL/src/core/lv_obj.cyclo ./Package/LVGL/src/core/lv_obj.d ./Package/LVGL/src/core/lv_obj.o ./Package/LVGL/src/core/lv_obj.su ./Package/LVGL/src/core/lv_obj_class.cyclo ./Package/LVGL/src/core/lv_obj_class.d ./Package/LVGL/src/core/lv_obj_class.o ./Package/LVGL/src/core/lv_obj_class.su ./Package/LVGL/src/core/lv_obj_draw.cyclo ./Package/LVGL/src/core/lv_obj_draw.d ./Package/LVGL/src/core/lv_obj_draw.o ./Package/LVGL/src/core/lv_obj_draw.su ./Package/LVGL/src/core/lv_obj_pos.cyclo ./Package/LVGL/src/core/lv_obj_pos.d ./Package/LVGL/src/core/lv_obj_pos.o ./Package/LVGL/src/core/lv_obj_pos.su ./Package/LVGL/src/core/lv_obj_scroll.cyclo ./Package/LVGL/src/core/lv_obj_scroll.d ./Package/LVGL/src/core/lv_obj_scroll.o ./Package/LVGL/src/core/lv_obj_scroll.su ./Package/LVGL/src/core/lv_obj_style.cyclo ./Package/LVGL/src/core/lv_obj_style.d ./Package/LVGL/src/core/lv_obj_style.o ./Package/LVGL/src/core/lv_obj_style.su ./Package/LVGL/src/core/lv_obj_style_gen.cyclo ./Package/LVGL/src/core/lv_obj_style_gen.d ./Package/LVGL/src/core/lv_obj_style_gen.o ./Package/LVGL/src/core/lv_obj_style_gen.su ./Package/LVGL/src/core/lv_obj_tree.cyclo ./Package/LVGL/src/core/lv_obj_tree.d ./Package/LVGL/src/core/lv_obj_tree.o ./Package/LVGL/src/core/lv_obj_tree.su ./Package/LVGL/src/core/lv_refr.cyclo ./Package/LVGL/src/core/lv_refr.d ./Package/LVGL/src/core/lv_refr.o ./Package/LVGL/src/core/lv_refr.su ./Package/LVGL/src/core/lv_theme.cyclo ./Package/LVGL/src/core/lv_theme.d ./Package/LVGL/src/core/lv_theme.o ./Package/LVGL/src/core/lv_theme.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-core

