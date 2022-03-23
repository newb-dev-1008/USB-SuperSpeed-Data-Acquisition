-- 32 Bit Counter using 8 Bit Counters

library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.math_real.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;
use IEEE.numeric_std_unsigned.all;

entity counter is
port (
	clk, rst : IN  std_logic;
    q : OUT std_logic_vector(7 downto 0));
end counter;

architecture architecture_counter of counter is

    -- Declaring an 8-bit counter as a component
    component counter8 port (
        clk : IN std_ulogic;
        rst : IN std_ulogic;
        prev : IN std_ulogic_vector(7 downto 0);
        q : OUT std_ulogic_vector(7 downto 0)
    );
    end component;

	signal count_val : std_logic_vector(31 downto 0);
    variable cnt : integer := '0';

begin

    ctr8 : counter8 port map (
        clk => clk;
        rst => rst;
    );

    process(clk) begin
        if (clk'event and rst = '1') then
            count_val <= to_unsigned(0, 32);
            cnt <= '0';
        
        elsif (clk'event and clk = '1') then
            cnt <= cnt + '1';

            if (cnt mod (2 ** 8) = '0') then
                if (cnt mod (2 ** 16) = '0') then
                    if (cnt mod (2 ** 24) = '0') then
                        count_val[31:24] <= ctr8(prev => count_val[31:24]);
                        count_val[23:0] <= to_unsigned(0, 24);
                    else
                        count_val[23:16] <= ctr8(prev => count_val[23:16]);
                        count_val[15:0] <= to_unsigned(0, 16);
                    end if
                else
                    count_val[15:8] <= ctr8(prev => count_val[15:8]);
                    count_val[7:0] <= to_unsigned(0, 8);
            
                end if
            else 
                count_val[7:0] <= ctr8(prev => count_val[7:0]);
            end if
        end if 
            
end architecture_counter;
