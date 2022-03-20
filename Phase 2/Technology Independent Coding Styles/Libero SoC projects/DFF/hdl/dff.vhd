--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dff.vhd
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

-- D Flip Flop (Rising Edge Triggered)

library ieee;
use IEEE.std_logic_1164.all;
    
entity dff is
port (data, clk : in std_logic;
    q : out std_logic);
end dff;

architecture behav of dff is
begin
process (clk) begin
    if (clk'event and clk = '1') then
        q <= data;
    end if;
end process;
end behav;
