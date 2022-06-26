#ifndef CORE_BRM1553_H_
#define CORE_BRM1553_H_

#include <stdint.h>
#include "cpu_types.h"


/**********************************************************************************
 *
 */

#define RTADD 9
#define TCWRDCNT 3
#define TMWRDCNT 18
#define CMDBLKWIDTH 8
#define DATAAREAWIDTH 32

#define TC1 0
#define TC2 1
#define TM1 2
#define TM2 3
#define TM3 4
#define MCTX 5
#define MCRX 6
#define EOL 7

/*BRM Registers
	/*
0	Control register
1	Operation and Status
2	Current Command
3	Interrupt Mask
4	Pending Interrupt
5	Interrupt Pointer
6	Built-In Test register
7	Time Tag / Minor Frame Timer
8	Descriptor/Command Block Pointer
9	1553A/B Status Word
10	Initialization Count
*/

#define CtrlReg 0
#define OprnSts 1
#define IntrptMask 3
#define IntrptPtr 5
#define CmdBlkPtr 8
/*****************************************************************************
BRM Registers Initialization for configuring as BC
******************************************************************************/
#define BRMREG0  0x0210U /* Control Word */
#define BRMREG1  0x0000U /* Operation and Status */
#define BRMREG2  0x0000U /* Current Command */
#define BRMREG3  0xFFFFU /* Interrupt Mask */
#define BRMREG4  0x0000U /* Pending interrupt */
#define BRMREG5  0x8100U /* Interrupt pointer */
#define BRMREG6  0x0000U /* Built in test register */
#define BRMREG7  0x0000U /* Time-tag/Minor frame register */
#define BRMREG8  0x0000U /* Command Block Pointer */
#define BRMREG10 0x0000U /* Initialization Count */

/*******************************************************************************
Command Block Words Offset 
1	Control Word
2	Command Word 1
3	Command Word 2
4	Data Pointer
5	Status Word 1
6	Status Word 2
7	Branch Address
8	Timer Value

*******************************************************************************/
#define CTRLWRD 0
#define CMDWRD1 1
#define CMDWRD2 2
#define DATAPTR 3
#define STSWRD1 4
#define STSWRD2 5
#define BRNCHADD 6
#define TIMRVAL 7


#define NEWCMDFLG  0x10
#define NEWCMDDATA 0x14
#define NEWTMDATA  0x18
/*******************************************************************************
 The BRM_Reset function is called to reset the BRM Core module.

 @param base_addr
   The base_addr parameter is the base address in the processor's memory map for
   reseting the BRM Module.
 @return
   none
*******************************************************************************/

void BRM_Reset (addr_t base_addr);


/*******************************************************************************
 The BRMReg_Config function is called to configure the CoreBRM as a Bus Controller.

 @param base_addr
   The base_addr parameter is the base address in the processor's memory map for
   the registers of the CoreBRM module instance being configured as BC.

 @return
   none
*******************************************************************************/

void BRMReg_Config (addr_t base_addr);

/*******************************************************************************
 The BRMCmdBlk_Config function is called to configure Command blocks in BRM
 back end memory

 @param base_addr
   The base_addr parameter is the base address in the processor's memory map for
   the registers of the CoreBRM module instance being configured as BC.

 @return
   none
*******************************************************************************/
void BRMCmdBlk_Config (
		addr_t base_addr
		);

uint16_t BRM_get_Cmd_Wrd 
(
uint16_t RtAdd,
uint16_t SubAdd,
uint16_t RxTx,
uint16_t WordCnt
);
		
#endif
