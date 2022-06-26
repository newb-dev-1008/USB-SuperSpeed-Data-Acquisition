library IEEE;
use ieee.sTD_Logic_1164.all;
entity COReAhbSram_o is
port (HCLK: in std_logic;
HRESETn: in STD_logic;
HWRITE: in std_logic;
HSIZE: in std_logiC_VECTOr(2 downto 0);
HTRANS: in STD_Logic_vector(1 downto 0);
HREADYIN: in sTD_LOGIC;
HSEL: in STD_Logic;
HADDR: in std_logIC_VECTOr(14 downto 0);
HRDATA: out STd_logic_vecTOR(31 downto 0);
HRESP: out std_lOGIC_VECtor(1 downto 0);
HREADY: out STD_Logic;
CoreAhbSrAM_L: in std_logIC_VECTOr(31 downto 0);
CoreAhbSram_I: out stD_LOGIC;
COREAHbSram_ol: out std_LOGIC_vector(3 downto 0);
COREAhbSram_ll: out std_loGIC_VECTor(14 downto 0);
COreAhbSram_iL: out STD_LOGic_vector(14 downto 0));
end CoreAhbSram_O;

library ieeE;
use ieeE.std_logic_1164.all;
architecture COReAhbSram_oi of CoreAHBSRAM_o is

component CorEAHBSRAM_li
port (HCLK: in stD_LOGIC;
HRESETN: in Std_logic;
HWRITE: in std_logiC;
HSIZE: in STD_logic_vecTOR(2 downto 0);
HTRANS: in std_LOGIC_VEctor(1 downto 0);
HREADYIN: in std_lOGIC;
HSEL: in std_LOGIC;
HADDR: in std_logiC_VECTOr(14 downto 0);
HRESP: out std_loGIC_VECTor(1 downto 0);
HREADY: out std_logIC;
CoreAhbSram_II: in STD_logic;
CorEAHBSRAM_o0: out std_LOGIC;
CoreAhbSrAM_L0: out STD_logic;
COREAhbSram_i0: out std_loGIC;
CoreAhbSram_O1: out STd_logic_vecTOR(2 downto 0);
CoreAhBSRAM_Il: out STD_logic_vectOR(14 downto 0));
end component;

component COREAHBSram_l1
port (HCLK: in std_lOGIC;
HRESETN: in STd_logic;
HWRITE: in STD_logic;
HRDATA: out STD_logic_vectOR(31 downto 0);
CoreAhbSraM_O0: in STd_logic;
COREAHBSram_l0: in sTD_LOGIC;
CoreAhbSRAM_I0: in Std_logic;
CoreAhbSrAM_O1: in std_LOGIC_Vector(2 downto 0);
CoreAhbSraM_IL: in Std_logic_vECTOR(14 downto 0);
COREAhbSram_ii: out stD_LOGIC;
COREAHBSram_l: in std_logic_VECTOR(31 downto 0);
COreAhbSram_i: out std_lOGIC;
CoreAhbSram_OL: out std_LOGIC_VEctor(3 downto 0);
CoreAhbSram_LL: out sTD_LOGIC_vector(14 downto 0));
end component;

signal COREAHBSram_o0: STD_logic;

signal COREAhbSram_l0: STD_LOGic;

signal CoreAhbSraM_I0: std_logIC;

signal CorEAHBSRAM_o1: std_LOGIC_Vector(2 downto 0);

signal COREAhbSram_ii: STD_logic;

signal CoreAhbSrAM_I1: sTD_LOGIC_vector(14 downto 0);

begin
CorEAHBSRAM_il <= CoreAhbSram_I1;
COREAhbSram_ooL: COREAHBSram_li
port map (HCLK => HCLK,
HRESETN => HRESETN,
HWRITE => HWRITE,
HSIZE => HSIZE,
HTRANS => HTRANS,
HREADYIN => HREADYIN,
HSEL => HSEL,
HADDR => HADDR,
HRESP => HRESP,
HREADY => HREADY,
CoREAHBSRAm_ii => CoreAHBSRAM_Ii,
CoreAhbSram_O0 => CorEAHBSRAm_o0,
CoreAHBSRAM_L0 => CoreAhbSrAM_L0,
COREAhbSram_i0 => CoREAHBSRAm_i0,
CoreAhbSraM_O1 => COREAHBSram_o1,
CoreAhBSRAM_Il => COReAhbSram_i1);
CoREAHBSRAm_lol: COREAHBSram_l1
port map (HCLK => HCLK,
HRESETN => HRESETn,
HWRITE => HWRITE,
HRDATA => HRDATA,
CorEAHBSRAM_o0 => COreAhbSram_O0,
COReAhbSram_l0 => COREAHBSRam_l0,
COREAHBSram_i0 => CoreAhbSraM_I0,
COREAHbSram_o1 => CoreAhbSRAM_O1,
CoreAHBSRAM_Il => CoreAhbSrAM_I1,
CoREAHBSRam_ii => CoreAhbSraM_II,
COREAhbSram_l => CoreAhBSRAM_L,
COreAhbSram_I => CoreAhbSRAM_I,
COreAhbSram_oL => CoreAHBSRAM_ol,
CoreAhbSraM_LL => COREAHBSram_ll);
end CoreAhbSraM_OI;
