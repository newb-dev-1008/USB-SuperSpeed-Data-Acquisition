#include "core_brm1553.h"
#include "../../hal/hal.h"
#include "../../hal/hal_assert.h"
#include <time.h>
#include <stdio.h>

void BRM_Reset (addr_t base_addr)
{
	addr_t cfg_reg_addr = base_addr;
	uint8_t i = 0;

	/* Pulse Reset Line */
	HW_set_32bit_reg(cfg_reg_addr, 0x2);
	HW_set_32bit_reg(cfg_reg_addr+4, 0xf);

	/* Bring out of reset */
	HW_set_32bit_reg(cfg_reg_addr, 0x3);

	/* wait for reset completion flag */
	while ((HW_get_32bit_reg(cfg_reg_addr+4) & 0x1) == 0)
	{
      /* loop until completion */
	}
	HW_set_32bit_reg(cfg_reg_addr+4, 0xf);
}
 


void BRMReg_Config (addr_t base_addr)
{
	addr_t cfg_reg_addr = base_addr;
	uint8_t i = 0;
	
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

	/* Clear configuration registers */
	for(i = 0, cfg_reg_addr = base_addr; i < 10; ++i )
	{
		HW_set_32bit_reg(cfg_reg_addr, 0);
		cfg_reg_addr += 4;
	}
	
	/* Configuration as Bus Controller */
	HW_set_32bit_reg(base_addr+(CtrlReg*4), BRMREG0); /* Control Register */
	HW_set_32bit_reg(base_addr+(OprnSts*4), BRMREG1); /* Operation and Status */
	HW_set_32bit_reg(base_addr+(IntrptMask*4), BRMREG3); /* Interrupt Mask */
	HW_set_32bit_reg(base_addr+(IntrptPtr*4), BRMREG5); /* Interrupt Pointer */
	HW_set_32bit_reg(base_addr+(CmdBlkPtr*4), BRMREG8); /* Command Block Pointer */
}


uint16_t BRM_get_Cmd_Wrd 
(
uint16_t RtAdd,
uint16_t SubAdd,
uint16_t RxTx,
uint16_t WordCnt
)
{
	uint16_t CmdWrd = 0;
	/* B15 B14 B13 B12 B11  B10  B9 B8 B7 B6 B5  B4   B3   B2   B1   B0
	   |-----RT ADDRESS--| |T/R| | SUB-ADDRESS|  |WORD COUNT/MODE CODE| */
	
	CmdWrd = CmdWrd | WordCnt;
	CmdWrd = CmdWrd | (SubAdd << 5);
    CmdWrd = CmdWrd | (RxTx << 10);
    CmdWrd = CmdWrd | (RtAdd << 11);
    return CmdWrd;		
}

void BRMCmdBlk_Config (
		addr_t base_addr
		)
	{
	addr_t cfg_reg_addr = base_addr;
	uint8_t i = 0;
	uint16_t tccmd, tm1cmd, tm2cmd;

	/* Control Word Setting */
	cfg_reg_addr = base_addr + (4*CTRLWRD);
	for(i = 0, cfg_reg_addr = base_addr; i < EOL; ++i )
		{
		HW_set_32bit_reg(cfg_reg_addr, 0x2600); //Opcode for all command words set as GOTO and branch
			cfg_reg_addr += CMDBLKWIDTH*4;
		}
	HW_set_32bit_reg(cfg_reg_addr, 0x0600); //Opcode for last command block is set as EOL

	/* Branch Address */
	cfg_reg_addr = base_addr + (4*BRNCHADD);//24;

	for(i = 0; i < EOL; ++i )
	{
		HW_set_32bit_reg(cfg_reg_addr, 0x8+(CMDBLKWIDTH*i));
		cfg_reg_addr += CMDBLKWIDTH*4;//32;
	}
    /* Command Word */
	
	// B15 B14 B13 B12 B11  B10  B9 B8 B7 B6 B5  B4   B3   B2   B1  B0
	// |-----RT ADDRESS--| |T/R| | SUB-ADDRESS|  |WORD COUNT/MODE CODE|
	cfg_reg_addr = base_addr + (4*CMDWRD1) + (CMDBLKWIDTH*4*TC1); // Command Block for TC
	tccmd = BRM_get_Cmd_Wrd(RTADD,1,0,TCWRDCNT);
	HW_set_32bit_reg(cfg_reg_addr, tccmd);
	
	//HW_set_32bit_reg(cfg_reg_addr, 0x4823); // RT Add:9, SA1, RX, WORD COUNT=3 4823, 4c32, 4c52
	cfg_reg_addr = base_addr + (4*CMDWRD1) + (CMDBLKWIDTH*4*TM1);  // Command Block for TM
	tm1cmd = BRM_get_Cmd_Wrd(RTADD,1,1,TMWRDCNT);
	HW_set_32bit_reg(cfg_reg_addr, tm1cmd); //RT Add:9, SA1, TX, WORD COUNT = 18
	
	//HW_set_32bit_reg(cfg_reg_addr, 0x4C32); //RT Add:9, SA1, TX, WORD COUNT = 18
	cfg_reg_addr = base_addr + (4*CMDWRD1) + (CMDBLKWIDTH*4*TM2); // Command Block for TM
	tm2cmd = BRM_get_Cmd_Wrd(RTADD,2,1,TMWRDCNT);
	HW_set_32bit_reg(cfg_reg_addr, tm2cmd); //RT Add:9, SA2, TX, WORD COUNT = 18
	//HW_set_32bit_reg(cfg_reg_addr, 0x4C52); //RT Add:9, SA2, TX, WORD COUNT = 18
	
	/* Data Pointers */
	cfg_reg_addr = base_addr + (4*DATAPTR);//+(8*(CMBBLK1-1));
	for(i = 0; i < EOL; ++i )
	{
		HW_set_32bit_reg(cfg_reg_addr, 0x100+(DATAAREAWIDTH*i));
		cfg_reg_addr += CMDBLKWIDTH*4;
	}

	}
