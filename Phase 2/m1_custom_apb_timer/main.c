/*******************************************************************************
 * (c) Copyright 2008 Actel Corporation.  All rights reserved.
 *
 * This simple program demonstrates the use of the CoreTimer driver used in
 * continuous interrupt mode. It toggles a LED on and off every second.
 *
 * SVN $Revision: 1081 $
 * SVN $Date: 2009-06-25 18:22:26 +0530 (Thu, 25 Jun 2009) $
 */
#include "platform.h"
#include "cortex_nvic.h"
#include "drivers/CoreTimer/core_timer.h"
#include "drivers/CoreGPIO/core_gpio.h"
#include "drivers/CoreBRM1553/core_brm1553.h"
#include "hw_reg_access.h"
#include "cpu_types.h"
#include "hal.h"
#include "../../hal/hal.h"
#include "../../hal/hal_assert.h"

/******************************************************************************
 * Timer load value. This value is calculated to result in the timer timing
 * out after after 1 second with a system clock of 24MHz and the timer
 * prescaler set to divide by 1024.
 *****************************************************************************/
 
#define CYCLE_TIME          32  //in milliseconds
#define TM_SCHEDULE_TIME    1024
#define TIMER_LOAD_VALUE	(CYCLE_TIME*24*1000)/1024 //750 //32ms (32ms*24MHz)/1024
#define TM_SCHEDULE_COUNT   (TM_SCHEDULE_TIME/CYCLE_TIME)*2 //16  // Every 2048 ms = 32 * 64ms
#define TC_SERVICE_COUNT    2
/******************************************************************************
 * Timer 0 instance data.
 *****************************************************************************/
timer_instance_t g_timer0;
int32_t output_state=1, cycle_0, cycle_1, tm1schedulecounter, tm2schedulecounter, startbit;
/******************************************************************************
 * GPIO 0 instance data.
 *****************************************************************************/
gpio_instance_t g_gpio;


void timer0_isr( void );


/******************************************************************************
 * Cortex-M1 interrupt handler for external interrupt 0.
 * This function is called when the Cortex-M1 IRQ0 signal is asserted.
 *****************************************************************************/
__attribute__((__interrupt__)) void IRQ0_IRQHandler( void )
{
	/**************************************************************************
	 * Call the  isr routine
	 *************************************************************************/
	timer0_isr();

	/**************************************************************************
	 * Clear the interrupt in the Cortex-M1 NVIC.
	 *************************************************************************/
    NVIC_clear_interrupt( NVIC_IRQ_0 );
}

/******************************************************************************
 * Timer interrupt service routine.
 *****************************************************************************/
void timer0_isr( void )
{
	/* static int32_t output_state = 1;

	/**************************************************************************
	 * Toggle LED attached to GPIO_0.
	 *************************************************************************/
	if ( output_state > 0 )
	{
		output_state = 0;
		tm1schedulecounter = tm1schedulecounter + 1;
	}
	else
	{
		output_state = 1;
	    tm2schedulecounter = tm2schedulecounter + 1;
	}

	cycle_1 = 0;
	cycle_0 = 0;

	//GPIO_set_output(&g_gpio,	GPIO_0, output_state );
	//HW_set_8bit_reg( USER_GPIO_OUT_REG, output_state );  // sent the  valueto the user-gpio connected to LED
	//GPIO_set_bits( &g_gpio,	GPIO_BIT_0, output_state );

	/**************************************************************************
	 * Clear the interrupt within the timer.
	 *************************************************************************/
	TMR_clear_int( &g_timer0 );
}

/******************************************************************************
 * main function.
 *****************************************************************************/
