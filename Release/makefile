################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include libopencm3/lib/usb/subdir.mk
-include libopencm3/lib/swm050/subdir.mk
-include libopencm3/lib/stm32/l4/subdir.mk
-include libopencm3/lib/stm32/l1/subdir.mk
-include libopencm3/lib/stm32/l0/subdir.mk
-include libopencm3/lib/stm32/h7/subdir.mk
-include libopencm3/lib/stm32/g4/subdir.mk
-include libopencm3/lib/stm32/g0/subdir.mk
-include libopencm3/lib/stm32/f7/subdir.mk
-include libopencm3/lib/stm32/f4/subdir.mk
-include libopencm3/lib/stm32/f3/subdir.mk
-include libopencm3/lib/stm32/f2/subdir.mk
-include libopencm3/lib/stm32/f1/subdir.mk
-include libopencm3/lib/stm32/f0/subdir.mk
-include libopencm3/lib/stm32/common/subdir.mk
-include libopencm3/lib/stm32/subdir.mk
-include libopencm3/lib/sam/d/subdir.mk
-include libopencm3/lib/sam/common/subdir.mk
-include libopencm3/lib/sam/4l/subdir.mk
-include libopencm3/lib/sam/3x/subdir.mk
-include libopencm3/lib/sam/3u/subdir.mk
-include libopencm3/lib/sam/3s/subdir.mk
-include libopencm3/lib/sam/3n/subdir.mk
-include libopencm3/lib/sam/3a/subdir.mk
-include libopencm3/lib/pac55xx/subdir.mk
-include libopencm3/lib/nrf/common/subdir.mk
-include libopencm3/lib/nrf/52/subdir.mk
-include libopencm3/lib/nrf/51/subdir.mk
-include libopencm3/lib/msp432/e4/subdir.mk
-include libopencm3/lib/lpc43xx/m4/subdir.mk
-include libopencm3/lib/lpc43xx/m0/subdir.mk
-include libopencm3/lib/lpc43xx/subdir.mk
-include libopencm3/lib/lpc17xx/subdir.mk
-include libopencm3/lib/lm4f/subdir.mk
-include libopencm3/lib/ethernet/subdir.mk
-include libopencm3/lib/dispatch/subdir.mk
-include libopencm3/lib/cm3/subdir.mk
-include libopencm3/ld/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(ASM_DEPS)),)
-include $(ASM_DEPS)
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


BUILD_ARTIFACT_NAME := stm32f1_dfu
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
stm32f1_dfu.hex \

SECONDARY_SIZE += \
stm32f1_dfu.siz \


# All Target
all:
	+@$(MAKE) --no-print-directory main-build && $(MAKE) --no-print-directory post-build

# Main-build Target
main-build: stm32f1_dfu.elf secondary-outputs

# Tool invocations
stm32f1_dfu.elf: $(OBJS) $(USER_OBJS) makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU Arm Cross C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fPIC  -g -nostartfiles -Xlinker --gc-sections -Wl,-Map,"stm32f1_dfu.map" -o "stm32f1_dfu.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

stm32f1_dfu.hex: stm32f1_dfu.elf makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: GNU Arm Cross Create Flash Image'
	arm-none-eabi-objcopy -O ihex "stm32f1_dfu.elf"  "stm32f1_dfu.hex"
	@echo 'Finished building: $@'
	@echo ' '

stm32f1_dfu.siz: stm32f1_dfu.elf makefile objects.mk $(OPTIONAL_TOOL_DEPS)
	@echo 'Invoking: GNU Arm Cross Print Size'
	arm-none-eabi-size --format=berkeley "stm32f1_dfu.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) stm32f1_dfu.elf
	-@echo ' '

post-build:
	-objcopy -Iihex -Obinary  stm32f1_dfu.hex stm32f1_dfu.bin
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_SIZE)

.PHONY: all clean dependents main-build post-build

-include ../makefile.targets
