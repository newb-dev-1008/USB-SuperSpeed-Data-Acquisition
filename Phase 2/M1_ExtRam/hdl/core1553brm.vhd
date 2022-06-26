-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--  
-- File:  BRM.vhd
--     
-- Description: Core1553BRM
--              Top Level  
--
-- Rev: 1.0  01May04  IPB  : Pre Production  
-- Rev: 2.0  27May04  IPB  : First Production Release 
-- Rev: 2.1  24Jan05  IPB  : PA3/E Production Release 
-- Rev: 2.11 07Feb05  IPB  : Backend Timing modified SAR44066, 44067
-- Rev: 2.12 19Feb05  IPB  : Backend Timing modified SAR44392
--                         : SARs   Updated Encoder and Loopback Test added 
-- Rev: 2.13 01Oct05  IPB  : Encoder fix and enhancements
-- Rev: 2.14 14Feb06  IPB  : PingPong Correction SAR52998
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release

-- Notes: Version 2.00  27May04 was used for Qualifiction testing at TestSystems
--        Version 2.14  No changes to this file
--        Version 2.17  No changes to this file
--		  Version 3.0   Additional of BETIMING=2 mode
--
-- *********************************************************************/ 
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

use work.convert.all;
use work.BRMcomps.all;

entity CORE1553BRM is
  generic ( FAMILY   : INTEGER range 0  to 21;
            BCENABLE : INTEGER range 0  to 1 ;
            RTENABLE : INTEGER range 0  to 1 ;
            MTENABLE : INTEGER range 0  to 1 ;
            LEGREGS  : INTEGER range 0  to 2 ;
            ENHANCED : INTEGER range 0  to 1 ;
            INITFREQ : INTEGER range 12 to 24;
            LOCKFREQ : INTEGER range 0  to 1;
            BETIMING : INTEGER range 0  to 2 ;
			ACKVAL   : INTEGER range 0  to 255;  
			WAITVAL  : INTEGER range 0  to 255 
           );

  port ( CLK        : in  std_logic;
         TCLK       : in  std_logic;
         RSTINn     : in  std_logic;
         RSTOUTn    : out std_logic;
         
         -- 1553B Interface
         BUSAINEN   : out std_logic;
         BUSAINP    : in  std_logic;
         BUSAINN    : in  std_logic;
         BUSBINEN   : out std_logic;
         BUSBINP    : in  std_logic;
         BUSBINN    : in  std_logic;
         BUSAOUTIN  : out std_logic;
         BUSAOUTP   : out std_logic;
         BUSAOUTN   : out std_logic;
         BUSBOUTIN  : out std_logic;
         BUSBOUTP   : out std_logic;
         BUSBOUTN   : out std_logic;
         
         -- BRM Control Signals - should be tied high or low
         CPUMEMEN   : in  std_logic;
         ASYNCIF    : in  std_logic;
         INTLEVEL   : in  std_logic;
                  
         -- Combined Status Signals
         ACTIVE     : out std_logic;
         BUSY       : out std_logic;
         INTOUTH    : out std_logic;
         INTOUTM    : out std_logic;
         INTACKH    : in  std_logic;
         INTACKM    : in  std_logic;
         MEMFAIL    : out std_logic;
         OPMODE     : out std_logic_vector(1 downto 0);
         
         -- RT ADDRESS Setting
         LOCKn      : in  std_logic;      
         RTADDRIN   : in  std_logic_vector(4 downto 0); 
         RTADDRPIN  : in  std_logic;
         RTADERR    : out std_logic;
         MSELIN     : in  std_logic_vector(1 downto 0);
         SSYSFn     : in  std_logic;
         ABSTDIN    : in  std_logic;
               
         -- RT Status Signals
         MSGSTART   : out std_logic;
         CMDSYNC    : out std_logic;
         SYNCNOW    : out std_logic;
         BUSRESET   : out std_logic;
         
         -- RT Command Legalization Interface
         CMDSTB     : out std_logic;
         CMDVAL     : out std_logic_vector(11 downto 0);
         CMDOK      : in  std_logic;
         CMDOKOUT   : out std_logic;
 
         -- CPU Interface
         CPUWRn     : in  std_logic_vector(1 downto 0);
         CPURDn     : in  std_logic;
         CPUCSn     : in  std_logic;
         CPUMEM     : in  std_logic;
         CPUWAITn   : out std_logic;
         CPUDEN     : out std_logic;
         CPUADDR    : in  std_logic_vector(15 downto 0);
         CPUDOUT    : out std_logic_vector(15 downto 0);
         CPUDIN     : in  std_logic_vector(15 downto 0);
                  
         -- Backend Memory interface
         MEMREQn    : out std_logic;
         MEMGNTn    : in  std_logic;
         MEMACCn    : out std_logic;
         MEMWRn     : out std_logic_vector(1 downto 0);
         MEMRDn     : out std_logic;
         MEMCSn     : out std_logic;
         MEMWAITn   : in  std_logic;
         MEMCEN     : out std_logic;
         MEMDEN     : out std_logic;
         MEMADDR    : out std_logic_vector(15 downto 0);
         MEMDOUT    : out std_logic_vector(15 downto 0);
         MEMDIN     : in  std_logic_vector(15 downto 0)
        );
