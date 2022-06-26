-- Copyright 2009 Actel Corporation. All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- Revision Information:
-- SVN Revision Information:
-- SVN $Revision: $
library IEEE;
use ieeE.std_lOGIC_1164.all;
use work.AHBTOapb3_pkg.all;
entity COREAHBTOAPB3 is
generic (FAMILY: Integer := 17); port (HCLK: in std_logic;
HRESETN: in STD_logic;
HSEL: in STD_LOGIC;
HADDR: in std_logic_vectOR(31 downto 0);
HWRITE: in std_logic;
HREADY: in std_logic;
HTRANS: in STD_LOGIC_VECtor(1 downto 0);
HWDATA: in STD_LOGIC_VECTOR(31 downto 0);
HREADYOUT: out std_logic;
HRESP: out std_logic_vector(1 downto 0);
HRDATA: out STD_LOGIC_VECTor(31 downto 0);
PADDR: out std_logic_veCTOR(31 downto 0);
PWRITE: out STD_LOGIC;
PENABLE: out STD_LOGIC;
PWDATA: out std_logic_vector(31 downto 0);
PSEL: out std_logic;
PREADY: in std_logic;
PSLVERR: in STD_LOGIC;
PRDATA: in STD_LOgic_vector(31 downto 0));
end entity COREAHBTOAPB3;

architecture CAHBtoAPB3lol of COREAHBTOAPB3 is

component CAHBtoAPB3o
generic (CAHBtoAPB3L: INTEGER := 0;
CAHBTOAPB3I: inteGER := 1;
CAHBTOAPB3ol: Integer := 0;
CAHBtoAPB3ll: integer := 1;
CAHBtoAPB3il: INTEGER := 2;
CAHBtoAPB3OI: integer := 3;
CAHBtoAPB3li: integer := 4;
SYNC_RESET: Integer := 0);
port (HCLK: in STD_LOGIC;
HRESETN: in std_logic;
HSEL: in Std_logic;
CAHBtoAPB3ii: in std_LOGIC;
Hwrite: in std_logic;
HREADY: in STD_LOGIc;
HRESP: out STD_LOGIC_VECTOR(1 downto 0);
HREADYOUT: out std_lOGIC;
PREADY: in STD_Logic;
PSLVERR: in std_logic;
PENABLE: in sTD_LOGIC;
PWRITE: out STD_LOGIC;
PSEL: out std_logic;
CAHBTOAPB3O0: out STD_logic;
CAHBtoAPB3l0: out STD_LOGIC;
CAHBTOAPB3i0: out std_logic;
CAHBtoAPB3O1: out STD_LOGIC;
CAHBtoAPB3l1: out STD_LOGIC;
CAHBToAPB3i1: out std_logic;
CAHBTOAPB3OOL: out std_logic);
end component;

component CAHBtoAPB3LLI
generic (SYNC_RESET: intEGER := 0);
port (HCLK: in STD_logic;
HRESETN: in std_logiC;
CAHBtoAPB3o0: in STD_LOGIC;
CAHBtoAPB3l0: in STD_LOgic;
CAHBTOAPB3I0: in std_logic;
CAHBtoAPB3o1: in std_logic;
CAHBtoAPB3l1: in STD_LOGIC;
HADDR: in STD_LOGIC_VECTOR(31 downto 0);
HWDATA: in STD_LOGIC_VECTOR(31 downto 0);
HRDATA: out STD_LOGIC_VECTOR(31 downto 0);
PADDR: out std_logic_vector(31 downto 0);
PWDATA: out std_logic_vector(31 downto 0);
PRDATA: in STD_logic_vector(31 downto 0));
end component;

component CAHBtoAPB3iii
generic (CAHBTOAPB3OL: INTEGER := 0;
CAHBtoAPB3li: integer := 1;
CAHBtoAPB3o0i: integer := 2;
SYNC_RESET: INTEger := 0);
port (HCLK: in STD_LOGIC;
HRESETN: in STD_LOGIC;
CAHBtoAPB3i1: in std_LOGIC;
CAHBTOAPB3ool: in std_logic;
PENABLE: out STD_LOGIC);
end component;

