/*******************************************************************************
 * (c) Copyright 2008 Actel Corporation.  All rights reserved.
 *
 * Platform definitions.
 *
 * SVN $Revision: 940 $
 * SVN $Date: 2009-05-20 13:57:59 +0100 (Wed, 20 May 2009) $
 */
#ifndef __PLATFORM_H_
#define __PLATFORM_H_

/*******************************************************************************
 * RAM and NVM base addresses
 */
#define COREAHBSRAM_BASE_ADDR		0x00000000UL
#define COREAHBNVM_BASE_ADDR		0x10000000UL

/*******************************************************************************
 * Peripherals base addresses
 */
#define CORETIMER0_BASE_ADDR        0xA0000300UL
#define COREGPIO_BASE_ADDR          0xA0000000UL
#define APB_COUNTER_BASE_ADDR       0xA0000100UL
#define USER_GPIO_BASE_ADDR         0xA0000200UL

#define USER_APBAUX_SLFFMD	        0xA0000B0CUL

#define COREBRM_REG_BASE_ADDR        0xC0000000UL
#define COREBRM_CMDBLK_BASE_ADDR     0xC0040000UL
#define COREBRM_DATAAREA_BASE_ADDR   0xC0040400UL
#define COREBRM_APBAUX_BASE_ADDR     0xA0000C00UL

#define APB_AUX_BASE_ADDR            0xA0000B00UL


/* User GPIO Register mappings, use the  HW_get_16bit_reg, and  HW_set_16bit_reg  for reading and writing
 *  these custom memory mapped location, these are implmented as 16 bit registers */
#define USER_GPIO_IN_REG          ( USER_GPIO_BASE_ADDR + 0x00 )
#define USER_GPIO_OUT_REG         ( USER_GPIO_BASE_ADDR + 0x04 )

/* User Counter Register Addresses HW_get_32bit_reg, and  HW_set_32bit_reg  for reading and writing
 *  these custom memory mapped location, these are implemented as 32 bit registers
 *  */


#define USER_COUNTER_LOAD_REG           ( APB_COUNTER_BASE_ADDR + 0x00 )
#define USER_COUNTER_VALUE_REG          ( APB_COUNTER_BASE_ADDR + 0x04 )
#define USER_COUNTER_CTRL_REG           ( APB_COUNTER_BASE_ADDR + 0x08 )




/*******************************************************************************
 * Interrupt numbers
 */
#define TIMER0_IRQ_NB           0
#define UART0_TXRDY_IRQ_NB      1
#define UART0_RXRDY_IRQ_NB      2
#define ANALOG_IRQ_NB           3
#define TIMER1_IRQ_NB           4
#define UART1_TXRDY_IRQ_NB      5
#define UART1_RXRDY_IRQ_NB      6

#endif /*__PLATFORM_H_*/