end CORE1553BRM;

architecture RTL of CORE1553BRM is

 
-- Encoder Signals
signal  BUSOUT         : std_logic;
signal  BUSA_INUSE     : std_logic;
signal  BUSB_INUSE     : std_logic;
signal  BUSA_TXENABLE  : std_logic;
signal  BUSB_TXENABLE  : std_logic;

signal  ENC_DATA       : std_logic_vector(15 downto 0);
signal  ENC_STROBE     : std_logic;
signal  ENC_ABORT      : std_logic;
signal  ENC_CMDSTAT    : std_logic;
signal  ENC_READY      : std_logic;
signal  ENC_BUSY       : std_logic;
signal  ENC_CLEAR      : std_logic;
signal  TXTIMEOUT      : std_logic;
signal  TXT_ENABLE     : std_logic;
signal  SHUTDOWNA      : std_logic;
signal  SHUTDOWNB      : std_logic;
signal  RXBUSENA       : std_logic;
signal  RXBUSENB       : std_logic;
signal  LOOPFAILA      : std_logic;
signal  LOOPFAILB      : std_logic;
signal  HWTIMVALUE     : UNSIGNED(6 downto 0);
                
-- Decoder Signals
signal  BUSAINP_LP     : std_logic;
signal  BUSAINN_LP     : std_logic;
signal  BUSBINP_LP     : std_logic;
signal  BUSBINN_LP     : std_logic;
 
signal  BUSSEL         : std_logic;
signal  DECA_STROBE    : std_logic;
signal  DECA_ERROR     : std_logic;
signal  DECA_DATAOUT   : std_logic_vector(15 downto 0);
signal  DECA_CMDSTAT   : std_logic;
signal  DECA_GOTSYNC   : std_logic;
signal  DECA_PARERR    : std_logic;
signal  DECA_MANERR    : std_logic;
signal  DECA_ACTIVE    : std_logic;
signal  DECA_CONTIG    : std_logic;
signal  DECA_FROMUS    : std_logic;
signal  DECB_STROBE    : std_logic;
signal  DECB_ERROR     : std_logic;
signal  DECB_DATAOUT   : std_logic_vector(15 downto 0);
signal  DECB_CMDSTAT   : std_logic;
signal  DECB_GOTSYNC   : std_logic;
signal  DECB_PARERR    : std_logic;
signal  DECB_MANERR    : std_logic;
signal  DECB_ACTIVE    : std_logic;
signal  DECB_CONTIG    : std_logic;
signal  DECB_FROMUS    : std_logic;
 
-- CPU interface Signals
signal  CPURDREG       : std_logic;    
signal  CPUWRREG       : std_logic_vector(1 downto 0);    
signal  CPUREGOUT      : std_logic_vector(15 downto 0);    

-- Backend Signals
signal  BCPUREQ        : std_logic;    
signal  BCPUWAIT       : std_logic;    
signal  BCPUWRT        : std_logic_vector(1 downto 0);    
signal  BCPUADDR       : std_logic_vector(15 downto 0);    
signal  BCPUDIN        : std_logic_vector(15 downto 0);    
signal  BCPUDOUT       : std_logic_vector(15 downto 0);    
signal  BENDREQ        : std_logic;
signal  BENDWRT        : std_logic;
signal  BENDBURST      : std_logic;
signal  BENDBUSY       : std_logic;
signal  BENDADDR       : std_logic_vector(15 downto 0);
signal  BENDDIN        : std_logic_vector(15 downto 0);
signal  BENDDOUT       : std_logic_vector(15 downto 0);
signal  BENDFAIL       : std_logic;
 
 
 -- Instrumentation
signal  INS_PPON       : std_logic;
signal  INS_PPONR      : std_logic;
                         
 
-- Misc Signals
signal  CLKSPD         : std_logic_vector(1 downto 0);
signal  iOPMODE        : std_logic_vector(1 downto 0);
signal  LOOPBACK       : std_logic; 
signal  RSTn           : std_logic; 
signal  Logic0         : std_logic; 
signal  Logic1         : std_logic; 
 
 
begin
  
        
--------------------------------------------------------------------
-- Misc

