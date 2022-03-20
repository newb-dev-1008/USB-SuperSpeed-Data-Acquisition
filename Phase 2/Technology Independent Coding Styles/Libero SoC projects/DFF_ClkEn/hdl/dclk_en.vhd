--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dclk_en.vhd
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

-- D Flip Flop with Asynchronous Reset and Clock Enable

library IEEE;
use IEEE.std_logic_1164.all;

entity dclk_en is
port (data, clk, reset, en : in std_logic;
    q : out std_logic);
end dclk_en;

architecture behav of dclk_en is
begin
    process (clk, reset) begin
        if (reset = '0') then
            q <= '0';
        elsif (clk'event and clk = '1') then
            if (en = '1') then
                q <= data;
            end if;
        end if;
    end process;
end behav;
