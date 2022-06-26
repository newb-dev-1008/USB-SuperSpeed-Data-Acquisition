-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
-- 
-- File:  BRMdec.vhd
--     
-- Description: Core1553BRM
--              Serial Decoder  
--
-- Rev: 1.0 01May04  IPB  : Pre Production from Core1553BRT 
-- Rev: 2.0 27May04  IPB  : First Production Release 
-- Rev: 3.0 15Feb07  IPB  :  CoreConsole Release 
-- Rev: 2.13 01Oct05 IPB  : Encoder fix and enhancements
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--  
--
-- Notes:
--  BRM: STARTED generation altered so we only START if we see a CW/SW SYNC
--       we will ignore incoming data if the the Burst starts with a DW SYNC
--
-- *********************************************************************/ 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;


entity BRMdec is
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
end BRMdec;


architecture RTL of BRMdec is

signal  DINP       : std_logic;
signal  DINN       : std_logic;
signal  DIN        : std_logic;
signal  LASTDIN    : std_logic;
signal  DLLCNT     : UNSIGNED(3 downto 0);
signal  DLLLIM     : UNSIGNED(3 downto 0);
signal  DLLSMP     : UNSIGNED(3 downto 0);
signal  SAMPLE     : std_logic;
signal  SAMPLEX    : std_logic;
signal  SAMPDEL    : std_logic;
signal  SYNC       : std_logic;   
signal  DECDATA    : std_logic;  
signal  DECERR     : std_logic;  
signal  SHIFTDATA  : std_logic_vector(5 downto 0);  
signal  DATASYNC   : std_logic;  
signal  PAR        : std_logic;
signal  WCNT       : UNSIGNED(4 downto 0);
signal  DWORD      : std_logic_vector(16 downto 0);
signal  FIRSTBIT   : std_logic;
signal  STARTED    : std_logic;
signal  WSTROBE    : std_logic;
signal  STBDONE    : std_logic;
signal  MANENCOK   : std_logic;

begin
      
process(CLKSPD)
 begin
   case CLKSPD is           -- FREQ/2 -1 
     when "00"   => DLLLIM <= "0101"; -- 12MHz      
     when "01"   => DLLLIM <= "0111"; -- 16MHz      
     when "10"   => DLLLIM <= "1001"; -- 20MHz      
     when others => DLLLIM <= "1011"; -- 24MHz      
   end case;
   case CLKSPD is           -- Offset after edge to sample 
     when "00"   => DLLSMP <= "0001"; -- 12MHz      
     when "01"   => DLLSMP <= "0010"; -- 16MHz      
     when "10"   => DLLSMP <= "0011"; -- 20MHz      
     when others => DLLSMP <= "0100"; -- 24MHz      
   end case;
end process;
   
---------------------------------------------------------------------------
-- Extract the clock from the incoming data
--  Require 2 MHz sample clock to detect manchester encoding
--  Delta dealy from EDGE to sample set up to make sure subsequent strobe
--  is not to early.

UDLL:
process(CLK,RSTn)
 variable EDGE : std_logic;
 begin
    if RSTn='0' then
      DIN     <= '0';
      LASTDIN <= '0';
      DLLCNT  <= "0000";
      SAMPLEX <= '0';
      DINP    <= '0';   
      DINN    <= '1';   
    elsif CLK'event and CLK='1' then
      SAMPLEX <= '0';
      DINP    <= DATAINP;                                  -- Sample incoming data stream
      DINN    <= DATAINN;                                  -- Use Pos/Neg Data to clean signals
      if DIN='1' and DINP='0' and DINN='1' then            -- Only change the data value if both
        DIN <= '0';                                        -- switched
      elsif DIN='0' and DINP='1' and DINN='0' then
        DIN <= '1';
      end if;
      LASTDIN <= DIN;
      EDGE   := DIN xor LASTDIN;
      DLLCNT <= DLLCNT +1;                                 -- Divide by clkrate/2 counter
      if DLLCNT=DLLSMP and EDGE='0' then                   -- Sample incoming data strobe
        SAMPLEX <= '1';                                    -- if about tosync then dont sample
      end if;
      if EDGE='1' or DLLCNT=DLLLIM then                    -- if data edge resync clock divider
        DLLCNT <="0000";                                  
      end if;
    end if;
