library IEEE;
use IEEE.std_logic_1164.all;

entity d_latch_e is
port (enable, gate, data : in std_logic;
    q : out std_logic);
end d_latch_e;

architecture behave of d_latch_e is
begin
    process (enable, gate, data) begin
        if (enable = '1') then
            q <= data and gate;
        end if;
    end process;
end behave;