Logic0 <= '0';
Logic1 <= '1';  
                    
--------------------------------------------------------------------
-- 1553B Bus Interface - Encoder
-- Just one encoder required, bus shutdown achieved by gating outputs
--

BUSAENC: BRMENC                                       
  port map ( CLK        => CLK,                       
             RSTn       => RSTn,                      
             CLKSPD     => CLKSPD,                    
             STROBE     => ENC_STROBE,                
             ABORTX     => ENC_ABORT,                 
             DATAIN     => ENC_DATA,                  
             CMDSTAT    => ENC_CMDSTAT,               
             TXREADY    => ENC_READY,                 
             TXBUSY     => ENC_BUSY,                  
             TXENABLE   => TXT_ENABLE,                
             DOUT       => BUSOUT,                    
             TXENA      => BUSA_TXENABLE,             
             RXSTROBEA  => DECA_STROBE,               
             RXERRORA   => DECA_ERROR,                                   
             RXDATAA    => DECA_DATAOUT,              
             RXDATAAS   => DECA_CMDSTAT,              
             LOOPFAILA  => LOOPFAILA,                 
             TXENB      => BUSB_TXENABLE,             
             RXSTROBEB  => DECB_STROBE,               
             RXERRORB   => DECB_ERROR,                                   
             RXDATAB    => DECB_DATAOUT,              
             RXDATABS   => DECB_CMDSTAT,              
             LOOPFAILB  => LOOPFAILB,                        
             CLRERRORS  => ENC_CLEAR,                  
             FSM_ERROR  => open                                                            
          );
          
                                               
BUSA_INUSE <= not BUSSEL;
BUSB_INUSE <= BUSSEL;

BUSA_TXENABLE <= BUSA_INUSE and TXT_ENABLE;
BUSB_TXENABLE <= BUSB_INUSE and TXT_ENABLE;


-- Generate all the output signals
PTXT:process(CLK,RSTn)
 begin
  if RSTn='0' then
    BUSAOUTIN <= '1';
    BUSAOUTP  <= '1';
    BUSAOUTN  <= '1';
    BUSBOUTIN <= '1';
    BUSBOUTP  <= '1';
    BUSBOUTN  <= '1';
    BUSAINEN  <= '0';
    BUSBINEN  <= '0';
  elsif CLK'event and CLK='1' then
    BUSAOUTIN <= SHUTDOWNA;
    BUSBOUTIN <= SHUTDOWNB;
    BUSAINEN  <= RXBUSENA;
    BUSBINEN  <= RXBUSENB;
    BUSAOUTP  <= BUSOUT     or not BUSA_TXENABLE;
    BUSAOUTN  <= not BUSOUT or not BUSA_TXENABLE;
    BUSBOUTP  <= BUSOUT     or not BUSB_TXENABLE;
    BUSBOUTN  <= not BUSOUT or not BUSB_TXENABLE;
    if LOOPBACK='1' then   -- Dissable outputs to transceiver
      BUSAOUTIN <= '1';
      BUSBOUTIN <= '1';
      BUSAINEN  <= '0';
      BUSBINEN  <= '0';
      BUSAOUTP  <= '1';
      BUSAOUTN  <= '1';
      BUSBOUTP  <= '1';
      BUSBOUTN  <= '1';
    end if;
  end if;
end process;


-- Transmitter Hardware Timeout
-- This is a separate timer, it should never trigger !
-- = ROUND(0.5+(688*FREQ/256),0)
-- at 12MHz set at 33 * 256 = 8448  = 704us 
-- at 16MHz set at 43 * 256 = 11264 = 688us
-- at 20MHz set at 54 * 256 = 13824 = 691 us
-- at 24MHz set at 65 * 256 = 16640 = 693us

process(CLKSPD)
 begin
   case CLKSPD is
     when "00"   => HWTIMVALUE <= "0100001"; -- 12MHz      
     when "01"   => HWTIMVALUE <= "0101011"; -- 16MHz      
     when "10"   => HWTIMVALUE <= "0110110"; -- 20MHz      
     when others => HWTIMVALUE <= "1000001"; -- 24MHz      
   end case;
end process;


