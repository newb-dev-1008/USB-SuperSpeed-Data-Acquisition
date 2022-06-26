library ieee;
use Ieee.STD_logic_1164.all;
entity COREAhbSram is
generic (RAM_BLOCK_INSTANCES: INTEGEr range 4 to 64 := 4;
FAMILY: integER range 0 to 23 := 17); port (HCLK: in Std_logic;
HRESETn: in std_logic;
HWRITE: in std_logic;
HSIZE: in STD_logic_vectOR(2 downto 0);
HTRANS: in STd_logic_vecTOR(1 downto 0);
HWDATA: in STd_logic_veCTOR(31 downto 0);
HREADYIN: in STd_logic;
HSEL: in STD_logic;
HADDR: in Std_logic_veCTOR(14 downto 0);
HRDATA: out sTD_LOgic_vecTOR(31 downto 0);
HRESP: out STD_LOGIc_vector(1 downto 0);
HREADY: out STD_logic);
end COREAhbSram;

library IEee;
use ieee.STd_logic_1164.all;
architecture COREAHBSram_oi of CoreAhBSRAM is

component CorEAHBSRAM_o
port (HCLK: in std_lOGIC;
HRESETn: in std_logIC;
HWRITE: in STD_Logic;
HSIZE: in STD_LOGic_vector(2 downto 0);
HTRANS: in Std_logic_vECTOR(1 downto 0);
HREADYIN: in STD_LOGIc;
HSEL: in sTD_LOGIC;
HADDR: in std_LOGIC_vector(14 downto 0);
HRDATA: out sTD_LOGIC_vector(31 downto 0);
HRESP: out std_logiC_VECTOR(1 downto 0);
HREADY: out STD_Logic;
CoreAhbSrAM_L: in Std_logic_veCTOR(31 downto 0);
CoreAhbSram_I: out STD_LOGic;
CoreAhbSrAM_OL: out STD_logic_vectOR(3 downto 0);
CorEAHBSRAM_ll: out STd_logic_vecTOR(14 downto 0);
COreAhbSram_iL: out std_LOGIC_vectoR(14 downto 0));
end component;

component COREAhbSram_oii
generic (RAM_BLOCK_INSTANCES: inTEGER := 4);
port (HCLK: in STD_Logic;
HRESETN: in STD_LOGIc;
COREAhbSram_lii: in STD_logic_vectOR(31 downto 0);
COReAhbSram_iiI: in STd_logic_vecTOR(12 downto 0);
CoreAHBSRAM_i: in STD_logic;
COREAhbSram_ol: in std_logiC_VECTOr(3 downto 0);
CoreAhbSraM_O0I: in STd_logic_vecTOR(12 downto 0);
CoreAhbSRAM_L0I: out std_logic_VECTOR(31 downto 0));
end component;

signal CoreAhbSrAM_I: std_loGIC;

signal COREAHBSRam_ol: stD_LOGIC_vector(3 downto 0);

signal COREAHBSram_ll: std_LOGIC_VEctor(14 downto 0);

signal COREAHbSram_l: std_loGIC_VECTor(31 downto 0);

signal COREAHBSram_il: sTD_LOGIC_vector(14 downto 0);

signal COreAhbSram_i0I: std_logiC_VECTOr(31 downto 0);

signal COREAhbSram_o1i: Std_logic_veCTOR(1 downto 0);

signal CoreAHBSRAM_oli: STD_LOgic;

begin
HRDATA <= CoreAhbSRAM_I0i;
HRESP <= COReAhbSram_o1I;
HREADY <= CoreAhbSrAM_OLI;
COREAHBSram_l1i: CoreAhbSraM_O
port map (HCLK => HCLK,
HRESETn => HRESETn,
HWRITE => HWRITE,
HSIZE => HSIZE,
HTRANS => HTRANS,
HREADYIN => HREADYIN,
HSEL => HSEL,
HADDR => HADDR,
HRDATA => COREAhbSram_i0i,
HRESP => COREAhbSram_o1i,
HREADY => CoreAhBSRAM_Oli,
COREAhbSram_l => COREAHbSram_l,
COREAhbSram_i => CoreAhbSram_I,
CoreAHBSRAM_ol => CoreAhbSram_OL,
COReAhbSram_ll => CoreAhbSRAM_LL,
COREAHbSram_il => CoreAhbSraM_IL);
COREAHBSRam_i1i: COREAHBSram_oii
generic map (RAM_BLOCK_INSTANCES => RAM_BLOCK_INSTANCES)
port map (HCLK => HCLK,
HRESETn => HRESETn,
CoreAhbSraM_LII => HWDATA,
COreAhbSram_iII => CoreAhbSrAM_IL(14 downto 2),
CoreAhbSRAM_I => COREAhbSram_i,
CoreAhbSRAM_OL => CoreAhbSram_OL,
COreAhbSram_O0I => CorEAHBSRAm_ll(14 downto 2),
COREAHBSram_l0i => CoreAhbSraM_L);
end CoreAhbSraM_OI;
