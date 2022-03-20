--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dlatch.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::ProASIC3> <Die::M1A3P1000> <Package::208 PQFP>
-- Author: Yash Umale
--
--------------------------------------------------------------------------------

-- D Latch with data and enable

library IEEE;
use IEEE.std_logic_1164.all;

entity dlatch is
port(enable, data: in std_logic;
    y : out std_logic);
end dlatch;

architecture behave of dlatch is
begin
    process (enable, data)
    begin
        if (enable = '1') then
            y <= data;
        end if;
    end process;
end behave;