PTXTTIM:  
process(CLK,RSTn)
 variable COUNT : UNSIGNED(14 downto 0);
 begin
   if RSTn='0' then
     COUNT     := ( others => '0');
     TXTIMEOUT <= '0';
   elsif CLK'event and CLK='1' then
     TXTIMEOUT <= '0';
     if ENC_BUSY='1' and TXTIMEOUT='0' then
       COUNT := COUNT + 1;
     else
       COUNT := ( others => '0');
     end if; 
     TXTIMEOUT <= to_logic( COUNT(14 downto 8) = HWTIMVALUE);
   end if;
end process;


--------------------------------------------------------------------
-- 1553B Bus Interface - Decoders
--   

BUSAINP_LP  <= BUSAINP  when LOOPBACK='0' else (BUSOUT     or not BUSA_TXENABLE);
BUSAINN_LP  <= BUSAINN  when LOOPBACK='0' else (not BUSOUT or not BUSA_TXENABLE);
BUSBINP_LP  <= BUSBINP  when LOOPBACK='0' else (BUSOUT     or not BUSB_TXENABLE);
BUSBINN_LP  <= BUSBINN  when LOOPBACK='0' else (not BUSOUT or not BUSB_TXENABLE);

BUSADEC: BRMDEC 
  port map ( CLK       => CLK,                 
             RSTn      => RSTn,                
             CLKSPD    => CLKSPD,               
             DATAINP   => BUSAINP_LP,             
             DATAINN   => BUSAINN_LP,
             TXENABLE  => BUSA_TXENABLE,
             FROMUS    => DECA_FROMUS,
             STROBE    => DECA_STROBE,         
             DATAOUT   => DECA_DATAOUT,        
             CMDSTAT   => DECA_CMDSTAT,        
             GOTSYNC   => DECA_GOTSYNC,        
             PARERR    => DECA_PARERR,         
             MANERR    => DECA_MANERR,         
             ACTIVE    => DECA_ACTIVE,         
             CONTIG    => DECA_CONTIG         
            );                                

BUSBDEC: BRMDEC 
  port map ( CLK       => CLK,                 
             RSTn      => RSTn,                
             CLKSPD    => CLKSPD,               
             DATAINP   => BUSBINP_LP,             
             DATAINN   => BUSBINN_LP,
             TXENABLE  => BUSB_TXENABLE,
             FROMUS    => DECB_FROMUS,
             STROBE    => DECB_STROBE,         
             DATAOUT   => DECB_DATAOUT,        
             CMDSTAT   => DECB_CMDSTAT,        
             GOTSYNC   => DECB_GOTSYNC,        
             PARERR    => DECB_PARERR,         
             MANERR    => DECB_MANERR,         
             ACTIVE    => DECB_ACTIVE,         
             CONTIG    => DECB_CONTIG         
            );                                

DECA_ERROR <= DECA_PARERR or DECA_MANERR;
DECB_ERROR <= DECB_PARERR or DECB_MANERR;

--------------------------------------------------------------------
-- The Bus Controller Protocol Engine
--
                                 
UPC : BRMPC 
      generic map
             ( FAMILY   => FAMILY,
               BCENABLE => BCENABLE,    
               RTENABLE => RTENABLE,
               MTENABLE => MTENABLE,
               LEGREGS  => LEGREGS,
               ENHANCED => ENHANCED,
               INITFREQ => INITFREQ,
			   LOCKFREQ => LOCKFREQ
             )
      port map 
        ( CLK            =>  CLK,
          TCLK           =>  TCLK,
          RSTINn         =>  RSTINn,
          RSTOUTn        =>  RSTn,
          CLKSPD         =>  CLKSPD,
          LOCKn          =>  LOCKn,     
          RTADDRIN       =>  RTADDRIN, 
          RTADDRPIN      =>  RTADDRPIN, 
          RTADERR        =>  RTADERR,   
          MSELIN         =>  MSELIN,    
          SSYSFn         =>  SSYSFn,    
          ABSTDIN        =>  ABSTDIN,   
          SHUTDOWNA      =>  SHUTDOWNA,
          SHUTDOWNB      =>  SHUTDOWNB,
          RXBUSENA       =>  RXBUSENA,
          RXBUSENB       =>  RXBUSENB,
          BUSSEL         =>  BUSSEL,
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
          ENCSTROBE      =>  ENC_STROBE, 
          ENCABORT       =>  ENC_ABORT,  
          ENCDATA        =>  ENC_DATA,       
          ENCCMDSTAT     =>  ENC_CMDSTAT,
          ENCREADY       =>  ENC_READY,  
          ENCBUSY        =>  ENC_BUSY,   
          ENCCLEAR       =>  ENC_CLEAR, 
          TXTIMEOUT      =>  TXTIMEOUT,
          BENDREQ        =>  BENDREQ,    
          BENDBURST      =>  BENDBURST,    
          BENDWRT        =>  BENDWRT,
          BENDBUSY       =>  BENDBUSY,   
          BENDFAIL       =>  BENDFAIL,   
          BENDADDR       =>  BENDADDR,   
          BENDDIN        =>  BENDDIN,    
          BENDDOUT       =>  BENDDOUT,   
          CPUWR          =>  CPUWRREG,      
          CPURD          =>  CPURDREG,      
          CPUADDR        =>  CPUADDR(5 downto 0), 
          CPUDIN         =>  CPUDIN,     
          CPUDOUT        =>  CPUREGOUT,
          MEMFAIL        =>  MEMFAIL,
          INTLEVEL       =>  INTLEVEL,
          INTOUTH        =>  INTOUTH,
          INTOUTM        =>  INTOUTM,
          INTACKH        =>  INTACKH,
          INTACKM        =>  INTACKM,
          BUSY           =>  BUSY,
          ACTIVE         =>  ACTIVE,
          OPMODE         =>  iOPMODE,
          MSGSTART       =>  MSGSTART,
          CMDSYNC        =>  CMDSYNC,   
          SYNCNOW        =>  SYNCNOW,   
          BUSRESET       =>  BUSRESET,  
          CMDVAL         =>  CMDVAL,    
          CMDOK          =>  CMDOK,     
          CMDSTB         =>  CMDSTB,     
          CMDOKOUT       =>  CMDOKOUT,
          LOOPBACK       =>  LOOPBACK,   
          INS_PPON       =>  INS_PPON,      
          INS_PPONR      =>  INS_PPONR  
        );
  
