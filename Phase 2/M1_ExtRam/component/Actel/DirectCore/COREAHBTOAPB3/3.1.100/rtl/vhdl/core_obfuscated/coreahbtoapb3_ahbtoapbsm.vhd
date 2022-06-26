-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library Ieee;
use IEEE.STD_LOGIC_1164.all;
entity CAHBtoAPB3o is
generic (CAHBtoAPB3l: integer := 0;
CAHBTOAPB3I: INTEGER := 1;
CAHBtoAPB3OL: integer := 0;
CAHBTOAPB3LL: inTEGER := 1;
CAHBTOAPB3IL: INTEGER := 2;
CAHBTOAPB3OI: INTEGER := 3;
CAHBtoAPB3li: integer := 4;
SYNC_RESET: INTEGER := 0); port (HCLK: in STD_logic;
HRESETN: in STd_logic;
HSEL: in std_logic;
CAHBtoAPB3II: in std_logic;
hwrite: in stD_LOGIC;
HREADY: in STd_logic;
HRESP: out STD_LOGIC_VECTOR(1 downto 0);
HREADYOUT: out std_logic;
PREADY: in std_logic;
PSLVERR: in std_logIC;
PENABLE: in Std_logic;
PWRITE: out std_logic;
PSEL: out std_logic;
CAHBTOAPB3O0: out std_logic;
CAHBtoAPB3l0: out STD_LOGIC;
CAHBtoAPB3i0: out std_logIC;
CAHBtOAPB3O1: out STD_logic;
CAHBToAPB3l1: out std_logic;
CAHBtoAPB3i1: out std_loGIC;
CAHBToAPB3ool: out std_logic);
end entity CAHBTOAPB3O;

architecture CAHBtoAPB3LOL of CAHBtoAPB3o is

signal CAHBTOAPB3Iol: STD_LOGIC_VEctor(2 downto 0);

signal CAHBtoAPB3oll: std_logic_vector(2 downto 0);

signal CAHBtoAPB3lll: STD_LOGIC;

signal CAHBtoAPB3ilL: STD_logic;

signal CAHBTOAPB3OIL: std_logic;

signal CAHBtoAPB3lil: STd_logic;

signal CAHBTOAPB3IIL: std_logic;

signal CAHBTOAPB3O0L: std_logic;

signal CAHBTOAPB3L0L: std_logic;

signal CAHBtoAPB3i0l: STD_LOGIC;

signal CAHBTOAPB3O1L: std_logic;

signal CAHBtoAPB3l1l: STD_LOGIC;

signal CAHBtoAPB3i1L: std_logic;

function TO_STDLOGICVECTOR(val: in INTEGER;
CAHBtoAPB3OOI: in INTEger)
return std_logic_vector is
variable CAHBtoAPB3loi: STD_LOGIC_Vector(CAHBtoAPB3ooi-1 downto 0) := ( others => '0');
variable CAHBtoAPB3ioi: INteger := VAL;
variable R: INteger;
begin
for CAHBtoAPB3oli in 0 to CAHBtoAPB3ooi-1
loop
r := CAHBtoAPB3ioi rem 2;
CAHBtoAPB3ioi := CAHBtoAPB3iOI/2;
if (r = 1) then
CAHBTOAPB3loi(CAHBtoAPB3oli) := '1';
else
CAHBTOAPB3LOI(CAHBTOAPB3oli) := '0';
end if;
end loop;
return (CAHBtoAPB3loi);
end TO_STDLOGICVECTOR;

