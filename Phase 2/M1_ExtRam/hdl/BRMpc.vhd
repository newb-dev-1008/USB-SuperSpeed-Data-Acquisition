-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--  
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--
-- File:  BRMpc.vhd
--     
-- Description: Core1553BRM
--              Protocol Controller  
--
-- Rev: 1.0  01May04  IPB  : Pre Production  
-- Rev: 2.0  27May04  IPB  : First Production Release 
-- Rev: 2.1  24Jan05  IPB  : PA3/E Production Release 
-- Rev: 2.11 05Feb05  IPB  : Backend Timing modified SAR44066, 44067
-- Rev: 2.12 19Feb05  IPB  : Backend Timing modified SAR44392 44473
-- Rev: 2.13 01Oct05  IPB  : Encoder fix and enhancements
-- Rev: 2.14 14Feb06  IPB  : PingPong Correction SAR52998
-- Rev: 2.16 26May06  IPB  : BC EOL Interrupt SAR56170 
-- Rev: 2.17 20Jul06  IPB  : Fixed Monitor parity/manchester error bits
-- Rev: 2.1X 13Oct06  IPB  : Temporary Fix
-- Rev: 2.1X 18Oct06  IPB  : Temporary Fix SAR59858 PPONR
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--
-- Notes:                      
--
-- v2.1  includes the ASYNC message addition SAR42827
-- v2.11 includes modified backend timing SAR44066, 44067
-- v2.12 includes modified backend timing SAR44392 
-- v2.12 includes RT Interrupt Generation fix SAR44473 
-- v2.17 includes Monitor parity error fix SAR57312
-- v3.0  includes PPON Update SAR59858
--
-- *********************************************************************/ 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.convert.all;
use work.brmcomps.all;

entity BRMPC is
  generic ( FAMILY   : INTEGER range 0 to 21;
            BCENABLE : INTEGER range 0 to 1;
            RTENABLE : INTEGER range 0 to 1;
            MTENABLE : INTEGER range 0 to 1;
            LEGREGS  : INTEGER range 0 to 2;
            ENHANCED : INTEGER range 0 to 1;
            INITFREQ : INTEGER range 12 to 24;
			LOCKFREQ : INTEGER range 0 to 1 
           );
   port ( CLK            : in  std_logic;
          TCLK           : in  std_logic;
          RSTINn         : in  std_logic;
          RSTOUTn        : out std_logic;
          CLKSPD         : out std_logic_vector(1 downto 0);
          
          LOCKn          : in  std_logic;      
          RTADDRIN       : in  std_logic_vector(4 downto 0); 
          RTADDRPIN      : in  std_logic;
          RTADERR        : out std_logic;
          MSELIN         : in  std_logic_vector(1 downto 0);
          SSYSFn         : in  std_logic;
          ABSTDIN        : in  std_logic;

          SHUTDOWNA      : out std_logic;
          SHUTDOWNB      : out std_logic;
          RXBUSENA       : out std_logic;
          RXBUSENB       : out std_logic;
          BUSSEL         : out std_logic;
          DECA_FROMUS    : in  std_logic;
          DECA_STROBE    : in  std_logic;
          DECA_DATAOUT   : in  std_logic_vector(15 downto 0);
          DECA_CMDSTAT   : in  std_logic;
          DECA_GOTSYNC   : in  std_logic;
          DECA_PARERR    : in  std_logic;
          DECA_MANERR    : in  std_logic;
          DECA_ACTIVE    : in  std_logic;
          DECA_CONTIG    : in  std_logic;
          DECB_FROMUS    : in  std_logic;
          DECB_STROBE    : in  std_logic;
          DECB_DATAOUT   : in  std_logic_vector(15 downto 0);
          DECB_CMDSTAT   : in  std_logic;
          DECB_GOTSYNC   : in  std_logic;
          DECB_PARERR    : in  std_logic;
          DECB_MANERR    : in  std_logic;
          DECB_ACTIVE    : in  std_logic;
          DECB_CONTIG    : in  std_logic;
          LOOPFAILA      : in  std_logic;
          LOOPFAILB      : in  std_logic;

          ENCSTROBE      : out std_logic;
          ENCABORT       : out std_logic;     
          ENCDATA        : out std_logic_vector(15 downto 0);       
          ENCCMDSTAT     : out std_logic;       
          ENCREADY       : in  std_logic;       
          ENCBUSY        : in  std_logic;
          ENCCLEAR       : out std_logic;
      
          TXTIMEOUT      : in  std_logic;
 
          BENDREQ        : out std_logic;
          BENDBURST      : out std_logic;
          BENDWRT        : out std_logic;
          BENDBUSY       : in  std_logic;
          BENDFAIL       : in  std_logic;
          BENDADDR       : out std_logic_vector(15 downto 0);
          BENDDIN        : in  std_logic_vector(15 downto 0);
          BENDDOUT       : out std_logic_vector(15 downto 0);
          
          CPUWR          : in  std_logic_vector(1 downto 0);
          CPURD          : in  std_logic;
          CPUADDR        : in  std_logic_vector(5 downto 0);
          CPUDIN         : in  std_logic_vector(15 downto 0);
          CPUDOUT        : out std_logic_vector(15 downto 0);
          MEMFAIL        : out std_logic;
          INTLEVEL       : in  std_logic;
          INTOUTH        : out std_logic;
          INTOUTM        : out std_logic;
          INTACKH        : in  std_logic;
          INTACKM        : in  std_logic;
          ACTIVE         : out std_logic;
          BUSY           : out std_logic;
          OPMODE         : out std_logic_vector(1 downto 0);
                 
          -- External Status Signals
          MSGSTART       : out std_logic;
          CMDSYNC        : out std_logic;
          SYNCNOW        : out std_logic;
          BUSRESET       : out std_logic;
       
          -- Command Legalization Interface
          CMDVAL         : out std_logic_vector(11 downto 0);
          CMDOK          : in  std_logic;
          CMDSTB         : out std_logic;
          CMDOKOUT       : out std_logic;
          
          -- Misc
          LOOPBACK       : out std_logic;
		  INS_PPON  	 : out std_logic;
		  INS_PPONR 	 : out std_logic
                          
        );
end BRMPC;

architecture RTL of BRMPC is

--------------------------------------------------------------------
-- Some Constants that effect the core


-- This sets the version number, Available in lower 8 bits of BIT word after reset
-- And Upper 8 bits of Extended Register

--constant VERSION : std_logic_vector(7 downto 0) := "00000000";  -- EAP  
--constant VERSION : std_logic_vector(7 downto 0) := "00000001";  -- v2.0 
--constant VERSION : std_logic_vector(7 downto 0) := "00000010";  -- v2.1 
--constant VERSION : std_logic_vector(7 downto 0) := "00000011";  -- v2.11
--constant VERSION : std_logic_vector(7 downto 0) := "00000100";  -- v2.12
--constant VERSION : std_logic_vector(7 downto 0) := "00000101";  -- v2.13
--constant VERSION : std_logic_vector(7 downto 0) := "00000111";  -- v2.14
--constant VERSION : std_logic_vector(7 downto 0) := "00001000";  -- v2.16
--constant VERSION : std_logic_vector(7 downto 0) := "00001001";  -- v2.17
  constant VERSION : std_logic_vector(7 downto 0) := "00001010";  -- v3.0
                                                                
-----------------------------------------------------------------------------



-- Core Operating Mode
signal iRTMODE      : std_logic;
signal iBCMODE      : std_logic;
signal iMTMODE      : std_logic;
    
-- Clock Dividers etc
signal CLKFREQ      : std_logic_vector(1 downto 0);
signal CLKFREQL     : std_logic_vector(1 downto 0);
signal CLKFREQS     : std_logic_vector(1 downto 0);
signal CLKSTB       : std_logic;
signal CLKSTB1US    : std_logic;
signal SCALE        : UNSIGNED(4 downto 0);
signal SCALER1      : UNSIGNED(4 downto 0);
signal SCALER2      : UNSIGNED(5 downto 0);

signal IMGVALUE     : UNSIGNED(4 downto 0);
signal RESPVALUE    : UNSIGNED(4 downto 0);

-- Registered CPU interface
signal CPUDINR      : std_logic_vector(15 downto 0);
signal CPUADDRR     : std_logic_vector( 5 downto 0);
signal CPUWRR       : std_logic_vector( 1 downto 0);
signal CPUWRRD      : std_logic_vector( 1 downto 0);
signal CPURDR       : std_logic;
signal CPUSTB       : std_logic;
signal CPUCLRINT    : std_logic;
signal CPUDOUT1     : std_logic_vector(15 downto 0);
signal CPUDOUT2     : std_logic_vector(15 downto 0);

-- CPU Registers
signal FORCEORUN    : std_logic;
signal ACT_ENHANCE  : std_logic;

-- Internal Status Flags etc
signal SW_ERROR     : std_logic;
signal SW_TFLAG     : std_logic;
signal SW_DBA       : std_logic;
signal SW_SSFLAG    : std_logic;
signal SW_BUSY      : std_logic;
signal SW_BCAST     : std_logic;
signal SW_SREQ      : std_logic;
signal SW_INSTRU    : std_logic;
signal SW_MSGERR    : std_logic;
signal RT_NORESP    : std_logic;
signal RT_ERROR     : std_logic;
signal EXPWCNT      : UNSIGNED(5 downto 0);
signal MSG_ERROR    : std_logic;
signal MSG_ERRORCC  : std_logic;
signal ABORT        : std_logic;


--Protocol BCSTATE Machine
signal DECSTB       : std_logic;
signal DECSTBDEL1   : std_logic;
signal DECSTBOKSW   : std_logic;
signal DECSTBOKSWA  : std_logic;
signal DECSTBOKDW   : std_logic;
signal DECSTBOKCW   : std_logic;

type TBCSTATE is ( BCIDLE , BCILIST, BCGETOPCODE ,BCLOADMMT, BCWAITMMT, BCGOTO, BCCALL, 
                   BCLOADMFT, BCGETBR, 
                   BCSTARTM, BCGETCW1, BCTXCW, BCCHECKCW, BCGETCW2, BCGETDPTR, BCWAITSW1, BCWRDATA, 
                   BCRDDATA1, BCRDDATA2, BCWAITSW2, BCRETRY1,
                   BCWAITBQ, BCCHECK, BCWRTTSW, BCMSGDONE, BCDECOPCODE,
                   BCALLDONE, BCGENINT );

signal BCSTATE      : TBCSTATE;
signal CCFLAG       : std_logic;

signal RTTIMER      : UNSIGNED(4 downto 0);

signal BCAST        : std_logic;
signal MSGTYPE      : std_logic_vector(2 downto 0);
signal CWRT1        : std_logic_vector(4 downto 0);
signal CWRT2        : std_logic_vector(4 downto 0);
signal GOTSW1       : std_logic;
signal GOTSW2       : std_logic;
signal RTTIMEOUT    : std_logic;
signal IMGDONE      : std_logic;
signal WORDCOUNT    : UNSIGNED(5 downto 0);

signal iENCSTROBE   : std_logic;
signal iENCCMDSTAT  : std_logic;
signal iBENDREQ     : std_logic;
signal iBENDWRT     : std_logic;
signal iBENDBURST   : std_logic;
signal iBUSY        : std_logic;
signal iLOOPBACK    : std_logic;

-- RT Signals

signal  DECSTROBE     : std_logic;
signal  DECDATA       : std_logic_vector(15 downto 0);
signal  DECCMDSTAT    : std_logic;
signal  DECGOTSYNC    : std_logic;
signal  DECPARERR     : std_logic;
signal  DECMANERR     : std_logic;
signal  DECACTIVE     : std_logic;
signal  DECCONTIG     : std_logic;
signal  DECFROMUS     : std_logic;

signal  CW_BCAST      : std_logic;
signal  CW_DATA       : std_logic;
signal  CW_MCODE      : std_logic;
signal  CW_COUNT      : std_logic_vector(5 downto 0);
signal  CW_TX         : std_logic;
signal  CW_SUBADDR    : std_logic_vector(4 downto 0);
signal  CW_MCWC       : std_logic_vector(4 downto 0);
signal  CW_STBME      : std_logic;
signal  RTSTART       : std_logic;
type    T_RTSTATE is  (RTIDLE,RTINIT1,RTGETD1,RTGETD2,RTGETD3,RTGETD4,RTGETD5,
                       RTINIT2,RTREAD1,RTREAD2,RTWRITE1,
                       RTTXSTAT,RTSTATRX,
                       RTPUTCW,RTPUTTT,RTPUTD0,RTPUTD1,RTPUTD2,RTPUTD3,
                       RTMSGSTAT,RTMSGDONE,RTALLDONE);
                       
signal  RTSTATE       : T_RTSTATE;
signal  PCONBUSY      : std_logic;
signal  RTCMDDONE     : std_logic;
signal  RTRTRT        : std_logic;
signal  RTRTOK        : std_logic;
signal  LEGAL         : std_logic;

signal  RTADDRERR     : std_logic;

signal  RTBUSY        : std_logic;
signal  iBUSSEL       : std_logic;
signal  RTBUSSEL      : std_logic;

signal  LATCHSW        :  std_logic;
signal  WCNTOVR        :  std_logic;
signal  WCNTTO         :  std_logic;
signal  RTMSG_STBME    :  std_logic;
signal  RTMSG_START    :  std_logic;
signal  RTMSG_CMDWORD  :  std_logic_vector(23 downto 0);
signal  RTMSG_RTRT     :  std_logic;
signal  RTMSG_RTRTOK   :  std_logic;
signal  RTMSG_LEGAL    :  std_logic;
signal  RTMSG_OKAY     :  std_logic;
signal  GOTSW          :  std_logic;
signal  TIMER57US      :  std_logic;
signal  SHUTDOWNRTA    :  std_logic;
signal  SHUTDOWNRTB    :  std_logic;
signal  RSTn           :  std_logic;
signal  RSTREG         :  std_logic;
signal  iBUSRESET      :  std_logic;
signal  CLRERR         :  std_logic;
signal  SWRESETX       :  std_logic;
signal  USEXTOK        :  std_logic;
signal  LOOPFAIL       :  std_logic;
signal  iSYNCNOW       :  std_logic;
signal  CMDOKREG       :  std_logic;
signal  iCMDSTB        :  std_logic;
signal  BITSELECT      :  std_logic_vector(7 downto 0);
    
-- Interrupt System
type TINSTATE is ( IDLE, WRTIIW, WRTIAW, DONE );
signal INTSTATE        : TINSTATE;
signal DOINT           : std_logic;
signal MTINT           : std_logic;

-- Monitor Signals

signal  SMR0_STEX     :  std_logic; 
signal  SMR0_SBIT     :  std_logic; 
signal  SMR0_SRST     :  std_logic; 
signal  SMR0_CHAEN    :  std_logic; 
signal  SMR0_CHBEN    :  std_logic; 
signal  SMR0_ETCE     :  std_logic; 
signal  SMR0_MTO      :  std_logic;
signal  SMR0_EMODE    :  std_logic_vector(1 downto 0);
signal  SMR0_BUFR     :  std_logic; 
signal  SMR0_SMTC     :  std_logic; 
signal  SMR0_BCEN     :  std_logic; 
signal  SMR0_DYNBC    :  std_logic; 
signal  SMR0_PPEN     :  std_logic; 
signal  SMR0_PPON     :  std_logic; 
signal  SMR0_PPONR    :  std_logic; 
signal  SMR0_INTEN    :  std_logic; 
signal  SMR0_XMTSW    :  std_logic;
signal  SMR0_BIT9     :  std_logic;
    
signal  SMR1_RTA      :  std_logic_vector(4 downto 0);
signal  SMR1_RTPTY    :  std_logic;
signal  SMR1_MSEL     :  std_logic_vector(1 downto 0);
signal  SMR1_STDA     :  std_logic;
signal  SMR1_LOCK     :  std_logic;
signal  SMR1_AUTOEN   :  std_logic;
signal  SMR1_SSYSF    :  std_logic;
signal  SMR1_EX       :  std_logic;
signal  SMR1_TAPF     :  std_logic;
signal  SMR1_READY    :  std_logic;
signal  SMR1_TERACT   :  std_logic;
 
signal  SMR2_CC       :  std_logic_vector(15 downto 0);
signal  SMR3_INTM     :  std_logic_vector(15 downto 0);
signal  SMR4_INTR     :  std_logic_vector(15 downto 0);
signal  SMR4_INTRP    :  std_logic_vector(15 downto 0);
signal  SMR5_INTA     :  std_logic_vector(15 downto 1);
    
