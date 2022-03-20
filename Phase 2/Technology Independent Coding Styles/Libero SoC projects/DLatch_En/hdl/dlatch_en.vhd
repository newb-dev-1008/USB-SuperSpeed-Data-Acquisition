--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dlatch_en.vhd
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

-- D Latch with Gated Enable

library IEEE;
use IEEE.std_logic_1164.all;

entity dlatch_en is
port (enable, gate, data : in std_logic;
    q : out std_logic);
end dlatch_en;

architecture behave of dlatch_en is
begin
    process (enable, gate, data) begin
        if (enable = '1') then
            q <= data and gate;
        end if;
    end process;
end behave;