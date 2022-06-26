-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--  
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--
-- File:  BRMrt.vhd
--     
-- Description: 1553 BRM
--              RT Command Word Decoder and Mode Code Support  
--
-- Rev: 1.0  01May04 IPB  : Pre Production  
-- Rev: 2.0  27May04 IPB  : First Production Release 
-- Rev: 2.1  24Jan05 IPB  : PA3/E Production Release 
-- Rev: 2.13 01Oct05 IPB  : Encoder fix and enhancements
-- Rev: 2.17 20Jul06 IPB  : Fixed Monitor parity/manchester error bits
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--
-- Notes:
--  Release 2.17 fixes SAR57312 
--
-- *********************************************************************/ 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.convert.all;

entity BRMRT is
  generic ( BCENABLE : INTEGER range 0 to 1    :=  1;
            RTENABLE : INTEGER range 0 to 1    :=  1;
            MTENABLE : INTEGER range 0 to 1    :=  1;
            LEGREGS  : INTEGER range 0 to 5    :=  1;
            ENHANCED : INTEGER range 0 to 1    :=  1;
            INITFREQ : INTEGER range 12 to 24  := 24
           );
  port ( CLK            : in  std_logic;
         CLKSPD         : in  std_logic_vector(1 downto 0);
         RSTn           : in  std_logic;
         RSTREG         : out std_logic;
         RTMODE         : in  std_logic;
         
         -- 1553B Interface
         RTADDR         : in  std_logic_vector(4 downto 0);
         RTADDRP        : in  std_logic;
         RTADERR        : out std_logic;
         
         -- Control Signals 
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
         
         -- Decoder Interface
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
         
         -- Interface to/from Protocol Logic
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
         TIMER57US      : out std_logic;
         MSGINFO        : out std_logic_vector(15 downto 0);
         BITWORD        : in  std_logic_vector(15 downto 0);
         CLR_SRQ        : out std_logic;
         -- RT Transmiter Data 
         TXT_CMDSTAT    : in  std_logic;
         BENDDIN        : in  std_logic_vector(15 downto 0);
         TXT_DATAIN     : out std_logic_vector(15 downto 0);
         
         -- External Status Signals
         CMDSYNC        : out std_logic;
         SYNCNOW        : out std_logic;
                  
         -- Command Legalization Interface
         BITSELECT      : out std_logic_vector(7 downto 0);
         CMDOKREG       : in  std_logic;    
         USEXTOK        : in  std_logic;
         CMDVAL         : out std_logic_vector(11 downto 0);
         CMDOK          : in  std_logic;
         CMDSTB         : out std_logic;
         CMDOKOUT       : out std_logic
        );
end BRMRT;

architecture RTL of BRMRT is

-- Bus Enable Signals
signal  MCSHUTDOWNA    : std_logic;
signal  MCSHUTDOWNB    : std_logic;
signal  SHUTDOWNA      : std_logic;
signal  SHUTDOWNB      : std_logic;
                      
-- Bus Selection and Multiplexing Signals
signal  iBUSSEL        : std_logic;
signal  DEC_STROBE     : std_logic;
signal  DEC_STBDEL1    : std_logic;
signal  DEC_DATAOUT    : std_logic_vector(15 downto 0);
signal  DEC_CMDSTAT    : std_logic;
signal  DEC_GOTSYNC    : std_logic;
signal  DEC_PARERR     : std_logic;
signal  DEC_MANERR     : std_logic;
signal  DEC_ACTIVE     : std_logic;
signal  DEC_CONTIG     : std_logic;
signal  DEC_FROMUS     : std_logic;
signal  DATASYNC       : std_logic;
  
-- Timer Signals  
signal  TIMERRTRT       : UNSIGNED(10 downto 0);
signal  RTTIMVALUE      : UNSIGNED(6 downto 0);
signal  iTIMER57US      : std_logic;

