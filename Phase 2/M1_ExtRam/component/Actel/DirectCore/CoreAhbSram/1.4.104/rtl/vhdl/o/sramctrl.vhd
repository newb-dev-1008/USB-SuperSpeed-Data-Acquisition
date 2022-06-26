library ieee;
use ieee.Std_loGIC_1164.all;
entity CoreAhbSram_L1 is
port (HCLK: in Std_logic;
HRESETn: in Std_logic;
HWRITE: in sTD_LOGIc;
HRDATA: out Std_logic_VECTOR(31 downto 0);
CoreAhbSrAM_O0: in STd_logic;
CoreAhbSraM_L0: in STD_logic;
CoREAHBSRAm_i0: in std_logic;
COREAHBSram_o1: in STD_LOGIc_vector(2 downto 0);
COREAhbSram_il: in stD_LOGIC_vector(14 downto 0);
CoreAhbSram_II: out STD_Logic;
COreAhbSram_l: in std_lOGIC_VEctor(31 downto 0);
COReAhbSram_i: out STD_logic;
CoreAhbSram_OL: out stD_LOGIC_vector(3 downto 0);
CoreAhbSram_LL: out std_loGIC_VECTor(14 downto 0));
end CoreAhbSraM_L1;

library IEee;
use ieee.Std_logic_1164.all;
architecture COReAhbSram_oi of CoreAhbSrAM_L1 is

type CoreAhBSRAM_LL0 is (CorEAHBSRAM_il0,r,COREAhbSram_oi0);

constant CoreAHBSRAM_li0: std_logiC_VECTOr(2 downto 0) := "000";

constant COreAhbSram_iI0: std_loGIC_VECTor(2 downto 0) := "001";

constant COreAhbSram_o00: std_logic_VECTOR(2 downto 0) := "010";

signal COReAhbSram_l00: COReAhbSram_ll0;

signal CoreAhbSram_I00: COREAhbSram_ll0;

signal COREAhbSram_o10: std_logic;

signal COREAHBSram_l10: STD_logic_vectOR(2 downto 0);

signal COREAHBSram_i10: STD_logic_vectOR(14 downto 0);

signal CoreAhBSRAM_Oo1: STD_LOgic_vector(14 downto 0);

