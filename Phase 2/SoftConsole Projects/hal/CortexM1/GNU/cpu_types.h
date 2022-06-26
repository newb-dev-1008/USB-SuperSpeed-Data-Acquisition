/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 * 
 * SVN $Revision: 12829 $
 * SVN $Date: 2020-07-28 17:22:47 +0530 (Tue, 28 Jul 2020) $
 */
#ifndef CPU_TYPES_H
#define CPU_TYPES_H 1

#include <stdint.h>

/*------------------------------------------------------------------------------
 */
typedef unsigned int size_t;

/*------------------------------------------------------------------------------
 * addr_t: address type.
 * Used to specify the address of peripherals present in the processor's memory
 * map.
 */
typedef unsigned int addr_t;

/*------------------------------------------------------------------------------
 * psr_t: processor state register.
 * Used by HAL_disable_interrupts() and HAL_restore_interrupts() to store the
 * processor's state between disabling and restoring interrupts.
 */
typedef unsigned int psr_t;

#endif  /* CPU_TYPES_H */