OPMODE  <= iOPMODE;  

RSTOUTn <= RSTn;
  
--------------------------------------------------------------------
-- Top Level CPU Interface
--

BCPUREQ     <=    (not CPUWRN(0) or not CPUWRN(1) or not CPURDN ) 
               and not CPUCSN and CPUMEM and CPUMEMEN;
BCPUWRT(0)  <= not CPUWRN(0) and CPUMEMEN;
BCPUWRT(1)  <= not CPUWRN(1) and CPUMEMEN;
CPUWRREG(0) <= not CPUWRN(0) and not CPUCSN and not CPUMEM;
CPUWRREG(1) <= not CPUWRN(1) and not CPUCSN and not CPUMEM;
CPURDREG    <= not CPURDN and not CPUCSN and not CPUMEM;

BCPUADDR <= CPUADDR;
BCPUDIN  <= CPUDIN;
CPUDOUT  <= BCPUDOUT when CPUMEM='1' else CPUREGOUT;
CPUWAITN <= not (BCPUWAIT and BCPUREQ);

CPUDEN   <= not CPUCSN and not CPURDN;


--------------------------------------------------------------------
-- The Backend Interface
--

UBEND:  BRMBEND 
  generic map ( BETIMING => BETIMING,
		    	ACKVAL   => ACKVAL,    
		    	WAITVAL  => WAITVAL
			  ) 
  port map      
       ( CLK       =>  CLK,
         RSTn      =>  RSTn,
         CLKSPD    =>  CLKSPD,         
         ASYNCIF   =>  ASYNCIF,
         CPUMEMEN  =>  CPUMEMEN,
         CPUREQ    =>  BCPUREQ,  
         CPUWRT    =>  BCPUWRT,  
         CPUWAIT   =>  BCPUWAIT, 
         CPUADDR   =>  BCPUADDR, 
         CPUDOUT   =>  BCPUDIN,      -- Input from CPU is output to RAM
         CPUDIN    =>  BCPUDOUT,     -- and vise versa
         BENDREQ   =>  BENDREQ, 
         BENDWRT   =>  BENDWRT, 
         BENDBURST =>  BENDBURST,
         BENDBUSY  =>  BENDBUSY,
         BENDFAIL  =>  BENDFAIL,
         BENDADDR  =>  BENDADDR,
         BENDDOUT  =>  BENDDOUT,
         BENDDIN   =>  BENDDIN, 
         MEMREQn   =>  MEMREQn, 
         MEMGNTn   =>  MEMGNTn,
         MEMACCn   =>  MEMACCn, 
         MEMWRn    =>  MEMWRn,  
         MEMRDn    =>  MEMRDn,  
         MEMCSn    =>  MEMCSn,  
         MEMWAITn  =>  MEMWAITn,
         MEMCEN    =>  MEMCEN,  
         MEMDEN    =>  MEMDEN,  
         MEMADDR   =>  MEMADDR, 
         MEMDOUT   =>  MEMDOUT, 
         MEMDIN    =>  MEMDIN 
       );        
                 
end RTL;

  