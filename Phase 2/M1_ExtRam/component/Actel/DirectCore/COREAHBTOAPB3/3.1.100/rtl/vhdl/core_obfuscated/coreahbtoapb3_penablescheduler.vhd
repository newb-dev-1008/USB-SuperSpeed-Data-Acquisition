-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library ieee;
use Ieee.STD_logic_1164.all;
entity CAHBTOAPB3III is
generic (CAHBTOAPB3OL: INTEger := 0;
CAHBTOAPB3li: INTEGER := 1;
CAHBtoAPB3o0i: integer := 2;
SYNC_RESET: integer := 0); port (HCLK: in std_logIC;
HRESETN: in std_logic;
CAHBTOAPB3i1: in std_logic;
CAHBtOAPB3OOL: in STD_LOGIC;
PENABLE: out std_logic);
end entity CAHBtoAPB3iii;

architecture CAHBtoAPB3lol of CAHBtoAPB3iii is

signal CAHBtoAPB3l0i: std_logic_VECTOR(1 downto 0);

signal CAHBtoAPB3i0I: std_logic_vector(1 downto 0);

signal CAHBTOAPB3O1I: STD_LOGIC;

signal CAHBTOAPB3L1L: std_logic;

signal CAHBTOAPB3i1l: std_LOGIC;

function TO_STdlogicvector(VAL: in INTEger;
CAHBTOAPB3OOI: in integer)
return std_logic_vECTOR is
variable CAHBtoAPB3loi: STD_LOGic_vector(CAHBtoAPB3ooi-1 downto 0) := ( others => '0');
variable CAHBtoAPB3ioi: INTEGER := val;
variable r: INTEGER;
begin
for CAHBTOAPB3oli in 0 to CAHBTOAPB3ooi-1
loop
r := CAHBtoAPB3ioI rem 2;
CAHBTOAPB3IOI := CAHBTOAPB3IOI/2;
if (r = 1) then
CAHBtoAPB3loi(CAHBTOAPB3OLI) := '1';
else
CAHBTOAPB3LOI(CAHBTOAPB3Oli) := '0';
end if;
end loop;
return (CAHBTOAPB3LOI);
end TO_STDLOGIcvector;

begin
CAHBTOAPB3L1l <= '1' when (SYNC_RESET = 1) else
HRESETN;
CAHBtoAPB3i1l <= HRESETN when (SYNC_RESET = 1) else
'1';
process (CAHBtoAPB3l0i,CAHBTOAPB3I1,CAHBtoAPB3OOL)
begin
CAHBtoAPB3o1i <= '0';
case CAHBtoAPB3l0i is
when to_stdlogicvector(CAHBTOAPB3OL,
2) =>
if (CAHBTOAPB3i1 = '1') then
CAHBtoAPB3I0I <= TO_STdlogicvector(CAHBtoAPB3LI,
2);
else
CAHBtoAPB3i0i <= to_stdlogicvecTOR(CAHBtoAPB3OL,
2);
end if;
when to_stdlogicvECTOR(CAHBTOAPB3li,
2) =>
CAHBTOAPB3O1I <= '1';
CAHBTOAPB3I0I <= to_stdlogicveCTOR(CAHBtoAPB3o0i,
2);
when to_stdlogicvector(CAHBTOAPB3o0i,
2) =>
if (CAHBTOAPB3ool = '1') then
CAHBtoAPB3i0i <= to_sTDLOGICVECTOR(CAHBtoAPB3ol,
2);
else
CAHBTOAPB3O1I <= '1';
CAHBTOAPB3I0I <= to_sTDLOGICVECTOR(CAHBTOAPB3o0i,
2);
end if;
when others =>
CAHBtoAPB3o1i <= '0';
CAHBtoAPB3i0i <= to_stdlogicvector(CAHBtOAPB3OL,
2);
end case;
end process;
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBTOAPB3l1l)) = '1') then
CAHBtoAPB3l0i <= to_stdlogicvectOR(CAHBtoAPB3ol,
2);
PENABLE <= '0';
elsif (HCLK'event and HCLK = '1') then
if ((not (CAHBtoAPB3i1l)) = '1') then
CAHBToAPB3l0i <= TO_STDLOGICVEctor(CAHBTOAPB3ol,
2);
PENABLE <= '0';
else
CAHBTOAPB3L0I <= CAHBtoAPB3i0i;
PENABLE <= CAHBtOAPB3O1I;
end if;
end if;
end process;
end architecture CAHBTOAPB3lol;
