-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library IEEE;
use ieee.std_logic_1164.all;
entity CAHBTOAPB3O is
generic (CAHBtoAPB3l: integer := 0;
CAHBtoAPB3i: INteger := 1;
CAHBtoAPB3ol: integer := 0;
CAHBtoAPB3ll: INTeger := 1;
CAHBtoAPB3IL: integer := 2;
CAHBTOAPB3oi: INTEGER := 3;
CAHBTOAPB3LI: integER := 4); port (HCLK: in std_loGIC;
HRESETN: in std_logIC;
HSEL: in Std_logic;
CAHBtoAPB3ii: in STD_LOGIC;
HWRITE: in sTD_LOGIC;
HREADY: in std_LOGIC;
HRESP: out STD_logic_vector(1 downto 0);
HREADYOUT: out STD_logic;
PREADY: in STD_LOGIC;
PSLVERR: in STD_logic;
PENABLE: in STd_logic;
PWRITE: out STD_LOGIC;
PSEL: out std_logic;
CAHBtoAPB3o0: out STd_logic;
CAHBTOAPB3l0: out STD_LOGIc;
CAHBTOAPB3I0: out STD_LOGIC;
CAHBTOAPB3O1: out STD_LOGIC;
CAHBTOAPB3L1: out stD_LOGIC;
CAHBtoAPB3i1: out STD_logic;
CAHBTOAPB3ool: out STD_LOGIC);
end entity CAHBTOAPB3o;

architecture CAHBTOAPB3LOL of CAHBTOAPB3o is

signal CAHBtoAPB3iol: STD_LOGIC_VEctor(2 downto 0);

signal CAHBtoAPB3oll: std_LOGIC_VECTOR(2 downto 0);

signal CAHBTOAPB3lll: STD_LOGIc;

signal CAHBtoAPB3ILL: std_logic;

signal CAHBTOAPB3oil: STD_LOGIC;

signal CAHBtoAPB3lil: STD_LOGic;

signal CAHBtOAPB3IIL: std_logic;

signal CAHBtoAPB3O0L: STd_logic;

signal CAHBtoAPB3l0l: STD_LOGIC;

signal CAHBtoAPB3i0l: STD_LOGIC;

signal CAHBtoAPB3o1l: sTD_LOGIC;

function TO_STDLOgicvector(VAL: in INTEGER;
CAHBTOAPB3L1L: in integER)
return stD_LOGIC_VECTOr is
variable CAHBTOAPB3I1l: STD_logic_vector(CAHBtoAPB3l1l-1 downto 0) := ( others => '0');
variable CAHBtoAPB3OOI: integer := val;
variable r: INTEger;
begin
for CAHBTOAPB3Loi in 0 to CAHBtoAPB3l1l-1
loop
R := CAHBtoAPB3oOI rem 2;
CAHBtoAPB3ooi := CAHBtoAPB3ooi/2;
if (r = 1) then
CAHBTOAPB3i1l(CAHBtOAPB3LOI) := '1';
else
CAHBtoAPB3i1l(CAHBTOAPB3LOI) := '0';
end if;
end loop;
return (CAHBtoAPB3I1L);
end to_stdlogicveCTOR;

