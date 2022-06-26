################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include hal/CortexM1/GNU/subdir.mk
-include hal/CortexM1/subdir.mk
-include drivers/CoreTimer/subdir.mk
-include drivers/CoreGPIO/subdir.mk
-include drivers/CoreBRM1553/subdir.mk
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

# Add inputs and outputs from these tool invocations to the build variables 
SECONDARY_FLASH += \
m1_custom_apb_timer.hex \

SECONDARY_LIST += \
m1_custom_apb_timer.lst \

SECONDARY_SIZE += \
m1_custom_apb_timer.siz \


# All Target
all: m1_custom_apb_timer.elf secondary-outputs

# Tool invocations
m1_custom_apb_timer.elf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: Cross ARM C Linker'
	arm-none-eabi-gcc -mcpu=cortex-m1 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -T ../hal/CortexM1/GNU/ram-debug.ld -nostartfiles -Xlinker --gc-sections -Wl,-Map,"m1_custom_apb_timer.map" --specs=nano.specs -o "m1_custom_apb_timer.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

m1_custom_apb_timer.hex: m1_custom_apb_timer.elf
	@echo 'Invoking: Cross ARM GNU Create Flash Image'
	arm-none-eabi-objcopy -O ihex "m1_custom_apb_timer.elf"  "m1_custom_apb_timer.hex"
	@echo 'Finished building: $@'
	@echo ' '

m1_custom_apb_timer.lst: m1_custom_apb_timer.elf
	@echo 'Invoking: Cross ARM GNU Create Listing'
	arm-none-eabi-objdump --source --all-headers --demangle --line-numbers --wide "m1_custom_apb_timer.elf" > "m1_custom_apb_timer.lst"
	@echo 'Finished building: $@'
	@echo ' '

m1_custom_apb_timer.siz: m1_custom_apb_timer.elf
	@echo 'Invoking: Cross ARM GNU Print Size'
	arm-none-eabi-size --format=berkeley "m1_custom_apb_timer.elf"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(OBJS)$(SECONDARY_FLASH)$(SECONDARY_LIST)$(SECONDARY_SIZE)$(ASM_DEPS)$(S_UPPER_DEPS)$(C_DEPS) m1_custom_apb_timer.elf
	-@echo ' '

secondary-outputs: $(SECONDARY_FLASH) $(SECONDARY_LIST) $(SECONDARY_SIZE)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
