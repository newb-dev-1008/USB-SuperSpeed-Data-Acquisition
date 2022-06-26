-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library IEEE;
use IEEE.std_lOGIC_1164.all;
entity CAHBtoAPB3oii is
generic (CAHBtoAPB3ol: INTEGER := 0;
CAHBTOAPB3LI: integer := 1;
CAHBtoAPB3liI: integer := 2); port (HCLK: in sTD_LOGIC;
HRESETN: in std_logIC;
CAHBTOAPB3I1: in std_logIC;
CAHBTOAPB3Ool: in std_logIC;
PENABLE: out std_logic);
end entity CAHBtoAPB3oii;

architecture CAHBTOAPB3LOL of CAHBTOAPB3oii is

signal CAHBtoAPB3III: std_loGIC_VECTOR(1 downto 0);

signal CAHBTOAPB3O0i: stD_LOGIC_VECTOr(1 downto 0);

signal CAHBtoAPB3l0i: STD_LOgic;

function to_stdlogicvecTOR(val: in integer;
CAHBTOAPB3L1l: in integer)
return std_lOGIC_VECTOR is
variable CAHBToAPB3i1l: Std_logic_vector(CAHBTOAPB3l1l-1 downto 0) := ( others => '0');
variable CAHBTOAPB3ooi: integer := val;
variable r: INTEGER;
begin
for CAHBtoAPB3loi in 0 to CAHBtoAPB3l1l-1
loop
R := CAHBtoAPB3ooi rem 2;
CAHBtoAPB3ooi := CAHBTOAPB3OOI/2;
if (R = 1) then
CAHBtoAPB3i1l(CAHBTOAPB3LOI) := '1';
else
CAHBTOAPB3i1l(CAHBtoAPB3loi) := '0';
end if;
end loop;
return (CAHBtoAPB3i1l);
end TO_stdlogicvector;

begin
process (CAHBtoAPB3iii,CAHBtoAPB3i1,CAHBTOAPB3ool)
begin
CAHBtoAPB3l0i <= '0';
case CAHBtoAPB3III is
when TO_stdlogicvector(CAHBtoAPB3ol,
2) =>
if (CAHBtoAPB3i1 = '1') then
CAHBTOAPB3o0i <= to_stdloGICVECTOR(CAHBtoAPB3li,
2);
else
CAHBtoAPB3o0I <= to_stdLOGICVECTOR(CAHBtoAPB3ol,
2);
end if;
when TO_stdlogicvector(CAHBToAPB3li,
2) =>
CAHBTOAPB3l0i <= '1';
CAHBtoAPB3O0I <= to_stdlogICVECTOR(CAHBtoAPB3lii,
2);
when TO_STDLOGICvector(CAHBtoAPB3LII,
2) =>
if (CAHBtoAPB3ooL = '1') then
CAHBtoAPB3o0i <= to_stdlogicVECTOR(CAHBtoAPB3ol,
2);
else
CAHBTOAPB3l0i <= '1';
CAHBTOAPB3o0i <= TO_STdlogicvector(CAHBtoAPB3LII,
2);
end if;
when others =>
CAHBTOAPB3L0I <= '0';
CAHBToAPB3o0i <= to_stdlogicveCTOR(CAHBTOAPB3ol,
2);
end case;
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBtOAPB3III <= TO_stdlogicvector(CAHBtoAPB3OL,
2);
PENABLE <= '0';
elsif (HCLK'eveNT and HCLK = '1') then
CAHBtoAPB3iiI <= CAHBTOAPB3O0i;
PENABLE <= CAHBTOAPB3l0i;
end if;
end process;
end architecture CAHBtoAPB3loL;
