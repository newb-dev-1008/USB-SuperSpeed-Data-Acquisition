-- Asynchronous D Latch with Reset

library IEEE;
use IEEE.std_logic_1164.all;

entity d_latch_rst is
port (enable, data, reset: in std_logic;
    q : out std_logic);
end d_latch_rst;

architecture behav of d_latch_rst is
begin
    process (enable, data, reset) begin
        if (reset = '0') then
            q <= '0';
        elsif (enable = '1') then
            q <= data;
        end if;
    end process;
end behav;