-- Command Word Signals
signal  RTADERROR       : std_logic;
signal  CW_STBME        : std_logic;
signal  PENDING         : std_logic;
signal  STARTMSG        : std_logic;
signal  CW_RTADDR       : std_logic_vector(4 downto 0);
signal  CW_TX           : std_logic;
signal  CW_TXX          : std_logic;
signal  CW_SUBADR       : std_logic_vector(4 downto 0);
signal  CW_MCWC         : std_logic_vector(4 downto 0);
signal  CW_COUNT        : std_logic_vector(5 downto 0);
signal  CW_BCAST        : std_logic;
signal  CW_MCODE        : std_logic;
signal  CW_DATA         : std_logic;
signal  SW_STBOK        : std_logic;
signal  DW_STBOK        : std_logic;
signal  BURST           : std_logic;
signal  RTRT            : std_logic;
signal  RTRTOK          : std_logic;
signal  RTRTTXADDR      : std_logic_vector(4 downto 0);
 
-- Status Word Signals
signal  SW_MSGERR       : std_logic;
signal  STATUS          : std_logic_vector(15 downto 0);
signal  MSGOKAY         : std_logic;
signal  GOTSW           : std_logic;
signal  WCNTERR         : std_logic;
signal  iRTBUSY         : std_logic;
    
-- Mode Code Signals
signal  CMDOKAY         : std_logic;
signal  CMDVALINT       : std_logic_vector(11 downto 0); 
signal  CMDOKAYR        : std_logic; 
signal  HOLDCW          : std_logic; 
signal  LASTSW          : std_logic; 
signal  MASKTFLAG       : std_logic;
signal  DORESET         : std_logic;
signal  LastCommandWord : std_logic_vector(15 downto 0);
signal  LastStatusWord  : std_logic_vector(15 downto 0);
signal  MODEDATA        : std_logic_vector(15 downto 0);
signal  MCDMUX          : std_logic_vector(1 downto 0);
signal  DYNBUSOK        : std_logic;
    
    
-- MSGINFO & BIT Signals    
signal  MSGI_ME         : std_logic;
signal  MSGI_MAN        : std_logic;
signal  MSGI_PRTY       : std_logic;
signal  MSGI_ILL        : std_logic;
signal  MSGI_TO         : std_logic;
signal  MSGI_OVR        : std_logic;
signal  MSGI_RTRT       : std_logic;
signal  MSGI_CHA        : std_logic;
signal  MSGI_WC         : std_logic_vector(4 downto 0);
signal  MSGI_MEMFAIL    : std_logic;
signal  MSGI_BC         : std_logic;
       
   
-- Misc Signals
signal  Logic0          : std_logic; 
signal  Logic1          : std_logic; 
 
-- Modifies CMDSYNC to pulse on data sync as well
constant BOTHSYNCS : boolean := FALSE; 
 
begin
          

--------------------------------------------------------------------
-- Misc

Logic0 <= '0';
Logic1 <= '1';   
          
--------------------------------------------------------------------------------------------
-- Handle the Transmitter Shutdown 
-- BUSA


PTOA:  
process(CLK,RSTn)
 begin
   if RSTn='0' then
     SHUTDOWNA <= '0';
   elsif CLK'event and CLK='1' then
     if (TXTIMEOUT='1' and iBUSSEL='0') then        -- Transmission to long
       SHUTDOWNA <= '1';
     end if;
     if  (STARTMSG='1' and iBUSSEL='0') then         -- valid command so clear
       SHUTDOWNA <= '0';
     end if; 
   end if;
end process;

-- Handle the Transmitter Shutdown 
-- BUSB

PTOB:  
process(CLK,RSTn)
 begin
   if RSTn='0' then
     SHUTDOWNB <= '0';
   elsif CLK'event and CLK='1' then
     if (TXTIMEOUT='1' and iBUSSEL='1') then        -- Transmission to long
       SHUTDOWNB <= '1';
     end if;
     if  (STARTMSG='1' and iBUSSEL='1') then         -- valid command so clear
       SHUTDOWNB <= '0';
     end if; 
   end if;
end process;

SHUTDOWNRTA <= SHUTDOWNA;
SHUTDOWNRTB <= SHUTDOWNB;

--------------------------------------------------------------------------------------------
-- Decoder Multiplexing logic
-- 

-- SAR57312 - this now uses the top level bus select signal

