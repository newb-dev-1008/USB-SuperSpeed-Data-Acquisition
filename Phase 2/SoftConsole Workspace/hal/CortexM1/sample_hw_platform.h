/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * Platform definitions
 * Version based on requirements of Cortex-M1 CMSIS HAL
 *
 * SVN $Revision: 12829 $
 * SVN $Date: 2020-07-28 17:22:47 +0530 (Tue, 28 Jul 2020) $
 */
 /*========================================================================*//**
  @mainpage Sample file detailing how hw_platform.h should be constructed for
            Cortex-M1 CMSIS HAL

    @section intro_sec Introduction
    Cortex-M1 CMSIS HAL expects a file named hw_platform.h to be located in the
    project root directory.
    Currently this file must be hand crafted when using the Cortex-M1 soft
    processor.

    You can use this file as sample.
    Rename this file from sample_hw_platform.h to hw_platform.h and store it in
    the root folder of your project. Then customize it per your HW design.

    @section driver_configuration Project configuration Instructions
    1. Copy sample_hw_platform.h to the project root directory
    2. Rename sample_hw_platform.h to hw_platform.h
    3. Change SYS_M1_CLK_FREQ define to frequency of Cortex-M1 clock
    4. Add memory core addresses- These are generally just used for creating
       linker script
    5. Add sizes of all memory Cores- These are generally just used for creating
       linker script
    6. Add all other core BASE addresses
    7. Add peripheral Core Interrupt to Cortex-M1 interrupt mappings
    8. Define MSCC_STDIO_UART_BASE_ADDR if you want a CoreUARTapb mapped to
       STDIO
*//*=========================================================================*/

#ifndef HW_PLATFORM_H
#define HW_PLATFORM_H
#if MSCC_NO_RELATIVE_PATHS
#include "cortexm1_cfg.h.h"
#else
#include "./CMSIS/cortexm1_cfg.h"
#endif
/***************************************************************************//**
 * Cortex-M1 clock definition
 * This is the only clock brought over from the Cortex-M1 Libero design.
 * The current design requirement is all the associated Cores in the Cortex-M1
 * subsystem are running at this frequency.
 */
#define SYS_M1_CLK_FREQ             50000000UL

/***************************************************************************//**
 * Memory Cores addresses-
 * RAM and NVM base addresses can be referenced here when editing to projects
 * linker script.
 * Format of define is:
 * <corename>_<instance>_ADDR
 */
/* e.g.
#define COREAHBSRAM_0_BASE_ADDR         0x00000000UL
#define COREAHBNVM_0_BASE_ADDR          0x10000000UL
*/
#define COREAHBLSRAM_0_BASE_ADDR        0x00000000UL
#define COREAHBLSRAM_1_BASE_ADDR        0x30000000UL
#define DDR3_0_BASE_ADDR                0x60000000UL

/***************************************************************************//**
 * Memory Cores sizes-
 * RAM and NVM sizes can be referenced here when editing projects
 * linker scripts.
 * Format of define is:
 * <corename>_<instance>_SIZE
 */
/* e.g.
#define COREAHBSRAM_0_SIZE              0x00002800UL
#define COREAHBNVM_0_SIZE               0x00002800UL
*/

/***************************************************************************//**
 * Non-memory Peripheral base addresses
 * Format of define is:
 * <corename>_<instance>_BASE_ADDR
 */
/* e.g.
#define COREGPIO_0_BASE_ADDR            0x40000000UL
#define COREUARTAPB_0_BASE_ADDR         0x41000000UL
#define CORETIMER_0_BASE_ADDR           0x42000000UL
*/
#define FLASH_CORE_SPI_BASE             0x35000000UL
#define COREGPIO_BASE_ADDR              0x31000000UL
#define COREUARTAPB0_BASE_ADDR          0x32000000UL
#define CORETIMER0_BASE_ADDR            0x33000000UL
#define CORETIMER1_BASE_ADDR            0x34000000UL
//#define MDDR_APB_INIT_ADDR            0x45000000UL
#define FLASH_CORE_SPI_1_BASE           0x45000000UL

/***************************************************************************//**
 * Peripheral Interrupts are mapped to the corresponding Cortex-M1 interrupt
 * from the Libero design.
 * There can be upto 32 external interrupts (0-31) on the Cortex-M1
 * The Cortex-M1 external interrupts are defined in the Cortex-M1 CMSIS HAL
 * in the file cortexm1_cfg.h
 *
 * These are of the form
 * #define ExternalIrq0_IRQn = 0
 *
 * The interrupt is enabled in the user code as follows:
 * First the Core is initialized
 *
 * UART_init( &g_uart, COREUARTAPB1_BASE_ADDR, BAUD_VALUE_57600,
 *            (DATA_8_BITS | NO_PARITY) );
 *
 * The Interrupt is then enabled.
 * NVIC_EnableIRQ(UART1_TXRDY_IRQ_NB);
 *
 * Format of define is:
 * <corename>_<instance>_<core interrupt name>
 */

/* e.g.
#define TIMER_0_IRQ                     External0_IRQn
#define UART_0_TXRDY_IRQ                External1_IRQn
#define UART_0_RXRDY_IRQ                External2_IRQn
*/

/****************************************************************************
 * Baud value to achieve a 115200 baud rate with a 50MHz system clock.
 * This value is calculated using the following equation:
 *      BAUD_VALUE = (CLOCK / (16 * BAUD_RATE)) - 1
 *****************************************************************************/
#define BAUD_VALUE_115200               ((SYS_M1_CLK_FREQ / (16 * 115200)) - 1)

/******************************************************************************
 * Baud value to achieve a 57600 baud rate with a 50MHz system clock.
 * This value is calculated using the following equation:
 *      BAUD_VALUE = (CLOCK / (16 * BAUD_RATE)) - 1
 *****************************************************************************/
 #define BAUD_VALUE_57600                ((SYS_M1_CLK_FREQ / (16 * 57600)) - 1)

/***************************************************************************//**
 * User edit section- Edit sections below if required
 */
#ifdef MSCC_STDIO_THRU_CORE_UART_APB
/*
 * A base address mapping for the STDIO printf/scanf mapping to CortUARTapb
 * must be provided if it is being used
 *
 * e.g. #define MSCC_STDIO_UART_BASE_ADDR COREUARTAPB1_BASE_ADDR
 */
#define MSCC_STDIO_UART_BASE_ADDR COREUARTAPB0_BASE_ADDR
#ifndef MSCC_STDIO_UART_BASE_ADDR
#error MSCC_STDIO_UART_BASE_ADDR not defined- e.g. #define MSCC_STDIO_UART_BASE_ADDR COREUARTAPB1_BASE_ADDR
#endif

#ifndef MSCC_STDIO_BAUD_VALUE
/*
 * The MSCC_STDIO_BAUD_VALUE define should be set in your project's settings to
 * specify the baud value used by the standard output CoreUARTapb instance for
 * generating the UART's baud rate if you want a different baud rate from the
 * default of 115200 baud
 */
#define MSCC_STDIO_BAUD_VALUE           115200
#endif  /*MSCC_STDIO_BAUD_VALUE*/

#endif  /* end of MSCC_STDIO_THRU_CORE_UART_APB */
/*******************************************************************************
 * End of user edit section
 */
#endif /* HW_PLATFORM_H */