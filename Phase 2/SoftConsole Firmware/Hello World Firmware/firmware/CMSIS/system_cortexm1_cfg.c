/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 *  Cortex-M1 CMSIS system initialization.
 *
 * SVN $Revision: 12819 $
 * SVN $Date: 2020-07-24 15:25:17 +0530 (Fri, 24 Jul 2020) $
 */
#ifdef __cplusplus
extern "C" {
#endif

#include "cortexm1_cfg.h"

#if MSCC_NO_RELATIVE_PATHS
#include "hw_platform.h"
#else
#include "../hw_platform.h"
#endif

#include "sys_init_cfg_types.h"


#ifndef HW_PLATFORM_H
/*
 * Let the user know he needs to define include hw_platform.h
 */
#error you must include (hw_platform.h) in you project. See ./hal/CortexM1/sample_hw_platform.h for instructions
#endif

/*------------------------------------------------------------------------------
  Silicon revisions.
 */


/*------------------------------------------------------------------------------
 * CoreConfigP IP block version.
 */


/*------------------------------------------------------------------------------
 *
 */
extern void mscc_post_hw_cfg_init(void);

/*------------------------------------------------------------------------------
 * CoreConfigP/CoreConfigP register bits
 */


/*------------------------------------------------------------------------------
 * System registers of interest.
 */

/*------------------------------------------------------------------------------
 * Standard CMSIS global variables.
 */
uint32_t SystemCoreClock = 1000000U;  /*!< System Clock Frequency (Core Clock)*/

/*------------------------------------------------------------------------------
 * global variables from linker script
 */

/*----------------------------------------------------- -------------------------
 * This GPIO has one pin dedicated to re-mapping
 */


/*------------------------------------------------------------------------------
 * CortexM1 system RTG4 system clocks specific clocks.
 */


/*------------------------------------------------------------------------------
 * System configuration tables generated by Libero.
 */


/*------------------------------------------------------------------------------
 * Local functions:
 */


/***************************************************************************//**
 * See system_cortexm1.h for details.
 */
void SystemInit(void)
{
    {
        /* If using DDR, you can verify it is up and running at this point
           This can be done by reading the init output from DDR controller via 
           a GPIO pin 
        */
    }

    /*--------------------------------------------------------------------------
    * Call user defined configuration function.
    */
    mscc_post_hw_cfg_init();
}

/***************************************************************************//**
 * SystemCoreClockUpdate()
 */

#define FREQ_32KHZ   32768u
#define FREQ_1MHZ    1000000u
#define FREQ_25MHZ   25000000u
#define FREQ_50MHZ   50000000u

void SystemCoreClockUpdate(void)
{
    SystemCoreClock = SYS_M1_CLK_FREQ;
}

#ifdef __cplusplus
}
#endif