DEC_FROMUS   <=  DECA_FROMUS  when BUSSELALL='0' else DECB_FROMUS;
DEC_STROBE   <=  DECA_STROBE  when BUSSELALL='0' else DECB_STROBE;
DEC_DATAOUT  <=  DECA_DATAOUT when BUSSELALL='0' else DECB_DATAOUT;
DEC_CMDSTAT  <=  DECA_CMDSTAT when BUSSELALL='0' else DECB_CMDSTAT;
DEC_GOTSYNC  <=  DECA_GOTSYNC when BUSSELALL='0' else DECB_GOTSYNC;
DEC_PARERR   <=  DECA_PARERR  when BUSSELALL='0' else DECB_PARERR;
DEC_MANERR   <=  DECA_MANERR  when BUSSELALL='0' else DECB_MANERR; 
DEC_ACTIVE   <=  DECA_ACTIVE  when BUSSELALL='0' else DECB_ACTIVE; 
DEC_CONTIG   <=  DECA_CONTIG  when BUSSELALL='0' else DECB_CONTIG; 

DATASYNC     <= DEC_GOTSYNC and not DEC_CMDSTAT; 
BURST        <= DEC_CONTIG;
   
--------------------------------------------------------------------
-- Command Word Decode For us
-- We actually need to decode Command Words from Both Decoders so
-- we know whether a command arrives on the reduntant bus

-- This controls the RX Bus selection Logic as well
-- Notice 2 indicates that we need to check that the RX RT on 
-- RTRT should check both command words for legality, this is done here

PCWD:
process(CLK,RSTn)
variable RTPAROK    : std_logic;
variable CWOKA      : std_logic;
variable CWOKB      : std_logic;
variable CW_SECOND  : std_logic;
variable MYADDRA    : std_logic;
variable MYADDRB    : std_logic;
variable BCASTADDRA : std_logic;
variable BCASTADDRB : std_logic;
variable SYNCS      : std_logic_vector(1 downto 0);
begin
 if RSTn='0' then
    CW_STBME      <= '0';
    iBUSSEL       <= '0';    -- default bus
    RTRT          <= '0';
    RTRTOK        <= '0';
    RTRTTXADDR    <= "00000";
    RTADERROR     <= '0';
    DEC_STBDEL1   <= '0';
    DW_STBOK      <= '0';
    SW_STBOK      <= '0';
 elsif CLK'event and CLK='1' then
    DEC_STBDEL1 <= DEC_STROBE;
    DW_STBOK    <= DEC_STROBE and not DEC_CMDSTAT and not DEC_MANERR and not DEC_PARERR and BURST;
    SW_STBOK    <= DEC_STROBE and     DEC_CMDSTAT and not DEC_MANERR and not DEC_PARERR;
    
    RTPAROK    := RTADDRP xor RTADDR(4) xor RTADDR(3) xor RTADDR(2) xor RTADDR(1) xor RTADDR(0);
    RTADERROR  <= not RTPAROK or (to_logic(RTADDR="11111") and BCASTEN);
    BCASTADDRA := to_logic(DECA_DATAOUT(15 downto 11)="11111") and BCASTEN;
    BCASTADDRB := to_logic(DECB_DATAOUT(15 downto 11)="11111") and BCASTEN;
    MYADDRA    := to_logic(DECA_DATAOUT(15 downto 11)=RTADDR) or BCASTADDRA;
    MYADDRB    := to_logic(DECB_DATAOUT(15 downto 11)=RTADDR) or BCASTADDRB;
   
    CWOKA := DECA_STROBE and DECA_CMDSTAT and not DECA_FROMUS 
              and not DECA_PARERR and not DECA_MANERR and not MCSHUTDOWNA and CHAEN;
    CWOKB := DECB_STROBE and DECB_CMDSTAT and not DECB_FROMUS 
               and not DECB_PARERR and not DECB_MANERR and not MCSHUTDOWNB and CHBEN;
   
    CW_SECOND := BURST and ((CWOKA and not iBUSSEL) or (CWOKB and iBUSSEL));
      
    CW_STBME    <= not RTADERROR and ((MYADDRA and CWOKA) or (MYADDRB and CWOKB));

    -- Switch the Buses when a Valid Command Received for me                                  
    SYNCS(1) := MYADDRB and CWOKB;
    SYNCS(0) := MYADDRA and CWOKA;
    case SYNCS is
      when "01"   => iBUSSEL <= '0';  --Bus A
      when "10"   => iBUSSEL <= '1';  --Bus B
      when others =>
    end case;
      
    -- Check for RTRT to RT Transmitting RTRT does not need to know its RTRT
    --  RXCW TXCW .... TXSW DW DW DW .. RXSW
    if CW_STBME='1' and BURST='0' then       -- RX RT First CW
      RTRT   <= '0';
      RTRTOK <= not DEC_DATAOUT(10);         -- should be a RX Command
    elsif CW_SECOND='1' and RTSMBUSY='1' then   -- Second command word and we are active 
      if RTRT='0' then
        RTRT       <= '1';
        RTRTOK     <= RTRTOK and DEC_DATAOUT(10) and not to_logic(DEC_DATAOUT(15 downto 11)="11111");
        RTRTTXADDR <= DEC_DATAOUT(15 downto 11);
      else -- third command word !
        RTRTOK     <= '0';
      end if;
    end if;
  end if;
