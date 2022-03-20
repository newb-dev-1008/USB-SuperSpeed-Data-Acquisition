--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dasync_pre.vhd
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

-- D Flip Flop (Asynchronous Preset)

library IEEE;
use IEEE.std_logic_1164.all;

entity dasync_pre is
port (data, clk, preset : in std_logic;
    q : out std_logic);
end dasync_pre;

architecture behav of dasync_pre is
begin
    process (clk, preset) begin
        if (preset = '0') then
            q <= '1';
        elsif (clk'event and clk = '1') then
            q <= data;
        end if;
    end process;
end behav;
