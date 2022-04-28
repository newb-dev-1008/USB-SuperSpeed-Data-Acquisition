/*******************************************************************************
 * Copyright 2019-2020 Microchip FPGA Embedded Systems Solutions.
 *
 * SPDX-License-Identifier: MIT
 *
 * Cortex-M1 boot code.
 * This function is called from startup_cortexm1.S
 *
 * SVN $Revision: 12920 $
 * SVN $Date: 2020-09-09 22:05:24 +0530 (Wed, 09 Sep 2020) $
 */

#include <unistd.h>
#include "cortexm1_cfg.h"

#ifdef __cplusplus
extern "C" {
#endif

/* defined by ARM - show here for background information
#define ITCM_LOW_START_ADDRESS     (uint32_t *)0x00000000
 */
#define ITCM_HIGH_START_ADDRESS     ((uint32_t *)0x10000000U)/* defined by ARM*/
#define ITCMLAEN                    3U                /* Lower aliasing enable*/
#define ITCMUAEN                    4U                /* Upper aliasing enable*/


extern void SystemInit(void);

/*------------------------------------------------------------------------------
 * Symbols from the linker script used to locate the text, data and bss sections.
 */

extern uint32_t __text_load;
extern uint32_t __text_start;
extern uint32_t _etext;
extern uint32_t _uPROM_start;
extern uint32_t _uPROM_end;

extern uint32_t __data_load;
extern uint32_t __data_start;
extern uint32_t _edata;

extern uint32_t __bss_start__;
extern uint32_t __bss_end__;

extern uint32_t __sc_load;
extern uint32_t __sc_start;
extern uint32_t __sc_end;

extern uint32_t __vector_table_load;
extern uint32_t _vector_table_end_load;

#ifndef __ARM_ARCH_6M__
#error "Microsemi ARM Cortex-M1 CMSIS Hardware Abstraction Layer must be\
        compiled with -mcpu=cortex-m1 -mthumb or -march=armv6-m -mthumb"
#endif /* __ARM_ARCH_6M__ */


extern uint32_t _startup_option;

__attribute__((section(".ram_codetext"))) void switch_program(void);

void _start_c( void);

static void copy_text_section(void)
{
    uint32_t * text_lma = &__text_load;
    uint32_t * end_text_vma = &_etext;
    uint32_t * text_vma = &__text_start;

    if ( text_vma != text_lma)
    {
        while ( text_vma < end_text_vma)
        {
            *text_vma = *text_lma;
            text_vma++ ; text_lma++;
        }
    }
}

static void copy_data_section(void)
{
    uint32_t * data_lma = &__data_load;
    uint32_t * end_data_vma = &_edata;
    uint32_t * data_vma = &__data_start;

    if (data_vma != data_lma)
    {
        while ( data_vma < end_data_vma )
        {
            *data_vma = *data_lma;
            data_vma++ ; data_lma++;
        }
    }
}

static void clear_bss_section(void)
{
    uint32_t * bss = &__bss_start__;
    uint32_t * bss_end = &__bss_end__;

    if ( bss_end > bss)
    {
        while ( bss < bss_end )
        {
            *bss = 0U;
            bss++;
        }
    }
}

static void copy_vector_table( uint32_t *acr)
{
    uint32_t * vec_table_rom = &__vector_table_load;
    uint32_t * vec_table_end = &_vector_table_end_load;
    uint32_t * vec_table_ram = ITCM_HIGH_START_ADDRESS;

    if (vec_table_rom > (uint32_t*)0)
    {
        *acr |= 0x10U;                 /* make sure ITCM mapped to 0x10000000 */
        asm ("DSB  ");                 /*; ensure that store completes before */
        /*; executing the next instruction          */
        
        asm ("ISB  ");              /*; executing synchronization instruction */
        
        /*ITCM is now located at 0x00000000 */
        while ( vec_table_rom < vec_table_end )
        {
            *vec_table_ram = *vec_table_rom;
             vec_table_ram++;
             vec_table_rom++;
        }
        
        *acr |= 0x08U;  /* make sure ITCM mapped to 0x00000000 */
        asm ("DSB  ");                 /*; ensure that store completes before */
        
        /*; executing the next instruction          */
        asm ("ISB  ");              /*; executing synchronization instruction */
        /*ITCM is now located at 0x00000000 */
    }
}

/* The program is copied from uPROM  and loaded to RAM*/
static void switch_code_routine(void)
{
    uint32_t * sc_lma = &__sc_load;
    uint32_t * end_sc_vma = &__sc_end;
    uint32_t * sc_vma = &__sc_start;

    if ( sc_vma != sc_lma )
    {
        while ( sc_vma < end_sc_vma )
        {
            *sc_vma = *sc_lma;
            sc_vma++;
            sc_lma++;
        }
    }
}
/*------------------------------------------------------------------------------
 * _start() function called invoked
 * This function is called from  startup_cortexm1.S on power up and warm reset.
 */

void _start_c(void)
{
    uint32_t *acr;
    volatile uint32_t * option = ( volatile uint32_t *)&_startup_option;

    acr = (uint32_t *)0xE000E008U; /* address of auxiliary control register */
    
    /* Copy text section if required (copy executable from LMA to VMA). */
    copy_text_section();

    /* Copy data section if required (initialized variables). */
    copy_data_section();

    /* Zero out the bss section (set non-initialized variables to 0). */
    clear_bss_section();

    if ((option == (uint32_t *)(0x1U || 0x2U)) && ((*acr) == 0x0U))
    {
        /* Invalid condition. The core should have TCM enabled to use startup
         * options 1 or 2. Please check the design or change the startup option
         * to 3 which independent of TCM configuration */
        _exit(1);
    }

    /* Copy program to ITCM and start running from ITCM */
    if ((option == (uint32_t *)((0x1U))) && (((*acr) & (1U << ITCMLAEN)) ||
                                      ((*acr) & (1U << ITCMUAEN))))
    {
        switch_program();
    }

    /* Copy a vector table if not located at zero. e.g. A program loaded by a
     * boot-loader and running from ITCM
     * Only required to be true if this program's vector table not located at 
     * zero and ITCM is present in core.
     */
    if ((option == (uint32_t *)((0x2U))) && (((*acr) & (1U << ITCMLAEN)) ||
                                      ((*acr) & (1U << ITCMUAEN))))
    {
        copy_vector_table(acr);
    }

    /* Copy switch code routine to RAM. Required when switching from uPROM to
     * different program in external memory.
     */

    if (option == (uint32_t *)3)
    {
        switch_code_routine();
    }

    /* SystemInit(void) as required by CMSIS */
    SystemInit();
}

/*
 * This routine will switch to running the program from ITCM
 * The auxiliary control register contains bits that control the memory space 
 * the ITCM occupies.
 * It occupies 0x10000000 when bit 4 set to one
 * It occupies 0x00000000 when bit 3 set to one
 * Both these bits can be set to a known state on startup in the Libero design
 * In normal operation, configure in Libero so
 * bit 3 is 0
 * bit 4 is 1
 * which means ITCM will be located at 0x10000000 on start-up
 * uPROM will be located at 0x0000000 on startup
 * The routine below will copy the program from uPROM/LSRAM to ITCM located at 
 * 0x10000000
 * It will then set bit 4 in the ACR, which maps ITCM to 0x0000000
 * The program will then be running from ITCM
 */
void switch_program(void)
{
    uint32_t asp_value;
    uint32_t *acr = (uint32_t *)0xE000E008U; /* auxiliary control register */
    uint32_t * uprom_start = &_uPROM_start;
    uint32_t * uprom_end = &_uPROM_end;
    uint32_t * itcm = ITCM_HIGH_START_ADDRESS;

    asp_value = *acr;           /* Line below is TRUE if it is a cold reset */
    
    /* if ITCM not mapped to zero, copy code there and map now */
    if (0U == (asp_value & 0x8U))
    {
        /* copy ROM code to ITCM  */
        while ( uprom_start < uprom_end )
        {
            *itcm = *uprom_start;
            itcm++ ; uprom_start++;
        }
        
        /* set bit in aux control register so ITCM appears at 0x0000000 */
        __disable_irq();
        asp_value |= 0x8U;
        *acr = asp_value;
        
        /*; ensure that store completes before */
        asm ("DSB  ");                      
        
        /*; executing synchronization instruction */
        asm ("ISB  ");
        
        /*ITCM is now located at 0x00000000 */
        /* it is the sane as code that was in uPROM so you can just continue 
           on as before */
        __enable_irq();
    }
}

#ifdef __cplusplus
}
#endif
