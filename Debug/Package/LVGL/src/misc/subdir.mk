################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Package/LVGL/src/misc/lv_anim.c \
../Package/LVGL/src/misc/lv_anim_timeline.c \
../Package/LVGL/src/misc/lv_area.c \
../Package/LVGL/src/misc/lv_async.c \
../Package/LVGL/src/misc/lv_bidi.c \
../Package/LVGL/src/misc/lv_color.c \
../Package/LVGL/src/misc/lv_fs.c \
../Package/LVGL/src/misc/lv_gc.c \
../Package/LVGL/src/misc/lv_ll.c \
../Package/LVGL/src/misc/lv_log.c \
../Package/LVGL/src/misc/lv_lru.c \
../Package/LVGL/src/misc/lv_math.c \
../Package/LVGL/src/misc/lv_mem.c \
../Package/LVGL/src/misc/lv_printf.c \
../Package/LVGL/src/misc/lv_style.c \
../Package/LVGL/src/misc/lv_style_gen.c \
../Package/LVGL/src/misc/lv_templ.c \
../Package/LVGL/src/misc/lv_timer.c \
../Package/LVGL/src/misc/lv_tlsf.c \
../Package/LVGL/src/misc/lv_txt.c \
../Package/LVGL/src/misc/lv_txt_ap.c \
../Package/LVGL/src/misc/lv_utils.c 

OBJS += \
./Package/LVGL/src/misc/lv_anim.o \
./Package/LVGL/src/misc/lv_anim_timeline.o \
./Package/LVGL/src/misc/lv_area.o \
./Package/LVGL/src/misc/lv_async.o \
./Package/LVGL/src/misc/lv_bidi.o \
./Package/LVGL/src/misc/lv_color.o \
./Package/LVGL/src/misc/lv_fs.o \
./Package/LVGL/src/misc/lv_gc.o \
./Package/LVGL/src/misc/lv_ll.o \
./Package/LVGL/src/misc/lv_log.o \
./Package/LVGL/src/misc/lv_lru.o \
./Package/LVGL/src/misc/lv_math.o \
./Package/LVGL/src/misc/lv_mem.o \
./Package/LVGL/src/misc/lv_printf.o \
./Package/LVGL/src/misc/lv_style.o \
./Package/LVGL/src/misc/lv_style_gen.o \
./Package/LVGL/src/misc/lv_templ.o \
./Package/LVGL/src/misc/lv_timer.o \
./Package/LVGL/src/misc/lv_tlsf.o \
./Package/LVGL/src/misc/lv_txt.o \
./Package/LVGL/src/misc/lv_txt_ap.o \
./Package/LVGL/src/misc/lv_utils.o 

C_DEPS += \
./Package/LVGL/src/misc/lv_anim.d \
./Package/LVGL/src/misc/lv_anim_timeline.d \
./Package/LVGL/src/misc/lv_area.d \
./Package/LVGL/src/misc/lv_async.d \
./Package/LVGL/src/misc/lv_bidi.d \
./Package/LVGL/src/misc/lv_color.d \
./Package/LVGL/src/misc/lv_fs.d \
./Package/LVGL/src/misc/lv_gc.d \
./Package/LVGL/src/misc/lv_ll.d \
./Package/LVGL/src/misc/lv_log.d \
./Package/LVGL/src/misc/lv_lru.d \
./Package/LVGL/src/misc/lv_math.d \
./Package/LVGL/src/misc/lv_mem.d \
./Package/LVGL/src/misc/lv_printf.d \
./Package/LVGL/src/misc/lv_style.d \
./Package/LVGL/src/misc/lv_style_gen.d \
./Package/LVGL/src/misc/lv_templ.d \
./Package/LVGL/src/misc/lv_timer.d \
./Package/LVGL/src/misc/lv_tlsf.d \
./Package/LVGL/src/misc/lv_txt.d \
./Package/LVGL/src/misc/lv_txt_ap.d \
./Package/LVGL/src/misc/lv_utils.d 


# Each subdirectory must supply rules for building sources it contributes
Package/LVGL/src/misc/%.o Package/LVGL/src/misc/%.su Package/LVGL/src/misc/%.cyclo: ../Package/LVGL/src/misc/%.c Package/LVGL/src/misc/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I../Package/CherryUSB/core -I../Package/CherryUSB/common -I../Package/CherryUSB/class/cdc -I../Package/CherryRB -I../Package/DAPLink/Include -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -I../Package/flmparse -I../Package/offline_download -I../Package/CherryUSB/class/msc -I../Drivers/CST816S -I../Drivers/IIC -I../Drivers/LCD -I../Package/LVGL -I../Package/LVGL/src -I../Package/LVGL/src/core -I../LVGL/src/draw -I../Package/LVGL/src/font -I../Package/LVGL/src/hal -I../Package/LVGL/src/misc -I../Package/LVGL/src/widgets -I../Package/LVGL/examples/porting -I../FATFS/Target -I../FATFS/App -I../Middlewares/Third_Party/FatFs/src -I../Package/lv_lib_100ask -I../Package/GUIAPP -Os -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Package-2f-LVGL-2f-src-2f-misc

