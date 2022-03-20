library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

entity counter8 is
port (
	clk, rst : IN  std_ulogic;
    prev : IN std_ulogic_vector(7 downto 0);
    q : OUT std_ulogic_vector(7 downto 0));
end counter8;

architecture architecture_counter8 of counter8 is

    begin 
    process (clk, rst, prev)
        if (rst = '1') then
            prev <= to_unsigned(0, 8);
        elsif (clk'event and clk = '1')
            prev <= prev + '1';
        end if;
        
        return prev;
        
    end process;
end architecture_counter8;