signal  SMR6_DMAF     :  std_logic;
signal  SMR6_WRAPF    :  std_logic;
signal  SMR6_TAPF     :  std_logic;
signal  SMR6_BITF     :  std_logic;
signal  SMR6_CHAF     :  std_logic;
signal  SMR6_CHBF     :  std_logic;
signal  SMR6_MSBF     :  std_logic;
signal  SMR6_LSBF     :  std_logic;
signal  SMR6_UDB      :  std_logic_vector(7 downto 0);    
    
signal  SMR7_TT       :  UNSIGNED(15 downto 0);
signal  SMR8_PREG     :  UNSIGNED(15 downto 0);

signal  SMR9_IMCLR    :  std_logic;
signal  SMR9_SB       :  std_logic_vector(10 to 19);
    
signal  SMR11_MBA     :  UNSIGNED(15 downto 0);
signal  SMR12_MDA     :  UNSIGNED(15 downto 0);
signal  SMR13_MBC     :  UNSIGNED(15 downto 0);
signal  SMR14_MF      :  std_logic_vector(31 downto 0);
        
signal  SMR_REG0      :  std_logic_vector(15 downto 0);
signal  SMR_REG1      :  std_logic_vector(15 downto 0);
signal  SMR_REG2      :  std_logic_vector(15 downto 0);
signal  SMR_REG3      :  std_logic_vector(15 downto 0);
signal  SMR_REG4      :  std_logic_vector(15 downto 0);
signal  SMR_REG5      :  std_logic_vector(15 downto 0);
signal  SMR_REG6      :  std_logic_vector(15 downto 0);
signal  SMR_REG7      :  std_logic_vector(15 downto 0);
signal  SMR_REG8      :  std_logic_vector(15 downto 0);
signal  SMR_REG9      :  std_logic_vector(15 downto 0);
signal  SMR_REGA      :  std_logic_vector(15 downto 0);
signal  SMR_REGB      :  std_logic_vector(15 downto 0);
signal  SMR_REGC      :  std_logic_vector(15 downto 0);
signal  SMR_REGD      :  std_logic_vector(15 downto 0);
signal  SMR_REGE      :  std_logic_vector(15 downto 0);
signal  SMR_REGF      :  std_logic_vector(15 downto 0);
signal  SMR_REG20     :  std_logic_vector(15 downto 0);

signal  SMD_CONTROL   :  std_logic_vector(15 downto 0);
signal  SMD_DPTR1     :  UNSIGNED(15 downto 0);
signal  SMD_DPTR2     :  UNSIGNED(15 downto 0);
signal  SMD_DPTR3     :  UNSIGNED(15 downto 0);
signal  SMD_MSGINFO   :  std_logic_vector(15 downto 0);
signal  SMD_MIBCAF    :  UNSIGNED(15 downto 0);
    
signal  SMDC_INDX     :  UNSIGNED(7 downto 0);
signal  SMDC_INTX     :  std_logic;
signal  SMDC_IWA      :  std_logic;
signal  SMDC_IBRD     :  std_logic;
signal  SMDC_BAC      :  std_logic;
signal  SMDC_BUFA     :  std_logic;
signal  SMDC_LBUFA    :  std_logic;
signal  SMDC_BRD      :  std_logic;
signal  SMDC_NII      :  std_logic;

signal  SMR3_DMAF     :  std_logic;
signal  SMR3_WRAPF    :  std_logic;
signal  SMR3_TAPF     :  std_logic;
signal  SMR3_BITF     :  std_logic;
signal  SMR3_MERR     :  std_logic;
signal  SMR3_SUBAD    :  std_logic;
signal  SMR3_BDRCV    :  std_logic;
signal  SMR3_IXEQ0    :  std_logic;
signal  SMR3_ILLCMD7  :  std_logic;
signal  SMR3_EOL      :  std_logic;
signal  SMR3_ILLCMD4  :  std_logic;
signal  SMR3_ILLOP    :  std_logic;
signal  SMR3_RTF      :  std_logic;
signal  SMR3_CBA      :  std_logic;
signal  SMR3_MBC      :  std_logic;

signal  SMR4_DMAF     :  std_logic;
signal  SMR4_WRAPF    :  std_logic;
signal  SMR4_TAPF     :  std_logic;
signal  SMR4_BITF     :  std_logic;
signal  SMR4_MERR     :  std_logic;
signal  SMR4_SUBAD    :  std_logic;
signal  SMR4_BDRCV    :  std_logic;
signal  SMR4_IXEQ0    :  std_logic;
signal  SMR4_ILLCMD7  :  std_logic;
signal  SMR4_EOL      :  std_logic;
signal  SMR4_ILLCMD4  :  std_logic;
signal  SMR4_ILLOP    :  std_logic;
signal  SMR4_RTF      :  std_logic;
signal  SMR4_CBA      :  std_logic;    
signal  SMR4_MBC      :  std_logic;    

signal  DATAPTR       :  UNSIGNED(15 downto 0);
signal  BASEPTR       :  UNSIGNED(15 downto 0);
signal  DESCPTR       :  UNSIGNED(15 downto 0);
signal  CAF           :  UNSIGNED(7 downto 0);
signal  CAFPLUS2      :  UNSIGNED(7 downto 0);
signal  CAFOVERFLOW   :  std_logic;
signal  INTLOG        :  std_logic;
signal  INTMSG        :  std_logic;
signal  WINT          :  std_logic;

signal  SMCW_OPCODE   :  std_logic_vector(3 downto 0);
signal  SMCW_RETRY    :  std_logic_vector(1 downto 0);
signal  SMCW_CHA      :  std_logic;
signal  SMCW_RTRT     :  std_logic;
signal  SMCW_CCODE    :  std_logic_vector(7 downto 1);
  
signal  MODECODE      :  std_logic;
signal  TRANSMIT      :  std_logic;
signal  SA            :  std_logic_vector(4 downto 0);
signal  NODATA        :  std_logic;
signal  BCBUSSEL      :  std_logic;
signal  ATTEMPTS      :  UNSIGNED(2 downto 0);
signal  M2MTIMER      :  UNSIGNED(15 downto 0);
       
signal  CW_DOFFSET    :  std_logic_vector(6 downto 0);
signal  SYNC_MRST     :  std_logic;
signal  SYNC_MRST1    :  std_logic;
signal  RSTINTn       :  std_logic;

signal  TCLK_DEL1     :  std_logic;
signal  TCLK_DEL2     :  std_logic;
signal  TTZERO        :  std_logic;
signal  BCLOADTT      :  std_logic;
signal  BC_CMDWORD    :  std_logic_vector(15 downto 0);
signal  iENCDATA      :  std_logic_vector(15 downto 0);
signal  DECDATASYNC   :  std_logic;
signal  BITWORD       :  std_logic_vector(15 downto 0);
signal  MIL1553A      :  std_logic;   
signal  MIL1553B      :  std_logic;   
        
-- Monitor 

type TMTSTATE is (MTIDLE, MTGTCW2, MTWRDP, MTWRTT, MTWRCW1, MTWRCW2, MTWRSW1,
                  MTWRDATA,MTWRTSW2,MTWRMINFO,MTMSGDONE,MTALLDONE);
signal MTSTATE :  TMTSTATE;      

signal  MTMSG_BUSSEL  :  std_logic; 
signal  MTMSG_STBALL  :  std_logic; 
signal  MTMSG_START   :  std_logic; 
signal  MTMSG_CMDWORD :  std_logic_vector(23 downto 0); 
signal  MTDESCPTR     :  UNSIGNED(15 downto 0);
signal  MTDATAPTR     :  UNSIGNED(15 downto 0);
signal  MTCOUNT       :  UNSIGNED(15 downto 0);
signal  MTCOUNTHD     :  UNSIGNED(15 downto 0);
signal  MTWORDCOUNT   :  UNSIGNED(5 downto 0);
signal  MTEXPWCNT     :  UNSIGNED(5 downto 0);
signal  MTMI_WORD     :  std_logic_vector(15 downto 0);
signal  MTMI_CHA      :  std_logic;
signal  MTMI_RTRT     :  std_logic;
signal  MTMI_MSGERR   :  std_logic;
signal  MTMI_MCND     :  std_logic;
signal  MTMI_TOUT     :  std_logic;
signal  MTMI_OVR      :  std_logic;
signal  MTMI_PERR     :  std_logic;
signal  MTMI_MERR     :  std_logic;
signal  MTCW_BCAST    :  std_logic;
signal  MTCW_MCODE    :  std_logic;
signal  MTCW_DATA     :  std_logic;
signal  MTCW_COUNT    :  std_logic_vector(5 downto 0);
signal  MTCW_TX       :  std_logic;
signal  MTCW_SUBADDR  :  std_logic_vector(4 downto 0);
signal  MTCW_MCWC     :  std_logic_vector(4 downto 0);
signal  MONHIT        :  std_logic;
signal  RTACTIVE      :  std_logic;
signal  EXPECTSW      :  std_logic;

signal  INTREAD       :  std_logic;
signal  INTOUTHX      :  std_logic;
signal  IMCOUNT       :  UNSIGNED(1 downto 0);
signal  IHCOUNT       :  UNSIGNED(1 downto 0);
signal  CLR_SRQ       :  std_logic;
signal  FASTIMG       :  std_logic;
signal  CWRT1_LB      :  std_logic_vector(10 downto 0);
signal  CWRT2_LB      :  std_logic_vector(10 downto 0);
signal  TTTEMP        :  UNSIGNED(15 downto 0);

-- MISC
signal  Logic0        :  std_logic;
signal  Logic1        :  std_logic;
signal  ZERO          :  std_logic_vector(15 downto 0);
	

-- Stop the SWRESETX register from being replicated

attribute syn_replicate : boolean;
attribute syn_replicate of SWRESETX : signal is false;


begin
    
Logic0 <= '0';
Logic1 <= '1';
ZERO   <= ( others => '0');
    
--------------------------------------------------------------------
-- Reset Handling 
-- Force a Global reset onto the internal reset network

iBUSRESET  <= RSTREG;          -- RT mode reset does not reset the whole core
BUSRESET   <= iBUSRESET; 
      
RSTINTn   <= not ( not RSTINn or SWRESETX);    

URST : GLOBALBUFF port map ( A => RSTINTn, Y => RSTn );
 
RSTOUTn   <= RSTn;      -- Only asserted by CPU or external reset

process(CLK,RSTINn)     -- This is only reset by the external reset
begin
 if RSTINn='0' then
   SWRESETX   <= '0';
 elsif CLK'event and CLK='1' then
   SWRESETX   <= SMR0_SRST;
 end if;
end process;

process(CLK,RSTn)      -- This is reset by the internal reset, allows the RT address to be reloaded
begin
 if RSTn='0' then
   SYNC_MRST  <= '1';
   SYNC_MRST1 <= '1';
 elsif CLK'event and CLK='1' then
   SYNC_MRST1 <= '0';
   SYNC_MRST  <= SYNC_MRST1;
 end if;
end process;

--------------------------------------------------------------------
-- RT Command Word Decoding 

URT:  BRMRT 
 generic map ( BCENABLE => BCENABLE,
               RTENABLE => RTENABLE,
               MTENABLE => MTENABLE,
               LEGREGS  => LEGREGS,
               ENHANCED => ENHANCED, 
               INITFREQ => INITFREQ )
  port map
       ( CLK            =>  CLK,  
         CLKSPD         =>  CLKFREQ,           
         RSTn           =>  RSTn,  
         RSTREG         =>  RSTREG,
         RTMODE         =>  iRTMODE,         
         RTADDR         =>  SMR1_RTA,          
         RTADDRP        =>  SMR1_RTPTY,         
         RTADERR        =>  RTADDRERR,         
         BCASTEN        =>  SMR0_BCEN,  
         MIL1553A       =>  SMR1_STDA,     
         SMR0_EMODE     =>  SMR0_EMODE,
         SMR9_SB        =>  SMR9_SB,
         DBA            =>  SMR0_DYNBC,
         XMTSW          =>  SMR0_XMTSW,
         CHAEN          =>  SMR0_CHAEN,
         CHBEN          =>  SMR0_CHBEN,
         SSYSFn         =>  SSYSFn,
         RTBUSY         =>  RTBUSY,
         SHUTDOWNRTA    =>  SHUTDOWNRTA,         
         SHUTDOWNRTB    =>  SHUTDOWNRTB,        
         BUSSEL         =>  RTBUSSEL,         
		 BUSSELALL      =>  iBUSSEL,
         TXTIMEOUT      =>  TXTIMEOUT,        
         DECA_FROMUS    =>  DECA_FROMUS,   
         DECA_STROBE    =>  DECA_STROBE,   
         DECA_DATAOUT   =>  DECA_DATAOUT,   
         DECA_CMDSTAT   =>  DECA_CMDSTAT,   
         DECA_GOTSYNC   =>  DECA_GOTSYNC,   
         DECA_PARERR    =>  DECA_PARERR,   
         DECA_MANERR    =>  DECA_MANERR,   
         DECA_ACTIVE    =>  DECA_ACTIVE,   
         DECA_CONTIG    =>  DECA_CONTIG,   
         DECB_FROMUS    =>  DECB_FROMUS,   
         DECB_STROBE    =>  DECB_STROBE,   
         DECB_DATAOUT   =>  DECB_DATAOUT,   
         DECB_CMDSTAT   =>  DECB_CMDSTAT,   
         DECB_GOTSYNC   =>  DECB_GOTSYNC,   
         DECB_PARERR    =>  DECB_PARERR,   
         DECB_MANERR    =>  DECB_MANERR,   
         DECB_ACTIVE    =>  DECB_ACTIVE,   
         DECB_CONTIG    =>  DECB_CONTIG,   
         LOOPFAILA      =>  LOOPFAILA,     
         LOOPFAILB      =>  LOOPFAILB,     
         LATCHSW        =>  LATCHSW,       
         WCNTTO         =>  WCNTTO,  
         WCNTOVR        =>  WCNTOVR,
         CMDDONE        =>  RTCMDDONE,       
         RTSMBUSY       =>  PCONBUSY,      
         BENDFAIL       =>  BENDFAIL,      
         RTMSG_STBME    =>  RTMSG_STBME,
         RTMSG_START    =>  RTMSG_START,   
         RTMSG_CMDWORD  =>  RTMSG_CMDWORD,   
         RTMSG_LEGAL    =>  RTMSG_LEGAL,   
         RTMSG_RTRT     =>  RTMSG_RTRT,    
         RTMSG_RTRTOK   =>  RTMSG_RTRTOK ,  
         RTMSG_OKAY     =>  RTMSG_OKAY,    
         RTMSG_GOTSW    =>  GOTSW,         
         CLR_SRQ        =>  CLR_SRQ,
         TIMER57US      =>  TIMER57US,     
         MSGINFO        =>  SMD_MSGINFO,         
         BITWORD        =>  BITWORD,         
         TXT_CMDSTAT    =>  iENCCMDSTAT,   
         BENDDIN        =>  BENDDIN,    
         TXT_DATAIN     =>  iENCDATA,      
         CMDSYNC        =>  CMDSYNC,       
         SYNCNOW        =>  iSYNCNOW,
         USEXTOK        =>  USEXTOK,
         BITSELECT      =>  BITSELECT,
         CMDOKREG       =>  CMDOKREG,
         CMDVAL         =>  CMDVAL,        
         CMDOK          =>  CMDOK,         
         CMDSTB         =>  iCMDSTB,         
         CMDOKOUT       =>  CMDOKOUT       
        );               
 
CMDSTB <= iCMDSTB; 
        
ENCDATA    <= iENCDATA;

MSGSTART   <=  RTMSG_START;

DECFROMUS  <=  DECA_FROMUS  when iBUSSEL='0' else DECB_FROMUS;
DECSTROBE  <=  DECA_STROBE  when iBUSSEL='0' else DECB_STROBE;
DECDATA    <=  DECA_DATAOUT when iBUSSEL='0' else DECB_DATAOUT;
DECCMDSTAT <=  DECA_CMDSTAT when iBUSSEL='0' else DECB_CMDSTAT;
DECGOTSYNC <=  DECA_GOTSYNC when iBUSSEL='0' else DECB_GOTSYNC;
DECPARERR  <=  DECA_PARERR  when iBUSSEL='0' else DECB_PARERR;
DECMANERR  <=  DECA_MANERR  when iBUSSEL='0' else DECB_MANERR; 
DECACTIVE  <=  DECA_ACTIVE  when iBUSSEL='0' else DECB_ACTIVE; 
DECCONTIG  <=  DECA_CONTIG  when iBUSSEL='0' else DECB_CONTIG; 

DECDATASYNC <= DECGOTSYNC and not DECCMDSTAT;


PBS:
process(iBCMODE,iMTMODE,SHUTDOWNRTA,SHUTDOWNRTB,RTBUSSEL,BCBUSSEL,
        RTACTIVE,MTMSG_BUSSEL,RTADDRERR)