begin
process (CAHBtoAPB3IOL,HSEL,HREADY,CAHBTOAPB3II,hwrite,PENABLE,PREADY,CAHBToAPB3oil,CAHBToAPB3ill)
begin
CAHBtoAPB3o0 <= '0';
CAHBTOAPB3L0 <= '0';
CAHBtoAPB3i0 <= '0';
CAHBtoAPB3o1 <= '0';
CAHBtoAPB3lll <= '0';
CAHBtoAPB3l1 <= '0';
CAHBtoAPB3lil <= '0';
CAHBTOAPB3iil <= '0';
CAHBTOAPB3I1 <= '0';
CAHBtoAPB3OOL <= '0';
CAHBToAPB3o0l <= '0';
CAHBtoAPB3L0L <= '0';
CAHBtoAPB3i0l <= '1';
case CAHBtoAPB3iOL is
when to_stdlogICVECTOR(CAHBtoAPB3OL,
3) =>
if ((HSEL and HREADY
and CAHBtoAPB3ii) = '1') then
CAHBtoAPB3o0 <= '1';
if (hwrite = '1') then
CAHBtoAPB3oll <= TO_STDLOGICVector(CAHBtoAPB3LL,
3);
else
CAHBTOAPB3i1 <= '1';
CAHBtoAPB3o0l <= '1';
CAHBtoAPB3i0l <= '0';
CAHBToAPB3oll <= to_stdlogicvector(CAHBtoAPB3oi,
3);
end if;
else
CAHBTOAPB3oll <= TO_stdlogicvector(CAHBtoAPB3OL,
3);
end if;
when TO_STdlogicvector(CAHBtoAPB3ll,
3) =>
if ((HSEL and HREADY
and CAHBTOAPB3ii) = '1') then
CAHBTOAPB3I0l <= '0';
CAHBtoAPB3O1 <= '1';
CAHBToAPB3lll <= '1';
CAHBtoAPB3lil <= '1';
end if;
CAHBTOAPB3l0 <= '1';
CAHBtoAPB3i1 <= '1';
CAHBTOAPB3O0L <= '1';
CAHBtOAPB3L0L <= '1';
CAHBtoAPB3OLL <= to_stdlogiCVECTOR(CAHBTOAPB3IL,
3);
when to_stdlogicVECTOR(CAHBtoAPB3il,
3) =>
if ((PENABLE and PREADY) = '1') then
CAHBtoAPB3ool <= '1';
if ((HSEL and HREADY
and CAHBtoAPB3II) = '1') then
CAHBtoAPB3O0 <= '1';
if (hwrite = '1') then
CAHBtoAPB3oll <= TO_STDLOgicvector(CAHBtoAPB3ll,
3);
else
CAHBTOAPB3i0l <= '0';
CAHBtoAPB3oll <= TO_stdlogicvector(CAHBtoAPB3LI,
3);
end if;
else
if (CAHBtoAPB3oil = '1') then
CAHBtoAPB3l1 <= '1';
CAHBTOAPB3IIL <= '1';
if (CAHBTOAPB3ill = '1') then
CAHBtoAPB3oll <= TO_STDlogicvector(CAHBtoAPB3ll,
3);
else
CAHBtoAPB3i0l <= '0';
CAHBtoAPB3oll <= TO_STDlogicvector(CAHBtoAPB3lI,
3);
end if;
else
CAHBToAPB3oll <= to_stdlogicvecTOR(CAHBTOAPB3OL,
3);
end if;
end if;
else
CAHBTOAPB3o0l <= '1';
CAHBToAPB3l0l <= '1';
if (CAHBtoAPB3oil = '1') then
CAHBtoAPB3I0L <= '0';
CAHBtoAPB3OLL <= TO_STDLOGICVEctor(CAHBTOAPB3il,
3);
else
if ((HSEL and HREADY
and CAHBtoAPB3ii) = '1') then
CAHBTOAPB3O1 <= '1';
CAHBtoAPB3lll <= '1';
CAHBtoAPB3LIL <= '1';
CAHBTOAPB3I0L <= '0';
CAHBtoAPB3OLL <= TO_STdlogicvector(CAHBtoAPB3il,
3);
else
CAHBTOAPB3OLL <= TO_Stdlogicvector(CAHBtoAPB3il,
3);
end if;
end if;
end if;
when to_STDLOGICVECTOR(CAHBtoAPB3oi,
3) =>
if ((PENABLE and PREADY) = '1') then
CAHBtoAPB3i0 <= '1';
CAHBtoAPB3ool <= '1';
CAHBTOAPB3OLL <= TO_stdlogicvector(CAHBTOAPB3ol,
3);
else
CAHBtoAPB3O0L <= '1';
CAHBTOAPB3I0L <= '0';
CAHBtoAPB3oll <= TO_STDLOgicvector(CAHBtoAPB3OI,
3);
end if;
when to_stDLOGICVECTOR(CAHBtoAPB3li,
3) =>
CAHBtoAPB3i1 <= '1';
CAHBToAPB3o0l <= '1';
CAHBTOAPB3I0L <= '0';
CAHBtoAPB3oll <= TO_STDLOGICvector(CAHBtoAPB3oi,
3);
when others =>
CAHBTOAPB3OLL <= TO_STdlogicvector(CAHBtoAPB3ol,
3);
end case;
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBtoAPB3iol <= to_stdlogicveCTOR(CAHBtoAPB3OL,
3);
PSEL <= '0';
PWRITE <= '0';
elsif (HCLK'event and HCLK = '1') then
CAHBtoAPB3iol <= CAHBTOAPB3oll;
PSEL <= CAHBtoAPB3o0l;
PWRITE <= CAHBtoAPB3l0l;
end if;
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBTOAPB3oil <= '0';
elsif (HCLK'EVENT and HCLK = '1') then
if (CAHBTOAPB3LIL = '1') then
CAHBTOAPB3OIL <= '1';
else
if (CAHBTOAPB3IIL = '1') then
CAHBTOAPB3oil <= '0';
end if;
end if;
end if;
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBtoAPB3ILL <= '0';
elsif (HCLK'EVENT and HCLK = '1') then
if (CAHBtoAPB3lll = '1') then
CAHBtoAPB3ill <= hwrite;
end if;
end if;
end process;
process (HCLK,HRESETN)
begin
if ((not (HRESETN)) = '1') then
CAHBTOAPB3O1l <= '0';
HRESP <= TO_STdlogicvector(CAHBTOAPB3l,
2);
HREADYOUT <= '1';
elsif (HCLK'event and HCLK = '1') then
case CAHBtOAPB3O1L is
when '0' =>
if (PSLVERR = '1') then
CAHBTOAPB3O1L <= '1';
HRESP <= to_stdlogicvectoR(CAHBTOAPB3I,
2);
HREADYOUT <= '0';
else
CAHBtoAPB3o1L <= '0';
HRESP <= to_stDLOGICVECTOR(CAHBTOAPB3L,
2);
HREADYOUT <= CAHBtoAPB3i0L;
end if;
when '1' =>
CAHBtoAPB3O1L <= '0';
HRESP <= to_stdlogicvectOR(CAHBTOAPB3I,
2);
HREADYOUT <= '1';
when others =>
CAHBtoAPB3O1L <= '0';
end case;
end if;
end process;
end architecture CAHBTOAPB3lol;
