--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: dsync_re.vhd
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
-- Author: <Name>
--
--------------------------------------------------------------------------------

-- D Flip Flop (Synchronised Reset)

library IEEE;
use IEEE.std_logic_1164.all;

entity dsync_re is
port (data, clk, reset : in std_logic;
    q : out std_logic);
end dsync_re;

architecture behav of dsync_re is
begin
    process (clk) begin
        if (clk'event and clk = '1') then
            if (reset = '0') then
                q <= '0';
            else q <= data;
            end if;
        end if;
    end process;
end behav;