end process;


BUSSEL         <= iBUSSEL;
RTMSG_RTRT     <= RTRT;
RTMSG_RTRTOK   <= RTRTOK;
RTMSG_STBME    <= CW_STBME;

RTADERR <= RTADERROR;

--------------------------------------------------------------------
-- Command Word Register & Decode
--

PCW:
process(CLK,RSTn)
 begin
  if RSTn='0' then
    CW_RTADDR  <= "00000";
    CW_TX      <= '0'; 
    CW_SUBADR  <= "00000";
    CW_MCWC    <= "00000";
    CW_COUNT   <= "000000";
    CW_BCAST   <= '0';
    CW_MCODE   <= '0';
    STARTMSG   <= '0';
    PENDING    <= '0';
    CMDSTB     <= '0';
  elsif CLK'event and CLK='1' then
    STARTMSG  <= '0';
    if CW_STBME='1' then    
      PENDING   <= '1';
      CW_RTADDR <= DEC_DATAOUT(15 downto 11);
      CW_TX     <= DEC_DATAOUT(10);
      CW_SUBADR <= DEC_DATAOUT(9 downto 5);
      CW_MCWC   <= DEC_DATAOUT(4 downto 0);
      CW_BCAST  <= to_logic(DEC_DATAOUT(15 downto 11)="11111") and BCASTEN;
      if MIL1553A='1' then
        if DEC_DATAOUT(9 downto 5)="00000" then 
          CW_MCODE  <= '1';
          CW_COUNT  <= "000000";
        else
          CW_MCODE  <= '0';
          CW_COUNT  <= to_logic(DEC_DATAOUT(4 downto 0)="00000" ) & DEC_DATAOUT(4 downto 0);
        end if;
      else
        if (DEC_DATAOUT(9 downto 5)="00000" or DEC_DATAOUT(9 downto 5)="11111") then 
          CW_MCODE  <= '1';
          CW_COUNT  <= "00000" & DEC_DATAOUT(4);
        else
          CW_MCODE  <= '0';
          CW_COUNT  <= to_logic(DEC_DATAOUT(4 downto 0)="00000" ) & DEC_DATAOUT(4 downto 0);
        end if;
      end if;
    end if;
    if PENDING='1' and (DEC_ACTIVE='0' or DEC_GOTSYNC='1') then 
      STARTMSG  <= '1';
      PENDING   <= '0';
    end if;
    CMDSTB <= CW_STBME;
  end if;                    
end process;

-- In 1553A Mode TX bit is ignored on mode codes and treated as TX
CW_TXX <=  '1' when (MIL1553A='1' and CW_MCODE='1') else CW_TX;

RTMSG_CMDWORD <= CW_BCAST & CW_MCODE & CW_COUNT & CW_RTADDR & CW_TXX & CW_SUBADR & CW_MCWC;

CW_DATA  <= not CW_MCODE;

--------------------------------------------------------------------
-- Command Legallity Block
--

CMDVALINT <= CW_BCAST & CW_TX & CW_SUBADR & CW_MCWC;

-- External Command Word checker     
CMDVAL  <= CMDVALINT;


-- Internal Checker, 

process(CMDVALINT,MIL1553A)
variable BCAST : std_logic;
variable TX    : std_logic;
variable SA    : std_logic_vector(4 downto 0);
variable WCMC  : std_logic_vector(4 downto 0);
variable MCODE : std_logic;
begin 
  BCAST   := CMDVALINT(11); 
  TX      := CMDVALINT(10); 
  SA      := CMDVALINT(9 downto 5);
  WCMC    := CMDVALINT(4 downto 0);
  if ( SA="00000" or (SA="11111" and MIL1553A='0') ) then
    -- Mode Code
    BITSELECT  <= '1' & BCAST & TX & WCMC(4) & WCMC(3 downto 0);
  else
    -- Data
    BITSELECT  <= '0' & BCAST & TX & SA(4) & SA(3 downto 0);
  end if;
