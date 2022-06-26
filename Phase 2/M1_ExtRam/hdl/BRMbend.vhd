-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
-- 
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
-- 
-- File:  brmbend.vhd
--     
-- Description: Core1553BRM
--              Default Backend Interface  
--
-- Rev: 1.0  01May04  IPB  : Pre Production  
-- Rev: 2.0  27May04  IPB  : First Production Release 
-- Rev: 2.1  24Jan05  IPB  : PA3/E Production Release 
-- Rev: 2.11 05Feb05  IPB  : Backend Timing modified SAR44066, 44067
-- Rev: 2.12 19Feb05  IPB  : Backend Timing modified SAR44392
-- Rev: 2.13 01Oct05  IPB  : Encoder fix and enhancements
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--  
--
-- Notes:
--
-- *********************************************************************/ 


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity BRMbend is
  generic ( BETIMING : INTEGER range 0 to 2;
			ACKVAL   : INTEGER range 0  to 255;  
			WAITVAL  : INTEGER range 0  to 255 
		  ); 
  port ( CLK       : in  std_logic;
         RSTn      : in  std_logic;
         CLKSPD    : in  std_logic_vector(1 downto 0);
         ASYNCIF   : in  std_logic;
         CPUMEMEN  : in  std_logic;
    
         -- Interface from the CPU Interface
         CPUREQ    : in  std_logic;
         CPUWRT    : in  std_logic_vector(1 downto 0);
         CPUWAIT   : out std_logic;
         CPUADDR   : in  std_logic_vector(15 downto 0);
         CPUDOUT   : in  std_logic_vector(15 downto 0);
         CPUDIN    : out std_logic_vector(15 downto 0);
                 
         -- Interface from the BC logic
         BENDREQ   : in  std_logic;
         BENDWRT   : in  std_logic;
         BENDBURST : in  std_logic;
         BENDBUSY  : out std_logic;
         BENDFAIL  : out std_logic;
         BENDADDR  : in  std_logic_vector(15 downto 0);
         BENDDOUT  : in  std_logic_vector(15 downto 0);
         BENDDIN   : out std_logic_vector(15 downto 0);
         
         -- Backend Memory interface
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
end BRMbend;


architecture RTL of BRMbend is

type    T_MSTATE is   (IDLE,BREQ,READ1,WRITE1,IDLE1);
signal  MSTATE         : T_MSTATE;
signal  iBENDFAIL      : std_logic;
   
signal  iMEMREQn       : std_logic;
signal  iMEMACCn       : std_logic;
signal  iMEMCSn        : std_logic;                     
signal  iMEMWRn        : std_logic_vector(1 downto 0);                     
signal  iMEMRDn        : std_logic;
signal  iMEMCEN        : std_logic;
signal  iMEMDEN        : std_logic;
signal  MEMWRT         : std_logic_vector(1 downto 0);
signal  GNT            : std_logic;
signal  MEMTIMER       : UNSIGNED(7 downto 0);    
signal  IDLETIMER      : UNSIGNED(2 downto 0);    
signal  ACKVALUE       : INTEGER range 0 to 255;
signal  WAITVALUE      : INTEGER range 0 to 255;

signal  BENDPENDING    : std_logic;
signal  CPUACCESS      : std_logic;
signal  LASTCPUREQ     : std_logic;
signal  CPUNOREQ       : std_logic;
signal  iCPUWAIT       : std_logic;

begin
    
-- Timeout numbers are From a Excel Spread sheet, Please contact Actel tech Support if required

process(CLKSPD,CPUMEMEN)
variable muxsel : std_logic_vector(2 downto 0);
 begin
   muxsel := CPUMEMEN & CLKSPD;
   case muxsel is
     when "000"   => ACKVALUE <= 59;   -- 12MHz NO CPU memory access     
     when "001"   => ACKVALUE <= 81;   -- 16MHz NO CPU memory access     
     when "010"   => ACKVALUE <= 112;  -- 20MHz NO CPU memory access     
     when "011"   => ACKVALUE <= 150;  -- 24MHz NO CPU memory access     
     when "100"   => ACKVALUE <= 33;   -- 12MHz CPU memory access     
     when "101"   => ACKVALUE <= 45;   -- 16MHz CPU memory access     
     when "110"   => ACKVALUE <= 66;   -- 20MHz CPU memory access     
     when "111"   => ACKVALUE <= 91;   -- 24MHz CPU memory access      
     when others  => ACKVALUE <= 0;  
   end case;
   if BETIMING=1 then  -- use alternate values
     case muxsel is
       when "000"   => ACKVALUE <= 48;  -- 12MHz NO CPU memory access     
       when "001"   => ACKVALUE <= 64;  -- 16MHz NO CPU memory access     
       when "010"   => ACKVALUE <= 85;  -- 20MHz NO CPU memory access     
       when "011"   => ACKVALUE <= 118; -- 24MHz NO CPU memory access     
       when "100"   => ACKVALUE <= 24;  -- 12MHz CPU memory access     
       when "101"   => ACKVALUE <= 32;  -- 16MHz CPU memory access     
       when "110"   => ACKVALUE <= 45;  -- 20MHz CPU memory access     
       when "111"   => ACKVALUE <= 66;  -- 24MHz CPU memory access      
       when others  => ACKVALUE <= 0;
     end case;
   end if;
   if BETIMING=2 then		 -- externally configured value
     ACKVALUE	<= ACKVAL;
   end if;
end process;

process(CLKSPD,CPUMEMEN)
variable muxsel : std_logic_vector(1 downto 0);
 begin
   muxsel := CLKSPD;
   case muxsel is
     when "00"    => WAITVALUE <= 3+1;   --  12MHz      
     when "01"    => WAITVALUE <= 6+1;   --  16MHz      
     when "10"    => WAITVALUE <= 7+1;   --  20MHz      
     when "11"    => WAITVALUE <= 7+1;   --  24MHz      
     when others  => WAITVALUE <= 0;  
   end case;
   if BETIMING=1 then -- use alternate values
     case muxsel is
       when "00"    => WAITVALUE <= 5+1;   --  12MHz      
       when "01"    => WAITVALUE <= 9+1;   --  16MHz      
       when "10"    => WAITVALUE <= 12+1;  --  20MHz      
       when "11"    => WAITVALUE <= 13+1;  --  24MHz      
       when others  => WAITVALUE <= 0;  
     end case;
   end if;
   if BETIMING=2 then		 -- externally configured value
     WAITVALUE	<= WAITVAL;
   end if;
end process;
      
--------------------------------------------------------------------
-- Data Transfers - Bus Control State Machine
--

GNT <= not MEMGNTn;


PMEMSM2:
process(CLK,RSTn)
 begin
  if RSTn='0' then
   MSTATE      <= IDLE;
   iMEMREQn    <= '1';
   iMEMACCn    <= '1';
   iMEMCSn     <= '1';
   iMEMWRn     <= "11";                                         
   iMEMRDn     <= '1';
   iMEMCEN     <= '0';
   iMEMDEN     <= '0';
   BENDDIN     <= ( others => '0');
   CPUDIN      <= ( others => '0');
   iCPUWAIT    <= '0';
   BENDBUSY    <= '0';
   iBENDFAIL   <= '0';
   BENDPENDING <= '0';
   CPUACCESS   <= '0';   
   LASTCPUREQ  <= '0'; 
   CPUNOREQ    <= '0';
   MEMADDR     <= ( others => '0');
   MEMDOUT     <= ( others => '0');
   MEMWRT      <= ( others => '0');
   MEMTIMER    <= ( others => '0');
   IDLETIMER   <= ( others => '1');
  elsif CLK'event and CLK='1' then
    LASTCPUREQ <= CPUREQ;
    iBENDFAIL  <= '0';                           
    if to_integer(MEMTIMER)=0 then
      iBENDFAIL <= '1';
    end if;
    if BENDREQ='1' and CPUMEMEN='1' then
      BENDBUSY    <= '1';
      BENDPENDING <= '1';
    end if; 
    if CPUREQ='0' then
      CPUNOREQ <= '1';
      iCPUWAIT <= '1';
    end if;
    MEMTIMER  <= MEMTIMER - 1;
    IDLETIMER <= IDLETIMER -1;
    case MSTATE is                                -- TX=1 memory reads
      when IDLE =>  iMEMCSn   <= '1';
                    iMEMWRn   <= "11";
                    iMEMRDn   <= '1';
                    iMEMCEN   <= '0';
                    iMEMDEN   <= '0';
                    iMEMREQn  <= '1';
                    BENDBUSY  <= '0';
                    iBENDFAIL <= '0';                           -- not started so cant fail here
                    MEMTIMER  <= to_unsigned(ACKVALUE,8);       -- Memory already granted
                    if BENDREQ='1' or BENDPENDING='1' then
                        BENDPENDING <= '0';
                        BENDBUSY  <= '1';
                        iMEMREQn  <= not iMEMACCn;
                        MSTATE    <= BREQ;
                        CPUACCESS <= '0';
                        MEMADDR   <= BENDADDR;
                        MEMDOUT   <= BENDDOUT;
                        MEMWRT    <= BENDWRT & BENDWRT;
                    elsif CPUREQ='1' and CPUNOREQ='1' and CPUMEMEN='1' and iMEMACCn='1' then
                        CPUNOREQ  <= '0';
                        iMEMREQn  <= not iMEMACCn;
                        MSTATE    <= BREQ;
                        CPUACCESS <= '1';
                        MEMADDR   <= CPUADDR;
                        MEMDOUT   <= CPUDOUT;
                        MEMWRT    <= CPUWRT;
                    elsif IDLETIMER="000" then
                        iMEMACCn   <= '1';
                    end if;
      when BREQ  => if iBENDFAIL='1' then
                      MSTATE  <= IDLE;
                      if CPUACCESS='1' then
                        iCPUWAIT <= '0';
                      end if;
                    elsif GNT='1' or iMEMACCn='0' then
                       iMEMACCn  <= '0';
                       iMEMCEN   <= '1';
                       iMEMCSn   <= '0';
                       iBENDFAIL <= '0';   
                       MEMTIMER  <= to_unsigned(WAITVALUE,8); 
                       if MEMWRT(0)='1' or MEMWRT(1)='1' then
                         MSTATE   <= WRITE1;
                         iMEMDEN  <= '1';
                         iMEMWRn(0)  <= not (MEMWRT(0) and not ASYNCIF);   -- set if SYNC mode
                         iMEMWRn(1)  <= not (MEMWRT(1) and not ASYNCIF);   -- set if SYNC mode
                       else
                         MSTATE  <= READ1;
                         iMEMRDn <= ASYNCIF;    -- set if SYNC mode
                       end if;
                    end if;
      when WRITE1 => iMEMWRn  <= not MEMWRT;
                     iMEMREQn <= '1';  
                     if ( MEMWAITn='1' or iBENDFAIL='1') and iMEMWRn/="11" then
                       iMEMWRn    <= "11";
                       MSTATE     <= IDLE1;
                       if CPUACCESS='1' then
                         iCPUWAIT <= '0';
                       end if;
                       iBENDFAIL  <= '0';                       -- complete so dont fail
                     end if;  
      when READ1  => iMEMREQn <= '1';  
                     if ASYNCIF='1' then
                       iMEMRDn  <= '0';
                       if (MEMWAITn='1' or iBENDFAIL='1') and iMEMRDn='0' then
                         iMEMRDn    <= '1';
                         if CPUACCESS='1' then
                           CPUDIN   <= MEMDIN;
                           iCPUWAIT  <= '0';
                         else
                           BENDDIN  <= MEMDIN;
                         end if;
                         iBENDFAIL  <= '0';                      -- complete so dont fail
                         MSTATE     <= IDLE1;
                       end if;  
                     else  -- SYNC Mode
                       if (MEMWAITn='1' or iBENDFAIL='1') then   -- if Wait delay input
                         iMEMRDn  <= '1';
                       end if;
                       if iMEMRDn='1' then
                         if CPUACCESS='0' then
                           BENDDIN  <= MEMDIN;
                         else
                           CPUDIN   <= MEMDIN;
                           iCPUWAIT <= '0';
                         end if;
                         iBENDFAIL  <= '0';                      -- complete so dont fail
                         MSTATE     <= IDLE1;
                       end if;  
                     end if;
      when IDLE1 => iMEMCSn  <= '1';
                    iMEMWRn  <= "11";
                    iMEMRDn  <= '1';
                    iMEMCEN  <= '0';
                    iMEMDEN  <= '0';
                    iMEMACCn <= not BENDBURST;
                    if CPUACCESS='0' then
                      BENDBUSY <= '0';
                    end if;
                    iBENDFAIL <= '0';                           -- complete so dont fail
                    IDLETIMER <= "111";
                    MSTATE    <= IDLE;
    end case;
    if iBENDFAIL='1' and CPUACCESS='0' then
      BENDBUSY    <= '0';
      BENDPENDING <= '0';
    end if;
  end if;
end process;

-- Since we send valid data and WAIT in active at the same time
-- and valid data needs to through the data MUX etc the CPU may
-- see WAIT active before the data becomes valid. Thus we delay
-- the external WAIT by half a cycle.

process(CLK,RSTn)
 begin
  if RSTn='0' then
    CPUWAIT <= '1';
  elsif CLK'event and CLK='0' then
    CPUWAIT <= iCPUWAIT;
  end if;
end process;


BENDFAIL <= iBENDFAIL;

MEMACCn <= iMEMACCn;
MEMREQn <= iMEMREQn;
MEMWRn  <= iMEMWRn;
MEMRDn  <= iMEMRDn;            
MEMCEN  <= iMEMCEN;
MEMDEN  <= iMEMDEN;
MEMCSn  <= iMEMCSn;


end RTL; 