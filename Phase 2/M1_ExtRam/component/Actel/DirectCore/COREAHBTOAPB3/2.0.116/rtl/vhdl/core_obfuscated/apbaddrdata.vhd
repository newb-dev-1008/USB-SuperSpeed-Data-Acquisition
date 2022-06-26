-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library IEEE;
use IEee.STD_LOGic_1164.all;
entity CAHBTOAPB3ioi is
port (HCLK: in std_logiC;
HRESETN: in std_logic;
CAHBTOAPB3O0: in STD_LOGIC;
CAHBTOAPB3l0: in STD_LOGic;
CAHBTOAPB3I0: in std_LOGIC;
CAHBtoAPB3O1: in std_logic;
CAHBtoAPB3l1: in STD_LOgic;
HADDR: in STD_logic_vector(23 downto 0);
HWDATA: in stD_LOGIC_VECTOr(31 downto 0);
HRDATA: out std_logic_vectoR(31 downto 0);
PADDR: out Std_logic_vector(23 downto 0);
PWDATA: out std_logic_VECTOR(31 downto 0);
PRDATA: in std_logic_vector(31 downto 0));
end entity CAHBTOAPB3ioi;

architecture CAHBtoAPB3lol of CAHBtoAPB3ioi is

signal CAHBtoAPB3oli: STD_LOGIC_vector(23 downto 0);

signal CAHBtoAPB3LLI: std_logic_vector(23 downto 0);

signal CAHBTOAPB3ILi: std_logic_veCTOR(31 downto 0);

begin
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBtoAPB3oLI <= "000000000000000000000000";
elsif (HCLK'event and HCLK = '1') then
if (CAHBtoAPB3o0 = '1') then
CAHBtoAPB3oli <= HADDR(23 downto 0);
else
if (CAHBTOAPB3L1 = '1') then
CAHBtoAPB3oli <= CAHBtoAPB3lli(23 downto 0);
end if;
end if;
end if;
end process;
process (CAHBTOAPB3oli)
begin
PADDR <= CAHBtoAPB3oli(23 downto 0);
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBTOAPB3lli <= "000000000000000000000000";
elsif (HCLK'eveNT and HCLK = '1') then
if (CAHBTOAPB3o1 = '1') then
CAHBTOAPB3lli <= HADDR(23 downto 0);
end if;
end if;
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBTOAPB3Ili <= "00000000000000000000000000000000";
elsif (HCLK'EVENT and HCLK = '1') then
if (CAHBTOAPB3L0 = '1') then
CAHBtoAPB3ILI(31 downto 0) <= HWDATA(31 downto 0);
end if;
end if;
end process;
process (CAHBTOAPB3Ili)
begin
PWDATA(31 downto 0) <= CAHBtoAPB3ili(31 downto 0);
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
HRDATA(31 downto 0) <= "00000000000000000000000000000000";
elsif (HCLK'EVENT and HCLK = '1') then
if (CAHBtoAPB3I0 = '1') then
HRDATA(31 downto 0) <= PRDATA(31 downto 0);
end if;
end if;
end process;
end architecture CAHBtoAPB3lol;
