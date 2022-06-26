-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--  
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--
-- File:  ram16x16_pa3e.vhd
--     
-- Description: Core1553BRM
--              Low level RAM 
--
-- Rev: 1.0  01May04  IPB  : Pre Production  
-- Rev: 2.0  27May04  IPB  : First Production Release 
-- Rev: 2.1  24Jan05  IPB  : PA3/E Production Release 
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--  
--
-- Notes:  
--
-- *********************************************************************/ 

library ieee;
use ieee.std_logic_1164.all;
library proasic3e;
use proasic3e.components.all;

entity RAM16X16 is 
    port( CLOCK    : in   std_logic;
          RESET    : in   std_logic;
          WE       : in   std_logic;
          RE       : in   std_logic;
          WADDRESS : in   std_logic_vector(3 downto 0); 
          RADDRESS : in   std_logic_vector(3 downto 0);
          DATA     : in   std_logic_vector(15 downto 0); 
          Q        : out  std_logic_vector(15 downto 0) 
        ) ;
end ram16x16;


architecture RTL of RAM16X16 is

    signal WEBP, WEAP, VCC_1_net, GND_1_net : std_logic ;
   
    begin   

    VCC_1_net <= '1';
    GND_1_net <= '0';
    WEBP <= not WE;
   	WEAP <= not RE;
    
    RAMBLOCK0 : RAM512X18
      port map(RADDR8 => GND_1_net, RADDR7 => GND_1_net, 
        RADDR6 => GND_1_net, RADDR5 => GND_1_net, RADDR4 => 
        GND_1_net, RADDR3 => RADDRESS(3), RADDR2 => RADDRESS(2), 
        RADDR1 => RADDRESS(1), RADDR0 => RADDRESS(0), WADDR8 => 
        GND_1_net, WADDR7 => GND_1_net, WADDR6 => GND_1_net, 
        WADDR5 => GND_1_net, WADDR4 => GND_1_net, WADDR3 => 
        WADDRESS(3), WADDR2 => WADDRESS(2), WADDR1 => WADDRESS(1), 
        WADDR0 => WADDRESS(0), WD17 => GND_1_net, WD16 => 
        GND_1_net, WD15 => DATA(15), WD14 => DATA(14), WD13 => 
        DATA(13), WD12 => DATA(12), WD11 => DATA(11), WD10 => 
        DATA(10), WD9 => DATA(9), WD8 => DATA(8), WD7 => DATA(7), 
        WD6 => DATA(6), WD5 => DATA(5), WD4 => DATA(4), WD3 => 
        DATA(3), WD2 => DATA(2), WD1 => DATA(1), WD0 => DATA(0), 
        RW0 => GND_1_net, RW1 => VCC_1_net, WW0 => GND_1_net, 
        WW1 => VCC_1_net, PIPE => GND_1_net, REN => WEAP, WEN => 
        WEBP, RCLK => CLOCK, WCLK => CLOCK, RESET => RESET, 
        RD17 => OPEN , RD16 => OPEN , RD15 => Q(15), RD14 => 
        Q(14), RD13 => Q(13), RD12 => Q(12), RD11 => Q(11), 
        RD10 => Q(10), RD9 => Q(9), RD8 => Q(8), RD7 => Q(7), 
        RD6 => Q(6), RD5 => Q(5), RD4 => Q(4), RD3 => Q(3), 
        RD2 => Q(2), RD1 => Q(1), RD0 => Q(0));
      
end RTL;
