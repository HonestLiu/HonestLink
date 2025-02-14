################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/examples/porting/lv_port_disp.c \
../Package/LVGL/examples/porting/lv_port_fs_template.c \
../Package/LVGL/examples/porting/lv_port_indev.c 

OBJS += \
./Package/LVGL/examples/porting/lv_port_disp.o \
./Package/LVGL/examples/porting/lv_port_fs_template.o \
./Package/LVGL/examples/porting/lv_port_indev.o 

C_DEPS += \
./Package/LVGL/examples/porting/lv_port_disp.d \
./Package/LVGL/examples/porting/lv_port_fs_template.d \
./Package/LVGL/examples/porting/lv_port_indev.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/examples/porting/%.o Package/LVGL/examples/porting/%.su Package/LVGL/examples/porting/%.cyclo: ../Package/LVGL/examples/porting/%.c Package/LVGL/examples/porting/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-examples-2f-porting

clean-Package-2f-LVGL-2f-examples-2f-porting:
	-$(RM) ./Package/LVGL/examples/porting/lv_port_disp.cyclo ./Package/LVGL/examples/porting/lv_port_disp.d ./Package/LVGL/examples/porting/lv_port_disp.o ./Package/LVGL/examples/porting/lv_port_disp.su ./Package/LVGL/examples/porting/lv_port_fs_template.cyclo ./Package/LVGL/examples/porting/lv_port_fs_template.d ./Package/LVGL/examples/porting/lv_port_fs_template.o ./Package/LVGL/examples/porting/lv_port_fs_template.su ./Package/LVGL/examples/porting/lv_port_indev.cyclo ./Package/LVGL/examples/porting/lv_port_indev.d ./Package/LVGL/examples/porting/lv_port_indev.o ./Package/LVGL/examples/porting/lv_port_indev.su

.PHONY: clean-Package-2f-LVGL-2f-examples-2f-porting

