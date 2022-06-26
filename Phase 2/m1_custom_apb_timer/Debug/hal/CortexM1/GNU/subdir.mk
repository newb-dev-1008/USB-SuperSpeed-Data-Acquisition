################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../hal/CortexM1/GNU/default_handlers.c \
../hal/CortexM1/GNU/hal_assert.c \
../hal/CortexM1/GNU/newlib_stubs.c \
../hal/CortexM1/GNU/sys_boot.c 

S_UPPER_SRCS += \
../hal/CortexM1/GNU/hal.S \
../hal/CortexM1/GNU/hw_reg_access.S \
../hal/CortexM1/GNU/vector_table.S 

OBJS += \
./hal/CortexM1/GNU/default_handlers.o \
./hal/CortexM1/GNU/hal.o \
./hal/CortexM1/GNU/hal_assert.o \
./hal/CortexM1/GNU/hw_reg_access.o \
./hal/CortexM1/GNU/newlib_stubs.o \
./hal/CortexM1/GNU/sys_boot.o \
./hal/CortexM1/GNU/vector_table.o 

S_UPPER_DEPS += \
./hal/CortexM1/GNU/hal.d \
./hal/CortexM1/GNU/hw_reg_access.d \
./hal/CortexM1/GNU/vector_table.d 

C_DEPS += \
./hal/CortexM1/GNU/default_handlers.d \
./hal/CortexM1/GNU/hal_assert.d \
./hal/CortexM1/GNU/newlib_stubs.d \
./hal/CortexM1/GNU/sys_boot.d 


# Each subdirectory must supply rules for building sources it contributes
hal/CortexM1/GNU/%.o: ../hal/CortexM1/GNU/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM C Compiler'
	arm-none-eabi-gcc -mcpu=cortex-m1 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -I../hal -I../hal/CortexM1 -I../hal/CortexM1/GNU -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

hal/CortexM1/GNU/%.o: ../hal/CortexM1/GNU/%.S
	@echo 'Building file: $<'
	@echo 'Invoking: Cross ARM GNU Assembler'
	arm-none-eabi-gcc -mcpu=cortex-m1 -mthumb -O0 -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


