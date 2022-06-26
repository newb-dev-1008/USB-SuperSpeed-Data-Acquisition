library Ieee;
use iEEE.STD_logic_1164.all;
entity CoreAhbSRAm_oii is
generic (RAM_BLOCK_INSTANCES: integeR range 4 to 64 := 4); port (HCLK: in stD_LOGIC;
HRESETn: in std_logic;
COREAHBSram_lii: in STD_Logic_veCTOR(31 downto 0);
CoreAhBSRAM_iii: in Std_logic_veCTOR(12 downto 0);
CoreAhbSRAM_I: in STD_LOGic;
CoreAhbSraM_OL: in sTD_LOGIC_vector(3 downto 0);
CoreAhbSRAM_O0i: in STD_logic_vectOR(12 downto 0);
CoreAHBSRAM_l0i: out std_logic_vECTOR(31 downto 0));
end COREAHBSRam_oii;

library IEEE;
use IEEE.std_logic_1164.all;
architecture COREAHBSram_oi of COREAhbSram_oiI is

component COREAHBSRam_oo0
generic (DEPTH: integER);
port (CoREAHBSram_liI: in std_loGIC_vector(7 downto 0);
CoreAhBSRAM_l0i: out Std_logiC_VECTor(7 downto 0);
CoreAhbSRAM_ol: in std_logIC;
CorEAHBSRam_i: in std_loGIC;
CorEAHBSram_o0I: in Std_logIC_VEctor(12 downto 0);
CoreAhbSRAM_IIi: in Std_logic_vECTOR(12 downto 0);
COReAhbSram_lo0: in stD_LOGIC;
COREAhbSram_io0: in STd_logic);
end component;

function COREAHBSRAm_ol0(RAM_BLOCK_INSTANCES: inteGER)
return iNTEGER is
begin
case RAM_BLOCK_INSTANCES is
when 4 =>
return 512;
when 8 =>
return 1024;
when 12 =>
return 1536;
when 16 =>
return 2048;
when 20 =>
return 2560;
when 24 =>
return 3072;
when 28 =>
return 3584;
when 32 =>
return 4096;
when 36 =>
return 4608;
when 40 =>
return 5120;
when 44 =>
return 5632;
when 48 =>
return 6144;
when 52 =>
return 6656;
when 56 =>
return 7168;
when 60 =>
return 7680;
when 64 =>
return 8192;
when others =>
return 8192;
end case;
end function CoreAhBSram_ol0;

constant DEPTH: iNTEGER := COreAhbSram_oL0(RAM_BLOCK_INSTANCES);

begin
Sram_bYTE3: COReAhbSram_oo0
generic map (DEPTH => DEPTH)
port map (COReAhbSram_liI => CoreAhbSram_LII(31 downto 24),
CoreAhbSram_L0I => CoreAhbSram_L0I(31 downto 24),
CoREAHBSRam_ol => COREAHBSram_ol(3),
CoreAhbSram_I => CoreAhBSRAM_I,
CoreAHBSRAM_o0i => CoreAhbSRAM_O0i(12 downto 0),
COReAhbSram_iiI => COREAHbSram_iii(12 downto 0),
CoreAhBSRAM_Lo0 => HCLK,
COreAhbSram_iO0 => HRESETn);
Sram_bYTE2: CoreAHBSRAM_Oo0
generic map (DEPTH => DEPTH)
port map (CoREAHBSRAm_lii => CoreAhbSram_LII(23 downto 16),
CoreAHBSRAM_l0i => COREAHBSram_l0i(23 downto 16),
CoreAhbSram_OL => CoreAhbSram_OL(2),
COREAHBSram_i => COREAHBSRam_i,
COREAHBSram_o0i => CoreAhbSraM_O0I(12 downto 0),
CoREAHBSRAm_iii => CoreAhBSRAM_Iii(12 downto 0),
CoreAhbSram_LO0 => HCLK,
CoREAHBSram_io0 => HRESETn);
SRAM_byte1: CoreAHBSRam_oo0
generic map (DEPTH => DEPTH)
port map (CoreAHBSRAM_Lii => COREAHBSram_lii(15 downto 8),
CoreAhbSram_L0I => CoreAhbSRAM_L0I(15 downto 8),
CoreAhbSraM_OL => CorEAHBSRAM_ol(1),
CoreAhBSRAM_I => CoreAhbSrAM_I,
CoreAhBSRAM_O0i => COReAhbSram_o0I(12 downto 0),
CoreAhbSRAM_IIi => CoREAHBSRAm_iii(12 downto 0),
CoreAhbSram_LO0 => HCLK,
CoreAHBSRAM_io0 => HRESETn);
Sram_byte0: CoREAHBSRAm_oo0
generic map (DEPTH => DEPTH)
port map (CoreAhbSram_LII => CoreAhbSraM_LII(7 downto 0),
CoreAhbSram_L0I => CoreAhbSrAM_L0I(7 downto 0),
CoreAhbSrAM_OL => COREAhbSram_ol(0),
CorEAHBSRAM_i => COREAhbSram_i,
COREAHbSram_o0i => COReAhbSram_o0I(12 downto 0),
COREAHBSram_iii => COreAhbSram_III(12 downto 0),
CoreAhbSRAM_LO0 => HCLK,
COreAhbSram_iO0 => HRESETN);
end CoreAhBSRAM_Oi;
