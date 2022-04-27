library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
-- use IEEE.numeric_std.all; (Use either unsigned + arith or just numeric [Numeric is the IEEE standard])

entity counter8 is
port (
	clk, rst : IN  std_logic;
    -- prev : IN std_ulogic_vector(7 downto 0);
    q : OUT std_logic_vector(7 downto 0));
end counter8;

architecture architecture_counter8 of counter8 is

    signal q_s : std_logic_vector(7 downto 0);

    begin 
    process (clk, rst, prev)
        if (rst = '1') then
            q_s <= (others => `0`); -- to_unsigned(0, 8);
        elsif (clk'event and clk = '1')
            q_s <= q_s + '1';
        end if;
        
        -- return prev;
        
    end process;

    q <= q_s;
end architecture_counter8;