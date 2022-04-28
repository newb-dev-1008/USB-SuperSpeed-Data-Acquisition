#-------------------------------------------------------------------------------
# Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
# 
# SPDX-License-Identifier: MIT
# 
# Interrupt disabling/restoration for critical section protection.
#
# SVN $Revision: 12779 $
# SVN $Date: 2020-06-04 09:27:31 +0530 (Thu, 04 Jun 2020) $
#

#ifndef __ARM_ARCH_6M__
#error "Microsemi ARM Cortex-M1 CMSIS Hardware Abstraction Layer must be compiled with -mcpu=cortex-m1 -mthumb or -march=armv6-m -mthumb"
#endif /* __ARM_ARCH_6M__ */

    .text
    .code 16
    .syntax unified
    
    .type HAL_disable_interrupts, function
    .type HAL_restore_interrupts, function
    
    .global HAL_disable_interrupts
    .global HAL_restore_interrupts

#-------------------------------------------------------------------------------
# 
#
HAL_disable_interrupts:
    mrs r0, PRIMASK
    cpsid I
    bx lr

#-------------------------------------------------------------------------------
#
#
HAL_restore_interrupts:
    msr PRIMASK, r0
    bx lr

.end