begin 
  if iBCMODE='1' then
    SHUTDOWNA <=     BCBUSSEL;  
    SHUTDOWNB <= not BCBUSSEL;  
    RXBUSENA  <= not BCBUSSEL;          
    RXBUSENB  <=     BCBUSSEL;          
    iBUSSEL   <=     BCBUSSEL;
  elsif RTACTIVE='1' then
    SHUTDOWNA <= SHUTDOWNRTA;  
    SHUTDOWNB <= SHUTDOWNRTB;   
    RXBUSENA  <= not RTADDRERR;         
    RXBUSENB  <= not RTADDRERR;         
    iBUSSEL   <= RTBUSSEL;
  elsif iMTMODE='1' then
    SHUTDOWNA <= '0';  
    SHUTDOWNB <= '0';   
    RXBUSENA  <= '1';         
    RXBUSENB  <= '1';         
    iBUSSEL   <= MTMSG_BUSSEL;
  else
    SHUTDOWNA <= SHUTDOWNRTA;  
    SHUTDOWNB <= SHUTDOWNRTB;   
    RXBUSENA  <= not RTADDRERR;        
    RXBUSENB  <= not RTADDRERR;        
    iBUSSEL   <= RTBUSSEL; 
  end if;
end process;


LOOPFAIL   <=  LOOPFAILA or LOOPFAILB;

BUSSEL  <= iBUSSEL;
 
-- SYNC is active for RT SYNC modecode 
SYNCNOW <= iSYNCNOW;  

--------------------------------------------------------------------
-- RT Command Word Decoding 
--
 
CW_BCAST   <= RTMSG_CMDWORD(23);
CW_MCODE   <= RTMSG_CMDWORD(22);
CW_DATA    <= not RTMSG_CMDWORD(22);
CW_COUNT   <= RTMSG_CMDWORD(21 downto 16);
CW_TX      <= RTMSG_CMDWORD(10);
CW_SUBADDR <= RTMSG_CMDWORD(9 downto 5);
CW_MCWC    <= RTMSG_CMDWORD(4 downto 0);
 
CW_STBME   <= RTMSG_STBME; 
RTSTART    <= RTMSG_START;
RTRTRT     <= RTMSG_RTRT;   
RTRTOK     <= RTMSG_RTRTOK;
LEGAL      <= RTMSG_LEGAL;  

process( CW_MCODE,CW_TX,CW_SUBADDR,CW_MCWC)
begin
 if CW_MCODE='0' then
   CW_DOFFSET <= '0' & CW_TX & CW_SUBADDR;
 else
   CW_DOFFSET <= '1' & CW_TX & CW_MCWC;
 end if;
end process;

--------------------------------------------------------------------
-- Monitor Command Word Decoding 
--
 

UMT :  BRMMT
  port map ( CLK           => CLK,
             RSTn          => RSTn,
             BCASTEN       => SMR0_BCEN,  
             MIL1553A      => SMR1_STDA, 
             EXPECTSW      => EXPECTSW,             
             DECA_STROBE   => DECA_STROBE,   
             DECA_DATAOUT  => DECA_DATAOUT,   
             DECA_CMDSTAT  => DECA_CMDSTAT,   
             DECA_GOTSYNC  => DECA_GOTSYNC,   
             DECA_PARERR   => DECA_PARERR,   
             DECA_MANERR   => DECA_MANERR,   
             DECA_ACTIVE   => DECA_ACTIVE,   
             DECA_CONTIG   => DECA_CONTIG,   
             DECA_FROMUS   => DECA_FROMUS,
             DECB_STROBE   => DECB_STROBE,   
             DECB_DATAOUT  => DECB_DATAOUT,   
             DECB_CMDSTAT  => DECB_CMDSTAT,   
             DECB_GOTSYNC  => DECB_GOTSYNC,   
             DECB_PARERR   => DECB_PARERR,   
             DECB_MANERR   => DECB_MANERR,   
             DECB_ACTIVE   => DECB_ACTIVE,   
             DECB_CONTIG   => DECB_CONTIG,   
             DECB_FROMUS   => DECB_FROMUS,
             MTMSG_BUSSEL  => MTMSG_BUSSEL,  
             MTMSG_STBALL  => MTMSG_STBALL,  
             MTMSG_START   => MTMSG_START,   
             MTMSG_CMDWORD => MTMSG_CMDWORD
            );

 
MTCW_BCAST   <= MTMSG_CMDWORD(23);
MTCW_MCODE   <= MTMSG_CMDWORD(22);
MTCW_DATA    <= not MTMSG_CMDWORD(22);
MTCW_COUNT   <= MTMSG_CMDWORD(21 downto 16);
MTCW_TX      <= MTMSG_CMDWORD(10);
MTCW_SUBADDR <= MTMSG_CMDWORD(9 downto 5);
MTCW_MCWC    <= MTMSG_CMDWORD(4 downto 0);


--------------------------------------------------------------------
-- Register Block 
--

UREGS: BRMREG 
 generic map ( FAMILY   => FAMILY,
               BCENABLE => BCENABLE,
               RTENABLE => RTENABLE,
               MTENABLE => MTENABLE,
               LEGREGS  => LEGREGS,
               ENHANCED => ENHANCED, 
               INITFREQ => INITFREQ )
 port map    ( CLK       =>  CLK,
               RSTn      =>  RSTn,
               SMR0_STEX =>  SMR0_STEX,
               CMDSTB    =>  iCMDSTB,
               CPUSEL    =>  CPUADDRR(4),
               CPUADDR   =>  CPUADDR(3 downto 0),
               CPUADDRR  =>  CPUADDRR(3 downto 0),
               CPUWR     =>  CPUWRR,
               CPURD     =>  CPURDR,
               CPUDIN    =>  CPUDINR,
               CPUDOUT   =>  CPUDOUT2,       
               BITSELECT =>  BITSELECT,
               CMDOKREG  =>  CMDOKREG 
              ); 
 
--------------------------------------------------------------------
-- Register Read Function 
-- Logic should minimize when functioned removed. Synthesis tool should
-- remove unused registers

process(CPUADDR,SMR_REG0,SMR_REG1,SMR_REG2,SMR_REG3,
                SMR_REG4,SMR_REG5,SMR_REG6,SMR_REG7,
                SMR_REG8,SMR_REG9,SMR_REGA,SMR_REGB,
                SMR_REGC,SMR_REGD,SMR_REGE,SMR_REGF )
begin
   CPUDOUT1 <= ( others => '-');
   case CPUADDR(3 downto 0) is
     when "0000"  => CPUDOUT1 <= SMR_REG0;
     when "0001"  => CPUDOUT1 <= SMR_REG1;
     when "0010"  => CPUDOUT1 <= SMR_REG2;
     when "0011"  => CPUDOUT1 <= SMR_REG3;
     when "0100"  => CPUDOUT1 <= SMR_REG4;
     when "0101"  => CPUDOUT1 <= SMR_REG5;
     when "0110"  => CPUDOUT1 <= SMR_REG6;
     when "0111"  => CPUDOUT1 <= SMR_REG7;
     when "1000"  => if BCENABLE=1 or RTENABLE=1 then CPUDOUT1 <= SMR_REG8; end if;
     when "1001"  => if RTENABLE=1 then CPUDOUT1 <= SMR_REG9; end if;
     when "1010"  => if BCENABLE=1 then CPUDOUT1 <= SMR_REGA; end if; 
     when "1011"  => if MTENABLE=1 then CPUDOUT1 <= SMR_REGB; end if;
     when "1100"  => if MTENABLE=1 then CPUDOUT1 <= SMR_REGC; end if;
     when "1101"  => if MTENABLE=1 then CPUDOUT1 <= SMR_REGD; end if;
     when "1110"  => if MTENABLE=1 then CPUDOUT1 <= SMR_REGE; end if;
     when "1111"  => if MTENABLE=1 then CPUDOUT1 <= SMR_REGF; end if;
     when others  => CPUDOUT1 <= ( others => '-');
  end case;
end process;     

process(CPUADDR,CPUDOUT1,CPUDOUT2,SMR_REG20)
begin
   case CPUADDR(4) is
     when '0'     => CPUDOUT <= CPUDOUT1;
     when others  => CPUDOUT <= CPUDOUT2;
   end case;
   if ENHANCED=1 then
     case CPUADDR(5 downto 4) is
       when "00"   => CPUDOUT <= CPUDOUT1;
       when "01"   => CPUDOUT <= CPUDOUT2;
       when others => CPUDOUT <= SMR_REG20;
     end case;
   end if;
end process;

                                                          
--------------------------------------------------------------------
-- Register CPU inputs to simplify timing 
--

process(CLK,RSTn)
begin
  if RSTn='0' then
    CPUDINR   <= ( others => '0');
    CPUADDRR  <= "000000";
    CPUWRR    <= "00";
    CPURDR    <= '0';
    CPUWRRD   <= "00";
    CPUSTB    <= '0';
    CPUCLRINT <= '0';
  elsif CLK'event and CLK='1' then
    CPUDINR   <= CPUDIN;  
    CPUADDRR  <= '0' & CPUADDR(4 downto 0); 
    if ENHANCED=1 then
      CPUADDRR(5)  <= CPUADDR(5); 
    end if;
    CPUWRR    <= CPUWR; 
    CPURDR    <= CPURD; 
    CPUWRRD   <= CPUWRR;
    CPUSTB    <= CPURD or CPUWR(1) or CPUWR(0);
    CPUCLRINT <= not (CPURD or CPUWR(1) or CPUWR(0)) and CPUSTB;
  end if;
end process;
            
--------------------------------------------------------------------
-- Actel Enhancments Register
-- Reset only bas external reset

CLKFREQL  <= to_std_logic(to_unsigned(((INITFREQ-12)/4),2)); -- convert 12-24 to 00-11
CLKFREQ   <= CLKFREQL when LOCKFREQ=1 else CLKFREQS;

process(CLK,RSTINn)
begin
  if RSTINn='0' then
    FORCEORUN   <= '0';
    USEXTOK     <= '0';
    FASTIMG     <= '0';
    CLKFREQS    <= to_std_logic(to_unsigned(((INITFREQ-12)/4),2)); -- convert 12-24 to 00-11
    ACT_ENHANCE <= '0';
    iLOOPBACK   <= '0';
  elsif CLK'event and CLK='1' then
    if CPUWRR(1)='1' and CPUADDRR="100000" and ENHANCED=1 then
      CLKFREQS    <= CPUDINR(1 downto 0);
      USEXTOK     <= CPUDINR(2);
      FORCEORUN   <= CPUDINR(3);
      FASTIMG     <= CPUDINR(4);
      ACT_ENHANCE <= CPUDINR(5);
      iLOOPBACK   <= CPUDINR(6);
    end if;
  end if;
end process;

LOOPBACK <= iLOOPBACK;

SMR_REG20 <= VERSION & '0' & iLOOPBACK & ACT_ENHANCE & FASTIMG & FORCEORUN & USEXTOK & CLKFREQ
              when ENHANCED=1
              else ( others => '-');

--------------------------------------------------------------------
-- CPU Registers
-- 

SMR1_AUTOEN  <= '0';
SMR1_SSYSF   <= not SSYSFn;
SMR1_EX      <= iBUSY; 
SMR1_TAPF    <= RTADDRERR;
SMR1_READY   <= '1';         -- since no BIT or Initilaisation is always ready
SMR1_TERACT  <= iBUSY;           

iRTMODE <= to_logic(RTENABLE) and to_logic(SMR1_MSEL="01" or SMR1_MSEL="11");
iBCMODE <= to_logic(BCENABLE) and to_logic(SMR1_MSEL="00");
iMTMODE <= to_logic(MTENABLE) and to_logic(SMR1_MSEL="10" or SMR1_MSEL="11");

PREG01:
process(CLK,RSTn)
begin
  if RSTn='0' then
      SMR1_RTA      <= "00000";
      SMR1_RTPTY    <= '1';     -- prevents a TAPF before loading the register from pads
      SMR1_MSEL     <= "00";
      SMR1_STDA     <= '0';
      SMR1_LOCK     <= '1';
  elsif CLK'event and CLK='1' then
    if SYNC_MRST='1'  then 
      SMR1_RTA   <= RTADDRIN;
      SMR1_RTPTY <= RTADDRPIN;
      SMR1_MSEL  <= MSELIN;
      SMR1_STDA  <= ABSTDIN;
      SMR1_LOCK  <= not LOCKn;
    elsif SMR1_LOCK='0' and SMR0_STEX='0' then      -- only load when inactive and not lock
      if CPUWRR(1)='1' and CPUADDRR="000001" then
        SMR1_RTA   <= CPUDINR(15 downto 11);       
        SMR1_RTPTY <= CPUDINR(10);
        SMR1_MSEL  <= CPUDINR(9 downto 8);
      end if;
      if CPUWRR(0)='1' and CPUADDRR="000001" then
        SMR1_STDA <= CPUDINR(7);  
      end if;  
    end if;
  end if;
end process; 

OPMODE <= SMR1_MSEL;

-- BIT 9 is not truely read and writable. In RT Mode this bit reflects
-- the PPEN status. In BC mode we provide readback. 

SMR0_BIT9 <= SMR0_MTO when iRTMODE='0' else SMR0_PPON; 

SMR_REG0 <= SMR0_STEX & SMR0_SBIT & SMR0_SRST 
            & SMR0_CHAEN & SMR0_CHBEN & SMR0_ETCE  & SMR0_BIT9 
            & SMR0_EMODE & SMR0_BUFR  & SMR0_SMTC  & SMR0_BCEN  
            & SMR0_DYNBC & SMR0_PPEN  & SMR0_INTEN & SMR0_XMTSW;
             
             
SMR_REG1 <= SMR1_RTA & SMR1_RTPTY & SMR1_MSEL & SMR1_STDA  
            & SMR1_LOCK & SMR1_AUTOEN & SMR1_SSYSF & SMR1_EX & SMR1_TAPF 
            & SMR1_READY & SMR1_TERACT;           


-- Command Word register function varies based on mode 

PMCCW:
process(CLK,RSTn)
begin
  if RSTn='0' then
    BC_CMDWORD <= ( others => '0');
  elsif CLK'event and CLK='1' then
    if iENCCMDSTAT='1' and iENCSTROBE='1' then
      BC_CMDWORD <= iENCDATA;
    end if;
  end if;
end process;

PCCWMUX:
process(SMR1_MSEL,BC_CMDWORD,RTMSG_CMDWORD,MTMSG_CMDWORD)
begin
  case SMR1_MSEL is
    when "00"   => SMR2_CC <= BC_CMDWORD;
    when "01"   => SMR2_CC <= RTMSG_CMDWORD(15 downto 0);
    when "10"   => SMR2_CC <= MTMSG_CMDWORD(15 downto 0);
    when others => SMR2_CC <= MTMSG_CMDWORD(15 downto 0);
  end case;
end process;


SMR_REG2 <= SMR2_CC;


SMR3_INTM <=   SMR3_DMAF & SMR3_WRAPF & SMR3_TAPF & SMR3_BITF & SMR3_MERR 
             & SMR3_SUBAD & SMR3_BDRCV & SMR3_IXEQ0 & SMR3_ILLCMD7 & '0'
             & SMR3_EOL & SMR3_ILLCMD4 & SMR3_ILLOP & SMR3_RTF
             & SMR3_CBA & SMR3_MBC;
      
SMR4_INTRP<=   SMR4_DMAF & SMR4_WRAPF & SMR4_TAPF & SMR4_BITF 
             & SMR4_MERR & SMR4_SUBAD & SMR4_BDRCV & SMR4_IXEQ0 
             & SMR4_ILLCMD7 & '0' & SMR4_EOL & SMR4_ILLCMD4 
             & SMR4_ILLOP & SMR4_RTF & SMR4_CBA & SMR4_MBC;

SMR_REG3 <= SMR3_INTM;
SMR_REG4 <= SMR4_INTR;
SMR_REG5 <= SMR5_INTA & '0';

INTOUTHX <= SMR4_DMAF or SMR4_WRAPF or SMR4_TAPF or SMR4_BITF;

MEMFAIL  <= SMR4_DMAF;

-- Generates the  3 cycle pulse on INTOUTH or level
PINTOUT:
process(CLK,RSTn)
begin
  if RSTn='0' then
    IHCOUNT <= "00";
    INTOUTH <= '0';
  elsif CLK'event and CLK='1' then
    case IHCOUNT is
     when "00"   => if INTOUTHX='1' then
                      INTOUTH <= '1';
                      IHCOUNT <= "01";
                    end if;
     when "01"   => IHCOUNT <= "10";
     when "10"   => IHCOUNT <= "11";
     when others => if INTLEVEL='0' then
                      INTOUTH <= '0';
                    end if;
                    if INTOUTHX='0' then
                      IHCOUNT <= "00";
                    end if;
    end case; 
    if INTLEVEL='1' and INTACKH='1' then
      INTOUTH <= '0';
    end if; 
 end if;