end process;

        
-- Select Internal or External Checker, also latch the input signal as we
-- start processing the message

PCMDOK:
process(CLK,RSTn)
 begin
  if RSTn='0' then
    CMDOKAY <= '0';
  elsif CLK'event and CLK='1' then
    if USEXTOK='1' or LEGREGS=0 then
      CMDOKAY <= CMDOK;
    else
      CMDOKAY <= CMDOKREG;
    end if;
  end if;
end process;

CMDOKOUT     <= CMDOKAY;
RTMSG_LEGAL  <= CMDOKAY;

--------------------------------------------------------------------
-- Mode Code Operations
--  This Peforms the command word operations


PMCODE:
process(CLK,RSTn)
variable MUXSEL : std_logic_vector(5 downto 0);
variable WRITE  : std_logic;
 begin
  if RSTn='0' then
    SYNCNOW      <= '0';
    LASTSW       <= '0';
    MASKTFLAG    <= '0';
    DORESET      <= '0';
    MCDMUX       <= "00";
    MCSHUTDOWNA  <= '0';
    MCSHUTDOWNB  <= '0';
  elsif CLK'event and CLK='1' then
    SYNCNOW      <= '0';
    LASTSW       <= '0';
    DORESET      <= '0';
    MCDMUX       <= "00";
    MUXSEL       := CW_TX & CW_MCWC;
    WRITE        := STARTMSG and CMDOKAY; 
    if MIL1553A='1' then    -- No special action is taken on any mode codes, they are simply stored
      if ( CW_MCODE='1' and CW_MCWC="00010" and XMTSW='1') then   -- XMTSW enabled so do auto return the SW
        LASTSW   <= CMDOKAY;      
      end if;
    else
      if ( CW_MCODE='1' ) then                              -- Mode functions  
         case MUXSEL is
           when "100000" =>  
           when "100001" =>  SYNCNOW  <= WRITE;                             --Synchronise
           when "100010" =>  LASTSW   <= CMDOKAY;                           --Transmit Status Word
           when "100100" =>  if WRITE='1' and iBUSSEL='1' then              --Transmitter ShutDown
                               MCSHUTDOWNA <= '1';
                             end if;
                             if WRITE='1' and iBUSSEL='0' then       
                               MCSHUTDOWNB <= '1';
                             end if;
           when "100101" =>  if WRITE='1' and iBUSSEL='1' then              --Override Transmitter Shutdown
                               MCSHUTDOWNA <= '0';
                             end if;
                             if WRITE='1' and iBUSSEL='0' then                   
                               MCSHUTDOWNB <= '0';
                             end if;
           when "100110" =>  if WRITE='1' then
                               MASKTFLAG  <= '1';                           --Inhibit terminal flag
                             end if;
           when "100111" =>  if WRITE='1' then                              --Override inhibit terminal flag
                               MASKTFLAG  <= '0';
                             end if;
           when "101000" =>  if CMDDONE='1' and CMDOKAY='1' then
                               DORESET     <= '1';                          --Reset Remote Terminal
                               MCSHUTDOWNA <= '0';                          -- Also clear as per summit
                               MCSHUTDOWNB <= '0';
                               MASKTFLAG   <= '0';
                             end if;
           when "110000" =>  MCDMUX  <= "01";                               --Transmit Vector Word
           when "010001" =>  SYNCNOW <= DW_STBOK and CMDOKAY and RTSMBUSY;  --Synchronise with data
           when "110010" =>  LASTSW  <= CMDOKAY;                            --Transmit last command
                             MCDMUX  <= "10";
           when "110011" =>  MCDMUX  <= "11";                               --Transmit bit word
                           
           when others   =>
         end case;
       end if;
     end if;  
   end if;
end process;

RSTREG   <= DORESET;
DYNBUSOK <= DBA and not CW_BCAST and CW_MCODE and CW_TX and to_logic(CW_MCWC="00000");
CLR_SRQ  <= STARTMSG and not CW_BCAST and CW_MCODE and CW_TX and to_logic(CW_MCWC="10000");
HOLDCW   <= to_logic(MCDMUX="10");

