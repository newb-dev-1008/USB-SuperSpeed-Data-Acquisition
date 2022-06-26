-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--  
-- File:  BRMcomps.vhd
--     
-- Description: Core1553BRM Testbench
--              Package giving top level declarations  
--
-- Rev: 1.0 01May04  IPB  : Pre Production  
-- Rev: 2.0 27May04  IPB  : First Production Release 
-- Rev: 3.0 15Feb07  IPB  :  CoreConsole Release 
-- Rev: 2.11 07Feb05 IPB  : Backend Timing modified SAR44066, 44067
-- Rev: 2.13 01Oct05 IPB  : Encoder fix and enhancements
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--  
--
-- Notes:
--
-- *********************************************************************/ 


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

package brmcomps is


component BRMPC 
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
          MSGSTART       : out std_logic;
          CMDSYNC        : out std_logic;
          SYNCNOW        : out std_logic;
          BUSRESET       : out std_logic;
          CMDVAL         : out std_logic_vector(11 downto 0);
          CMDSTB         : out std_logic;
          CMDOK          : in  std_logic;
          CMDOKOUT       : out std_logic;
          LOOPBACK       : out std_logic;
		  INS_PPON  	 : out std_logic;
		  INS_PPONR 	 : out std_logic
                          
        );
end component;


component BRMENC 
  port ( CLK        : in  std_logic;                                
         RSTn       : in  std_logic;                                
         CLKSPD     : in  std_logic_vector(1 downto 0);             
         STROBE     : in  std_logic;                                
         ABORTX     : in  std_logic;                                
         DATAIN     : in  std_logic_vector(15 downto 0);            
         CMDSTAT    : in  std_logic;                                
         TXENABLE   : out std_logic;                                
         TXBUSY     : out std_logic;                                
         TXREADY    : out std_logic;                                
         DOUT       : out std_logic;                                
         TXENA      : in  std_logic;                                
         RXSTROBEA  : in  std_logic;                                
         RXERRORA   : in  std_logic;                                
         RXDATAA    : in  std_logic_vector(15 downto 0);            
         RXDATAAS   : in  std_logic;                                
         LOOPFAILA  : out std_logic;                                
         TXENB      : in  std_logic;                                
         RXSTROBEB  : in  std_logic;                                
         RXERRORB   : in  std_logic;                                
         RXDATAB    : in  std_logic_vector(15 downto 0);            
         RXDATABS   : in  std_logic;                                
         LOOPFAILB  : out std_logic;                                 
         CLRERRORS  : in  std_logic;                                 
         FSM_ERROR  : out std_logic
      );
end component;

component BRMDEC 
  port ( CLK       : in  std_logic;
         RSTn      : in  std_logic;
         CLKSPD    : in  std_logic_vector(1 downto 0);
         DATAINP   : in  std_logic;
         DATAINN   : in  std_logic;
         TXENABLE  : in  std_logic;
         FROMUS    : out std_logic;
         STROBE    : out std_logic;
         DATAOUT   : out std_logic_vector(15 downto 0);
         CMDSTAT   : out std_logic;
         GOTSYNC   : out std_logic;
         PARERR    : out std_logic;
         MANERR    : out std_logic;
         ACTIVE    : out std_logic;
         CONTIG    : out std_logic
      );
end component;


component BRMBEND  
  generic ( BETIMING : INTEGER range 0 to 2;
			ACKVAL   : INTEGER range 0  to 255;  
			WAITVAL  : INTEGER range 0  to 255 
		  ); 
  port ( CLK       : in  std_logic;
         RSTn      : in  std_logic;
         CLKSPD    : in  std_logic_vector(1 downto 0);
         ASYNCIF   : in  std_logic;
         CPUMEMEN  : in  std_logic;
         CPUREQ    : in  std_logic;
         CPUWRT    : in  std_logic_vector(1 downto 0);
         CPUWAIT   : out std_logic;
         CPUADDR   : in  std_logic_vector(15 downto 0);
         CPUDOUT   : in  std_logic_vector(15 downto 0);
         CPUDIN    : out std_logic_vector(15 downto 0);
         BENDREQ   : in  std_logic;
         BENDWRT   : in  std_logic;
         BENDBURST : in  std_logic;
         BENDBUSY  : out std_logic;
         BENDFAIL  : out std_logic;
         BENDADDR  : in  std_logic_vector(15 downto 0);
         BENDDOUT  : in  std_logic_vector(15 downto 0);
         BENDDIN   : out std_logic_vector(15 downto 0);
         MEMREQn   : out std_logic;
         MEMGNTn   : in  std_logic;
         MEMACCn   : out std_logic;
         MEMWRn    : out std_logic_vector(1 downto 0);
         MEMRDn    : out std_logic;
         MEMCSn    : out std_logic;
         MEMWAITn  : in  std_logic;
         MEMCEN    : out std_logic;
         MEMDEN    : out std_logic;
         MEMADDR   : out std_logic_vector(15 downto 0);
         MEMDOUT   : out std_logic_vector(15 downto 0);
         MEMDIN    : in  std_logic_vector(15 downto 0)
       );
end component;


component BRMREG 
  generic ( FAMILY   : INTEGER range 0 to 21;
            BCENABLE : INTEGER range 0 to 1;
            RTENABLE : INTEGER range 0 to 1;
            MTENABLE : INTEGER range 0 to 1;
            LEGREGS  : INTEGER range 0 to 5;
            ENHANCED : INTEGER range 0 to 1;
            INITFREQ : INTEGER range 12 to 24
           );
  port ( CLK       : in  std_logic;
         RSTn      : in  std_logic;
         CPUSEL    : in  std_logic;
         CPUADDR   : in  std_logic_vector( 3 downto 0);
         CPUADDRR  : in  std_logic_vector( 3 downto 0);
         CPUDIN    : in  std_logic_vector(15 downto 0);
         CPUDOUT   : out std_logic_vector(15 downto 0);
         CPUWR     : in  std_logic_vector( 1 downto 0);
         CPURD     : in  std_logic;
         SMR0_STEX : in  std_logic;
         CMDSTB    : in  std_logic;
         BITSELECT : in  std_logic_vector(7 downto 0);
         CMDOKREG  : out std_logic 
        );
