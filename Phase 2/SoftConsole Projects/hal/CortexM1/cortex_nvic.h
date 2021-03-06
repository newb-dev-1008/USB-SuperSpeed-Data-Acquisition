/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 * 
 * Cortex-M1 Nested Vectored Interrupt Controller (NVIC) driver public API.
 * 
 * SVN $Revision: 12790 $
 * SVN $Date: 2020-06-21 23:05:29 +0530 (Sun, 21 Jun 2020) $
 */
#ifndef CORTEX_NVIC_H_
#define CORTEX_NVIC_H_

#include "cpu_types.h"

/***************************************************************************//**
 * Defines used to identify Cortex-M1 external interrupts.
 * Please note that the current Actel supplied Cortex-M1 currently only support
 * one external interrupt.  
 */
#define NVIC_IRQ_0  0

/***************************************************************************//**
 * NVIC_init() initializes the NVIC.
 */
void NVIC_init( void );

/***************************************************************************//**
 * NVIC_set_priority() is used to set the priority of the external interrupt
 * specified as first parameter.
 * 
 * @param interrupt_nb      Identifies the interrupt for which the priority is
 *                          set.
 * @param priority_level    Priority level to be assigned to the interrupt 
 *                          identified by the "interrupt_nb" parameter.
 */
void 
NVIC_set_priority
(
    uint32_t interrupt_nb,
    uint32_t priority_level
);

/***************************************************************************//**
 * NVIC_enable_interrupt() is used to allow the external interrupt identified by
 * the parameter "interrupt_nb" to interrupt the Cortex-M1 processor.
 * 
 * @param interrupt_nb  Identifies the external interrupt which is enabled. 
 *
 */
void 
NVIC_enable_interrupt
(
    uint32_t interrupt_nb 
);

/***************************************************************************//**
 * NVIC_disable_interrupt() is used to disable the external interrupt identified
 * by the parameter "interrupt_nb" from interrupting the Cortex-M1 processor.
 * 
 * @param interrupt_nb  Identifies the external interrupt which is disabled. 
 *
 */
void
NVIC_disable_interrupt
(
    uint32_t interrupt_nb
);

/***************************************************************************//**
 * NVIC_clear_interrupt() is used to clear the external interrupt specified as
 * parameter "interrupt_nb".
 * 
 * @param interrupt_nb  Identifies the external interrupt being cleared.
 *
 */
void
NVIC_clear_interrupt
( 
    uint32_t interrupt_nb
);

#endif /*CORTEX_NVIC_H_*/