begin
CAHBtoAPB3l1l <= '1' when (SYNC_RESET = 1) else
HRESETN;
CAHBTOAPB3i1l <= HRESETN when (SYNC_RESET = 1) else
'1';
process (CAHBtoAPB3iol,HSEL,HREADY,CAHBtoAPB3ii,HWRITE,PENABLE,PREADY,CAHBToAPB3oil,CAHBtoAPB3ill)
begin
CAHBTOAPB3o0 <= '0';
CAHBToAPB3l0 <= '0';
CAHBTOAPB3I0 <= '0';
CAHBtoAPB3o1 <= '0';
CAHBtoAPB3lll <= '0';
CAHBtoAPB3l1 <= '0';
CAHBtoAPB3LIL <= '0';
CAHBTOAPB3IIL <= '0';
CAHBTOAPB3I1 <= '0';
CAHBtoAPB3ool <= '0';
CAHBTOAPB3o0l <= '0';
CAHBtoAPB3l0l <= '0';
CAHBtoAPB3i0l <= '1';
case CAHBTOAPB3IOL is
when TO_STdlogicvector(CAHBTOAPB3OL,
3) =>
if ((HSEL and HREADY
and CAHBtoAPB3ii) = '1') then
CAHBTOAPB3O0 <= '1';
if (HWRITE = '1') then
CAHBTOAPB3OLL <= to_stdlogicvecTOR(CAHBTOAPB3Ll,
3);
else
CAHBtoAPB3i1 <= '1';
CAHBtoAPB3o0l <= '1';
CAHBtoAPB3i0l <= '0';
CAHBtoAPB3oLL <= TO_Stdlogicvector(CAHBtoAPB3oI,
3);
end if;
else
CAHBtoAPB3oll <= TO_STDLogicvector(CAHBtoAPB3ol,
3);
end if;
when TO_Stdlogicvector(CAHBtoAPB3ll,
3) =>
if ((HSEL and HREADY
and CAHBtoAPB3ii) = '1') then
CAHBtoAPB3i0l <= '0';
CAHBTOAPB3O1 <= '1';
CAHBTOAPB3LLL <= '1';
CAHBTOAPB3LIL <= '1';
end if;
CAHBTOAPB3L0 <= '1';
CAHBTOAPB3I1 <= '1';
CAHBTOAPB3O0L <= '1';
CAHBtoAPB3l0l <= '1';
CAHBtoAPB3oll <= TO_STDLOGIcvector(CAHBtoAPB3il,
3);
when TO_STDLOGICVECtor(CAHBtoAPB3il,
3) =>
if ((PENABLE and PREADY) = '1') then
CAHBTOAPB3OOL <= '1';
if ((HSEL and HREADY
and CAHBtoAPB3ii) = '1') then
CAHBtoAPB3o0 <= '1';
if (HWRITE = '1') then
CAHBTOAPB3oll <= to_stdlogicvecTOR(CAHBtoAPB3LL,
3);
else
CAHBTOAPB3I0L <= '0';
CAHBTOAPB3oll <= TO_STDLOGIcvector(CAHBtoAPB3li,
3);
end if;
else
if (CAHBTOAPB3OIL = '1') then
CAHBtoAPB3L1 <= '1';
CAHBtoAPB3iil <= '1';
if (CAHBTOAPB3ILL = '1') then
CAHBtoAPB3oll <= TO_STDLOGICVECTOR(CAHBTOAPB3ll,
3);
else
CAHBTOAPB3i0l <= '0';
CAHBtoAPB3OLL <= to_stdlogicvector(CAHBTOAPB3LI,
3);
end if;
else
CAHBTOAPB3oll <= to_stdlogicvectOR(CAHBTOAPB3OL,
3);
end if;
end if;
else
CAHBtoAPB3o0l <= '1';
CAHBtoAPB3l0l <= '1';
if (CAHBtoAPB3OIL = '1') then
CAHBTOAPB3i0l <= '0';
CAHBTOAPB3oll <= to_stdlogicvector(CAHBTOAPB3IL,
3);
else
if ((HSEL and HREADY
and CAHBTOAPB3II) = '1') then
CAHBtoAPB3o1 <= '1';
CAHBtoAPB3lll <= '1';
CAHBtoAPB3LIL <= '1';
CAHBTOAPB3I0L <= '0';
CAHBTOAPB3OLL <= to_stdlogicvector(CAHBtoAPB3IL,
3);
else
CAHBTOAPB3OLL <= TO_STDLOGICVECTOR(CAHBTOAPB3IL,
3);
end if;
end if;
end if;
when to_stdlogicvector(CAHBTOAPB3Oi,
3) =>
if ((PENABLE and PREADY) = '1') then
CAHBtoAPB3I0 <= '1';
CAHBtoAPB3ool <= '1';
CAHBtoAPB3OLL <= TO_STdlogicvector(CAHBtoAPB3ol,
3);
else
CAHBTOAPB3O0l <= '1';
CAHBtoAPB3i0l <= '0';
CAHBtoAPB3oll <= to_stdlogicvector(CAHBtoAPB3oi,
3);
end if;
when to_stdlogicvector(CAHBtOAPB3LI,
3) =>
CAHBtoAPB3i1 <= '1';
CAHBTOAPB3O0l <= '1';
CAHBtoAPB3I0L <= '0';
CAHBtoAPB3oll <= to_stdlogicvector(CAHBtoAPB3oi,
3);
when others =>
CAHBtoAPB3OLL <= to_stdlogicvector(CAHBtoAPB3ol,
3);
end case;
end process;
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBtoAPB3l1l)) = '1') then
CAHBTOAPB3iol <= to_stdlogicvector(CAHBtoAPB3ol,
3);
PSEL <= '0';
PWRITE <= '0';
elsif (HCLK'event and HCLK = '1') then
if ((not (CAHBTOAPB3i1l)) = '1') then
CAHBtoAPB3iol <= to_stdlogicvector(CAHBTOAPB3OL,
3);
PSEL <= '0';
PWRITE <= '0';
else
CAHBTOAPB3IOL <= CAHBtoAPB3oll;
PSEL <= CAHBtoAPB3o0L;
PWRITE <= CAHBtOAPB3L0L;
end if;
end if;
end process;
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBtoAPB3l1l)) = '1') then
CAHBtoAPB3oil <= '0';
elsif (HCLK'EVENT and HCLK = '1') then
if ((not (CAHBTOAPB3i1l)) = '1') then
CAHBtoAPB3oil <= '0';
else
if (CAHBtOAPB3LIL = '1') then
CAHBTOAPB3oil <= '1';
else
if (CAHBToAPB3iil = '1') then
CAHBTOAPB3OIL <= '0';
end if;
end if;
end if;
end if;
end process;
process (HCLK,CAHBtoAPB3l1l)
begin
if ((not (CAHBTOAPB3L1L)) = '1') then
CAHBTOAPB3ill <= '0';
elsif (HCLK'event and HCLK = '1') then
if ((not (CAHBtoAPB3i1l)) = '1') then
CAHBtoAPB3ill <= '0';
else
if (CAHBtoAPB3lll = '1') then
CAHBtoAPB3ill <= hwrite;
end if;
end if;
end if;
end process;
process (HCLK,CAHBTOAPB3l1l)
begin
if ((not (CAHBtoAPB3L1L)) = '1') then
CAHBTOAPB3O1L <= '0';
HRESP <= TO_STDLOGICVECTOR(CAHBtoAPB3L,
2);
HREADYOUT <= '1';
elsif (HCLK'event and HCLK = '1') then
if ((not (CAHBTOAPB3I1L)) = '1') then
CAHBtoAPB3o1l <= '0';
HRESP <= to_stdlogICVECTOR(CAHBtoAPB3L,
2);
HREADYOUT <= '1';
else
case CAHBTOAPB3O1l is
when '0' =>
if (PSLVERR = '1') then
CAHBtoAPB3o1l <= '1';
HRESP <= to_stdlogiCVECTOR(CAHBtoAPB3i,
2);
HREADYOUT <= '0';
else
CAHBTOAPB3O1L <= '0';
HRESP <= TO_STDLOGicvector(CAHBtoAPB3l,
2);
HREADYOUT <= CAHBtOAPB3I0L;
end if;
when '1' =>
CAHBtoAPB3o1l <= '0';
HRESP <= TO_STDLOGICVECTOR(CAHBtoAPB3i,
2);
HREADYOUT <= '1';
when others =>
CAHBTOAPB3O1L <= '0';
end case;
end if;
end if;
end process;
end architecture CAHBTOAPB3lol;
