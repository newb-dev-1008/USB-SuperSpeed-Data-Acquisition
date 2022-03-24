--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: bit8register.vhd
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
-- Author: Sayanth Kishore
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity bit8register is
port (
    d: IN STD_LOGIC_VECTOR(31 downto 0);
    ld: IN STD_LOGIC; --load
    clr: IN STD_LOGIC;--clear
    clk: IN STD_LOGIC;--clock
    inc: IN STD_LOGIC; --increment
    q: OUT STD_LOGIC_VECTOR(31 downto 0)--output
);
end bit8register;

architecture description of bit8register is
begin
    process(clk, clr)
    begin
        if clr = '1' then
            q<=x"00000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                q<=d;
            end if;
            if inc = '1' then
                q <=q + 4;
            end if;
        end if;
    end process;
end description;
