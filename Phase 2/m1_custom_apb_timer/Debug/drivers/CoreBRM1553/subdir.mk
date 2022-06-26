################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/CoreBRM1553/core_brm1553.c 

OBJS += \
./drivers/CoreBRM1553/core_brm1553.o 

C_DEPS += \
./drivers/CoreBRM1553/core_brm1553.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/CoreBRM1553/%.o: ../drivers/CoreBRM1553/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m1 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I../hal -I../hal/CortexM1 -I../hal/CortexM1/GNU -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


