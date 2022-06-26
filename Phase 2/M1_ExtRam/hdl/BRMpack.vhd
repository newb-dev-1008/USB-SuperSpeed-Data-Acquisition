-- *********************************************************************/ 
-- Copyright 2007 Actel Corporation.  All rights reserved.
-- IP Solutions Group
--
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN 
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED 
-- IN ADVANCE IN WRITING.  
--  
-- File:  BRMpack.vhd
--     
-- Description: Core1553BRM
--              Synthesizable Conversion functions etc 
--
-- Rev: 1.0 01May04  IPB  : Pre Production  
-- Rev: 2.0 27May04  IPB  : First Production Release 
-- Rev: 3.0 15Feb07  IPB  :  CoreConsole Release 
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

package convert is

subtype WORD      is std_logic_vector (15 downto 0);
type WORD_ARRAY   is array ( INTEGER range <>) of WORD;

function to_std_logic( x: UNSIGNED ) return std_logic_vector;
function to_unsigned( x: std_logic_vector ) return UNSIGNED;
function to_logic( x: BOOLEAN) return std_logic;
function to_logic( x: INTEGER) return std_logic;
function to_integer( x: BOOLEAN) return integer;

end convert;


package body convert is

---------------------------------------------------------------------
-- Handle UNSIGNED to std_logic_vector conversions
--

function to_std_logic( x: UNSIGNED ) return std_logic_vector is
variable y: std_logic_vector(x'range);
begin
   for i in x'range loop
     y(i) := x(i);
   end loop;
   return(y);
end to_std_logic;

function to_unsigned( x: std_logic_vector ) return UNSIGNED is
variable y: UNSIGNED(x'range);
begin
   for i in x'range loop
     y(i) := x(i);
   end loop;
   return(y);
end to_unsigned;


function to_logic( x: BOOLEAN) return std_logic is
 variable y : std_logic;
 begin
  if x then y:='1';
       else y:='0';
  end if;
  return(y);
end to_logic;

function to_logic( x: INTEGER) return std_logic is
 variable y : std_logic;
 begin
  y:='0';
  if x=1 then 
    y:='1';
  end if;
  return(y);
end to_logic;

 function to_integer( x: BOOLEAN) return integer is 
  variable y : integer;                             
  begin                                             
   if x then y:=1;                                  
        else y:=0;                                  
   end if;                                          
   return(y);                                       
 end to_integer;                                    


end convert;