-- Force 4-1 Mux for datapath
PMCMUX:
process(MCDMUX,LastCommandWord,BITWord)
 begin
   case MCDMUX(0) is  -- synopsys infer_mux 
    when '0'    => MODEDATA <= LastCommandWord;
    when '1'    => MODEDATA <= BITWord;
    when others => 
   end case;
end process;

--------------------------------------------------------------------
-- Error Control and Clearing
--

PERRLAT:
process(CLK,RSTn)
 begin
  if RSTn='0' then
    MSGI_MAN     <= '0';
    MSGI_PRTY    <= '0';
    MSGI_MEMFAIL <= '0';
  elsif CLK'event and CLK='1' then
    if DEC_STROBE='1' and DEC_MANERR='1' and RTSMBUSY='1' then
      MSGI_MAN <= '1';
    end if;
    if DEC_STROBE='1' and DEC_PARERR='1' and RTSMBUSY='1' then
      MSGI_PRTY <= '1';
    end if;
    if CMDDONE='1' then
      MSGI_MAN  <= '0';
      MSGI_PRTY <= '0';
    end if;
    if BENDFAIL='1' then 
      MSGI_MEMFAIL <= '1';
    end if;
    if STARTMSG='1' then 
      MSGI_MEMFAIL <= '0';
    end if;
  end if;
end process;

--------------------------------------------------------------------
-- Status Word Creation
--

SW_MSGERR  <= not CMDOKAY or MSGI_MAN or MSGI_PRTY or WCNTERR or MSGI_MEMFAIL;
iRTBUSY    <= SMR9_SB(16) and not MIL1553A;
RTBUSY     <= iRTBUSY;

PSWCR:
process(RTADDR,SW_MSGERR,SMR9_SB,SSYSFn,DBA,DYNBUSOK,MASKTFLAG,CW_BCAST,MIL1553A)
begin
  STATUS(15 downto 11) <= RTADDR;
  STATUS(10)           <= SW_MSGERR;
  STATUS(9 downto 0)   <= SMR9_SB;
  if MIL1553A='0' then                -- modify the B bit settings
    STATUS(7 downto 5) <= "000";
    STATUS(4) <= CW_BCAST;
    STATUS(2) <= SMR9_SB(17) or not SSYSFn;
    STATUS(1) <= DBA and DYNBUSOK;
    STATUS(0) <= SMR9_SB(19) and not MASKTFLAG; 
  end if;
end process;

--------------------------------------------------------------------
-- Message Info Word Creation, Written to RAM
--
WCNTERR <= WCNTOVR or WCNTTO;

MSGOKAY    <= not (MSGI_MEMFAIL or MSGI_MAN or WCNTERR or MSGI_PRTY 
                   or LOOPFAILB or LOOPFAILA or not CMDOKAY or iRTBUSY);

RTMSG_OKAY <= MSGOKAY;
                   

MSGI_ILL  <= not CMDOKAY;
MSGI_TO   <= WCNTTO;
MSGI_OVR  <= WCNTOVR;
MSGI_RTRT <= RTRT and RTRTOK; 
MSGI_CHA  <= not iBUSSEL;
MSGI_WC   <= CW_MCWC;
MSGI_BC   <= CW_BCAST; --  and (SMR0_EMODE(1) or CW_MCODE);   -- undocumented bit 5 is BCAST in enhanced mode !
                                                         -- it is also set for MCODE messages
                                           
MSGINFO <= MSGI_WC & '0' & MSGI_CHA & MSGI_RTRT & MSGI_ME & "0" & MSGI_BC & 
           MSGI_ILL & MSGI_TO & MSGI_OVR & MSGI_PRTY & MSGI_MAN;

MSGI_ME <= not CMDOKAY or WCNTTO or WCNTOVR or MSGI_PRTY or MSGI_MAN;
 
--------------------------------------------------------------------
-- Last Command and Status Word Store
--  This is not RESET since we want to Preserve the last CW and SW values
--   After the reset mode code !

-- The testplan does a broadcast transmit last command word. This is illegal
-- and since it is not the transmit last command word message it expects us
-- to overwrite the last command word, so we do !