int main( void )
{
	 uint32_t counter_value, counter_ctrl,counter_load;
	 uint8_t switch_value, i;
	 // LOOPBACK   "101"
	 // STREAM_IN  "011"
	 // STREAM_OUT "100"
	 uint32_t  slffconfig = 0x00000004UL;
	 uint32_t newcmdarrival, newcmddata, valuetx, newtmreq;
	 addr_t cfg_reg_addr_tmrx, cfg_reg_addr_tmtx; 

	 uint16_t brmregctrlreg, brmregoprnsts, brmregcmd, brmregcmdblkptr, tm1, tm2, tm3, tm4, tm5;
	/**************************************************************************
	 * Configure Interrupts
     *    Initialize the Cortex-M1 NVIC.
	 *************************************************************************/
    NVIC_init();

	/**************************************************************************
	 * Initialize and configure the timer.
	 *************************************************************************/
	TMR_init( &g_timer0,
			  CORETIMER0_BASE_ADDR,
			  TMR_CONTINUOUS_MODE,
			  PRESCALER_DIV_1024,
			  TIMER_LOAD_VALUE );

	/**************************************************************************
	 * Enable the timer to generate interrupts.
	 *************************************************************************/
	TMR_enable_int( &g_timer0 );
	GPIO_init( &g_gpio, COREGPIO_BASE_ADDR, GPIO_APB_32_BITS_BUS );
	GPIO_config( &g_gpio, GPIO_0, GPIO_OUTPUT_MODE );
	BRM_Reset (COREBRM_APBAUX_BASE_ADDR);
	BRMReg_Config(COREBRM_REG_BASE_ADDR);
	BRMCmdBlk_Config (COREBRM_CMDBLK_BASE_ADDR);
	/**************************************************************************
	 * Enable interrupts at the processor level.
	 *************************************************************************/
    NVIC_enable_interrupt( NVIC_IRQ_0 );

	/**************************************************************************
	 * Start the timer.
	 *************************************************************************/
    TMR_start( &g_timer0 );

    //set slFIFO interface setting
  //  HW_set_32bit_reg(USER_APBAUX_SLFFMD, slffconfig );
  //  HAL_ASSERT( HW_get_32bit_reg( USER_APBAUX_SLFFMD ) == slffconfig );

    /* User Counter  setting up     */

    //HW_set_32bit_reg( USER_COUNTER_LOAD_REG, 20000 );// load the counter with a value 20000,
    //HW_set_32bit_reg( USER_COUNTER_CTRL_REG, 0x01 );  // start the counter by setting bit0 in the ctrl register

	/**************************************************************************
	 * Infinite Loop. This loop will be interrupted at regular intervals by
	 * the timer interrupt.
	 *************************************************************************/
	while( 1 )
	{

		if ((output_state == 0) && (cycle_0 == 0))
		//if (cycle_0 == 0)
		{
			// Poll TC request flag from APBAUX
			newcmdarrival = HW_get_32bit_reg(APB_AUX_BASE_ADDR+NEWCMDFLG);
			if ((newcmdarrival & 0x1) == 1) 
			{
				// Get the TC data from APBAUX register
				newcmddata = HW_get_32bit_reg(APB_AUX_BASE_ADDR+NEWCMDDATA);
				
				/* Update TC Data Area */
				HW_set_32bit_reg(COREBRM_DATAAREA_BASE_ADDR,((newcmddata & 0xffff0000)<<16)); // Command MSB
				HW_set_32bit_reg(COREBRM_DATAAREA_BASE_ADDR + (4*1),(newcmddata & 0xffff));   // Command LSB 
				HW_set_32bit_reg(COREBRM_DATAAREA_BASE_ADDR + (4*2), 0x55);                 // Check Word
				
				HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(CMDBLKWIDTH*4*TC1), 0x5600); // Make TC Opcode as Execute and Branch Unconditionally
				
				HW_set_32bit_reg(APB_AUX_BASE_ADDR+NEWCMDFLG, 0); // Reset TC request flag in APBAUX
			}
			

				if (tm1schedulecounter >= TM_SCHEDULE_COUNT) 
				{
				   tm1schedulecounter = 0;
				   HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(CMDBLKWIDTH*4*TM1), 0x5600); // Make SA1 TM Opcode as Execute and Branch Unconditionally
				  // HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(8*4*3), 0x5600); // Make SA1 TM Opcode as Execute and Branch Unconditionally
				}
				HW_set_32bit_reg(COREBRM_REG_BASE_ADDR +(CmdBlkPtr*4), BRMREG8); /* Initialize Command Block Pointer */
				
				HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(CMDBLKWIDTH*4*TM2), 0x2600); // Make SA2 TM Opcode as GOTO
				HW_set_32bit_reg(COREBRM_REG_BASE_ADDR + (CtrlReg*4),(BRMREG0 | 0x8000)); // Set STX bit high for transactions to start
				cycle_0 = 1;

				//brmregctrlreg = HW_get_32bit_reg(0xc0000000);
				//brmregoprnsts = HW_get_32bit_reg(0xc0000004);
				//brmregcmd     = HW_get_32bit_reg(0xc0000008);
				//brmregcmdblkptr = HW_get_32bit_reg(0xc0000020);

			/*}*/
		}
		else if ((output_state == 1) && (cycle_1 == 0))
		{

			//brmregctrlreg = HW_get_32bit_reg(0xc0000000);
			//brmregcmdblkptr = HW_get_32bit_reg(0xc0000020);

			/* Check Command Block Pointer has reached the End of List */			
			if (((HW_get_32bit_reg(COREBRM_REG_BASE_ADDR+(CmdBlkPtr*4))) & 0xffff) == (EOL*CMDBLKWIDTH))
			{
				// Get Base address of TM1 Data Area received in BRM Back end memory
				cfg_reg_addr_tmrx = COREBRM_DATAAREA_BASE_ADDR + (DATAAREAWIDTH*4*TM1);
				// Get Base Address of TM1 Data Area to be send via SPI in APBAUX area
				cfg_reg_addr_tmtx = APB_AUX_BASE_ADDR + NEWTMDATA;
				
				//  Update TM Data received from RT in APBAUX registers
				for (i=0; i<TMWRDCNT; ++i)
				{
					HW_set_32bit_reg(cfg_reg_addr_tmtx, HW_get_32bit_reg(cfg_reg_addr_tmrx+(4*i)));
					cfg_reg_addr_tmtx += 4;
				}
				
				GPIO_set_output(&g_gpio,GPIO_0,(HW_get_32bit_reg(COREBRM_DATAAREA_BASE_ADDR + (DATAAREAWIDTH*4*TM1)) & 0x1)); // To be Removed

				// Reset TM1 and TC1 Opcode as GOTO
				HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(CMDBLKWIDTH*4*TM1), 0x2600); // Reset SA1 TM Opcode as GOTO
				HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(CMDBLKWIDTH*4*TC1), 0x2600); // Reset TC1 Opcode as GOTO
				  
				  // Schedule TM requests for every 1 second from RT
                if (tm2schedulecounter >= TM_SCHEDULE_COUNT) 
				{
				   tm2schedulecounter = 0;
				   HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(CMDBLKWIDTH*4*TM2), 0x5600); // Make SA1 TM Opcode as Execute and Branch Unconditionally
				  // HW_set_32bit_reg(COREBRM_CMDBLK_BASE_ADDR+(8*4*3), 0x5600); // Make SA1 TM Opcode as Execute and Branch Unconditionally
				  
				   HW_set_32bit_reg(COREBRM_REG_BASE_ADDR +(CmdBlkPtr*4), BRMREG8); /* Initialize Command Block Pointer */
				   HW_set_32bit_reg(COREBRM_REG_BASE_ADDR + (CtrlReg*4), (BRMREG0 | 0x8000)); // Set STX bit high for transactions to start		
				}
											
			}
			cycle_1 = 0;
		}

	}
}