end process; 


INTMSG  <=    SMR4_MERR or SMR4_SUBAD or SMR4_BDRCV or SMR4_IXEQ0 or SMR4_ILLCMD7
           or SMR4_EOL or SMR4_ILLCMD4 or SMR4_ILLOP or SMR4_RTF or SMR4_CBA or SMR4_MBC;

INTOUTM <= INTMSG when SMR0_INTEN='0' else INTLOG;
 
-- BIT Register    
    
PREGRT6:
process(CLK,RSTn)
begin
  if RSTn='0' then
    SMR6_DMAF  <= '0';
    SMR6_WRAPF <= '0';
    SMR6_BITF  <= '0';
    SMR6_TAPF  <= '0';
    SMR6_CHAF  <= '0';
    SMR6_CHBF  <= '0';
    SMR6_MSBF  <= '0';
    SMR6_LSBF  <= '0';
    SMR6_UDB   <= ( others => '0');
  elsif CLK'event and CLK='1' then
    if CPUWRR(1)='1' and CPUADDRR="000110" then
      SMR6_DMAF  <= CPUDINR(15);
      SMR6_WRAPF <= CPUDINR(14);
      SMR6_BITF  <= CPUDINR(12);
      SMR6_TAPF  <= CPUDINR(13);
      SMR6_CHAF  <= CPUDINR(11);
      SMR6_CHBF  <= CPUDINR(10);
      SMR6_MSBF  <= CPUDINR(9);  
      SMR6_LSBF  <= CPUDINR(8);  
    end if;
    if CPUWRR(0)='1' and CPUADDRR="000110" then
      SMR6_UDB <= CPUDINR(7 downto 0);
    end if;
    if BENDFAIL='1'  then
      SMR6_DMAF <= '1';
    end if;
    if LOOPFAIL='1' then
      SMR6_WRAPF <= '1';
    end if;
    if RTADDRERR='1' then
      SMR6_TAPF <= '1';
    end if;
    if TXTIMEOUT='1' and iBUSSEL='0'  then
      SMR6_CHAF <= '1';
    end if;
    if TXTIMEOUT='1' and iBUSSEL='1' then
      SMR6_CHBF <= '1';
    end if;
    if SYNC_MRST='1' then 
      SMR6_UDB <= VERSION;
    end if;
  end if;
end process;


BITWORD <=   SMR6_DMAF & SMR6_WRAPF & SMR6_TAPF & SMR6_BITF
           & SMR6_CHAF & SMR6_CHBF  & SMR6_MSBF & SMR6_LSBF
           & SMR6_UDB;


SMR_REG6  <= BITWORD;

    
PREG7:
process(CLK,RSTn)
begin
  if RSTn='0' then
    SMR7_TT   <= ( others => '0');
    TCLK_DEL1 <= '0';
    TCLK_DEL2 <= '0';
  elsif CLK'event and CLK='1' then
    TCLK_DEL1 <= TCLK;
    TCLK_DEL2 <= TCLK_DEL1;
    
    -- Counting Control
    if   (SMR0_ETCE='0' and CLKSTB='1') 
      or (SMR0_ETCE='1' and TCLK_DEL1='1' and TCLK_DEL2='0')      
    then 
      if iBCMODE='1' then
        if TTZERO='0' then
          SMR7_TT <= SMR7_TT - 1;
        end if;
      else
        SMR7_TT <= SMR7_TT + 1;
      end if;
    end if;
    
    -- Register is Read only in BC mode
    if iBCMODE='0' and CPUWRR(1)='1' and CPUADDRR="000111" then
      SMR7_TT(15 downto 8) <= to_unsigned(CPUDINR(15 downto 8));
    end if;
    if iBCMODE='0' and CPUWRR(0)='1' and CPUADDRR="000111" then
      SMR7_TT(7 downto 0)  <= to_unsigned(CPUDINR(7 downto 0));
    end if;
 
    if (iSYNCNOW='1' or iBUSRESET='1') and iRTMODE='1' then
      -- TIMETAG is loaded with data or reset
      if SMR2_CC(4)='1' then
        SMR7_TT <= to_unsigned(DECDATA);
      else
        SMR7_TT <= ( others => '0');
      end if;
    end if; 
    if (iBCMODE='1' and SMR0_STEX='0')  then
      SMR7_TT <= ( others => '0');
    end if;
    if BCLOADTT='1' then
      SMR7_TT <= to_unsigned(BENDDIN);
    end if;
   end if;
end process;

TTZERO <= to_logic( SMR7_TT = 0);

SMR_REG7 <= to_std_logic(SMR7_TT);

SMR_REG8 <= to_std_logic(SMR8_PREG);

PREGRT9:
process(CLK,RSTn)
begin
  if RSTn='0' then
    SMR9_IMCLR <= '0';
    SMR9_SB    <= ( others => '0');
  elsif CLK'event and CLK='1' then
    if CPUWRR(1)='1' and CPUADDRR="001001" then
      SMR9_IMCLR <= CPUDINR(15);
      SMR9_SB(10 to 11) <= CPUDINR(9 downto 8);
    end if;
    if CPUWRR(0)='1' and CPUADDRR="001001" then
      SMR9_SB(12 to 19) <= CPUDINR(7 downto 0);
    end if;
    if RTCMDDONE='1' and SMR9_IMCLR='1' then
      SMR9_SB <= ( others => '0');
    end if;
    if CLR_SRQ='1' and SMR1_STDA='0' then  -- clear bit on VW if in BUSB mode
      SMR9_SB(11) <= '0';
    end if;
  end if;
end process;
      
SMR_REG9 <= SMR9_IMCLR & "00000" & SMR9_SB;

PREGRT11:
process(CLK,RSTn)
begin
  if RSTn='0' then
    SMR11_MBA <= ( others => '0');
  elsif CLK'event and CLK='1' then
    if CPUWRR(1)='1' and CPUADDRR="001011" then
      SMR11_MBA(15 downto 8) <= to_unsigned(CPUDINR(15 downto 8));
    end if;
    if CPUWRR(0)='1' and CPUADDRR="001011" then
      SMR11_MBA(7 downto 0) <= to_unsigned(CPUDINR(7 downto 0));
    end if;
  end if;
end process;

SMR_REGB  <= to_std_logic(SMR11_MBA);


PREGRT12:
process(CLK,RSTn)
begin
  if RSTn='0' then
    SMR12_MDA <= ( others => '0');
  elsif CLK'event and CLK='1' then
    if CPUWRR(1)='1' and CPUADDRR="001100" then
      SMR12_MDA(15 downto 8) <= to_unsigned(CPUDINR(15 downto 8));
    end if;
    if CPUWRR(0)='1' and CPUADDRR="001100" then
      SMR12_MDA(7 downto 0) <= to_unsigned(CPUDINR(7 downto 0));
    end if;
  end if;
end process;

SMR_REGC  <= to_std_logic(SMR12_MDA);

SMR_REGD  <= to_std_logic(SMR13_MBC);


PREGRT14:
process(CLK,RSTn)
begin
  if RSTn='0' then
    SMR14_MF <= ( others => '0');
  elsif CLK'event and CLK='1' then
    if CPUWRR(1)='1' and CPUADDRR="001110" then
      SMR14_MF(31 downto 24) <= CPUDINR(15 downto 8);
    end if;
    if CPUWRR(0)='1' and CPUADDRR="001110" then
      SMR14_MF(23 downto 16) <= CPUDINR(7 downto 0);
    end if;
    if CPUWRR(1)='1' and CPUADDRR="001111" then
      SMR14_MF(15 downto 8) <= CPUDINR(15 downto 8);
    end if;
    if CPUWRR(0)='1' and CPUADDRR="001111" then
      SMR14_MF(7 downto 0) <= CPUDINR(7 downto 0);
    end if;
  end if;
end process;

SMR_REGE  <= SMR14_MF(31 downto 16);
SMR_REGF  <= SMR14_MF(15 downto 0);


SMR_REGA  <= ( others => '0');   -- BC Command Block Initialization


RTADERR  <= RTADDRERR;

--------------------------------------------------------------------
-- Clock and TIMER Scaling 
--

PSC1:
process(CLKFREQ)
 begin
   case CLKFREQ is
     when "00"   => SCALE <= "01011"; -- 12MHz      
     when "01"   => SCALE <= "01111"; -- 16MHz      
     when "10"   => SCALE <= "10011"; -- 20MHz      
     when others => SCALE <= "10111"; -- 24MHz      
   end case;
end process;

CLKSPD <= CLKFREQ;

PSC2:
process(CLK,RSTn)
begin
  if RSTn='0' then
    CLKSTB    <= '0';
    CLKSTB1US <= '0';
    SCALER1   <= "00000";
    SCALER2   <= "000000";
  elsif CLK'event and CLK='1' then
    CLKSTB  <= '0';
    SCALER1 <= SCALER1 + 1;
    if SCALER1=SCALE then
      SCALER1 <= "00000";
    end if;
    CLKSTB1US <= to_logic(SCALER1="00000");
    if CLKSTB1US='1' then 
      SCALER2 <= SCALER2 + 1;
      CLKSTB  <= to_logic(SCALER2(5 downto 0) = "111111"); -- 64us 
    end if;
  end if;
end process;

-- DECACTIVE stays Active for approx 5us after the last word if the bus is quiet

process(FASTIMG)
 begin
   if FASTIMG='1' then
     IMGVALUE <=  "00001";   -- 6 us 5+1    We can go faster depending on memory
   else
     IMGVALUE <=  "10111";   -- 28 us 5+23  Summit has an IMG of 28us
   end if;
 end process;



-- DECACTIVE stays active for 5us after last WORD and takes 3us to reactivate
-- DEC_INACTIVE = RESPTIME - 2.0us

process(SMR1_STDA,SMR0_MTO)
 variable muxsel : std_logic_vector(1 downto 0);
 begin
   muxsel := SMR0_MTO & SMR1_STDA;
   case muxsel is
    when "00" => RESPVALUE <= "01100";   -- B: 14 us   14-2=12
    when "01" => RESPVALUE <= "00111";   -- A: 9  us    9-2=7 
    when "10" => RESPVALUE <= "11100";   -- B: 30 us   30-2=28
    when "11" => RESPVALUE <= "10011";   -- A: 21 us   21-2=19 
    when others =>
   end case;
end process;


--------------------------------------------------------------------
-- BC SW Checking TSW Setting 
--

MIL1553A <= SMR1_STDA;
MIL1553B <= not SMR1_STDA;

MSG_ERROR   <= SW_MSGERR or RT_NORESP or RT_ERROR or SW_ERROR;   -- Note SW_BUSY is not a message error
MSG_ERRORCC <= SW_MSGERR or RT_NORESP or RT_ERROR or SW_ERROR; 


--------------------------------------------------------------------
-- Condition Code Mux 
--

PCCMUX:
process(SMCW_CCODE,MSG_ERRORCC,SW_MSGERR,SW_BUSY,SW_TFLAG,SW_SSFLAG,SW_INSTRU,SW_SREQ)
variable CC : std_logic_vector(7 downto 1);
 begin
   CC(7) := SMCW_CCODE(7) and MSG_ERRORCC;
   CC(6) := SMCW_CCODE(6) and SW_MSGERR;
   CC(5) := SMCW_CCODE(5) and SW_BUSY;
   CC(4) := SMCW_CCODE(4) and SW_TFLAG;
   CC(3) := SMCW_CCODE(3) and SW_SSFLAG;
   CC(2) := SMCW_CCODE(2) and SW_INSTRU;
   CC(1) := SMCW_CCODE(1) and SW_SREQ;     
   CCFLAG <= CC(7) or CC(6) or CC(5) or CC(4) or CC(3) or CC(2) or CC(1);
end process;


--------------------------------------------------------------------
-- The Master STATE machine 
--

PSTB:
process(CLK,RSTn)  
begin
  if RSTn='0' then
    DECSTBDEL1  <= '0';
    DECSTB      <= '0';
    DECSTBOKSW  <= '0';
    DECSTBOKSWA <= '0';
    DECSTBOKDW  <= '0';
    DECSTBOKCW  <= '0';
  elsif CLK'event and CLK='1' then
    DECSTBDEL1  <= DECSTROBE;  
    DECSTB      <= DECSTROBE and not DECFROMUS;
    DECSTBOKCW  <= DECSTROBE and DECCMDSTAT and not DECFROMUS 
                     and not DECPARERR and not DECMANERR;
    DECSTBOKSW  <= DECSTROBE and DECCMDSTAT and not DECCONTIG and not DECFROMUS 
                    and not DECPARERR and not DECMANERR;
    DECSTBOKSWA <= DECSTROBE and DECCMDSTAT and not DECCONTIG  
                    and not DECPARERR and not DECMANERR;
    DECSTBOKDW  <= DECSTROBE and not DECCMDSTAT and DECCONTIG 
                     and not DECPARERR and not DECMANERR;
  end if;
end process;