PLCSW:
process(CLK)
 begin
  if CLK'event and CLK='1' then
    if CMDDONE='1' and (HOLDCW='0' or CW_BCAST='1') then
      LastCommandWord <= CW_RTADDR & CW_TX & CW_SUBADR & CW_MCWC;
    end if;
    if LATCHSW='1' and LASTSW='0' then
      LastStatusWord <= STATUS;
    end if;
  end if;
end process;         


-- Select what data to output, handles last status word problem
-- Code forces 4:1 Mux

PDM1:
process(LASTSW,TXT_CMDSTAT,CW_MCODE,BENDDIN,MODEDATA,STATUS,LastStatusWord,
        MCDMUX,RTMODE)
 variable MUXSELC : std_logic_vector(2 downto 0);
 variable MUXSELD : std_logic_vector(1 downto 0);
 begin
   MUXSELC := LASTSW & TXT_CMDSTAT & CW_MCODE;
   case MUXSELC is
     when "000"  => MUXSELD := "00";
     when "001"  => MUXSELD := "01";
     when "010"  => MUXSELD := "10";
     when "011"  => MUXSELD := "10";
     when "101"  => MUXSELD := "01";
     when "111"  => MUXSELD := "11";
     when others => MUXSELD := ( others => '-');
   end case;
   if RTMODE='0' or (MCDMUX(1)='0' and CW_MCODE='1' and TXT_CMDSTAT='0') then
     MUXSELD := "00";
   end if;
   case MUXSELD is -- synopsys infer_mux 
     when "00"   => TXT_DATAIN <= BENDDIN;
     when "01"   => TXT_DATAIN <= MODEDATA;
     when "10"   => TXT_DATAIN <= STATUS;
     when others => TXT_DATAIN <= LastStatusWord;
   end case;
end process; 


--------------------------------------------------------------------
-- Core Status Signals
--

CMDSYNC     <= (DECA_GOTSYNC or DECB_GOTSYNC )
               when BOTHSYNCS else
               ((DECA_GOTSYNC and DECA_CMDSTAT) or (DECB_GOTSYNC and DECB_CMDSTAT));
               
RTMSG_START <= STARTMSG;

---------------------------------------------------------------------------
-- Notice 2 implies we need a special timer to detect RTRT timeout condition
-- This is a timer that times from the RX command word received 
-- Counter starts about 250ns the mid point of parity bit

--  Notice 2 says we need to check the TX SW in the RX RT before accepting the data

-- RT address should match the stored TX RT Address, unless BCAST
--  MSGERR and BUSY bits should be zero

-- We start 0.25 later than the spec but out DATASYNC is delayed until bit 2. Thus the
-- timer is set to 60 us


process(CLKSPD)
 begin
   case CLKSPD is           -- 60 * FREQ/16   
     when "00"   => RTTIMVALUE <= "0101101"; -- 12MHz  45    
     when "01"   => RTTIMVALUE <= "0111100"; -- 16MHz  60    
     when "10"   => RTTIMVALUE <= "1001011"; -- 20MHz  75  
     when others => RTTIMVALUE <= "1011010"; -- 24MHz  90    
   end case;
end process;


UTIMER:
process(CLK,RSTn)
 begin
  if RSTn='0' then
      TIMERRTRT  <= "00000000000";
      iTIMER57US <= '0';
      GOTSW      <= '0';
  elsif CLK'event and CLK='1' then
  
    if DEC_ACTIVE='0' then
      GOTSW <= '0';
    elsif SW_STBOK='1' and BURST='0' and RTRT='1' and CW_STBME='0' then
      -- Got the Status Word, check if okay
      if (RTRTTXADDR=DEC_DATAOUT(15 downto 11) or (RTRTTXADDR="11111" and BCASTEN='1')) 
      and DEC_DATAOUT(10)='0' and DEC_DATAOUT(3)='0'
        then
          GOTSW <= '1';
        else
          iTIMER57US <= '1'; -- bad SW force RT to abort command
        end if;
    end if;
    
    if CW_STBME='1' or DATASYNC='1' then
      TIMERRTRT <= "00000000000";
      iTIMER57US <= '0';
    else
      TIMERRTRT <= TIMERRTRT + 1;
      if TIMERRTRT(10 downto 4) = RTTIMVALUE then
        iTIMER57US <= '1';
      end if;
    end if;
    
  end if;
end process;

TIMER57US    <= iTIMER57US;
RTMSG_GOTSW  <= GOTSW;



end RTL;
















 