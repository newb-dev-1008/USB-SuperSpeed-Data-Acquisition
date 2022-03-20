--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dff_async_rst.vhd
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

-- D Flip Flop with Asynchronous Reset

library IEEE;
use IEEE.std_logic_1164.all;

entity dff_async_rst is
port (data, clk, reset : in std_logic;
    q : out std_logic);
end dff_async_rst;

architecture behav of dff_async_rst is
begin
process (clk, reset) begin
    if (reset = '0') then
        q <= '0';
    elsif (clk'event and clk = '1') then
        q <= data;
    end if;
end process;
end behav;