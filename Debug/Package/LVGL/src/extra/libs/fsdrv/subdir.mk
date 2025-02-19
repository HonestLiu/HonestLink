################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/extra/libs/fsdrv/lv_fs_fatfs.c \
../Package/LVGL/src/extra/libs/fsdrv/lv_fs_littlefs.c \
../Package/LVGL/src/extra/libs/fsdrv/lv_fs_posix.c \
../Package/LVGL/src/extra/libs/fsdrv/lv_fs_stdio.c \
../Package/LVGL/src/extra/libs/fsdrv/lv_fs_win32.c 

OBJS += \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_fatfs.o \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_littlefs.o \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_posix.o \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_stdio.o \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_win32.o 

C_DEPS += \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_fatfs.d \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_littlefs.d \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_posix.d \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_stdio.d \
./Package/LVGL/src/extra/libs/fsdrv/lv_fs_win32.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/extra/libs/fsdrv/%.o Package/LVGL/src/extra/libs/fsdrv/%.su Package/LVGL/src/extra/libs/fsdrv/%.cyclo: ../Package/LVGL/src/extra/libs/fsdrv/%.c Package/LVGL/src/extra/libs/fsdrv/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -I../Package/PageManager -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-extra-2f-libs-2f-fsdrv

clean-Package-2f-LVGL-2f-src-2f-extra-2f-libs-2f-fsdrv:
	-$(RM) ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_fatfs.cyclo ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_fatfs.d ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_fatfs.o ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_fatfs.su ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_littlefs.cyclo ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_littlefs.d ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_littlefs.o ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_littlefs.su ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_posix.cyclo ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_posix.d ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_posix.o ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_posix.su ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_stdio.cyclo ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_stdio.d ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_stdio.o ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_stdio.su ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_win32.cyclo ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_win32.d ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_win32.o ./Package/LVGL/src/extra/libs/fsdrv/lv_fs_win32.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-extra-2f-libs-2f-fsdrv

