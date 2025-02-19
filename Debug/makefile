################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Package/PageManager/subdir.mk
-include Package/LVGL/src/widgets/subdir.mk
-include Package/LVGL/src/misc/subdir.mk
-include Package/LVGL/src/hal/subdir.mk
-include Package/LVGL/src/font/subdir.mk
-include Package/LVGL/src/extra/widgets/win/subdir.mk
-include Package/LVGL/src/extra/widgets/tileview/subdir.mk
-include Package/LVGL/src/extra/widgets/tabview/subdir.mk
-include Package/LVGL/src/extra/widgets/spinner/subdir.mk
-include Package/LVGL/src/extra/widgets/spinbox/subdir.mk
-include Package/LVGL/src/extra/widgets/span/subdir.mk
-include Package/LVGL/src/extra/widgets/msgbox/subdir.mk
-include Package/LVGL/src/extra/widgets/meter/subdir.mk
-include Package/LVGL/src/extra/widgets/menu/subdir.mk
-include Package/LVGL/src/extra/widgets/list/subdir.mk
-include Package/LVGL/src/extra/widgets/led/subdir.mk
-include Package/LVGL/src/extra/widgets/keyboard/subdir.mk
-include Package/LVGL/src/extra/widgets/imgbtn/subdir.mk
-include Package/LVGL/src/extra/widgets/colorwheel/subdir.mk
-include Package/LVGL/src/extra/widgets/chart/subdir.mk
-include Package/LVGL/src/extra/widgets/calendar/subdir.mk
-include Package/LVGL/src/extra/widgets/animimg/subdir.mk
-include Package/LVGL/src/extra/themes/mono/subdir.mk
-include Package/LVGL/src/extra/themes/default/subdir.mk
-include Package/LVGL/src/extra/themes/basic/subdir.mk
-include Package/LVGL/src/extra/others/snapshot/subdir.mk
-include Package/LVGL/src/extra/others/msg/subdir.mk
-include Package/LVGL/src/extra/others/monkey/subdir.mk
-include Package/LVGL/src/extra/others/imgfont/subdir.mk
-include Package/LVGL/src/extra/others/ime/subdir.mk
-include Package/LVGL/src/extra/others/gridnav/subdir.mk
-include Package/LVGL/src/extra/others/fragment/subdir.mk
-include Package/LVGL/src/extra/libs/tiny_ttf/subdir.mk
-include Package/LVGL/src/extra/libs/sjpg/subdir.mk
-include Package/LVGL/src/extra/libs/rlottie/subdir.mk
-include Package/LVGL/src/extra/libs/qrcode/subdir.mk
-include Package/LVGL/src/extra/libs/png/subdir.mk
-include Package/LVGL/src/extra/libs/gif/subdir.mk
-include Package/LVGL/src/extra/libs/fsdrv/subdir.mk
-include Package/LVGL/src/extra/libs/freetype/subdir.mk
-include Package/LVGL/src/extra/libs/ffmpeg/subdir.mk
-include Package/LVGL/src/extra/libs/bmp/subdir.mk
-include Package/LVGL/src/extra/layouts/grid/subdir.mk
-include Package/LVGL/src/extra/layouts/flex/subdir.mk
-include Package/LVGL/src/extra/subdir.mk
-include Package/LVGL/src/draw/swm341_dma2d/subdir.mk
-include Package/LVGL/src/draw/sw/subdir.mk
-include Package/LVGL/src/draw/stm32_dma2d/subdir.mk
-include Package/LVGL/src/draw/sdl/subdir.mk
-include Package/LVGL/src/draw/renesas/subdir.mk
-include Package/LVGL/src/draw/nxp/vglite/subdir.mk
-include Package/LVGL/src/draw/nxp/pxp/subdir.mk
-include Package/LVGL/src/draw/arm2d/subdir.mk
-include Package/LVGL/src/draw/subdir.mk
-include Package/LVGL/src/core/subdir.mk
-include Package/LVGL/examples/porting/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
-include Middlewares/Third_Party/FatFs/src/option/subdir.mk
-include Middlewares/Third_Party/FatFs/src/subdir.mk
-include FATFS/Target/subdir.mk
-include FATFS/App/subdir.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Drivers/LCD/subdir.mk
-include Drivers/IIC/subdir.mk
-include Drivers/CST816S/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := HonestLink
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
HonestLink.elf \

MAP_FILES += \
HonestLink.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
HonestLink.list \


# All Target
all: main-build

# Main-build Target
main-build: HonestLink.elf secondary-outputs

# Tool invocations
HonestLink.elf HonestLink.map: $(OBJS) $(USER_OBJS) D:\Develop\STM32CubeIDE\workspace_1.17.0\F4_CherryDAP\STM32F407ZGTX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "HonestLink.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"D:\Develop\STM32CubeIDE\workspace_1.17.0\F4_CherryDAP\STM32F407ZGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="HonestLink.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

HonestLink.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "HonestLink.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) HonestLink.elf HonestLink.list HonestLink.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
