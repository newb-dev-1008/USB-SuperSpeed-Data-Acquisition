-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--  
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--
-- File:  globalbuff_pa3.vhd
--     
-- Description: Core1553BRM
--              Global Buffer used for reset   
--
-- Rev: 1.0 01May04  IPB  : Pre Production  
-- Rev: 2.0 27May04  IPB  : First Production Release 
-- Rev: 3.0 15Feb07  IPB  :  CoreConsole Release 
-- Rev: 2.15  02May05  IPB  :  
-- Rev: 3.0  14Feb07  IPB  : CoreConsole Release
--
-- Notes:
--  SAR 55491: 2.15: Simply renamed the architecture
--
-- *********************************************************************/ 

library IEEE;
use IEEE.STD_LOGIC_1164.all;

library ProASIC3E;
use ProASIC3E.COMPONENTS.all;

entity GLOBALBUFF is
  port ( A : in  std_logic;
         Y : out std_logic
       );
end GLOBALBUFF;

architecture RTL of GLOBALBUFF is

begin

  U1 : CLKINT port map(A => A, Y => Y);
  
end RTL;
