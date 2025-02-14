################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp.c \
../Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp_blend.c \
../Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp.c \
../Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.c 

OBJS += \
./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp.o \
./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp_blend.o \
./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp.o \
./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.o 

C_DEPS += \
./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp.d \
./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp_blend.d \
./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp.d \
./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/draw/nxp/pxp/%.o Package/LVGL/src/draw/nxp/pxp/%.su Package/LVGL/src/draw/nxp/pxp/%.cyclo: ../Package/LVGL/src/draw/nxp/pxp/%.c Package/LVGL/src/draw/nxp/pxp/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-pxp

clean-Package-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-pxp:
	-$(RM) ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp.cyclo ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp.d ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp.o ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp.su ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp_blend.cyclo ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp_blend.d ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp_blend.o ./Package/LVGL/src/draw/nxp/pxp/lv_draw_pxp_blend.su ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp.cyclo ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp.d ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp.o ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp.su ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.cyclo ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.d ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.o ./Package/LVGL/src/draw/nxp/pxp/lv_gpu_nxp_pxp_osa.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-draw-2f-nxp-2f-pxp

