-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--  
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--
-- File:  BRMreg.vhd
--     
-- Description: Core1553BRM
--              Command Legalization Register Block 
--
-- Rev: 1.0 01May04  IPB  : Pre Production  
-- Rev: 2.0 27May04  IPB  : First Production Release 
-- Rev: 3.0 15Feb07  IPB  :  CoreConsole Release 
-- Rev: 2.13 01Oct05 IPB  : Encoder fix and enhancements
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--
-- Notes:
--   LEGREGS  0:None  1:Registers  2:RAM
--
-- *********************************************************************/ 

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use work.convert.all;
use work.BRMcomps.all;

entity BRMreg is
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
end BRMreg;


architecture RTL of BRMreg is

signal MEM         : WORD_ARRAY(0 to 15);
signal REGS        : std_logic_vector(255 downto 0); 
signal RAMWR       : std_logic;
signal RAMRD       : std_logic;
signal RAMADDR     : std_logic_vector(3 downto 0);
signal RAMDATA     : std_logic_vector(15 downto 0);

signal Logic0      : std_logic;
signal Logic1      : std_logic;

begin

Logic0 <= '0';
Logic1 <= '1';

-----------------------------------------------------------------
--  Legalisation registers not implemented
--

REGS0: 
if ( RTENABLE=0 or LEGREGS=0 ) generate

  CPUDOUT  <= ( others => '0');
  CMDOKREG <= '0';

end generate;

    
-----------------------------------------------------------------
-- Legalisation registers  implemented  in registers
--	 

REGS1: 							 -- If SXA or RTSXS no RAM so force use of registers
if ((RTENABLE>0 and LEGREGS=1) or (RTENABLE>0 and LEGREGS=2 and FAMILY>=1 and FAMILY<=10) ) generate

   PMEM:
   process(CLK,RSTn)
   variable ADDR : INTEGER range 0 to 15;
   begin
     if RSTn='0' then                   -- NOTE when 1 dissables i.e ILLEGAL 
                 --FEDCBA9876543210     -- Reset Values to set up the RT !
       MEM(0)  <= "0000000000000000";   -- Receive  SA 15:0                0000
       MEM(1)  <= "0000000000000000";   -- Receive  SA 31:16               0000
       MEM(2)  <= "0000000000000000";   -- Transmit SA 15:0                0000
       MEM(3)  <= "0000000000000000";   -- Transmit SA 31:16               0000
       MEM(4)  <= "0000000000000000";   -- Bcast Receive  SA 15:0          0000
       MEM(5)  <= "0000000000000000";   -- Bcast Receive  SA 31:16         0000
       MEM(6)  <= "1111111111111111";   -- Bcast Transmit SA 15:0          FFFF
       MEM(7)  <= "1111111111111111";   -- Bcast Transmit SA 31:16         FFFF
       MEM(8)  <= "1111111111111111";   -- Mode Code Receive  15:0         FFFF
       MEM(9)  <= "1111111111111101";   -- Mode Code Receive  31:16        FFFD 
       MEM(10) <= "1111111000000001";   -- Mode Code Transmit 15:0         FE01 
       MEM(11) <= "1111111111110010";   -- Mode Code Transmit 31:16        FFF2
       MEM(12) <= "1111111111111111";   -- Bcast Mode Code Receive  15:0   FFFF
       MEM(13) <= "1111111111111101";   -- Bcast Mode Code Receive  31:16  FFFD
       MEM(14) <= "1111111000000101";   -- Bcast Mode Code Transmit 15:0   FE05
       MEM(15) <= "1111111111111111";   -- Bcast Mode Code Transmit 31:16  FFFF
     elsif CLK'event and CLK='1' then
       if CPUWR(0)='1' and CPUSEL='1' then
         ADDR := to_integer(to_unsigned(CPUADDRR));
         MEM(ADDR)(7 downto 0) <= CPUDIN(7 downto 0);
       end if;
       if CPUWR(1)='1' and CPUSEL='1' then
         ADDR := to_integer(to_unsigned(CPUADDRR));
         MEM(ADDR)(15 downto 8) <= CPUDIN(15 downto 8);
       end if;
     end if;
   end process;


   PMRD:
   process(MEM,CPUADDR)
   begin
     case CPUADDR is
      when "0000" => CPUDOUT <= MEM(0)  ;
      when "0001" => CPUDOUT <= MEM(1)  ;
      when "0010" => CPUDOUT <= MEM(2)  ;
      when "0011" => CPUDOUT <= MEM(3)  ;
      when "0100" => CPUDOUT <= MEM(4)  ;
      when "0101" => CPUDOUT <= MEM(5)  ;
      when "0110" => CPUDOUT <= MEM(6)  ;
      when "0111" => CPUDOUT <= MEM(7)  ;
      when "1000" => CPUDOUT <= MEM(8)  ;
      when "1001" => CPUDOUT <= MEM(9)  ;
      when "1010" => CPUDOUT <= MEM(10) ;
      when "1011" => CPUDOUT <= MEM(11) ;
      when "1100" => CPUDOUT <= MEM(12) ;
      when "1101" => CPUDOUT <= MEM(13) ;
      when "1110" => CPUDOUT <= MEM(14) ;
      when "1111" => CPUDOUT <= MEM(15) ;
      when others => CPUDOUT <= ( others => '-');
     end case;
   end process;


   -- Create the look up array , memory being 1 illegalizes the SA
   PREGS:
   process(MEM)
   begin
     REGS <= ( others => '0');
     for i in 0 to 15 loop
       REGS(i*16+15 downto i*16) <= MEM(i);
     end loop;
   end process;

   CMDOKREG <= not REGS(to_integer(to_unsigned(BITSELECT)));

end generate;



-----------------------------------------------------------------
-- Legalisation registers implemented using FPGA RAM
--

REGS2: 
if (RTENABLE>0 and LEGREGS=2 and (FAMILY=0 or FAMILY>10) ) generate

  RAMWR   <= ( CPUWR(0) and CPUWR(1) and CPUSEL);                          
  RAMADDR <= CPUADDR when SMR0_STEX='0' else BITSELECT(7 downto 4);        
                                                                           
  URAM:  RAM16X16 port map                                             
    (  CLOCK     => CLK,                                                   
       RESET     => RSTn,                                                  
       WE        => RAMWR,                                                 
       RE        => Logic1,                                                
       WADDRESS  => CPUADDRR,                                              
       RADDRESS  => RAMADDR,                                               
       DATA      => CPUDIN,                                                
       Q         => RAMDATA                                                
     );                                                                    
                                                                           
  CPUDOUT  <= RAMDATA;                                                     
                                                                           
  CMDOKREG <= not RAMDATA(to_integer(to_unsigned(BITSELECT(3 downto 0)))); 


end generate;




end RTL;