PSM:
process(CLK,RSTn)
type TBUFMODE is ( INDEX,PPONG,CIRC1,CIRC2);
variable BENDWAIT   : std_logic;
variable MUXSEL     : std_logic_vector(3 downto 0);
variable RTMUXSEL   : std_logic_vector(2 downto 0);
variable MTMUXSEL   : std_logic_vector(2 downto 0);
variable RTBUFMODE  : std_logic_vector(2 downto 0);
variable BUFMODE    : TBUFMODE;
variable CALLOKAY   : std_logic;
begin
  if RSTn='0' then
    BCSTATE      <= BCIDLE;
    ABORT        <= '0';
    iENCSTROBE   <= '0';
    iENCCMDSTAT  <= '0';
    iBENDREQ     <= '0';
    iBENDWRT     <= '0';
    iBENDBURST   <= '0';
    BENDADDR     <= ( others => '0');
    BENDDOUT     <= ( others => '0');
    RTTIMER      <= ( others => '0');
    DATAPTR      <= ( others => '0');
    BASEPTR      <= ( others => '0');
    DESCPTR      <= ( others => '0');
    BCAST        <= '0';
    MSGTYPE      <= "000";
    WORDCOUNT    <= "000000";
    EXPWCNT      <= "000000";
    CWRT1        <= "00000";
    CWRT2        <= "00000";
    IMGDONE      <= '1';
    RTTIMEOUT    <= '0';
    RT_NORESP    <= '0';
    RT_ERROR     <= '0';
    GOTSW1       <= '0';
    GOTSW2       <= '0';
    SW_ERROR     <= '0';
    SW_TFLAG     <= '0';
    SW_DBA       <= '0';
    SW_SSFLAG    <= '0';
    SW_BUSY      <= '0';
    SW_BCAST     <= '0';
    SW_SREQ      <= '0';
    SW_INSTRU    <= '0';
    SW_MSGERR    <= '0';  
    RTSTATE      <= RTIDLE;
    WCNTTO       <= '0';
    WCNTOVR      <= '0';
    PCONBUSY     <= '0';
    LATCHSW      <= '0';
    RTCMDDONE    <= '0';
    CLRERR       <= '0';
    SMDC_INDX    <= ( others => '0');
    SMDC_INTX    <= '0';
    SMDC_IWA     <= '0';
    SMDC_IBRD    <= '0';
    SMDC_BAC     <= '0';
    SMDC_BUFA    <= '0';
    SMDC_LBUFA   <= '0';
    SMDC_BRD     <= '0';
    SMDC_NII     <= '0';
    SMD_DPTR1    <= ( others => '0');                   
    SMD_DPTR2    <= ( others => '0');                   
    SMD_DPTR3    <= ( others => '0'); 
    SMR0_STEX    <= '0';
    SMR0_SBIT    <= '0';
    SMR0_SRST    <= '0';
    SMR0_CHAEN   <= '0';
    SMR0_CHBEN   <= '0';
    SMR0_ETCE    <= '0';
    SMR0_MTO     <= '0';
    SMR0_EMODE   <= "00";
    SMR0_BUFR    <= '0';
    SMR0_SMTC    <= '0';
    SMR0_BCEN    <= '0';
    SMR0_DYNBC   <= '0';
    SMR0_PPEN    <= '0';
    SMR0_PPON    <= '0';
    SMR0_PPONR   <= '0';
    SMR0_INTEN   <= '0';
    SMR0_XMTSW   <= '0';
    SMR3_DMAF    <= '0';
    SMR3_WRAPF   <= '0';
    SMR3_TAPF    <= '0';
    SMR3_BITF    <= '0';
    SMR3_MERR    <= '0';
    SMR3_SUBAD   <= '0';
    SMR3_BDRCV   <= '0';
    SMR3_IXEQ0   <= '0';
    SMR3_EOL     <= '0';
    SMR3_ILLCMD7 <= '0';
    SMR3_EOL     <= '0';
    SMR3_ILLCMD4 <= '0'; 
    SMR3_ILLOP   <= '0';
    SMR3_RTF     <= '0';
    SMR3_CBA     <= '0';
    SMR3_MBC     <= '0';
    SMR4_DMAF    <= '0';
    SMR4_WRAPF   <= '0';
    SMR4_TAPF    <= '0';
    SMR4_BITF    <= '0';
    SMR4_MERR    <= '0';
    SMR4_SUBAD   <= '0';
    SMR4_BDRCV   <= '0';
    SMR4_IXEQ0   <= '0';
    SMR4_EOL     <= '0';
    SMR4_ILLCMD7 <= '0';
    SMR4_EOL     <= '0';
    SMR4_ILLCMD4 <= '0'; 
    SMR4_ILLOP   <= '0';
    SMR4_RTF     <= '0';
    SMR4_CBA     <= '0';
    SMR4_MBC     <= '0';
    SMR4_INTR    <= ( others => '0');
    SMR5_INTA    <= ( others => '0');
    SMR8_PREG    <= ( others => '0');
    DATAPTR      <= ( others => '0');               
    BASEPTR      <= ( others => '0');               
    DESCPTR      <= ( others => '0');               
    CAF          <= ( others => '0');  
    WCNTOVR      <= '0';
    WCNTTO       <= '0';
    WINT         <= '0';
    INTLOG       <= '0';
    SMCW_OPCODE  <= "0000";
    SMCW_RETRY   <= "00";
    SMCW_CHA     <= '0';
    SMCW_RTRT    <= '0';
    SMCW_CCODE   <= "0000000";
    ATTEMPTS     <= "000";
    NODATA       <= '0';
    MODECODE     <= '0';
    TRANSMIT     <= '0';
    BCBUSSEL     <= '0';
    SA           <= "00000";
    M2MTIMER     <= ( others => '0');
    BCLOADTT     <= '0';
    DOINT        <= '0';
    MTSTATE      <= MTIDLE;
    MTMI_TOUT    <= '0';
    INTSTATE     <= IDLE;
    MTDATAPTR    <= ( others => '0');
    MTDESCPTR    <= ( others => '0');
    MTWORDCOUNT  <= ( others => '0');
    MTCOUNT      <= ( others => '0');
    MTCOUNTHD    <= ( others => '0');
    MTMI_OVR     <= '0';
    MTMI_RTRT    <= '0';
    MTEXPWCNT    <= ( others => '0');
    RTACTIVE     <= '0';
    MONHIT       <= '0';
    EXPECTSW     <= '0';
    INTREAD      <= '0';
    IMCOUNT      <= "00";
    MTINT        <= '0';
    CWRT1_LB     <= ( others => '0');
    CWRT2_LB     <= ( others => '0');
    TTTEMP       <= ( others => '0');
  elsif CLK'event and CLK='1' then
    ------------------------------------------------------------------
    -- TIMER, Counts held when Core is inactive
  
    if CLKSTB1US='1' and DECACTIVE='0' then 
      RTTIMER <= RTTIMER + 1;
    end if;
    if DECACTIVE='1' or iENCSTROBE='1' then
      RTTIMER   <= "00000";
      IMGDONE   <= '0';
      RTTIMEOUT <= '0';
    else
      if RTTIMER=RESPVALUE then
        RTTIMEOUT <= '1';
      end if;                                                            
      if RTTIMER=IMGVALUE then
        IMGDONE <= '1';
      end if;   
    end if;

    ------------------------------------------------------------------
    -- Default Actions
    iBENDREQ   <= '0';
    BENDWAIT   := iBENDREQ or BENDBUSY;
    iENCSTROBE <= '0';
    RTCMDDONE  <= '0';
    CLRERR     <= '0';
    BCLOADTT   <= '0';
          
    ------------------------------------------------------------------
    -- CPU Registers
  
    if CPUWRR(1)='1' and CPUADDRR="000000"  then
      SMR0_STEX     <= CPUDINR(15) and not CPUDINR(14);  -- BIT has priority
      SMR0_SBIT     <= CPUDINR(14);                      -- these bits can be written when BUSY
      SMR0_SRST     <= CPUDINR(13);
    end if;  
      
    if CPUWRR(1)='1' and CPUADDRR="000000" and SMR0_STEX='0' then
      SMR0_CHAEN    <= CPUDINR(12);               -- Must be inactive to change these bits
      SMR0_CHBEN    <= CPUDINR(11);
      SMR0_ETCE     <= CPUDINR(10);
      SMR0_MTO      <= CPUDINR(9);
      SMR0_EMODE(1) <= CPUDINR(8);
    end if;  
    if CPUWRR(0)='1' and CPUADDRR="000000" and SMR0_STEX='0' then
      SMR0_EMODE(0) <= CPUDINR(7);                -- Must be inactive to change these bits
      SMR0_BUFR     <= CPUDINR(6);
      SMR0_SMTC     <= CPUDINR(5);
      SMR0_BCEN     <= CPUDINR(4);
      SMR0_DYNBC    <= CPUDINR(3);
      SMR0_PPEN     <= CPUDINR(2);
      SMR0_PPONR    <= CPUDINR(2);
      SMR0_INTEN    <= CPUDINR(1);
      SMR0_XMTSW    <= CPUDINR(0);
    end if;
	
	-- SAR52998  If started then set/reset the PPON bit on writes to the register instead of PPEN
	-- if write pulse is multiple cycles initially this bit will be set with PPEN thats okay
    if CPUWRR(0)='1' and CPUADDRR="000000" and SMR0_STEX='1' and SMR0_PPEN='1' then
      SMR0_PPONR    <= CPUDINR(2);
    end if;
	
	-- SAR59858 Internal PPON must not be turned off whilst message processing is active. If it is
	-- then the A/B bit can indicate the wrong buffer. However can be turned on immediatlty, will cause
	-- core to switch buffers at the end of the current message	search for PPONR for other changes
	if SMR0_PPONR='1' then
	  SMR0_PPON <= '1';
	end if;
	
	if iRTMODE='1' and RTADDRERR='1' then
      SMR0_STEX <= '0';
    end if;
     
    if CPUWRR(1)='1' and CPUADDRR="000011" then
      SMR3_DMAF  <= CPUDINR(15);
      SMR3_WRAPF <= CPUDINR(14);
      SMR3_TAPF  <= CPUDINR(13);
      SMR3_BITF  <= CPUDINR(12);
      SMR3_MERR  <= CPUDINR(11);
      SMR3_SUBAD <= CPUDINR(10);
      SMR3_BDRCV <= CPUDINR(9);
      SMR3_IXEQ0 <= CPUDINR(8);
    end if;
    if CPUWRR(0)='1' and CPUADDRR="000011" then
      SMR3_ILLCMD7 <= CPUDINR(7);
      SMR3_EOL     <= CPUDINR(5);
      SMR3_ILLCMD4 <= CPUDINR(4); 
      SMR3_ILLOP   <= CPUDINR(3);
      SMR3_RTF     <= CPUDINR(2);
      SMR3_CBA     <= CPUDINR(1);
      SMR3_MBC     <= CPUDINR(0);
    end if;  
 
    -- Handle the Interrupt Register Clearing
    -- When register is read note latch the current value and
    -- hold until Interrupt is acknowledged by next CPU access
    -- That only clears interrupts that were read, any generated
    -- since are not cleared
 
    if CPURDR='1' and CPUADDRR="000100"  then
      INTREAD <= '1';
    elsif INTREAD='0' then
      SMR4_INTR <= SMR4_INTRP;
    end if;
 
    if CPUCLRINT='1' and INTREAD='1' then
      INTREAD      <= '0';
      SMR4_DMAF    <= SMR4_DMAF    and not SMR4_INTR(15); -- clear if previously read
      SMR4_WRAPF   <= SMR4_WRAPF   and not SMR4_INTR(14);
      SMR4_TAPF    <= SMR4_TAPF    and not SMR4_INTR(13);
      SMR4_BITF    <= SMR4_BITF    and not SMR4_INTR(12);
      if SMR0_INTEN='0' then  -- If log enabled do not clear these bits
        SMR4_MERR    <= SMR4_MERR    and not SMR4_INTR(11);
        SMR4_SUBAD   <= SMR4_SUBAD   and not SMR4_INTR(10);
        SMR4_BDRCV   <= SMR4_BDRCV   and not SMR4_INTR(9);
        SMR4_IXEQ0   <= SMR4_IXEQ0   and not SMR4_INTR(8);
        SMR4_ILLCMD7 <= SMR4_ILLCMD7 and not SMR4_INTR(7);
        -- Bit 6 is not used
        SMR4_EOL     <= SMR4_EOL     and not SMR4_INTR(5);
        SMR4_ILLCMD4 <= SMR4_ILLCMD4 and not SMR4_INTR(4); 
        SMR4_ILLOP   <= SMR4_ILLOP   and not SMR4_INTR(3);
        SMR4_RTF     <= SMR4_RTF     and not SMR4_INTR(2);
        SMR4_CBA     <= SMR4_CBA     and not SMR4_INTR(1);
        SMR4_MBC     <= SMR4_MBC     and not SMR4_INTR(0);
      end if;
    end if;                             
      
    if CPUWRR(1)='1' and CPUADDRR="000101" then
      SMR5_INTA(15 downto 8) <= CPUDINR(15 downto 8);
    end if;
    if CPUWRR(0)='1' and CPUADDRR="000101" then
      SMR5_INTA(7 downto 1) <= CPUDINR(7 downto 1);
    end if;
 
    if CPUWRR(1)='1' and CPUADDRR="001000" then
      SMR8_PREG(15 downto 8) <= to_unsigned(CPUDINR(15 downto 8));
    end if;
    if CPUWRR(0)='1' and CPUADDRR="001000" then
      SMR8_PREG(7 downto 0)  <= to_unsigned(CPUDINR(7 downto 0));
    end if;
 
    if CPUWRR(1)='1' and CPUADDRR="001101" then
      MTCOUNTHD(15 downto 8) <= to_unsigned(CPUDINR(15 downto 8));
      MTCOUNT  (15 downto 8) <= to_unsigned(CPUDINR(15 downto 8));
    end if;
    if CPUWRR(0)='1' and CPUADDRR="001101" then
      MTCOUNTHD(7 downto 0) <= to_unsigned(CPUDINR(7 downto 0));
      MTCOUNT  (7 downto 0) <= to_unsigned(CPUDINR(7 downto 0));
    end if;
 
    ------------------------------------------------------------------
    -- External Interrupt Settings
    
    if LOOPFAIL='1' then
      RT_ERROR   <= '1';
      SMR4_WRAPF <= SMR3_WRAPF;
    end if;
    if BENDFAIL='1' then
      SMR4_DMAF <= SMR3_DMAF;
    end if;
    
    SMR4_TAPF <= SMR3_TAPF and RTADDRERR and iRTMODE;
    SMR4_BITF <= '0';    -- BIT not implemented therefore always 0
    
    ------------------------------------------------------------------
    -- Instruction State Machine Bus Controller
    --

    -- Call and Jump Enhancement.
    -- if bit 11 (RETRY(1)) is set then only call if bit 10 is zero (RETRY(0))
    if ACT_ENHANCE='0' or SMCW_RETRY(1)='0' then
     CALLOKAY := '1';
    else
     CALLOKAY := not SMCW_RETRY(0); 
    end if;
    
    if iBCMODE='1' then
         case BCSTATE is
           when BCIDLE  =>      iBENDBURST <= '0';
                                PCONBUSY   <=  SMR0_STEX;
                                if SMR0_STEX='1' then
                                   BCSTATE <= BCILIST;
                                   DESCPTR <= SMR8_PREG;
                                end if;
           when BCILIST =>      if BENDWAIT='0' then
                                  iBENDREQ   <= '1';
                                  iBENDWRT   <= '0';
                                  iBENDBURST <= '1';
                                  BENDADDR   <= to_std_logic(DESCPTR+0);
                                  BCSTATE    <= BCGETOPCODE;
                                end if;                   
           when BCGETOPCODE =>  if BENDWAIT='0' then
                                  SMCW_OPCODE <= BENDDIN(15 downto 12);
                                  SMCW_RETRY  <= BENDDIN(11 downto 10);
                                  SMCW_CHA    <= BENDDIN(9);
                                  SMCW_RTRT   <= BENDDIN(8);
                                  SMCW_CCODE  <= BENDDIN(7 downto 1);
                                  BCBUSSEL    <= not BENDDIN(9);
                                  ATTEMPTS    <= to_unsigned( (not BENDDIN(11) and not BENDDIN(10)) & BENDDIN(11 downto 10));
                                  iBENDREQ    <= '1';
                                  iBENDWRT    <= '0';
                                  iBENDBURST  <= '0';
                                  BCSTATE     <= BCDECOPCODE;
                                end if;
           when BCDECOPCODE =>  if BENDWAIT='0' then
                                  SMR8_PREG  <= SMR8_PREG+8;
                                  case SMCW_OPCODE is
                                    when "0000" => -- End of List
                                                   BCSTATE   <= BCMSGDONE;
                                                   --SMR0_STEX <= '0';	  -- v2.16 moved to the end
                                                   SMR4_EOL  <= SMR3_EOL;
                                                   SMR8_PREG <= SMR8_PREG; -- dont increment
                                    when "0001" => -- SKIP and wait for MMT
                                                   iBENDREQ   <= '1';
                                                   iBENDWRT   <= '0';
                                                   BENDADDR   <= to_std_logic(DESCPTR+7);
                                                   BCSTATE    <= BCLOADMMT;
                                    when "0010" => -- GOTO Branch Address
                                                   if CALLOKAY='1' then
                                                     iBENDREQ   <= '1';
                                                     iBENDWRT   <= '0';
                                                     BENDADDR   <= to_std_logic(DESCPTR+6);
                                                     BCSTATE    <= BCGOTO;
                                                   else
                                                     BCSTATE    <= BCIDLE;
                                                   end if;
                                    when "0011" => -- Build in Test
                                                   BCSTATE    <= BCMSGDONE;
                                                   CLRERR     <= '1';
                                    when "0100" => -- Execute Block
                                                   BCSTATE <= BCSTARTM;
                                    when "0101" => -- Execute Block and Branch
                                                   BCSTATE <= BCSTARTM;
                                    when "0110" => -- Exceute Block and Branch on Conition
                                                   BCSTATE <= BCSTARTM;
                                    when "0111" => -- Retry and Execute Block
                                                   BCSTATE <= BCSTARTM;
                                    when "1000" => -- Retry on condition and Branch 
                                                   BCSTATE <= BCSTARTM;
                                    when "1001" => -- Retry on condition and Branch if failed
                                                   BCSTATE <= BCSTARTM;
                                    when "1010" => -- Interrupt and Continue
                                                   SMR4_CBA  <= SMR3_CBA;
                                                   BCSTATE   <= BCMSGDONE;
                                    when "1011" => -- Call
                                                   if CALLOKAY='1' then
                                                     iBENDREQ   <= '1';
                                                     iBENDWRT   <= '0';
                                                     BENDADDR   <= to_std_logic(DESCPTR+6);
                                                     BCSTATE    <= BCCALL;
                                                   else
                                                     BCSTATE    <= BCIDLE;
                                                   end if;
                                    when "1100" => -- Return
                                                   SMR8_PREG  <= SMD_DPTR1;
                                                   BCSTATE    <= BCIDLE;
                                    when "1110" => -- Load Minor Frame Timer
                                                   iBENDREQ   <= '1';
                                                   iBENDWRT   <= '0';
                                                   BENDADDR   <= to_std_logic(DESCPTR+7);
                                                   BCSTATE    <= BCLOADMFT;
                                    when "1111" => -- Return to Branch Address
                                                   SMR8_PREG  <= SMD_DPTR2;
                                                   BCSTATE    <= BCIDLE;
                                    when others => -- Illegal
                                                   SMR4_ILLOP <= SMR3_ILLOP;
                                                   SMR0_STEX  <= '0';
                                                   BCSTATE    <= BCMSGDONE;
                                  end case;
                               end if;
           when BCLOADMMT  =>  if BENDWAIT='0' then   
                                 M2MTIMER <= to_unsigned(BENDDIN);
                                 BCSTATE  <= BCWAITMMT;
                               end if;
           when BCWAITMMT  =>  M2MTIMER <= M2MTIMER -1;
                               if M2MTIMER=0 then
                                 BCSTATE <= BCMSGDONE;
                               end if;
           when BCGOTO     =>  if BENDWAIT='0' then   
                                 SMR8_PREG <= to_unsigned(BENDDIN);
                                 if ACT_ENHANCE='1' then
                                   BCSTATE       <= BCWRTTSW;
                                   SMCW_RETRY(0) <= '1';
                                 else
                                   BCSTATE <= BCMSGDONE;
                                 end if;
                               end if;
           when BCCALL     =>  if BENDWAIT='0' then   
                                 SMD_DPTR1  <= SMR8_PREG;   -- share RT registers
                                 SMR8_PREG  <= to_unsigned(BENDDIN);
                                 if ACT_ENHANCE='1' then
                                   BCSTATE       <= BCWRTTSW;
                                   SMCW_RETRY(0) <= '1';
                                 else
                                   BCSTATE <= BCMSGDONE;
                                 end if;
                               end if;
           when BCLOADMFT  =>  if BENDWAIT='0' and TTZERO='1' then
                                 BCLOADTT <= '1';
                                 BCSTATE  <= BCMSGDONE;
                               end if;
           when BCSTARTM   =>  GOTSW1      <= '0';
                               GOTSW2      <= '0';
                               WORDCOUNT   <= "000000";
                               iBENDREQ    <= '1';
                               iBENDWRT    <= '0';
                               iBENDBURST  <= '0';
                               BENDADDR    <= to_std_logic(DESCPTR+1);
                               iBENDREQ    <= '1';     
                               iBENDWRT    <= '0';
                               RT_NORESP   <= '0';
                               RT_ERROR    <= '0';
                               SW_TFLAG    <= '0';
                               SW_DBA      <= '0';
                               SW_SSFLAG   <= '0';
                               SW_BUSY     <= '0';
                               SW_BCAST    <= '0';
                               SW_SREQ     <= '0';
                               SW_INSTRU   <= '0';
                               SW_MSGERR   <= '0';
                               SW_ERROR    <= '0';    
                               BCSTATE     <= BCGETCW1;
           when BCGETCW1   =>  if BENDWAIT='0' and IMGDONE='1' then
                                 CWRT1  <= BENDDIN(15 downto 11);
                                 CWRT2  <= BENDDIN(15 downto 11);
                                 
                                 SA       <= BENDDIN(9 downto 5);
                                 BCAST    <= to_logic( BENDDIN(15 downto 11) = "11111") and SMR0_BCEN;
                                 TRANSMIT <= BENDDIN(10);
                                 
                                 if (   BENDDIN(9 downto 5)="00000" 
                                    or (SMR1_STDA='0' and BENDDIN(9 downto 5)="11111")) 
                                 then
                                   MODECODE <= '1';
                                   if SMR1_STDA='0' then
                                     NODATA   <= not BENDDIN(4);
                                     EXPWCNT  <= "00000" & BENDDIN(4);
                                   else
                                     NODATA   <= '1';
                                     EXPWCNT  <= "000000";
                                   end if;
                                 else
                                   MODECODE <= '0';
                                   NODATA   <= '0';
                                   if BENDDIN(4 downto 0)="00000" then
                                     EXPWCNT <= to_unsigned('1' & BENDDIN(4 downto 0));
                                   else
                                     EXPWCNT <= to_unsigned('0' & BENDDIN(4 downto 0));
                                   end if;
                                 end if;
                                 if FORCEORUN='1' then
                                   EXPWCNT(5) <= '1';
                                 end if;
                                 BCSTATE <= BCCHECKCW;   
                               end if;
           when BCCHECKCW   => if   (BCAST='1' and MODECODE='0' and TRANSMIT='1')
                                 or (SMCW_RTRT='1' and TRANSMIT='1')
                               then
                                 BCSTATE      <= BCMSGDONE;    -- Illegal Command Word
                                 SMR0_STEX    <= '0';
                                 SMR4_ILLCMD4 <= SMR3_ILLCMD4;
                               else
                                 BCSTATE <= BCTXCW;
                               end if; 
           when BCTXCW      => iENCCMDSTAT <= '1';
                               iENCSTROBE  <= '1';
                               if SMCW_RTRT='1' then
                                  iBENDREQ    <= '1';    -- Read CW2
                                  iBENDWRT    <= '0';
                                  BENDADDR    <= to_std_logic(DESCPTR+2);
                                  BCSTATE     <= BCGETCW2;
                               elsif MODECODE='1' and NODATA='1' then
                                  if BCAST='1' then
                                    BCSTATE <= BCWAITBQ;
                                  else
                                    BCSTATE <= BCWAITSW2;
                                  end if;
                               else 
                                  iBENDREQ  <= '1';    -- Read DPTR
                                  iBENDWRT  <= '0';
                                  BENDADDR  <= to_std_logic(DESCPTR+3);
                                  BCSTATE   <= BCGETDPTR;
                               end if;
           when BCGETCW2   => if BENDWAIT='0' then
                                 CWRT1       <= BENDDIN(15 downto 11);   
                                 iENCCMDSTAT <= '1';
                                 iENCSTROBE  <= '1';
                                 iBENDREQ    <= '1';      
                                 iBENDWRT    <= '0';
                                 BENDADDR    <= to_std_logic(DESCPTR+3);
                                 BCSTATE     <= BCGETDPTR;
                                 if BENDDIN(10)='0' or ( SMR0_BCEN='1' and BENDDIN(15 downto 11)="11111") then   -- check transmit bit is set
                                   BCSTATE      <= BCMSGDONE;                               -- and not BCAST
                                   SMR0_STEX    <= '0';
                                   SMR4_ILLCMD4 <= SMR3_ILLCMD4;
                                 end if;
                              end if;   
           when BCGETDPTR  => if BENDWAIT='0' then
                                 DATAPTR <= to_unsigned(BENDDIN);   
                                 if TRANSMIT='0' and SMCW_RTRT='0' then
                                   BCSTATE <= BCRDDATA1;
                                 else
                                   BCSTATE <= BCWAITSW1;
                                 end if;
                               end if;
           when BCWAITSW1   => if DECSTBOKSW='1' then              
                                 BCSTATE   <= BCWRDATA;              
                                 GOTSW1    <= '1';
                                 iBENDREQ  <= '1';
                                 iBENDWRT  <= '1';
                                 BENDADDR  <= to_std_logic(DESCPTR+4);
                                 BENDDOUT  <= DECDATA;
                                 SW_TFLAG  <= SW_TFLAG  or DECDATA(0);
                                 SW_DBA    <= SW_DBA    or DECDATA(1);
                                 SW_SSFLAG <= SW_SSFLAG or DECDATA(2);
                                 SW_BUSY   <= SW_BUSY   or DECDATA(3);
                                 SW_BCAST  <= SW_BCAST  or DECDATA(4);
                                 SW_SREQ   <= SW_SREQ   or DECDATA(8);
                                 SW_INSTRU <= SW_INSTRU or DECDATA(9);
                                 SW_MSGERR <= SW_MSGERR or DECDATA(10);
                                 if DECDATA(15 downto 11) /= CWRT1 then
                                   BCSTATE  <= BCCHECK;
                                   SW_ERROR <= '1';
                                 end if;
                               elsif DECSTB='1' then
                                 BCSTATE   <= BCCHECK;
                                 RT_ERROR  <= '1';
                               elsif DECACTIVE='0' and RTTIMEOUT='1' and iENCSTROBE='0' then 
                                 BCSTATE   <= BCCHECK;
                                 RT_NORESP <= '1';
                               end if;
           when BCWRDATA    => if DECSTBOKDW='1' and (WORDCOUNT<EXPWCNT) then
                                 iBENDREQ  <= '1';
                                 iBENDWRT  <= '1';
                                 BENDADDR  <= to_std_logic(DATAPTR);
                                 DATAPTR   <= DATAPTR+1;
                                 BENDDOUT  <= DECDATA;
                                 WORDCOUNT <= WORDCOUNT+ 1;
                               elsif DECSTB='1' then
                                 BCSTATE   <= BCCHECK;
                                 RT_ERROR  <= '1';
                               elsif DECACTIVE='0' then
                                 if WORDCOUNT/=EXPWCNT then
                                   RT_ERROR <= '1';
                                 end if;
                                 if SMCW_RTRT='1' and BCAST='0' then   
                                   BCSTATE <= BCWAITSW2;
                                 else
                                   BCSTATE <= BCWAITBQ;
                                 end if;
                               end if;
           when BCRDDATA1  =>  iBENDREQ  <= '1';
                               iBENDWRT  <= '0';
                               BENDADDR  <= to_std_logic(DATAPTR);
                               DATAPTR   <= DATAPTR+1;
                               BCSTATE   <= BCRDDATA2;
                               WORDCOUNT <= WORDCOUNT+1;
           when BCRDDATA2   => if BENDWAIT='0' and ENCREADY='1' then
                                 iENCCMDSTAT <= '0';
                                 iENCSTROBE  <= '1';
                                 if WORDCOUNT/=EXPWCNT then
                                   BCSTATE <= BCRDDATA1;
                                 else
                                   if BCAST='1' then
                                      BCSTATE <= BCWAITBQ;
                                   else
                                      BCSTATE <= BCWAITSW2;
                                   end if;
                                 end if;
                               end if;
           when BCWAITSW2   => if DECSTBOKSW='1' then
                                 BCSTATE   <= BCWAITBQ;
                                 iBENDREQ  <= '1';
                                 iBENDWRT  <= '1';
                                 BENDDOUT  <= DECDATA;
                                 SW_TFLAG  <= SW_TFLAG  or DECDATA(0);
                                 SW_DBA    <= SW_DBA    or DECDATA(1);
                                 SW_SSFLAG <= SW_SSFLAG or DECDATA(2);
                                 SW_BUSY   <= SW_BUSY   or DECDATA(3);
                                 SW_BCAST  <= SW_BCAST  or DECDATA(4);
                                 SW_SREQ   <= SW_SREQ   or DECDATA(8);
                                 SW_INSTRU <= SW_INSTRU or DECDATA(9);
                                 SW_MSGERR <= SW_MSGERR or DECDATA(10);
                                 if DECDATA(15 downto 11) /= CWRT2 then
                                   SW_ERROR <= '1';
                                 end if;
                                 if SMCW_RTRT='0' then
                                   GOTSW1    <= '1';
                                   BENDADDR  <= to_std_logic(DESCPTR+4);
                                 else
                                   GOTSW2    <= '1';
                                   BENDADDR  <= to_std_logic(DESCPTR+5);
                                 end if;
                               elsif DECSTB='1' then
                                 BCSTATE   <= BCCHECK;
                                 RT_ERROR  <= '1';
                               elsif DECACTIVE='0' and RTTIMEOUT='1' and iENCSTROBE='0' then 
                                 BCSTATE    <= BCCHECK;
                                 RT_NORESP  <= '1';
                               end if;
           when BCWAITBQ    => if DECSTB='1' then     -- if any extra words discard and error
                                 BCSTATE   <= BCCHECK;
                                 RT_ERROR  <= '1';
                               elsif DECACTIVE='0' and ENCBUSY='0' then
                                 BCSTATE <= BCCHECK;
                               end if;
           when BCCHECK     => BCSTATE <= BCWRTTSW;
                               case SMCW_OPCODE is
                                 when "0111" => -- Retry on Condition
                                                if CCFLAG='1' then
                                                  BCSTATE <= BCRETRY1; 
                                                end if;
                                 when "1000" => -- Retry on Condition & Branch
                                                if CCFLAG='1' then
                                                  BCSTATE <= BCRETRY1; 
                                                end if;
                                 when "1001" => -- Retry on Condition & Branch if fails
                                                if CCFLAG='1' then
                                                  BCSTATE <= BCRETRY1; 
                                                end if;
                                 when others => BCSTATE <= BCWRTTSW;                                              
                               end case;
                               if MSG_ERROR='1' then
                                 SMR4_MERR <= SMR3_MERR;
                               end if;
           when BCRETRY1    => if ATTEMPTS="000" then
                                 BCSTATE   <= BCWRTTSW;
                                 if MSG_ERROR='1' then
                                   SMR4_RTF  <= SMR3_RTF; -- Final retry failed so set the flag                               
                                 end if;
                               else
                                 ATTEMPTS <= ATTEMPTS - 1;
                                 BCSTATE  <= BCSTARTM;
                                 if SMR0_PPEN='1' then
                                   BCBUSSEL <= not BCBUSSEL;
                                 end if;
                               end if;
           when BCWRTTSW    => if BENDWAIT='0' and ENCBUSY='0' then
                                 iBENDREQ  <= '1';
                                 iBENDWRT  <= '1';
                                 BENDADDR  <= to_std_logic(DESCPTR);
                                 BENDDOUT  <= SMCW_OPCODE & SMCW_RETRY & SMCW_CHA & SMCW_RTRT 
                                              & SMCW_CCODE & MSG_ERROR;  
                                 BCSTATE   <= BCMSGDONE;
                               end if;                
           when BCMSGDONE  => if BENDWAIT='0' and ENCBUSY='0' then
                                 BCSTATE <= BCGENINT;
                                 case SMCW_OPCODE is
                                    when "0101" => -- Execute Block and Branch
                                                   iBENDREQ <= '1';
                                                   iBENDWRT <= '0';
                                                   BENDADDR <= to_std_logic(DESCPTR+6);
                                                   BCSTATE  <= BCGETBR;
                                    when "0110" => -- Execute Block and Conditionally Branch
                                                   if CCFLAG='1' then
                                                     iBENDREQ <= '1';
                                                     iBENDWRT <= '0';
                                                     BENDADDR <= to_std_logic(DESCPTR+6);
                                                     BCSTATE  <= BCGETBR;
                                                   end if;
                                    when "1000" => -- Retry on condition and Branch
                                                   iBENDREQ <= '1';
                                                   iBENDWRT <= '0';
                                                   BENDADDR <= to_std_logic(DESCPTR+6);
                                                   BCSTATE  <= BCGETBR;
                                    when "1001" => -- Retry on condition and Branch if failed 
                                                   if CCFLAG='1' then
                                                     iBENDREQ <= '1';
                                                     iBENDWRT <= '0';
                                                     BENDADDR <= to_std_logic(DESCPTR+6);
                                                     BCSTATE  <= BCGETBR;
                                                   end if;
                                    when others => BCSTATE  <= BCGENINT;
                                  end case; 
                               end if;
           when BCGETBR    =>  if BENDWAIT='0' then   
                                 SMD_DPTR2  <= SMR8_PREG;   -- share RT register
                                 SMR8_PREG  <= to_unsigned(BENDDIN);
                                 BCSTATE    <= BCGENINT;
                               end if;
           when BCGENINT   =>  DOINT     <= '1';
                               BCSTATE   <= BCALLDONE;
                               RTCMDDONE <= '1';  -- clears LOOPFAIL in encoders
           when BCALLDONE  =>  if BENDWAIT='0' and DOINT='0' then  
                                 BCSTATE    <= BCIDLE;
								 if SMCW_OPCODE="0000" then		-- v2.16
								   SMR0_STEX  <= '0';
								 end if;
                               end if;
        end case;    
        if ABORT='1' or BENDFAIL='1' then
          ABORT      <= '0';
          BCSTATE    <= BCIDLE;
          SMR0_STEX  <= '0';
          RTCMDDONE  <= '1';  -- clears LOOPFAIL in encoders
          iBENDBURST <= '0';
        end if;
    end if;
    
    ------------------------------------------------------------------------------
    -- Some Variable Assignments
    
    RTBUFMODE := ( SMR0_PPEN & SMR0_EMODE);
    case RTBUFMODE is
      when "100"  => BUFMODE := PPONG;
      when "001"  => BUFMODE := INDEX;
      when "101"  => BUFMODE := PPONG;
      when "010"  => BUFMODE := CIRC1;
      when "110"  => BUFMODE := CIRC1;
      when "011"  => BUFMODE := CIRC2;
      when "111"  => BUFMODE := CIRC2;
      when others => BUFMODE := INDEX;
    end case;
    
    -----------------------------------------------------------------------
     
    -- This Starts the RT Protocol State Machine, 
    -- note that it can be restarted by a subsequent command
    if iRTMODE='1' then
        LATCHSW  <= '0';
        ABORT    <= '0';
        RTMUXSEL := CW_BCAST & CW_TX & CW_DATA;
        if CW_STBME='1' then  -- Second command is received need to abort operation
          RTSTATE <= RTIDLE;
          ABORT   <= '1';
        elsif RTSTART='1' and SMR0_STEX='1' then
           RTSTATE <= RTINIT1;
           TTTEMP  <= SMR7_TT;
        else
          case RTSTATE is
            when RTIDLE =>  PCONBUSY   <= '0';
						    -- Can Acknowledge PPONG ON/OFF here
							SMR0_PPON <= SMR0_PPONR;    
            when RTINIT1 => -- Added for Debug
							
			                -- Clear various things
                            INTSTATE  <= IDLE;        -- must abort any pending interrupt log write
                            if INTLOG='1' then        -- If interrupt log set make sure nothing left set from the previous message   
                               SMR4_MERR    <= '0';   -- Clear Just the RT inturrupts
                               SMR4_SUBAD   <= '0';    
                               SMR4_BDRCV   <= '0';
                               SMR4_IXEQ0   <= '0';
                               SMR4_ILLCMD7 <= '0';
                            end if;
                            DOINT     <= '0';
                            MTINT     <= '0';        -- if in RTMT mode and second message is RT clear MTINT request
                            PCONBUSY  <= '1';
                            WORDCOUNT <= "000000";
                            EXPWCNT   <= to_unsigned(CW_COUNT);
                            if FORCEORUN='1' then             
                              EXPWCNT(5) <= '1';   -- force to many words 
                            end if;
                            WINT    <= '0';
                            WCNTOVR <= '0';
                            WCNTTO  <= '0';
                            CLRERR  <= '1';            
            
                            case RTMUXSEL is
                              when "000" => RTSTATE  <= RTGETD1;        -- RX Mode Code
                              when "010" => RTSTATE  <= RTTXSTAT;       -- TX Mode Code
                              when "001" => RTSTATE  <= RTGETD1;        -- RX Data Transfer
                              when "011" => RTSTATE  <= RTTXSTAT;       -- TX Data Transfer
                              when "100" => RTSTATE  <= RTGETD1;        -- Bcast RX Mode Code
                              when "110" => RTSTATE  <= RTGETD1;        -- Bcast TX Mode Code
                                            LATCHSW  <= '1'; 
                              when "101" => RTSTATE  <= RTGETD1;        -- Bcast RX Data Transfer
                              when "111" => RTSTATE  <= RTGETD1;        -- Bcast TX Data Transfer
                                            LATCHSW  <= '1'; 
                              when others =>
                            end case;
                            DESCPTR <= SMR8_PREG + to_unsigned(( ZERO(15 downto 9) & CW_DOFFSET & "00"));
                            DATAPTR <= SMR8_PREG + to_unsigned(( ZERO(15 downto 9) & CW_DOFFSET & "00"));
            when RTTXSTAT=> if DECSTBDEL1='1' and (RTRTRT='0' or RTRTOK='0') then   -- if another word after TX Command then error
                              RTSTATE     <= RTGETD1;              -- need to get pointers before MSGSTAT           
                              WCNTOVR     <= '1';
                              LATCHSW     <= '1';
                            elsif DECACTIVE='0' then
                              iENCSTROBE  <= '1';                  -- Transmit the SW
                              iENCCMDSTAT <= '1';
                              LATCHSW     <= '1';
                              RTSTATE     <= RTGETD1;
                            end if;
            when RTGETD1=>  if BENDWAIT='0' then                   -- Read the Descriptor
                              iBENDREQ   <= '1';                   
                              iBENDWRT   <= '0';                   
                              BENDADDR   <= to_std_logic(DATAPTR);
                              DATAPTR    <= DATAPTR + 1;
                              iBENDBURST <= '1';
                              RTSTATE    <= RTGETD2;
                            end if;
						    -- Last Chance before processing to acknowledge PPONG ON/OFF here
							-- we are going to read the descriptor values here
							SMR0_PPON <= SMR0_PPONR;    
            when RTGETD2=>  if BENDWAIT='0' then
                              SMDC_INDX  <= to_unsigned(BENDDIN(15 downto 8));
                              SMDC_INTX  <= BENDDIN(7);
                              SMDC_IWA   <= BENDDIN(6);
                              SMDC_IBRD  <= BENDDIN(5);
                              SMDC_BAC   <= BENDDIN(4); 
                              SMDC_BUFA  <= BENDDIN(2);
                              SMDC_BRD   <= BENDDIN(1);
                              SMDC_NII   <= BENDDIN(0);
                              iBENDREQ   <= '1';                   
                              iBENDWRT   <= '0';                   
                              BENDADDR   <= to_std_logic(DATAPTR);
                              DATAPTR    <= DATAPTR + 1;
                              iBENDBURST <= '1';
                              RTSTATE    <= RTGETD3;
                            end if;
            when RTGETD3=>  if BENDWAIT='0' then
                              SMD_DPTR1  <= to_unsigned(BENDDIN);                   
                              iBENDREQ   <= '1';                   
                              iBENDWRT   <= '0';                   
                              BENDADDR   <= to_std_logic(DATAPTR);
                              DATAPTR    <= DATAPTR + 1;
                              iBENDBURST <= '1';
                              RTSTATE    <= RTGETD4;
                            end if;
            when RTGETD4=>  if BENDWAIT='0' then
                              SMD_DPTR2  <= to_unsigned(BENDDIN);                   
                              iBENDREQ   <= '1';                   
                              iBENDWRT   <= '0';                   
                              BENDADDR   <= to_std_logic(DATAPTR);
                              DATAPTR    <= DATAPTR + 1;
                              iBENDBURST <= '0';
                              RTSTATE    <= RTGETD5;
                            end if;
            when RTGETD5=>  if BENDWAIT='0' then
                              SMD_DPTR3  <= to_unsigned(BENDDIN);                   
                              RTSTATE    <= RTINIT2;
                            end if;
            when RTINIT2 => case BUFMODE is
                              when PPONG => if SMDC_BUFA='1' then
                                              BASEPTR <= SMD_DPTR2;
                                              DATAPTR <= SMD_DPTR2+2;
                                            else
                                              BASEPTR <= SMD_DPTR1;
                                              DATAPTR <= SMD_DPTR1+2;
                                            end if;
                                            if CW_BCAST='1' and SMDC_NII='1' then
                                              BASEPTR <= SMD_DPTR3;
                                              DATAPTR <= SMD_DPTR3+2;
                                            end if; 
                              when INDEX => if CW_BCAST='1' and SMDC_NII='1' then
                                              BASEPTR <= SMD_DPTR3;
                                              DATAPTR <= SMD_DPTR3+2;
                                            else
                                              BASEPTR <= SMD_DPTR1;
                                              DATAPTR <= SMD_DPTR1+2;
                                            end if;
                              when CIRC1 => BASEPTR <= SMD_DPTR2;
                                            DATAPTR <= SMD_DPTR2+2;
                              when CIRC2 => BASEPTR <= SMD_DPTR3;
                                            DATAPTR <= SMD_DPTR2;
                                            CAF     <= SMD_DPTR3(7 downto 0);
                            end case; 
                            case RTMUXSEL is
                              when "000" => RTSTATE  <= RTWRITE1;         -- RX Mode Code
                              when "010" =>                               -- TX Mode Code
                                            if RTBUSY='1' or LEGAL='0' then         -- If BUSY just we send the SW
                                              RTSTATE <= RTMSGSTAT;                 --  or command is illegal
                                            else
                                              RTSTATE <= RTREAD2;
                                            end if;
                              when "001" => RTSTATE  <= RTWRITE1;                  -- RX Data Transfer
                              when "011" =>                                        -- TX Data Transfer
                                            if RTBUSY='1' or LEGAL='0' then        -- If BUSY just we send the SW
                                              RTSTATE <= RTMSGSTAT;                --  or command is illegal
                                            else
                                              RTSTATE <= RTREAD2;
                                            end if;
                              when "100" => RTSTATE  <= RTWRITE1;       -- Bcast RX Mode Code
                              when "110" => RTSTATE  <= RTMSGSTAT;      -- Bcast TX Mode Code
                              when "101" => RTSTATE  <= RTWRITE1;       -- Bcast RX Data Transfer
                              when "111" => RTSTATE  <= RTMSGSTAT;      -- Bcast TX Data Transfer
                              when others =>
                            end case;
                            if WCNTOVR='1' then    --  TXSTAT failed we now have the pointers etc
                              RTSTATE <= RTMSGSTAT;  
                            else
                            end if;
            when RTREAD1 => if BENDWAIT='0' and ENCREADY='1' then
                               iENCCMDSTAT <= '0';                    -- Transmit a data word
                               iENCSTROBE  <= '1';
                               RTSTATE     <= RTREAD2;
                            end if;
            when RTREAD2 => if WORDCOUNT=EXPWCNT then            
                               RTSTATE <= RTMSGSTAT;
                            elsif BENDWAIT='0' then
                               RTSTATE  <= RTREAD1;
                               iBENDREQ <= LEGAL and not RTBUSY;
                               iBENDWRT <= '0';
                               BENDADDR <= to_std_logic(DATAPTR);
                               WORDCOUNT<= WORDCOUNT + 1;  
                               DATAPTR  <= DATAPTR + 1;    
                            end if;
            when RTWRITE1=> if (RTRTRT='0' or GOTSW='1') then         -- must have the SW for RTRT
                              if DECACTIVE='0' then                   -- end of transmission
                                 if WORDCOUNT > EXPWCNT  then         -- Check count  
                                   WCNTOVR <= '1';
                                   RTSTATE <= RTMSGSTAT; 
                                 elsif WORDCOUNT < EXPWCNT  then      -- Check count  
                                   WCNTTO  <= '1';
                                   RTSTATE <= RTMSGSTAT; 
                                 else
                                   RTSTATE <= RTSTATRX; 
                                 end if;
                                 LATCHSW <= '1';                              
                              elsif DECSTBOKDW='1' then                          
                                 iBENDREQ    <= LEGAL and not RTBUSY;
                                 iBENDWRT    <= '1';
                                 BENDADDR    <= to_std_logic(DATAPTR);
                                 BENDDOUT    <= DECDATA;
                                 DATAPTR     <= DATAPTR+1;
                                 WORDCOUNT   <= WORDCOUNT+1;
                              elsif DECSTBDEL1='1' then
                                 RTSTATE  <= RTMSGSTAT;                  -- Bad Transfer
                                 LATCHSW  <= '1';
                                 WCNTTO   <= '1';                           
                              end if;
                            end if;
                            if TIMER57US='1'  then                       -- No data received at 67us
                               WCNTTO  <= '1'; 
                               LATCHSW <= '1';                           
                               RTSTATE <= RTMSGSTAT;                     -- Send the SW
                            end if;
            when RTSTATRX =>LATCHSW <= '1';               
                            if CW_BCAST='1'  then 
                              RTSTATE  <= RTMSGSTAT;
                            elsif DECACTIVE='0' then
                              iENCCMDSTAT <= '1';                        -- transmit SW           
                              iENCSTROBE  <= '1';
                              RTSTATE     <= RTMSGSTAT;
                            end if;
            when RTMSGSTAT=>if ENCBUSY='0' and iENCSTROBE='0' then                   
				              RTSTATE <= RTPUTCW;
                              DATAPTR <= BASEPTR;
							  SMDC_LBUFA  <= SMDC_BUFA and to_logic(ENHANCED);		  -- save the last buffer accessed value
                              if RTMSG_OKAY='1' then
                                iENCCMDSTAT <= SMDC_INDX(0);  
                                case BUFMODE is
                                  when PPONG => if CW_BCAST='1' and SMDC_NII='1' then
                                                 -- if NII enabled do not flip buffer
                                                elsif SMR0_PPON='1' then                  -- SA52998  assuming ping ponging not dissabled switch the buffer
                                                  SMDC_BUFA <= not SMDC_BUFA;
                                                end if;
                                  when INDEX => if CW_TX='0' then -- INDEX mode only on RX messages !
                                                  if SMDC_INDX/="0000000"  then
                                                    SMDC_INDX <= SMDC_INDX - 1;
                                                  end if;
                                                  if SMDC_INDX="00000001" then 
                                                    WINT <= '1';
                                                  end if;
                                                  if CW_BCAST='1' and SMDC_NII='1' then
                                                    SMD_DPTR3   <= DATAPTR;
                                                  else
                                                    SMD_DPTR1   <= DATAPTR;
                                                  end if;
                                                end if;
                                  when CIRC1 => if DATAPTR>=SMD_DPTR3 then
                                                  SMD_DPTR2 <= SMD_DPTR1;
                                                  WINT <= '1';
                                                else
                                                  SMD_DPTR2 <= DATAPTR;
                                                end if;
                                  when CIRC2 => CAF <= CAFPLUS2;
                                                if CAFOVERFLOW='1' then
                                                  SMD_DPTR2 <= SMD_DPTR1;
                                                  SMD_DPTR3 <= SMD_MIBCAF;
                                                  WINT <= '1';
                                                else
                                                  SMD_DPTR2 <= DATAPTR;
                                                  SMD_DPTR3 <= SMD_MIBCAF;
                                                end if;
                                end case;
                              else
                                case BUFMODE is
                                  -- in PPONG mode we flip the buffer even if errors
                                  when PPONG => if CW_BCAST='1' and SMDC_NII='1' then
                                                 -- if NII enabled do not flip buffer
                                                elsif SMR0_PPON='1' then               -- SAR52998 only if ping ponging still on
                                                  SMDC_BUFA <= not SMDC_BUFA;
                                                end if;
                                  when others =>
                                end case;
                               end if; 
							  -- Can Acknowledge PPONG ON/OFF here
							  SMR0_PPON <= SMR0_PPONR;    
                            end if;
            when RTPUTCW => if BENDWAIT='0' and ENCBUSY='0' and iENCSTROBE='0' then
                               iBENDREQ  <= '1';
                               iBENDWRT  <= '1';
                               iBENDBURST<= '1';                   -- Stays Active until RTPUTD3
                               BENDADDR  <= to_std_logic(DATAPTR);
                               BENDDOUT  <= SMD_MSGINFO;
                               RTSTATE   <= RTPUTTT;
                               DATAPTR   <= DATAPTR + 1;
                             end if;
            when RTPUTTT=>   if BENDWAIT='0' then
                               iBENDREQ  <= '1';
                               iBENDWRT  <= '1';
                               BENDADDR  <= to_std_logic(DATAPTR);
                               BENDDOUT  <= to_std_logic(TTTEMP);
                               RTSTATE   <= RTPUTD0;
                               DATAPTR   <= DESCPTR;
                             end if;
            when RTPUTD0=>   if BENDWAIT='0' then
                               iBENDREQ  <= '1';
                               iBENDWRT  <= '1';
                               BENDADDR  <= to_std_logic(DATAPTR);
                               DATAPTR   <= DATAPTR+1;
                               BENDDOUT  <= SMD_CONTROL; 
                               RTSTATE   <= RTPUTD1;
                             end if;
            when RTPUTD1=>   if BENDWAIT='0' then
                               iBENDREQ  <= to_logic(BUFMODE=INDEX and not(CW_BCAST='1' and SMDC_NII='1'));
                               iBENDWRT  <= '1';
                               BENDADDR  <= to_std_logic(DATAPTR);
                               DATAPTR   <= DATAPTR+1;
                               BENDDOUT  <= to_std_logic(SMD_DPTR1);
                               RTSTATE   <= RTPUTD2;
                             end if;
            when RTPUTD2=>   if BENDWAIT='0' then
                               iBENDREQ  <= to_logic(BUFMODE=CIRC1 or BUFMODE=CIRC2);
                               iBENDWRT  <= '1';
                               BENDADDR  <= to_std_logic(DATAPTR);
                               DATAPTR   <= DATAPTR+1;
                               BENDDOUT  <= to_std_logic(SMD_DPTR2);
                               RTSTATE   <= RTPUTD3;
                             end if;
            when RTPUTD3=>   if BENDWAIT='0' then
                               iBENDREQ  <= to_logic((BUFMODE=INDEX and CW_BCAST='1' and SMDC_NII='1') 
                                                  or BUFMODE=CIRC2);
                               iBENDWRT  <= '1';
                               iBENDBURST<= SMR0_INTEN;
                               BENDADDR  <= to_std_logic(DATAPTR);
                               DATAPTR   <= DATAPTR+1;
                               BENDDOUT  <= to_std_logic(SMD_DPTR3);   
                               RTSTATE   <= RTMSGDONE;
                             end if;
            when RTMSGDONE=> if RTMSG_OKAY='0' then
                               SMR4_MERR <= SMR3_MERR;
                             end if; 
                             if SMDC_IWA='1' then
                               SMR4_SUBAD <= SMR3_SUBAD;
                             end if;               
                             if SMDC_IBRD='1' and CW_BCAST='1' then
                               SMR4_BDRCV <= SMR3_BDRCV;
                             end if;
                             if WINT='1' then
                               SMR4_IXEQ0 <= SMR3_IXEQ0 and SMDC_INTX;
                             end if;
                             if LEGAL='0' then
                               SMR4_ILLCMD7 <= SMR3_ILLCMD7;
                             end if;
                             RTSTATE <= RTALLDONE;
                             DOINT   <= '1';
            when RTALLDONE=> if BENDWAIT='0' and DOINT='0' then  
                               RTSTATE    <= RTIDLE;
                               RTCMDDONE  <= '1';
                             end if;
          end case;
          if PCONBUSY='1' and (TXTIMEOUT='1' or BENDFAIL='1') then   
             RTSTATE  <= RTIDLE;       
             LATCHSW  <= '1';        
             WCNTTO   <= '1'; 
             ABORT    <= '1';
             iBENDBURST <= '0';
          end if;
        end if;
    end if;
    
    RTACTIVE <= not to_logic(RTSTATE = RTIDLE);
    
    -------------------------------------------------------------------------
    -- Monitor Operations
    -- Note monitor SM can run in parrellel with RT SM, memory writes are blocked if 
    -- the RT is actually active
       
    if iMTMODE='1' then
    
        MTMUXSEL := MTCW_BCAST & MTCW_TX & MTCW_DATA;
        if SMR0_STEX='0' then
          MTDESCPTR <= SMR11_MBA;
          MTDATAPTR <= SMR12_MDA; 
        end if;                  
        if MTMSG_START='1' and SMR0_STEX='1' then
          INTSTATE    <= IDLE;   -- Must abort any pending interrupt log write
          DOINT       <= '0';
          MTINT       <= '0';
          PCONBUSY    <= '1';
          PCONBUSY    <= '1';
          MTWORDCOUNT <= "000000";
          MTEXPWCNT   <= to_unsigned(MTCW_COUNT);
          MTMI_OVR    <= '0';
          MTMI_TOUT   <= '0';
          MTMI_RTRT   <= '0';
          EXPECTSW    <= '0';
          MONHIT      <= '0';
          CLRERR      <= '1';
          CWRT1       <= DECDATA(15 downto 11);        -- Store the Command Word 
          CWRT1_LB    <= DECDATA(10 downto 0);
          MTSTATE     <= MTGTCW2; 
          MONHIT      <= not SMR0_SMTC or SMR14_MF(to_integer(to_unsigned(DECDATA(15 downto 11))));
          TTTEMP      <= SMR7_TT;
        else
          case MTSTATE is
            when MTIDLE  =>   PCONBUSY  <=  RTACTIVE;                         -- if RT is active the activate PCONBUSY
                              EXPECTSW  <= '0';
                              MONHIT    <= '0';
            when MTGTCW2 =>   INTSTATE   <= IDLE;       -- must abort interrupt log write if active
                              if INTLOG='1' then        -- If interrupt log set make sure nothing left set from the previous message   
                                 SMR4_MERR <= '0';      -- Clear Just the MT inturrupts
                                                        -- but allow MBC to be generated next time
                              end if;
                              if DECACTIVE='0' or DECCMDSTAT='0' then         -- or following word is data
                                case MTMUXSEL is
                                  when "000" => MTSTATE  <= MTWRDP;           -- RX Mode Code - store DW
                                  when "010" => MTSTATE  <= MTWRSW1;          -- TX Mode Code - store SW
                                  when "001" => MTSTATE  <= MTWRDP;           -- RX Data Transfer  
                                  when "011" => MTSTATE  <= MTWRSW1;          -- TX Data Transfer
                                  when "100" => MTSTATE  <= MTWRDP;           -- Bcast RX Mode Code
                                  when "110" => MTSTATE  <= MTWRDP;           -- Bcast TX Mode Code
                                  when "101" => MTSTATE  <= MTWRDP;           -- Bcast RX Data Transfer
                                  when "111" => MTSTATE  <= MTWRDP;           -- Bcast TX Data Transfer
                                  when others =>
                                end case;
                              elsif DECSTBOKCW='1'  then                          
                                 MTSTATE   <= MTWRSW1;                        -- Store the 2nd CW
                                 MTMI_RTRT <= '1';
                                 CWRT2     <= DECDATA(15 downto 11);
                                 CWRT2_LB  <= DECDATA(10 downto 0);
                                 MONHIT    <= MONHIT or SMR14_MF(to_integer(to_unsigned(DECDATA(15 downto 11))));
                              elsif DECSTBDEL1='1' then
                                 MTSTATE    <= MTWRMINFO;                     -- Bad Transfer
                                 MTMI_TOUT  <= '1';                             
                              end if;
                              if not (RTSTATE=RTIDLE) then                    -- RT has started so disable the monitor
                                MONHIT  <= '0';
                              end if;   
            when MTWRSW1=>    EXPECTSW <= '1';
                              if not (RTSTATE=RTIDLE) then                    -- RT has started so disable the monitor
                                MONHIT  <= '0';                               -- This catches the RT-RT case
                              end if;   
                              if DECSTBOKSWA='1' then                          
                                 EXPECTSW <= '0';
                                 if MONHIT='1' then
                                   iBENDREQ <= '1';
                                   iBENDWRT <= '1';
                                   BENDADDR <= to_std_logic(MTDESCPTR+4);
                                   BENDDOUT <= DECDATA;
                                 end if;
                                 MTSTATE  <= MTWRDP;
                              elsif DECSTBDEL1='1' or RTTIMEOUT='1' then
                                 EXPECTSW  <= '0';
                                 MTSTATE   <= MTWRMINFO;                       -- Bad Transfer
                                 MTMI_TOUT <= '1';                           
                              end if;
            when MTWRDP  =>   if BENDWAIT='0' or MONHIT='0' then
                                if MONHIT='1' then
                                  iBENDREQ <= '1';
                                  iBENDWRT <= '1';
                                  BENDADDR <= to_std_logic(MTDESCPTR+3);
                                  BENDDOUT <= to_std_logic(MTDATAPTR);
                                end if;
                                MTSTATE <= MTWRDATA; 
                              end if;
            when MTWRDATA =>  if DECACTIVE='0' then                         -- End of transmission
                                 if MTWORDCOUNT > MTEXPWCNT  then           -- Check count  
                                   MTMI_OVR  <= '1';
                                   MTSTATE   <= MTWRMINFO; 
                                 elsif MTWORDCOUNT < MTEXPWCNT  then        -- Check count  
                                   MTMI_TOUT <= '1';
                                   MTSTATE   <= MTWRMINFO; 
                                 else
                                   MTSTATE <= MTWRTSW2; 
                                 end if;
                              elsif DECSTBOKDW='1' then                          
                                 if MONHIT='1' then
                                   iBENDREQ   <= '1';
                                   iBENDWRT   <= '1';
                                   BENDADDR   <= to_std_logic(MTDATAPTR);
                                   BENDDOUT   <= DECDATA;
                                   MTDATAPTR  <= MTDATAPTR+1;
                                 end if;
                                 MTWORDCOUNT <= MTWORDCOUNT+1;
                              elsif DECSTBDEL1='1' then
                                 MTSTATE   <= MTWRMINFO;                          -- Bad Transfer
                                 MTMI_TOUT <= '1';                           
                              end if;
            when MTWRTSW2=>   EXPECTSW <= '1';
                              if MTCW_BCAST='1' or (MTMI_RTRT='0' and MTCW_TX='1') then 
                                EXPECTSW <= '0';         -- No SW at the end
                                MTSTATE  <= MTWRMINFO;
                              elsif DECSTBOKSWA='1' then                          
                                 MTSTATE  <= MTWRMINFO;
                                 EXPECTSW <= '0';
                                 if MONHIT='1' then
                                   iBENDREQ <= '1';
                                   iBENDWRT <= '1';
                                   if MTMI_RTRT='1' then
                                     BENDADDR <= to_std_logic(MTDESCPTR+5);
                                   else
                                     BENDADDR <= to_std_logic(MTDESCPTR+4);
                                   end if;
                                   BENDDOUT <= DECDATA;
                                 end if;
                              elsif DECSTBDEL1='1' or RTTIMEOUT='1' then
                                 EXPECTSW   <= '0';
                                 MTSTATE    <= MTWRMINFO;                          -- Bad Transfer
                                 MTMI_TOUT  <= '1';                           
                              end if;
            when MTWRMINFO=>  EXPECTSW  <= '0';
                              if MONHIT='0' then
                                MTSTATE <= MTIDLE;
                              elsif BENDWAIT='0' then
                                iBENDREQ   <= '1';
                                iBENDWRT   <= '1';
                                iBENDBURST <= '1';                                -- Write MINFO
                                BENDADDR   <= to_std_logic(MTDESCPTR+0);
                                BENDDOUT   <= MTMI_WORD;
                                MTSTATE    <= MTWRCW1;
                              end if;
            when MTWRCW1  =>   if BENDWAIT='0' then
                                iBENDREQ   <= '1';
                                iBENDWRT   <= '1';
                                BENDADDR   <= to_std_logic(MTDESCPTR+1);
                                BENDDOUT   <= CWRT1 & CWRT1_LB;
                                MTSTATE    <= MTWRCW2; 
                              end if;
            when MTWRCW2  =>  if BENDWAIT='0' then
                                iBENDREQ   <= MTMI_RTRT;
                                iBENDWRT   <= '1';
                                BENDADDR   <= to_std_logic(MTDESCPTR+2);
                                BENDDOUT   <= CWRT2 & CWRT2_LB;
                                MTSTATE    <= MTWRTT; 
                              end if;
            when MTWRTT  =>   if BENDWAIT='0' then
                                iBENDREQ   <= '1';
                                iBENDWRT   <= '1';
                                iBENDBURST <= '0';
                                BENDADDR   <= to_std_logic(MTDESCPTR+6);
                                BENDDOUT   <= to_std_logic(TTTEMP);
                                MTSTATE    <= MTMSGDONE; 
                              end if;
            when MTMSGDONE=>  if MTMI_MSGERR='1' then
                                SMR4_MERR <= SMR3_MERR;
                              end if; 
                              MTSTATE <= MTALLDONE;
                              if MTCOUNT=1 then
                                SMR4_MBC  <= SMR3_MBC;
                              end if;
                              DOINT   <= '1';
                              MTINT   <= '1';
            when MTALLDONE=>  if BENDWAIT='0' and  DOINT='0' then  
                                MTCOUNT    <= MTCOUNT - 1;
                                MTDESCPTR  <= MTDESCPTR + 8;
                                if MTCOUNT=0 then          -- This mimics the Summit device
                                  MTDESCPTR <= SMR11_MBA;  -- It actually captures 1 more block than requested 
                                  MTDATAPTR <= SMR12_MDA;  -- after the interrupt is generated
                                  MTCOUNT   <= MTCOUNTHD; 
                                end if;
                                MTSTATE    <= MTIDLE;    
                                RTCMDDONE  <= '1';         -- Clears error detectors
                              end if;
          end case;
          if PCONBUSY='1' and  (ABORT='1' or BENDFAIL='1') then   
             MTSTATE   <= MTIDLE; 
             iBENDBURST <= '0';      
          end if;
        end if;
    end if;
    
    ----------------------------------------------------------------------------------------------  
    -- Write the Interrupt to the Log if enabled 
  
    if  (INTACKM='1' and INTLEVEL='1')
     or (IMCOUNT="11" and INTLEVEL='0') then
      INTLOG <= '0';
    end if;
    if IMCOUNT/="00" then
      IMCOUNT <= IMCOUNT+1;
    end if;
        
        
    case INTSTATE is
      when IDLE =>   if DOINT='1' and INTMSG='1' and SMR0_INTEN='1' then
                       INTSTATE <= WRTIIW;   -- Process using the Log
                     elsif DOINT='1' then
                       DOINT <= '0';         -- No processing required
                       MTINT <= '0';
                     end if;
      when WRTIIW=> if BENDWAIT='0' then    
                       iBENDREQ  <= '1';
                       iBENDWRT  <= '1';
                       iBENDBURST<= '1';
                       BENDADDR  <= SMR5_INTA & '0';
                       BENDDOUT  <= "0000" & SMR4_INTR(11 downto 0);
                       INTSTATE  <= WRTIAW;
                     end if;
      when WRTIAW=> if BENDWAIT='0' then
                       iBENDREQ  <= '1';
                       iBENDWRT  <= '1';
                       iBENDBURST<= '0';
                       BENDADDR  <= SMR5_INTA & '1';
                       if MTINT='1' then  -- If a Monitor Interrupt then put the count there
                         BENDDOUT  <= to_std_logic(MTDESCPTR);
                       else
                         BENDDOUT  <= to_std_logic(DESCPTR);
                       end if;    -- Increment by 2
                       INTSTATE  <= DONE;
                     end if;
      when DONE   => if BENDWAIT='0' then  
                       -- Dont update the Internal interrupt pointer until we know both locations written
                       SMR5_INTA(4 downto 1) <= to_std_logic(to_unsigned(SMR5_INTA(4 downto 1))+1);
                       INTSTATE     <= IDLE;
                       INTLOG       <= '1';
                       IMCOUNT      <= "01";
                       DOINT        <= '0';
                       MTINT        <= '0';
                       SMR4_MERR    <= '0';   -- Clear the Interrupts
                       SMR4_SUBAD   <= '0';   -- Since now in the log
                       SMR4_BDRCV   <= '0';
                       SMR4_IXEQ0   <= '0';
                       SMR4_ILLCMD7 <= '0';
                       SMR4_EOL     <= '0';
                       SMR4_ILLCMD4 <= '0';
                       SMR4_ILLOP   <= '0';
                       SMR4_RTF     <= '0';
                       SMR4_CBA     <= '0';    
                       SMR4_MBC     <= '0';    
                     end if;   
    end case;  
    
    if INTLOG='1' and SMR0_STEX='0' then
      MTINT        <= '0';
      SMR4_MERR    <= '0';   -- Make sure that interrupt log will be clean when started
      SMR4_SUBAD   <= '0';   -- for instance if stopped mid RT message could leave some
      SMR4_BDRCV   <= '0';   -- RT  bits set, if restarted as BC then RT bits would be active
      SMR4_IXEQ0   <= '0';
      SMR4_ILLCMD7 <= '0';
      SMR4_EOL     <= '0';
      SMR4_ILLCMD4 <= '0';
      SMR4_ILLOP   <= '0';
      SMR4_RTF     <= '0';
      SMR4_CBA     <= '0';    
      SMR4_MBC     <= '0';    
    end if;

  end if;
