-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library Ieee;
use ieEE.STd_logic_1164.all;
entity COREAHBTOAPB3 is
generic (FAMILY: INteger := 17); port (HCLK: in std_logic;
HRESETN: in std_logic;
HSEL: in std_logic;
HADDR: in STd_logic_vector(23 downto 0);
HWRIte: in std_logic;
HREADY: in Std_logic;
HTRANS: in std_logic_veCTOR(1 downto 0);
HWDATA: in STD_LOGIc_vector(31 downto 0);
HREADYOUT: out std_logic;
HRESP: out STD_logic_vector(1 downto 0);
HRDATA: out std_logic_VECTOR(31 downto 0);
PADDR: out Std_logic_vector(23 downto 0);
PWRITE: out STD_Logic;
PENABLE: out STD_LOGIc;
PWDATA: out std_lOGIC_VECTOR(31 downto 0);
PSEL: out STD_LOGIC;
PREADY: in STD_LOgic;
PSLVERR: in STD_logic;
PRDATA: in STD_LOGIC_VEctor(31 downto 0));
end entity COREAHBTOAPB3;

architecture CAHBTOAPB3LOL of COREAHBTOAPB3 is

component CAHBTOAPB3O
generic (CAHBtoAPB3l: INTeger := 0;
CAHBtoAPB3i: integER := 1;
CAHBtoAPB3ol: INTEGER := 0;
CAHBToAPB3ll: integeR := 1;
CAHBtoAPB3il: inTEGER := 2;
CAHBtoAPB3oi: integER := 3;
CAHBtoAPB3LI: INTEGER := 4);
port (HCLK: in STD_logic;
HRESETN: in Std_logic;
HSEL: in STD_LOgic;
CAHBtoAPB3iI: in std_logic;
hwrite: in Std_logic;
HREADY: in STD_LOgic;
HRESP: out STD_LOGIC_Vector(1 downto 0);
HREADYOUT: out STD_Logic;
PREADY: in std_logic;
PSLVERR: in std_logiC;
PENABLE: in STd_logic;
PWRITE: out std_logic;
PSEL: out STD_Logic;
CAHBTOAPB3o0: out std_logic;
CAHBtoAPB3L0: out STD_LOGic;
CAHBtoAPB3i0: out std_loGIC;
CAHBtoAPB3O1: out STD_logic;
CAHBtoAPB3l1: out std_logic;
CAHBtoAPB3i1: out std_logic;
CAHBtoAPB3ool: out std_logIC);
end component;

component CAHBtoAPB3IOI
port (HCLK: in STD_Logic;
HRESETN: in std_logic;
CAHBtoAPB3O0: in Std_logic;
CAHBtoAPB3l0: in STD_LOGic;
CAHBtoAPB3i0: in STD_LOGIC;
CAHBtoAPB3o1: in STD_LOGIC;
CAHBTOAPB3l1: in std_logic;
HADDR: in std_logic_vECTOR(23 downto 0);
HWDATA: in std_lOGIC_VECTOR(31 downto 0);
HRDATA: out std_logiC_VECTOR(31 downto 0);
PADDR: out STD_logic_vector(23 downto 0);
PWDATA: out std_LOGIC_VECTOR(31 downto 0);
PRDATA: in std_logic_vectoR(31 downto 0));
end component;

component CAHBTOAPB3OIi
generic (CAHBtoAPB3OL: integer := 0;
CAHBtoAPB3li: integer := 1;
CAHBtoAPB3lii: integER := 2);
port (HCLK: in STD_LOGIC;
HRESETN: in STD_Logic;
CAHBTOAPB3i1: in Std_logic;
CAHBtoAPB3ool: in std_logic;
PENABLE: out STD_LOGIc);
end component;

signal CAHBtoAPB3I1: std_logic;

signal CAHBTOAPB3ool: stD_LOGIC;

signal CAHBtoAPB3o0: sTD_LOGIC;

signal CAHBtoAPB3l0: STD_LOGIC;

signal CAHBtoAPB3i0: STD_LOGIC;

signal CAHBtoAPB3o1: STD_LOGIC;

signal CAHBtoAPB3l1: std_loGIC;

signal CAHBtoAPB3i0i: STD_LOGIC;

signal CAHBTOAPB3o1i: STD_LOGIc_vector(1 downto 0);

signal CAHBTOAPB3l1i: STD_logic_vector(31 downto 0);

signal CAHBTOAPB3i1i: STD_LOGIC_Vector(23 downto 0);

signal CAHBTOAPB3oo0: sTD_LOGIC;

signal CAHBTOAPB3LO0: std_logic;

signal CAHBtoAPB3IO0: STD_logic_vector(31 downto 0);

signal CAHBtoAPB3ol0: STD_LOGIC;

begin
HREADYOUT <= CAHBTOAPB3i0i;
HRESP <= CAHBtoAPB3o1i;
HRDATA <= CAHBtoAPB3L1I;
PADDR <= CAHBtoAPB3I1I;
PWRITE <= CAHBtoAPB3OO0;
PENABLE <= CAHBTOAPB3lo0;
PWDATA <= CAHBTOAPB3io0;
PSEL <= CAHBtOAPB3OL0;
CAHBtoAPB3LL0: CAHBTOAPB3O
port map (HCLK => HCLK,
HRESETN => HRESETN,
HSEL => HSEL,
CAHBtoAPB3ii => HTRANS(1),
HWRIte => hwrite,
HREADY => HREADY,
HRESP => CAHBtoAPB3O1I,
HREADYOUT => CAHBtOAPB3I0I,
PREADY => PREADY,
PSLVERR => PSLVERR,
PENABLE => CAHBtoAPB3lo0,
PWRITE => CAHBtoAPB3oO0,
PSEL => CAHBtoAPB3ol0,
CAHBtoAPB3O0 => CAHBTOAPB3O0,
CAHBtoAPB3l0 => CAHBtoAPB3L0,
CAHBTOAPB3I0 => CAHBtoAPB3i0,
CAHBtoAPB3o1 => CAHBtoAPB3O1,
CAHBTOAPB3l1 => CAHBToAPB3l1,
CAHBtoAPB3i1 => CAHBtoAPB3i1,
CAHBtoAPB3ool => CAHBtoAPB3ool);
CAHBTOAPB3il0: CAHBtoAPB3oII
port map (HCLK => HCLK,
HRESETN => HRESETN,
CAHBToAPB3i1 => CAHBToAPB3i1,
CAHBtoAPB3ool => CAHBtoAPB3ool,
PENABLE => CAHBTOAPB3lo0);
CAHBtoAPB3oi0: CAHBtoAPB3ioi
port map (HCLK => HCLK,
HRESETN => HRESETN,
CAHBtoAPB3o0 => CAHBTOAPB3o0,
CAHBtoAPB3l0 => CAHBTOAPB3L0,
CAHBtoAPB3i0 => CAHBtoAPB3I0,
CAHBTOAPB3o1 => CAHBtoAPB3o1,
CAHBtoAPB3L1 => CAHBTOAPB3L1,
HADDR => HADDR(23 downto 0),
HWDATA => HWDATA(31 downto 0),
HRDATA => CAHBtoAPB3L1I(31 downto 0),
PADDR => CAHBTOAPB3i1i(23 downto 0),
PWDATA => CAHBtoAPB3iO0(31 downto 0),
PRDATA => PRDATA(31 downto 0));
end architecture CAHBTOAPB3LOl;