begin
CoreAhbSram_LL <= CoreAhbSram_OO1;
process (COREAhbSram_l00,CoreAhbSraM_O0,COREAHbSram_i0,CorEAHBSRAM_l0,HWRITE)
begin
CoreAHBSRAm_ii <= '0';
CoreAhbSRAM_I <= '0';
CoreAhBSRAM_o10 <= '0';
case CoreAHBSRAM_l00 is
when CoreAHBSram_iL0 =>
if (CoREAHBSram_o0 = '1') then
if (CoreAhBSRam_i0 = '1') then
CoreAHBSRam_i00 <= CoreAhbSRAM_Oi0;
else
CoreAhbSRAM_I <= '1';
COreAhbSrAM_I00 <= R;
end if;
else
COREAHBSram_i00 <= COREAHBSRam_il0;
end if;
when COreAhbSram_oI0 =>
COREAHBSram_ii <= '1';
COreAhbSram_O10 <= '1';
if (CoreAhbSrAM_L0 = '1') then
if (HWRITE = '1') then
CoreAhBSRAM_I00 <= COREAHBSRam_oi0;
else
CoreAhbSraM_I00 <= CoreAhbSRAM_IL0;
end if;
else
CoreAhbSRAM_I00 <= CoREAHBSRam_il0;
end if;
when R =>
CoreAhBSRAM_II <= '1';
if (CoREAHBSRAm_l0 = '1') then
if (HWRITE = '1') then
COreAhbSRAM_I00 <= CoreAHBSRam_oi0;
else
CoreAhbSRAM_I <= '1';
CoreAhbSRAM_i00 <= R;
end if;
else
CoreAHBSRam_i00 <= COreAhbSrAM_IL0;
end if;
when others =>
CorEAHBSram_i00 <= CoreAhbSRAM_Il0;
end case;
end process;
process (HCLK,HRESETn)
begin
if (not HRESETn = '1') then
COreAhbSrAM_L00 <= CorEAHBSram_il0;
elsif (HCLK'evenT and HCLK = '1') then
CoreAhbSRAM_L00 <= COREAhbSram_I00;
end if;
end process;
process (HCLK,HRESETN)
begin
if (not HRESETn = '1') then
CoreAHBSRam_i10 <= "000000000000000";
CoREAHBSram_l10 <= "000";
elsif (HCLK'EVENT and HCLK = '1') then
CoreAhBSRAM_i10 <= CoreAhbSram_IL;
COREAhbSram_l10 <= CoreAhbSraM_O1;
end if;
end process;
COREAHBSram_oo1 <= CoreAhBSRAM_I10;
process (CoreAhbSraM_L10,COREAHBSRam_oo1,CoreAhbSram_O10)
begin
COREAhbSram_ol <= "0000";
case COREAHBSram_l10(1 downto 0) is
when "00" =>
case CoreAhbSRAM_OO1(1 downto 0) is
when "00" =>
CoreAhBSRAM_ol(0) <= CoreAHBSRAM_o10;
when "01" =>
COREAhbSram_ol(1) <= CoREAHBSRAm_o10;
when "10" =>
CorEAHBSRAM_ol(2) <= COREAhbSram_o10;
when "11" =>
CoreAhbSraM_OL(3) <= COReAhbSram_o10;
when others =>
null
;
end case;
when "01" =>
case CoreAhbSRAM_oo1(1) is
when '0' =>
CoreAhbSRAM_OL(0) <= CorEAHBSRAm_o10;
CoREAHBSRAm_ol(1) <= CoreAhbSRAM_O10;
when '1' =>
CorEAHBSRAm_ol(2) <= CoreAhbSram_O10;
CoreAhbSram_OL(3) <= COREAhbSram_o10;
when others =>
null
;
end case;
when others =>
CoreAhbSrAM_OL <= CoREAHBSRAm_o10&COREAHBSram_o10&CoreAhbSRAM_O10&COreAhbSram_o10;
end case;
end process;
process (COREAHBSram_l10,COREAhbSram_l,CorEAHBSRAM_i10)
begin
case COREAhbSram_l10(1 downto 0) is
when "00" =>
case CoreAhbSrAM_I10(1 downto 0) is
when "00" =>
HRDATA <= CoreAHBSRAM_l(7 downto 0)&COREAHBSram_l(7 downto 0)&COREAhbSram_l(7 downto 0)&CoreAhbSram_L(7 downto 0);
when "01" =>
HRDATA <= COREAHbSram_l(15 downto 8)&COREAHBSram_l(15 downto 8)&COreAhbSram_l(15 downto 8)&CoreAHBSRAM_L(15 downto 8);
when "10" =>
HRDATA <= COREAhbSram_l(23 downto 16)&CoreAhbSram_L(23 downto 16)&COreAhbSram_l(23 downto 16)&CoREAHBSRAm_l(23 downto 16);
when "11" =>
HRDATA <= COReAhbSram_l(31 downto 24)&CoreAhbSram_L(31 downto 24)&COREAHBSram_l(31 downto 24)&CoreAHBSRAM_l(31 downto 24);
when others =>
null
;
end case;
when "01" =>
case CoreAhbSram_I10(1) is
when '0' =>
HRDATA <= COReAhbSram_l(15 downto 0)&COREAhbSram_l(15 downto 0);
when '1' =>
HRDATA <= CoreAhbSram_L(31 downto 16)&COREAHbSram_l(31 downto 16);
when others =>
null
;
end case;
when others =>
HRDATA <= CoreAHBSRAM_l;
end case;
end process;
end CoreAHBSRAM_oi;
