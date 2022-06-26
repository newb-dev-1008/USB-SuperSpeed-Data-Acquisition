-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--  
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--
-- File:  BRMmt.vhd
--     
-- Description: Core1553BRM
--              Monitor Command Word Decoder   
--
-- Rev: 1.0 01May04  IPB  : Pre Production  
-- Rev: 2.0 27May04  IPB  : First Production Release 
-- Rev: 3.0 15Feb07  IPB  :  CoreConsole Release 
-- Rev: 2.13 01Oct05 IPB  : Encoder fix and enhancements
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--
-- Notes:
--
-- *********************************************************************/ 


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.convert.all;

entity BRMMT is
  generic ( MTENABLE : INTEGER range 0 to 1    :=  1 );
  port ( CLK            : in  std_logic;
         RSTn           : in  std_logic;
         
         -- Control Signals 
         BCASTEN        : in  std_logic;
         MIL1553A       : in  std_logic;
         EXPECTSW       : in  std_logic;
     
         -- Decoder Interface
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
         
         -- Interface to/from Protocol Logic
         MTMSG_BUSSEL   : out std_logic;
         MTMSG_STBALL   : out std_logic;
         MTMSG_START    : out std_logic;
         MTMSG_CMDWORD  : out std_logic_vector(23 downto 0)
        );
end BRMMT;

architecture RTL of BRMMT is

                      
-- Bus Selection and Multiplexing Signals
signal  iBUSSEL        : std_logic;
signal  DEC_STROBE     : std_logic;
signal  DEC_DATAOUT    : std_logic_vector(15 downto 0);
signal  DEC_CMDSTAT    : std_logic;
signal  DEC_GOTSYNC    : std_logic;
signal  DEC_PARERR     : std_logic;
signal  DEC_MANERR     : std_logic;
signal  DEC_ACTIVE     : std_logic;
signal  DEC_CONTIG     : std_logic;
signal  DEC_FROMUS     : std_logic;
signal  DATASYNC       : std_logic;
  
-- Command Word Signals
signal  CW_STBALL       : std_logic;
signal  PENDING         : std_logic;
signal  STAMTMSG        : std_logic;
signal  CW_RTADDR       : std_logic_vector(4 downto 0);
signal  CW_TX           : std_logic;
signal  CW_SUBADR       : std_logic_vector(4 downto 0);
signal  CW_MCWC         : std_logic_vector(4 downto 0);
signal  CW_COUNT        : std_logic_vector(5 downto 0);
signal  CW_BCAST        : std_logic;
signal  CW_MCODE        : std_logic;
signal  CW_DATA         : std_logic;
signal  SW_STBOK        : std_logic;
signal  DW_STBOK        : std_logic;
signal  BURST           : std_logic;
     
   
-- Misc Signals
signal  Logic0          : std_logic; 
signal  Logic1          : std_logic; 
 
begin
          
--------------------------------------------------------------------
-- Misc

Logic0 <= '0';
Logic1 <= '1';   
          
--------------------------------------------------------------------------------------------
-- Decoder Multiplexing logic
-- 

DEC_STROBE   <=  DECA_STROBE  when iBUSSEL='0' else DECB_STROBE;
DEC_DATAOUT  <=  DECA_DATAOUT when iBUSSEL='0' else DECB_DATAOUT;
DEC_CMDSTAT  <=  DECA_CMDSTAT when iBUSSEL='0' else DECB_CMDSTAT;
DEC_GOTSYNC  <=  DECA_GOTSYNC when iBUSSEL='0' else DECB_GOTSYNC;
DEC_PARERR   <=  DECA_PARERR  when iBUSSEL='0' else DECB_PARERR;
DEC_MANERR   <=  DECA_MANERR  when iBUSSEL='0' else DECB_MANERR; 
DEC_ACTIVE   <=  DECA_ACTIVE  when iBUSSEL='0' else DECB_ACTIVE; 
DEC_CONTIG   <=  DECA_CONTIG  when iBUSSEL='0' else DECB_CONTIG; 
DEC_FROMUS   <=  DECA_FROMUS  when iBUSSEL='0' else DECB_FROMUS; 

DATASYNC     <= DEC_GOTSYNC and not DEC_CMDSTAT; 
BURST        <= DEC_CONTIG;
   