end process;

SAMPLE <= SAMPLEX and not (DIN xor LASTDIN);

---------------------------------------------------------------------------
-- Shift the input stream and decode the Manchester data
--  detect encoding errors as well

UMAN:
process(CLK,RSTn)
 begin
    if RSTn='0' then
      SYNC      <= '0';
      DECDATA   <= '0';
      DECERR    <= '0';
      SHIFTDATA <= "000000";
      DATASYNC  <= '0';
      FIRSTBIT  <= '0';
      SAMPDEL   <= '0';
    elsif CLK'event and CLK='1' then
      SYNC     <= '0';
      DECDATA  <= '0';
      DECERR   <= '0';
      DATASYNC <= '0';
      SAMPDEL  <= SAMPLE;
      if SAMPLE='1' then
        SHIFTDATA <= SHIFTDATA(4 downto 0) & DIN;
      end if;
      if (SHIFTDATA="111000" or SHIFTDATA="000111") and SAMPDEL='1'then
        DECDATA <= SHIFTDATA(5);
        SYNC    <= '1';
      end if;
      if SYNC='1' then
        FIRSTBIT<='0';
      end if;
      if SAMPDEL='1' then
        if FIRSTBIT='0' then
          FIRSTBIT <= '1';
        else
          FIRSTBIT <= '0';
          DATASYNC <= '1';
          case SHIFTDATA(1 downto 0) is
           when "01"   => DECDATA <= '0';
           when "10"   => DECDATA <= '1';
           when others => DECERR  <= '1';
          end case;
        end if;
      end if;
    end if;
end process;

---------------------------------------------------------------------------
-- Extract the data words 
--

USTP:
process(CLK,RSTn)
 begin
    if RSTn='0' then
      CMDSTAT    <= '0';
      GOTSYNC    <= '0';
      PAR        <= '0';
      WCNT       <= "00000";
      DWORD      <= ( others => '0');
      WSTROBE    <= '0';
      DATAOUT    <= ( others => '0');
      MANENCOK   <= '0';
      STARTED    <= '0';
      CONTIG     <= '0';
      STBDONE    <= '0';
      FROMUS     <= '0';
    elsif CLK'event and CLK='1' then
      GOTSYNC    <= '0';
      WSTROBE    <= '0';
      if SYNC='1' then
        FROMUS   <= TXENABLE;
        CMDSTAT  <= DECDATA;
        PAR      <= '1'; 
        WCNT     <= "00000";
        STARTED  <= '1';                       
        STBDONE  <= '0';
        if WCNT="10011" and FIRSTBIT='0' then    -- SYNC contiguous to previous word
          CONTIG   <= '1';
          MANENCOK <= '1';                       -- contiguous words are okay
        else
          CONTIG   <= '0';
          MANENCOK <= DECDATA;                   -- OK if a CW, DW's must be contiguous
        end if; 
      else
        if DATASYNC='1' and STARTED='1' then     -- Datasync is a free running 1us pulse
          WCNT  <= WCNT+1;                       -- WCNT stops at 10101
          DWORD <= DWORD(15 downto 0) & DECDATA;
          PAR   <= PAR xor DECDATA;
          if DECERR='1' then
            MANENCOK <= '0'; 
            if WCNT(4 downto 1)="0000" then      -- If either bits 0 or 1 are corrupt then assume it is
              STARTED  <= '0';                   -- noise and terminate the decoder
              CONTIG   <= '0';
            end if;
          end if;
          if MANENCOK='1' and DECERR='0' and WCNT="00001" then
            GOTSYNC  <= '1';                     -- SYNC and 2 databits validated
          end if;
        end if;
        if WCNT="10001" and STBDONE='0' then
          WSTROBE  <= '1';
          STBDONE  <= '1';   
          DATAOUT  <= DWORD(16 downto 1);
        end if;
        if WCNT="10100" then               -- Goes In active 3us after Parity Bit
          STARTED <= '0';                  -- No valid SYNC by this time
        end if;                            -- If valid SYNC STARTED stays active
      end if;
    end if;
end process;

PARERR <= PAR;
MANERR <= not MANENCOK;

STROBE <= WSTROBE;

ACTIVE <= STARTED;

end RTL;