constant SYNC_RESET: INTEGER := SYNC_MODE_SEL(FAMILY);

signal CAHBtoAPB3i1: std_logic;

signal CAHBtoAPB3ool: STD_logic;

signal CAHBtoAPB3o0: STD_LOGIC;

signal CAHBTOAPB3l0: std_loGIC;

signal CAHBtoAPB3I0: Std_logic;

signal CAHBTOAPB3o1: STD_LOGIC;

signal CAHBtoAPB3L1: std_logic;

signal CAHBtoAPB3l1i: std_logic;

signal CAHBtoAPB3i1i: STD_LOGIC_VECtor(1 downto 0);

signal CAHBtoAPB3oo0: STD_LOGIC_VEctor(31 downto 0);

signal CAHBtOAPB3LO0: std_logic_vECTOR(31 downto 0);

signal CAHBtoAPB3io0: Std_logic;

signal CAHBTOAPB3ol0: STD_LOGIC;

signal CAHBTOAPB3Ll0: STD_LOGIC_VECTOR(31 downto 0);

signal CAHBTOAPB3IL0: STD_LOGIC;

begin
HREADYOUT <= CAHBtoAPB3l1i;
HRESP <= CAHBtoAPB3i1i;
HRDATA <= CAHBTOAPB3OO0;
PADDR <= CAHBtoAPB3LO0;
PWRITE <= CAHBTOAPB3IO0;
PENABLE <= CAHBtoAPB3ol0;
PWDATA <= CAHBTOAPB3LL0;
PSEL <= CAHBtoAPB3IL0;
CAHBTOAPB3OI0: CAHBtoAPB3o
generic map (SYNC_RESET => SYNC_RESET)
port map (HCLK => HCLK,
HRESETN => HRESETN,
HSEL => HSEL,
CAHBTOAPB3II => HTRANS(1),
HWRITE => HWRITE,
HREADY => HREADY,
HRESP => CAHBtoAPB3i1i,
HREADYOUT => CAHBTOAPB3L1I,
PREADY => PREADY,
PSLVERR => PSLVERR,
PENABLE => CAHBTOAPB3OL0,
PWRITE => CAHBTOAPB3IO0,
PSEL => CAHBtoAPB3il0,
CAHBTOAPB3O0 => CAHBtoAPB3o0,
CAHBTOAPB3L0 => CAHBTOAPB3L0,
CAHBtoAPB3i0 => CAHBtoAPB3i0,
CAHBTOAPB3o1 => CAHBTOAPB3o1,
CAHBtoAPB3l1 => CAHBTOAPB3l1,
CAHBtoAPB3i1 => CAHBTOAPB3I1,
CAHBtoAPB3ool => CAHBTOAPB3ool);
CAHBTOAPB3LI0: CAHBtoAPB3iii
generic map (SYNC_RESET => SYNC_RESET)
port map (HCLK => HCLK,
HRESETN => HRESETN,
CAHBtoAPB3i1 => CAHBtoAPB3i1,
CAHBtoAPB3oOL => CAHBtoAPB3OOL,
PENABLE => CAHBTOAPB3ol0);
CAHBtoAPB3ii0: CAHBtoAPB3lli
generic map (SYNC_RESET => SYNC_RESET)
port map (HCLK => HCLK,
HRESETN => HRESETN,
CAHBtoAPB3o0 => CAHBTOAPB3o0,
CAHBtoAPB3l0 => CAHBTOAPB3L0,
CAHBtoAPB3i0 => CAHBTOAPB3i0,
CAHBtoAPB3o1 => CAHBtoAPB3o1,
CAHBtoAPB3L1 => CAHBTOAPB3l1,
HADDR => HADDR(31 downto 0),
HWDATA => HWDATA(31 downto 0),
HRDATA => CAHBtoAPB3oo0(31 downto 0),
PADDR => CAHBtoAPB3lo0(31 downto 0),
PWDATA => CAHBTOAPB3LL0(31 downto 0),
PRDATA => PRDATA(31 downto 0));
end architecture CAHBtoAPB3lol;
