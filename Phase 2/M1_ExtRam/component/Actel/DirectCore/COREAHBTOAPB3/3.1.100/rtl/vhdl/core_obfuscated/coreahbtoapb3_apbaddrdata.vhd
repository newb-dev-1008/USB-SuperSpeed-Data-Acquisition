-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library ieee;
use ieee.std_logic_1164.all;
entity CAHBTOAPB3lli is
generic (SYNC_RESET: integer := 0); port (HCLK: in Std_logic;
HRESETN: in std_logic;
CAHBTOAPB3O0: in std_logic;
CAHBtoAPB3l0: in std_LOGIC;
CAHBtoAPB3i0: in Std_logic;
CAHBTOAPB3O1: in std_logic;
CAHBtoAPB3l1: in STD_LOGIC;
HADDR: in sTD_LOGIC_VECTOR(31 downto 0);
HWDATA: in Std_logic_vector(31 downto 0);
HRDATA: out std_logic_vector(31 downto 0);
PADDR: out std_logiC_VECTOR(31 downto 0);
PWDATA: out std_logic_vector(31 downto 0);
PRDATA: in std_logic_vector(31 downto 0));
end entity CAHBTOAPB3LLI;

architecture CAHBtoAPB3loL of CAHBtoAPB3lli is

signal CAHBToAPB3ili: STD_LOGIC_VECTOR(31 downto 0);

signal CAHBtoAPB3oii: STD_LOGIC_VECTOR(31 downto 0);

signal CAHBtoAPB3lii: STD_LOGIC_VECtor(31 downto 0);

signal CAHBtoAPB3l1l: STD_logic;

signal CAHBTOAPB3i1l: stD_LOGIC;

begin
CAHBtoAPB3l1l <= '1' when (SYNC_RESET = 1) else
HRESETN;
CAHBTOAPB3I1L <= HRESETN when (SYNC_RESET = 1) else
'1';
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBtoAPB3l1l)) = '1') then
CAHBtoAPB3ili <= "00000000000000000000000000000000";
elsif (HCLK'event and HCLK = '1') then
if ((not (CAHBTOAPB3I1L)) = '1') then
CAHBtoAPB3ili <= "00000000000000000000000000000000";
else
if (CAHBtoAPB3o0 = '1') then
CAHBTOAPB3ILI <= HADDR(31 downto 0);
else
if (CAHBtoAPB3l1 = '1') then
CAHBTOAPB3ili <= CAHBTOAPB3oii(31 downto 0);
end if;
end if;
end if;
end if;
end process;
process (CAHBtoAPB3ili)
begin
PADDR <= CAHBtoAPB3ili(31 downto 0);
end process;
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBtoAPB3L1L)) = '1') then
CAHBTOAPB3oii <= "00000000000000000000000000000000";
elsif (HCLK'event and HCLK = '1') then
if ((not (CAHBtoAPB3i1l)) = '1') then
CAHBTOAPB3OII <= "00000000000000000000000000000000";
else
if (CAHBtoAPB3o1 = '1') then
CAHBtoAPB3oii <= HADDR(31 downto 0);
end if;
end if;
end if;
end process;
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBTOAPB3L1L)) = '1') then
CAHBtoAPB3lii <= "00000000000000000000000000000000";
elsif (HCLK'eVENT and HCLK = '1') then
if ((not (CAHBtoAPB3i1l)) = '1') then
CAHBTOAPB3lii <= "00000000000000000000000000000000";
else
if (CAHBTOAPB3L0 = '1') then
CAHBTOAPB3LII(31 downto 0) <= HWDATA(31 downto 0);
end if;
end if;
end if;
end process;
process (CAHBTOAPB3LII)
begin
PWDATA(31 downto 0) <= CAHBTOAPB3lii(31 downto 0);
end process;
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBtoAPB3L1L)) = '1') then
HRDATA(31 downto 0) <= "00000000000000000000000000000000";
elsif (HCLK'EVENt and HCLK = '1') then
if ((not (CAHBtoAPB3I1L)) = '1') then
HRDATA(31 downto 0) <= "00000000000000000000000000000000";
else
if (CAHBtoAPB3I0 = '1') then
HRDATA(31 downto 0) <= PRDATA(31 downto 0);
end if;
end if;
end if;
end process;
end architecture CAHBTOAPB3lol;
