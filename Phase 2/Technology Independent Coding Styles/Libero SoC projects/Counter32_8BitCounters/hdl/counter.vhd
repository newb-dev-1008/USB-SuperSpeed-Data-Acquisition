--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: counter.vhd
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
use IEEE.math_real.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity counter is
port (
	clk, rst : IN  std_logic;
    q : OUT std_logic_vector(7 downto 0));
end counter;

architecture architecture_counter of counter is

    -- Function to define an 8-bit counter
    function counter8(prev : unsigned(7 downto 0); rst : integer := 0) return integer is
        variable outp : unsigned(7 downto 0) := to_unsigned(0, 8);
        begin 
            if (rst = '1') then
                outp <= to_unsigned(0, 8);
            else
                outp <= prev + '1';
            end if;
            return outp;
        end

    -- signal, component etc. declarations
	signal count_val : std_logic_vector(31 downto 0);
    variable cnt : integer := '0';

begin
    process(clk) begin
        if (clk'event and rst = '1') then
            count_val <= to_unsigned(0, 32);
            cnt <= '0';
        
        elsif (clk'event and clk = '1') then
            cnt <= cnt + '1';

            if (cnt mod (2 ** 8) = '0') then
                if (cnt mod (2 ** 16) = '0') then
                    if (cnt mod (2 ** 24) = '0') then
                        count_val[31:24] <= counter8(prev => count_val[31:24]);
                        count_val[23:0] <= to_unsigned(0, 24);
                    else
                        count_val[23:16] <= count8(prev => count_val[23:16]);
                        count_val[15:0] <= to_unsigned(0, 16);
                    end if
                else
                    count_val[15:8] <= count8(prev => count_val[15:8]);
                    count_val[7:0] <= to_unsigned(0, 8);
            
                end if
            else 
                count_val[7:0] <= count8(prev => count_val[7:0]);
            end if
            
end architecture_counter;