clean-Package-2f-LVGL-2f-src-2f-misc:
	-$(RM) ./Package/LVGL/src/misc/lv_anim.cyclo ./Package/LVGL/src/misc/lv_anim.d ./Package/LVGL/src/misc/lv_anim.o ./Package/LVGL/src/misc/lv_anim.su ./Package/LVGL/src/misc/lv_anim_timeline.cyclo ./Package/LVGL/src/misc/lv_anim_timeline.d ./Package/LVGL/src/misc/lv_anim_timeline.o ./Package/LVGL/src/misc/lv_anim_timeline.su ./Package/LVGL/src/misc/lv_area.cyclo ./Package/LVGL/src/misc/lv_area.d ./Package/LVGL/src/misc/lv_area.o ./Package/LVGL/src/misc/lv_area.su ./Package/LVGL/src/misc/lv_async.cyclo ./Package/LVGL/src/misc/lv_async.d ./Package/LVGL/src/misc/lv_async.o ./Package/LVGL/src/misc/lv_async.su ./Package/LVGL/src/misc/lv_bidi.cyclo ./Package/LVGL/src/misc/lv_bidi.d ./Package/LVGL/src/misc/lv_bidi.o ./Package/LVGL/src/misc/lv_bidi.su ./Package/LVGL/src/misc/lv_color.cyclo ./Package/LVGL/src/misc/lv_color.d ./Package/LVGL/src/misc/lv_color.o ./Package/LVGL/src/misc/lv_color.su ./Package/LVGL/src/misc/lv_fs.cyclo ./Package/LVGL/src/misc/lv_fs.d ./Package/LVGL/src/misc/lv_fs.o ./Package/LVGL/src/misc/lv_fs.su ./Package/LVGL/src/misc/lv_gc.cyclo ./Package/LVGL/src/misc/lv_gc.d ./Package/LVGL/src/misc/lv_gc.o ./Package/LVGL/src/misc/lv_gc.su ./Package/LVGL/src/misc/lv_ll.cyclo ./Package/LVGL/src/misc/lv_ll.d ./Package/LVGL/src/misc/lv_ll.o ./Package/LVGL/src/misc/lv_ll.su ./Package/LVGL/src/misc/lv_log.cyclo ./Package/LVGL/src/misc/lv_log.d ./Package/LVGL/src/misc/lv_log.o ./Package/LVGL/src/misc/lv_log.su ./Package/LVGL/src/misc/lv_lru.cyclo ./Package/LVGL/src/misc/lv_lru.d ./Package/LVGL/src/misc/lv_lru.o ./Package/LVGL/src/misc/lv_lru.su ./Package/LVGL/src/misc/lv_math.cyclo ./Package/LVGL/src/misc/lv_math.d ./Package/LVGL/src/misc/lv_math.o ./Package/LVGL/src/misc/lv_math.su ./Package/LVGL/src/misc/lv_mem.cyclo ./Package/LVGL/src/misc/lv_mem.d ./Package/LVGL/src/misc/lv_mem.o ./Package/LVGL/src/misc/lv_mem.su ./Package/LVGL/src/misc/lv_printf.cyclo ./Package/LVGL/src/misc/lv_printf.d ./Package/LVGL/src/misc/lv_printf.o ./Package/LVGL/src/misc/lv_printf.su ./Package/LVGL/src/misc/lv_style.cyclo ./Package/LVGL/src/misc/lv_style.d ./Package/LVGL/src/misc/lv_style.o ./Package/LVGL/src/misc/lv_style.su ./Package/LVGL/src/misc/lv_style_gen.cyclo ./Package/LVGL/src/misc/lv_style_gen.d ./Package/LVGL/src/misc/lv_style_gen.o ./Package/LVGL/src/misc/lv_style_gen.su ./Package/LVGL/src/misc/lv_templ.cyclo ./Package/LVGL/src/misc/lv_templ.d ./Package/LVGL/src/misc/lv_templ.o ./Package/LVGL/src/misc/lv_templ.su ./Package/LVGL/src/misc/lv_timer.cyclo ./Package/LVGL/src/misc/lv_timer.d ./Package/LVGL/src/misc/lv_timer.o ./Package/LVGL/src/misc/lv_timer.su ./Package/LVGL/src/misc/lv_tlsf.cyclo ./Package/LVGL/src/misc/lv_tlsf.d ./Package/LVGL/src/misc/lv_tlsf.o ./Package/LVGL/src/misc/lv_tlsf.su ./Package/LVGL/src/misc/lv_txt.cyclo ./Package/LVGL/src/misc/lv_txt.d ./Package/LVGL/src/misc/lv_txt.o ./Package/LVGL/src/misc/lv_txt.su ./Package/LVGL/src/misc/lv_txt_ap.cyclo ./Package/LVGL/src/misc/lv_txt_ap.d ./Package/LVGL/src/misc/lv_txt_ap.o ./Package/LVGL/src/misc/lv_txt_ap.su ./Package/LVGL/src/misc/lv_utils.cyclo ./Package/LVGL/src/misc/lv_utils.d ./Package/LVGL/src/misc/lv_utils.o ./Package/LVGL/src/misc/lv_utils.su

.PHONY: clean-Package-2f-LVGL-2f-src-2f-misc

