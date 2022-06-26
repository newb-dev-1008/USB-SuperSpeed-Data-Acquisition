################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/CoreTimer/core_timer.c 

OBJS += \
./drivers/CoreTimer/core_timer.o 

C_DEPS += \
./drivers/CoreTimer/core_timer.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/CoreTimer/%.o: ../drivers/CoreTimer/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m1 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I../hal -I../hal/CortexM1 -I../hal/CortexM1/GNU -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


