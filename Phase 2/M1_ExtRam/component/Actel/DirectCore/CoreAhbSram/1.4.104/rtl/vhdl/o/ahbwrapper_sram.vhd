library Ieee;
use ieee.std_logIC_1164.all;
entity CoreAhBSRAM_li is
port (HCLK: in STD_LOGIc;
HRESETN: in sTD_LOGIC;
HWRITE: in std_logic;
HSIZE: in STD_logic_vectOR(2 downto 0);
HTRANS: in std_logic_VECTOR(1 downto 0);
HREADYIN: in STD_logic;
HSEL: in STd_logic;
HADDR: in std_logic_vECTOR(14 downto 0);
HRESP: out stD_LOGIC_vector(1 downto 0);
HREADY: out std_logic;
COREAHbSram_ii: in STd_logic;
COREAHBSRam_o0: out Std_logic;
COREAhbSram_l0: out Std_logic;
CoreAhBSRAM_I0: out STD_Logic;
COREAHBSram_o1: out Std_logic_VECTOR(2 downto 0);
COREAHBSram_il: out Std_logic_VECTOR(14 downto 0));
end CoREAHBSRAm_li;

library IEEe;
use IEEE.std_logic_1164.all;
architecture CoreAHBSRAM_oi of CoreAhBSRAM_Li is

constant COREAHBSram_iol: std_lOGIC_VECtor(1 downto 0) := "00";

constant COREAhbSram_oll: std_logic_vECTOR(1 downto 0) := "01";

constant CoreAhbSRAM_LLl: STD_LOGIc_vector(1 downto 0) := "10";

constant COreAhbSram_iLL: std_logiC_VECTOR(1 downto 0) := "11";

constant CoreAhbSram_OIL: std_lOGIC_VECtor(1 downto 0) := "00";

constant COReAhbSram_liL: Std_logic_VECTOR(1 downto 0) := "01";

constant COREAHbSram_iil: Std_logic_VECTOR(1 downto 0) := "10";

constant COREAHBSram_o0l: STd_logic_vecTOR(1 downto 0) := "11";

signal CoREAHBSRAm_l0l: STD_Logic_vectoR(14 downto 0);

signal CoreAhbSraM_I0L: sTD_LOGIC_vector(2 downto 0);

signal COReAhbSram_o1L: STD_Logic;

signal COreAhbSram_l1L: std_logIC;

signal CoreAhbSraM_I1L: std_logiC;

signal CoreAhbSraM_OOI: sTD_LOGIC_vector(14 downto 0);

signal CoreAhbSram_LOI: std_logiC;

signal CoreAhbSraM_IOI: std_loGIC_VECTor(2 downto 0);

signal CoreAhbSraM_OLI: sTD_LOGIC;

signal CorEAHBSRAM_lli: STD_LOgic;

signal CoreAhBSRAM_ILi: sTD_LOGIC_vector(2 downto 0);

begin
HREADY <= COREAHbSram_oli;
CoreAhBSRAM_L0 <= CoreAhbSRAM_lli;
CoREAHBSRAm_o1 <= CorEAHBSRam_ili;
HRESP <= CoREAHBSRAm_oil;
process (HCLK)
begin
if (HCLK'event and HCLK = '1') then
if ((CoreAHBSRAM_Oli and HREADYIN) = '1') then
COReAhbSram_l0L <= HADDR;
CoreAhBSRAM_O1l <= HWRITE;
CoreAhbSrAM_I0L <= HSIZE;
else
COReAhbSram_l0L <= CoreAHBSRAM_l0l;
CoreAhbSrAM_O1L <= COREAhbSram_o1l;
CorEAHBSram_i0l <= CoreAhbSraM_ILI;
end if;
end if;
end process;
CoREAHBSRAm_il <= CoreAhbSrAM_L0L when (CoREAHBSRAm_l1l and not CoreAhbSrAM_II) = '1' else
HADDR;
CoreAhbSRAM_I0 <= COREAHBSRam_o1l when (COREAhbSram_l1l and not COREAHBSram_ii) = '1' else
HWRITE;
COREAHBSRam_ili <= COreAhbSram_i0L when (COReAhbSram_l1L and not CoreAhbSram_II) = '1' else
HSIZE;
process (CoreAhbSram_OLI,HREADYIN,HSEL,HTRANS)
begin
CoreAhbSraM_LLI <= '0';
if ((CoreAHBSRAM_Oli = '1') and (HREADYIN = '1')
and (HSEL = '1')) then
case HTRANS is
when COREAhbSram_lll =>
COReAhbSram_lLI <= '1';
when COReAhbSram_iLL =>
COREAHbSram_lli <= '1';
when others =>
COREAHBSram_lli <= '0';
end case;
end if;
end process;
process (HCLK,HRESETN)
begin
if (not HRESETn = '1') then
CoreAhBSRAM_L1l <= '0';
elsif (HCLK'event and HCLK = '1') then
if (COREAHbSram_i1L = '1') then
CoreAhbSRAM_l1l <= CoreAHBSRAm_lli;
else
if (COREAHBSram_iI = '1') then
COReAhbSraM_L1L <= '0';
else
CorEAHBSram_l1l <= CoreAhbSRAM_l1l;
end if;
end if;
end if;
end process;
COREAhbSram_O0 <= CoreAHBSRAm_lli or COreAhbSrAM_L1L;
CorEAHBSram_i1l <= (COREAhbSram_LLI and not CoreAhbSRAM_l1l) or ((CoreAhbSRAM_LLi and COReAhbSrAM_L1l) and COREAhbSram_II);
COREAhbSram_OLI <= (not COReAhbSraM_L1L) or COREAHbSram_iI;
end CoreAhBSRAM_oi;