--------------------------------------------------------------------
-- Command Word Decode 
-- We actually need to decode Command Words from Both Decoders so
-- we know whether a command arrives on the reduntant bus

-- This controls the RX Bus selection Logic as well

PCWD:
process(CLK,RSTn)
variable RTPAROK    : std_logic;
variable CWOKA      : std_logic;
variable CWOKB      : std_logic;
variable CWSTB      : std_logic;
variable ADDRA      : std_logic;
variable ADDRB      : std_logic;
variable SYNCS      : std_logic_vector(1 downto 0);
begin
 if RSTn='0' then
    CW_STBALL     <= '0';
    iBUSSEL       <= '0';    -- default bus
    DW_STBOK      <= '0';
    SW_STBOK      <= '0';
 elsif CLK'event and CLK='1' then
    DW_STBOK    <= DEC_STROBE and not DEC_CMDSTAT and not DEC_MANERR and not DEC_PARERR and BURST;
    SW_STBOK    <= DEC_STROBE and     DEC_CMDSTAT and not DEC_MANERR and not DEC_PARERR;
       
    CWOKA := DECA_STROBE and DECA_CMDSTAT   
              and not DECA_PARERR and not DECA_MANERR;
    CWOKB := DECB_STROBE and DECB_CMDSTAT   
               and not DECB_PARERR and not DECB_MANERR;
   
    CWSTB := not EXPECTSW and (  (CWOKA and not DECA_CONTIG) 
                                  or (CWOKB and not DECB_CONTIG) );
  
    CW_STBALL <= '0';
   
    -- Switch the Buses when a Valid Command Received                                   
    if CWSTB='1' then
      CW_STBALL <= '1';
      SYNCS(1) := CWOKB;
      SYNCS(0) := CWOKA;
      case SYNCS is
        when "01"   => iBUSSEL <= '0';  --Bus A
        when "10"   => iBUSSEL <= '1';  --Bus B
        when others =>
      end case;
    end if;
  end if;
end process;

MTMSG_STBALL   <= CW_STBALL;

--------------------------------------------------------------------
-- Command Word Register & Decode
--

PCW:
process(CLK,RSTn)
 begin
  if RSTn='0' then
    CW_RTADDR <= "00000";
    CW_TX     <= '0'; 
    CW_SUBADR <= "00000";
    CW_MCWC   <= "00000";
    CW_COUNT  <= "000000";
    CW_BCAST  <= '0';
    CW_MCODE  <= '0';
    STAMTMSG  <= '0';
    PENDING   <= '0';
  elsif CLK'event and CLK='1' then
    STAMTMSG  <= '0';
    if CW_STBALL='1' then  
      PENDING   <= '1';    
      CW_RTADDR <= DEC_DATAOUT(15 downto 11);
      CW_TX     <= DEC_DATAOUT(10);
      CW_SUBADR <= DEC_DATAOUT(9 downto 5);
      CW_MCWC   <= DEC_DATAOUT(4 downto 0);
      CW_BCAST  <= to_logic(DEC_DATAOUT(15 downto 11)="11111") and BCASTEN;
      if (DEC_DATAOUT(9 downto 5)="00000") then 
        CW_MCODE  <= '1';
        CW_COUNT  <= "00000" & DEC_DATAOUT(4);
      elsif (MIL1553A='0' and DEC_DATAOUT(9 downto 5)="11111") then
        CW_MCODE  <= '1';
        CW_COUNT  <= "000000";
      else
        CW_MCODE  <= '0';
        CW_COUNT  <= to_logic(DEC_DATAOUT(4 downto 0)="00000" ) & DEC_DATAOUT(4 downto 0);
      end if;
    end if;
    if PENDING='1' and (DEC_ACTIVE='0' or DEC_GOTSYNC='1') then 
      STAMTMSG  <= '1';
      PENDING   <= '0';
    end if;
  end if;                    
end process;

MTMSG_CMDWORD <= CW_BCAST & CW_MCODE & CW_COUNT & CW_RTADDR & CW_TX & CW_SUBADR & CW_MCWC 
                       when MTENABLE=1
                       else ( others => '0');

MTMSG_BUSSEL  <= iBUSSEL   and to_logic(MTENABLE);
MTMSG_STBALL  <= CW_STBALL and to_logic(MTENABLE);
MTMSG_START   <= STAMTMSG  and to_logic(MTENABLE);


end RTL;









 