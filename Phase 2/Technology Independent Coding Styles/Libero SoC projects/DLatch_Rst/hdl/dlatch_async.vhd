--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dlatch_async.vhd
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
-- Author: <Name>
--
--------------------------------------------------------------------------------

-- Asynchronous D Latch with Reset

library IEEE;
use IEEE.std_logic_1164.all;

entity dlatch_async is
port (enable, data, reset: in std_logic;
    q : out std_logic);
end dlatch_async;

architecture behav of dlatch_async is
begin
    process (enable, data, reset) begin
        if (reset = '0') then
            q <= '0';
        elsif (enable = '1') then
            q <= data;
        end if;
    end process;
end behav;
