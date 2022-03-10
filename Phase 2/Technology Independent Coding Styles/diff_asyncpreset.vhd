library IEEE;
use IEEE.std_logic_1164.all;

entity dff_async_pre is
port (data, clk, preset : in std_logic;
    q : out std_logic);
end dff_async_pre;

architecture behav of dff_async_pre is
begin
    process (clk, preset) begin
        if (preset = '0') then
            q <= '1';
        elsif (clk'event and clk = '1') then
            q <= data;
        end if;
    end process;
end behav;