end process;

MTMI_MCND <= MTCW_MCODE and not MTCW_COUNT(0);

          
MTMI_WORD <= "0100" & "00" & MTMI_CHA & MTMI_RTRT
             & MTMI_MSGERR & MTMI_MCND & MTCW_BCAST & '0'
             & MTMI_TOUT & MTMI_OVR & MTMI_PERR & MTMI_MERR;

MTMI_CHA    <= not MTMSG_BUSSEL;
MTMI_PERR   <= SMD_MSGINFO(1);
MTMI_MERR   <= SMD_MSGINFO(0);
MTMI_MSGERR <= MTMI_TOUT or MTMI_OVR or MTMI_PERR or MTMI_MERR;


SMD_CONTROL <= to_std_logic(SMDC_INDX) & SMDC_INTX & SMDC_IWA & SMDC_IBRD & '1' 
               & SMDC_LBUFA & SMDC_BUFA & CW_BCAST & SMDC_NII;   

CAFPLUS2 <= CAF + 2;

process(CAF,SMDC_INDX,SMD_DPTR3,CAFPLUS2)
variable CAFMASK : std_logic_vector(7 downto 0);
begin
  CAFMASK := to_std_logic(CAF) or not to_std_logic(SMDC_INDX);
  if CAFMASK(7 downto 1)="1111111" then
    CAFOVERFLOW <= '1';
  else
    CAFOVERFLOW <= '0';
  end if;
  SMD_MIBCAF <= SMD_DPTR3;
  for i in 0 to 7 loop
    if SMDC_INDX(i)='1' then
      SMD_MIBCAF(i) <= CAFPLUS2(i);
    end if;
  end loop;
end process;
  
SMR13_MBC <= MTCOUNT;

ENCCLEAR <= RTCMDDONE;

iBUSY  <= PCONBUSY;
BUSY   <= PCONBUSY;
ACTIVE <= SMR0_STEX;

ENCSTROBE   <= iENCSTROBE; 
ENCABORT    <= ABORT;  
ENCCMDSTAT  <= iENCCMDSTAT;
BENDREQ     <= iBENDREQ;    
BENDWRT     <= iBENDWRT;    
BENDBURST   <= iBENDBURST; 



INS_PPON  <= SMR0_PPON;
INS_PPONR <= SMR0_PPONR;

end RTL;