end component;
    
    
component  BRMRT 
  generic ( BCENABLE : INTEGER range 0 to 1;
            RTENABLE : INTEGER range 0 to 1;
            MTENABLE : INTEGER range 0 to 1;
            LEGREGS  : INTEGER range 0 to 5;
            ENHANCED : INTEGER range 0 to 1;
            INITFREQ : INTEGER range 12 to 24 
           );
  port ( CLK            : in  std_logic;
         CLKSPD         : in  std_logic_vector(1 downto 0);
         RSTn           : in  std_logic;
         RSTREG         : out std_logic;
         RTMODE         : in  std_logic;
         RTADDR         : in  std_logic_vector(4 downto 0);
         RTADDRP        : in  std_logic;
         RTADERR        : out std_logic;
         BCASTEN        : in  std_logic;
         MIL1553A       : in  std_logic;
         SMR0_EMODE     : in  std_logic_vector(1 downto 0);
         SMR9_SB        : in  std_logic_vector(10 to 19);
         DBA            : in  std_logic;
         XMTSW          : in  std_logic;
         SSYSFn         : in  std_logic;
         CHAEN          : in  std_logic;
         CHBEN          : in  std_logic;
         RTBUSY         : out std_logic;
         BUSSEL         : out std_logic;
		 BUSSELALL      : in  std_logic;
         TXTIMEOUT      : in  std_logic;
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
         SHUTDOWNRTA    : out std_logic;
         SHUTDOWNRTB    : out std_logic;
         LATCHSW        : in  std_logic;
         WCNTTO         : in  std_logic;
         WCNTOVR        : in  std_logic;
         CMDDONE        : in  std_logic;
         RTSMBUSY       : in  std_logic;
         BENDFAIL       : in  std_logic;
         RTMSG_STBME    : out std_logic;
         RTMSG_START    : out std_logic;
         RTMSG_CMDWORD  : out std_logic_vector(23 downto 0);
         RTMSG_LEGAL    : out std_logic;
         RTMSG_RTRT     : out std_logic;
         RTMSG_RTRTOK   : out std_logic;
         RTMSG_OKAY     : out std_logic;
         RTMSG_GOTSW    : out std_logic;
         CLR_SRQ        : out std_logic;
         TIMER57US      : out std_logic;
         MSGINFO        : out std_logic_vector(15 downto 0);
         BITWORD        : in  std_logic_vector(15 downto 0);
         TXT_CMDSTAT    : in  std_logic;
         BENDDIN        : in  std_logic_vector(15 downto 0);
         TXT_DATAIN     : out std_logic_vector(15 downto 0);
         CMDSYNC        : out std_logic;
         SYNCNOW        : out std_logic;
         BITSELECT      : out std_logic_vector(7 downto 0);
         CMDOKREG       : in  std_logic;    
         USEXTOK        : in  std_logic;
         CMDVAL         : out std_logic_vector(11 downto 0);
         CMDSTB         : out std_logic;
         CMDOK          : in  std_logic;
         CMDOKOUT       : out std_logic
        );
end component;

component BRMMT
  generic ( MTENABLE : INTEGER range 0 to 1    :=  1 );
  port ( CLK            : in  std_logic;
         RSTn           : in  std_logic;
         BCASTEN        : in  std_logic;
         MIL1553A       : in  std_logic;
         EXPECTSW       : in  std_logic;
         DECA_STROBE    : in  std_logic;
         DECA_DATAOUT   : in  std_logic_vector(15 downto 0);
         DECA_CMDSTAT   : in  std_logic;
         DECA_GOTSYNC   : in  std_logic;
         DECA_PARERR    : in  std_logic;
         DECA_MANERR    : in  std_logic;
         DECA_ACTIVE    : in  std_logic;
         DECA_CONTIG    : in  std_logic;
         DECA_FROMUS    : in  std_logic;
         DECB_STROBE    : in  std_logic;
         DECB_DATAOUT   : in  std_logic_vector(15 downto 0);
         DECB_CMDSTAT   : in  std_logic;
         DECB_GOTSYNC   : in  std_logic;
         DECB_PARERR    : in  std_logic;
         DECB_MANERR    : in  std_logic;
         DECB_ACTIVE    : in  std_logic;
         DECB_CONTIG    : in  std_logic;
         DECB_FROMUS    : in  std_logic;
         MTMSG_BUSSEL   : out std_logic;
         MTMSG_STBALL   : out std_logic;
         MTMSG_START    : out std_logic;
         MTMSG_CMDWORD  : out std_logic_vector(23 downto 0)
        );
end component;


component GLOBALBUFF 
  port ( A : in  std_logic;
         Y : out std_logic
       );
end component;


component RAM16X16 
    port( CLOCK    : in   std_logic;
          RESET    : in   std_logic;
          WE       : in   std_logic;
          RE       : in   std_logic;
          WADDRESS : in   std_logic_vector(3 downto 0); 
          RADDRESS : in   std_logic_vector(3 downto 0);
          DATA     : in   std_logic_vector(15 downto 0); 
          Q        : out  std_logic_vector(15 downto 0) 
        ) ;
end component;


end brmcomps;