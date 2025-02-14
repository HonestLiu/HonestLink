################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/widgets/lv_arc.c \
../Package/LVGL/src/widgets/lv_bar.c \
../Package/LVGL/src/widgets/lv_btn.c \
../Package/LVGL/src/widgets/lv_btnmatrix.c \
../Package/LVGL/src/widgets/lv_canvas.c \
../Package/LVGL/src/widgets/lv_checkbox.c \
../Package/LVGL/src/widgets/lv_dropdown.c \
../Package/LVGL/src/widgets/lv_img.c \
../Package/LVGL/src/widgets/lv_label.c \
../Package/LVGL/src/widgets/lv_line.c \
../Package/LVGL/src/widgets/lv_objx_templ.c \
../Package/LVGL/src/widgets/lv_roller.c \
../Package/LVGL/src/widgets/lv_slider.c \
../Package/LVGL/src/widgets/lv_switch.c \
../Package/LVGL/src/widgets/lv_table.c \
../Package/LVGL/src/widgets/lv_textarea.c 

OBJS += \
./Package/LVGL/src/widgets/lv_arc.o \
./Package/LVGL/src/widgets/lv_bar.o \
./Package/LVGL/src/widgets/lv_btn.o \
./Package/LVGL/src/widgets/lv_btnmatrix.o \
./Package/LVGL/src/widgets/lv_canvas.o \
./Package/LVGL/src/widgets/lv_checkbox.o \
./Package/LVGL/src/widgets/lv_dropdown.o \
./Package/LVGL/src/widgets/lv_img.o \
./Package/LVGL/src/widgets/lv_label.o \
./Package/LVGL/src/widgets/lv_line.o \
./Package/LVGL/src/widgets/lv_objx_templ.o \
./Package/LVGL/src/widgets/lv_roller.o \
./Package/LVGL/src/widgets/lv_slider.o \
./Package/LVGL/src/widgets/lv_switch.o \
./Package/LVGL/src/widgets/lv_table.o \
./Package/LVGL/src/widgets/lv_textarea.o 

C_DEPS += \
./Package/LVGL/src/widgets/lv_arc.d \
./Package/LVGL/src/widgets/lv_bar.d \
./Package/LVGL/src/widgets/lv_btn.d \
./Package/LVGL/src/widgets/lv_btnmatrix.d \
./Package/LVGL/src/widgets/lv_canvas.d \
./Package/LVGL/src/widgets/lv_checkbox.d \
./Package/LVGL/src/widgets/lv_dropdown.d \
./Package/LVGL/src/widgets/lv_img.d \
./Package/LVGL/src/widgets/lv_label.d \
./Package/LVGL/src/widgets/lv_line.d \
./Package/LVGL/src/widgets/lv_objx_templ.d \
./Package/LVGL/src/widgets/lv_roller.d \
./Package/LVGL/src/widgets/lv_slider.d \
./Package/LVGL/src/widgets/lv_switch.d \
./Package/LVGL/src/widgets/lv_table.d \
./Package/LVGL/src/widgets/lv_textarea.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/widgets/%.o Package/LVGL/src/widgets/%.su Package/LVGL/src/widgets/%.cyclo: ../Package/LVGL/src/widgets/%.c Package/LVGL/src/widgets/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-widgets

clean-Package-2f-LVGL-2f-src-2f-widgets:
	-$(RM) ./Package/LVGL/src/widgets/lv_arc.cyclo ./Package/LVGL/src/widgets/lv_arc.d ./Package/LVGL/src/widgets/lv_arc.o ./Package/LVGL/src/widgets/lv_arc.su ./Package/LVGL/src/widgets/lv_bar.cyclo ./Package/LVGL/src/widgets/lv_bar.d ./Package/LVGL/src/widgets/lv_bar.o ./Package/LVGL/src/widgets/lv_bar.su ./Package/LVGL/src/widgets/lv_btn.cyclo ./Package/LVGL/src/widgets/lv_btn.d ./Package/LVGL/src/widgets/lv_btn.o ./Package/LVGL/src/widgets/lv_btn.su ./Package/LVGL/src/widgets/lv_btnmatrix.cyclo ./Package/LVGL/src/widgets/lv_btnmatrix.d ./Package/LVGL/src/widgets/lv_btnmatrix.o ./Package/LVGL/src/widgets/lv_btnmatrix.su ./Package/LVGL/src/widgets/lv_canvas.cyclo ./Package/LVGL/src/widgets/lv_canvas.d ./Package/LVGL/src/widgets/lv_canvas.o ./Package/LVGL/src/widgets/lv_canvas.su ./Package/LVGL/src/widgets/lv_checkbox.cyclo ./Package/LVGL/src/widgets/lv_checkbox.d ./Package/LVGL/src/widgets/lv_checkbox.o ./Package/LVGL/src/widgets/lv_checkbox.su ./Package/LVGL/src/widgets/lv_dropdown.cyclo ./Package/LVGL/src/widgets/lv_dropdown.d ./Package/LVGL/src/widgets/lv_dropdown.o ./Package/LVGL/src/widgets/lv_dropdown.su ./Package/LVGL/src/widgets/lv_img.cyclo ./Package/LVGL/src/widgets/lv_img.d ./Package/LVGL/src/widgets/lv_img.o ./Package/LVGL/src/widgets/lv_img.su ./Package/LVGL/src/widgets/lv_label.cyclo ./Package/LVGL/src/widgets/lv_label.d ./Package/LVGL/src/widgets/lv_label.o ./Package/LVGL/src/widgets/lv_label.su ./Package/LVGL/src/widgets/lv_line.cyclo ./Package/LVGL/src/widgets/lv_line.d ./Package/LVGL/src/widgets/lv_line.o ./Package/LVGL/src/widgets/lv_line.su ./Package/LVGL/src/widgets/lv_objx_templ.cyclo ./Package/LVGL/src/widgets/lv_objx_templ.d ./Package/LVGL/src/widgets/lv_objx_templ.o ./Package/LVGL/src/widgets/lv_objx_templ.su ./Package/LVGL/src/widgets/lv_roller.cyclo ./Package/LVGL/src/widgets/lv_roller.d ./Package/LVGL/src/widgets/lv_roller.o ./Package/LVGL/src/widgets/lv_roller.su ./Package/LVGL/src/widgets/lv_slider.cyclo ./Package/LVGL/src/widgets/lv_slider.d ./Package/LVGL/src/widgets/lv_slider.o ./Package/LVGL/src/widgets/lv_slider.su ./Package/LVGL/src/widgets/lv_switch.cyclo ./Package/LVGL/src/widgets/lv_switch.d ./Package/LVGL/src/widgets/lv_switch.o ./Package/LVGL/src/widgets/lv_switch.su ./Package/LVGL/src/widgets/lv_table.cyclo ./Package/LVGL/src/widgets/lv_table.d ./Package/LVGL/src/widgets/lv_table.o ./Package/LVGL/src/widgets/lv_table.su ./Package/LVGL/src/widgets/lv_textarea.cyclo ./Package/LVGL/src/widgets/lv_textarea.d ./Package/LVGL/src/widgets/lv_textarea.o ./Package/LVGL/src/widgets/lv_textarea.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-widgets

