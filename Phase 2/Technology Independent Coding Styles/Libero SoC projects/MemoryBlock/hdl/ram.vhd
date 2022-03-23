--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: ram.vhd
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

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram is

generic(K : integer := 38; n : integer := 7);

port (
	clk, rst : IN  std_logic;
    wen : IN std_logic;
    waddr : IN std_logic_vector(6 downto 0);
    wdata : IN std_logic_vector(37 downto 0);
    ren : IN std_logic;
    raddr : IN std_logic_vector(6 downto 0);
    rdata : OUT std_logic_vector(37 downto 0)
);
end ram;

architecture architecture_ram of ram is
    subtype Word is std_logic_vector(37 downto 0);
    type Memory is array(0 to 127) of Word;
	signal ram128 : Memory;

begin
    process(wen, wdata, waddr, ren, rdata, raddr)
        variable ram_addr_int : integer;
    begin
        if (clk'event and clk = '1' and wen = '1') then
            ram_addr_int := to_integer(unsigned(waddr));
            ram128(ram_addr_int) <= wdata;
        elsif (clk'event and clk = '1' and ren = '1') then
            ram_addr_int := to_integer(unsigned(rdata));
            rdata <= ram128(ram_addr_int);
        end if;
    end process;
end architecture architecture_ram;
