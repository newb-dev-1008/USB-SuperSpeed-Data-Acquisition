-- D Flip Flop with Asynchronous Reset and Clock Enable

library IEEE;
use IEEE.std_logic_1164.all;

entity dff_ck_en is
port (data, clk, reset, en : in std_logic;
    q : out std_logic);
end dff_ck_en;

architecture behav of dff_ck_en is
begin
    process (clk, reset) begin
        if (reset = '0') then
            q <= '0';
        elsif (clk'event and clk = '1') then
            if (en = '1') then
                q <= data;
            end if;
        end if;
    end process;
end behav;