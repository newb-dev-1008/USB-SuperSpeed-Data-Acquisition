library iEEE;
use IEEE.std_logic_1164.all;
library PROASIc3e;
entity CoreAhbSram_OO0 is
generic (DEPTH: INTEger range 512 to 8192 := 512); port (COREAhbSram_lo0: in std_logiC;
CoreAhbSram_IO0: in std_LOGIC;
COREAhbSram_LII: in std_logic_VECTOR(7 downto 0);
COREAHBSram_iii: in std_logic_VECTOR(12 downto 0);
COreAhbSram_I: in std_LOGIC;
CoreAhbSram_OL: in std_LOGIC;
CoreAhbSram_O0I: in STD_LOgic_vector(12 downto 0);
COREAhbSram_l0i: out std_LOGIC_vector(7 downto 0));
end CoreAhbSRAM_OO0;

architecture CoreAhbSraM_OI of CoreAhbSRAM_OO0 is

component RAM4K9
port (ADDRA11: in STD_ULOgic;
ADDRA10: in sTD_ULOGIc;
ADDRA9: in STD_ULOgic;
ADDRA8: in std_ulogic;
ADDRA7: in std_uLOGIC;
ADDRA6: in stD_ULOGIC;
ADDRA5: in Std_ulogic;
ADDRA4: in std_ulogiC;
ADDRA3: in sTD_ULOGIC;
ADDRA2: in Std_ulogic;
ADDRA1: in std_ULOGIC;
ADDRA0: in Std_ulogic;
ADDRB11: in STD_Ulogic;
ADDRB10: in Std_ulogic;
ADDRB9: in STD_ulogic;
ADDRB8: in std_uLOGIC;
ADDRB7: in std_uLOGIC;
ADDRB6: in STD_ULogic;
ADDRB5: in std_ulogIC;
ADDRB4: in sTD_ULOGic;
ADDRB3: in std_uLOGIC;
ADDRB2: in std_ulogiC;
ADDRB1: in Std_ulogic;
ADDRB0: in STD_ULOGic;
DINA8: in STD_ulogic;
DINA7: in sTD_ULOGIc;
DINA6: in std_ULOGIC;
DINA5: in std_ULOGIC;
DINA4: in std_ulogic;
DINA3: in stD_ULOGIC;
DINA2: in std_ulogic;
DINA1: in std_ulogic;
DINA0: in std_ulOGIC;
DINB8: in STD_ulogic;
DINB7: in STD_ulogic;
DINB6: in std_ULOGIC;
DINB5: in std_ulOGIC;
DINB4: in Std_ulogic;
DINB3: in STD_ulogic;
DINB2: in STD_ULOgic;
DINB1: in Std_ulogic;
DINB0: in STD_ulogic;
WIDTHA1: in std_uloGIC;
WIDTHA0: in Std_ulogic;
WIDTHB1: in std_uLOGIC;
WIDTHB0: in STD_ulogic;
PIPEA: in Std_ulogic;
PIPEB: in sTD_ULOGIC;
WMODEA: in STd_ulogic;
WMODEB: in STD_ULogic;
BLKA: in std_ULOGIC;
BLKB: in sTD_ULOGIc;
WENA: in Std_ulogic;
WENB: in STD_ulogic;
CLKA: in std_ULOGIC;
CLKB: in STD_Ulogic;
RESET: in STD_Ulogic;
DOUTA8: out std_ulogic;
DOUTA7: out STD_Ulogic;
DOUTA6: out sTD_ULOGIc;
DOUTA5: out std_ulogic;
DOUTA4: out stD_ULOGIC;
DOUTA3: out STD_ULogic;
DOUTA2: out STD_ulogic;
DOUTA1: out STD_ulogic;
DOUTA0: out stD_ULOGIC;
DOUTB8: out std_uloGIC;
DOUTB7: out std_ulogic;
DOUTB6: out STD_ULOGic;
DOUTB5: out std_ULOGIC;
DOUTB4: out std_ulOGIC;
DOUTB3: out std_ulogiC;
DOUTB2: out STD_Ulogic;
DOUTB1: out STD_ULOGic;
DOUTB0: out std_ulOGIC);
end component;

constant COREAHBSram_lo1: Integer := 1;

signal COREAHBSRam_io1: STD_LOGic_vector(12 downto 9);

signal COReAhbSram_oL1: std_logic_VECTOR(1 downto 0);

signal CoreAHBSRAM_Ll1: stD_LOGIC_vector(1 downto 0);

signal CoreAHBSRAM_il1: STD_logic_vectoR(1 downto 0);

signal CoreAhbSram_OI1: std_logic_vECTOR(1 downto 0);

signal COReAhbSram_lI1: std_logic_vECTOR(1 downto 0);

signal CoreAhbSraM_II1: std_LOGIC_VEctor(1 downto 0);

signal COREAHbSram_o01: Std_logic_veCTOR(1 downto 0);

signal CoreAHBSRAm_l01: stD_LOgic_vecTOR(1 downto 0);

signal COREAhbSraM_I01: std_logIC_VEctor(1 downto 0);

signal CoreAhbSRAM_O11: std_lOGIC_vector(1 downto 0);

signal CoreAhbSRAM_l11: std_loGIC_Vector(1 downto 0);

signal CoreAHBSRAm_i11: sTD_LOgic_vecTOR(1 downto 0);

signal COreAhbSrAM_OOOl: std_loGIC_Vector(1 downto 0);

signal CoREAHBSram_loOL: sTD_LOgic_vecTOR(1 downto 0);

signal CoREAHBSram_ioOL: STD_logic_VECTOR(1 downto 0);

signal CoreAhBSRAM_olol: STd_logic_VECTOr(1 downto 0);

signal CoreAhbSRAM_LLOl: STd_logic_vecTOR(15 downto 0);

signal COREAhbSram_iloL: std_logic_VECTOR(15 downto 0);

signal COREAhbSram_oiol: Std_logic_veCTOR(7 downto 0);

signal COREAhbSram_liol: std_logic_vECTOR(7 downto 0);

signal COREAhbSram_iioL: std_logiC_VECTOR(7 downto 0);

signal COReAhbSram_o0OL: std_logIC_VECTOr(7 downto 0);

signal CoREAHBSRAm_l0ol: Std_logic_vECTOR(7 downto 0);

signal CorEAHBSRAM_i0ol: std_logic_vECTOR(7 downto 0);

signal CoreAHBSRAM_o1ol: STD_logic_vectOR(7 downto 0);

signal COREAhbSram_l1oL: Std_logic_vECTOR(7 downto 0);

signal COReAhbSram_i1OL: std_logiC_VECTOR(7 downto 0);

signal CorEAHBSRAM_ooll: STD_Logic_vectoR(7 downto 0);

signal COREAhbSram_LOLL: sTD_LOgic_vecTOR(7 downto 0);

signal CoreAhBSRAM_IOll: Std_logic_veCTOR(7 downto 0);

signal COreAhbSram_oLLL: std_logiC_VECTOR(7 downto 0);

signal CoreAhbSram_LLLL: sTD_LOGIC_vector(7 downto 0);

signal CoreAhbSrAM_ILLL: STD_LOgic_vector(7 downto 0);

signal COREAHBSRam_oill: STD_logic_vectOR(7 downto 0);

signal CoreAhBSRAM_LIll: STD_Logic_vectoR(7 downto 0);

signal COREAHbSram_iill: STD_logic_vecTOR(7 downto 0);

signal CoreAhbSram_O0LL: std_lOGIC_VECtor(7 downto 0);

signal CoreAhbSraM_L0LL: STD_LOGIc_vector(7 downto 0);

signal CoREAHBSRAm_i0ll: STD_logic_vectOR(7 downto 0);

signal CoreAhbSRAM_O1Ll: STD_LOGIc_vector(7 downto 0);

signal COREAhbSram_l1lL: std_logic_VECTOR(7 downto 0);

signal COREAhbSram_i1lL: std_logIC_VECTOr(7 downto 0);

signal CoreAhBSRAM_Ooil: STD_logic_vectoR(7 downto 0);

signal COREAhbSram_loIL: sTD_LOgic_vecTOR(7 downto 0);

signal COREAHBSram_ioil: STD_logic_vecTOR(7 downto 0);

signal CoreAhbSram_OLIL: std_logiC_VECTOr(7 downto 0);

signal COREAHbSram_llil: STD_logic_vecTOR(7 downto 0);

signal COREAhbSram_ilil: std_logic_VECTOR(7 downto 0);

signal CoreAHBSRAM_Oiil: sTD_LOGIC_vector(7 downto 0);

signal COREAHBSram_liil: Std_logic_VECTOR(7 downto 0);

signal CoreAhbSram_IIIL: std_logiC_VECTOR(11 downto 0);

signal CoreAhbSram_O0IL: std_logiC_VECTOR(11 downto 0);

signal CoreAhbSRAM_l0il: std_logIC_VEctor(11 downto 0);

signal CoreAhbSRAM_I0il: STD_logic_vECTOR(11 downto 0);

signal CoreAhbSRAM_O1il: std_logic_VECTOR(11 downto 0);

signal CoreAhbSram_L1IL: std_logic_vECTOR(11 downto 0);

signal CoreAhbSram_I1IL: std_loGIC_VECTor(11 downto 0);

signal COREAHBSRam_oo0l: STD_Logic_vector(11 downto 0);

signal CoREAHBSRAm_lo0l: std_LOGIC_vector(11 downto 0);

signal COREAHBSRam_io0l: STD_logic_vectOR(11 downto 0);

signal COREAHBSRam_ol0l: STD_logic_vectOR(11 downto 0);

signal COreAhbSram_lL0L: std_logiC_VECTOr(11 downto 0);

signal COREAHBSram_il0l: STD_LOgic_vector(11 downto 0);

signal CoreAhbSraM_OI0L: std_lOGIC_VECtor(11 downto 0);

signal CoreAhbSraM_LI0L: STD_logic_VECTOR(11 downto 0);

signal COREAhbSram_ii0L: std_logIC_VECTOr(11 downto 0);

signal CoreAhbSram_O00L: std_LOGIC_Vector(11 downto 0);

signal CoreAhbSram_L00L: std_logic_VECTOR(11 downto 0);

signal CoREAHBSRam_i00l: STD_logic_vecTOR(11 downto 0);

signal CoreAhbSRAM_O10l: sTD_LOGIC_vector(11 downto 0);

signal COREAhbSram_l10L: std_logic_vECTOR(11 downto 0);

signal CoreAhBSRAM_I10l: sTD_LOGIC_vector(11 downto 0);

signal CoreAhbSrAM_OO1L: STD_Logic_vectoR(11 downto 0);

signal COREAHBSram_lo1l: STD_logic_vectOR(11 downto 0);

signal CoreAhbSraM_IO1L: std_LOGIC_VEctor(11 downto 0);

signal COREAHBSRam_ol1l: STD_logic_vectOR(11 downto 0);

signal CoreAHBSRAM_ll1l: STD_logic_vectOR(11 downto 0);

signal CoreAHBSRAM_Il1l: STD_LOgic_vector(11 downto 0);

signal CoreAhbSraM_OI1L: std_LOGIC_VEctor(11 downto 0);

signal COReAhbSram_li1L: std_logic_VECTOR(11 downto 0);

signal CoreAhbSram_II1L: Std_logic_VECTOR(11 downto 0);

signal COreAhbSram_o01L: std_logic_VECTOR(11 downto 0);

signal CoreAHBSRAM_L01l: STD_logic;

signal CoreAhbSram_I01L: stD_LOGic;

signal COREAhbSram_O11L: sTD_LOGic;

signal CoreAhbSraM_L11L: std_loGIC;

begin
CoreAhbSram_L01L <= not (CoREAHBSRAm_ol);
CoreAHBSRAM_i01l <= not (CoreAhbSraM_I);
COREAHBSram_o11l <= '1';
CoreAhbSraM_L11L <= '0';
process (COREAHBSram_lo0,CoreAhbSram_IO0)
begin
if (COreAhbSram_iO0 = '0') then
COreAhbSram_iO1(12 downto 9) <= "0000";
elsif (CoreAhbSram_LO0'eVENT and CoreAHBSram_lo0 = '1') then
COREAHBSram_io1(12 downto 9) <= CoreAhbSRAM_IIi(12 downto 9);
end if;
end process;
process (CoreAhbSRAM_O0i,COREAhbSram_iiI,COReAhbSram_lII,CoreAHBSRAM_l01l,CoreAhbSraM_I01L,CoreAhBSRAM_Lill,COREAHBSRam_iill,COREAHBSram_o0ll,COreAhbSram_l0LL,CoreAhbSraM_I0LL,CoreAhbSRAM_O1Ll,CoreAhbSRAM_L1ll,CorEAHBSRAM_i1ll,CoreAHBSRAM_ooil,COREAHbSram_loil,COREAhbSram_ioiL,COREAhbSram_olIL,COReAhbSram_llIL,COREAhbSram_ilIL,CoreAhbSram_OIIL,CoreAhbSram_LIIL)
begin
CoreAHBSRAM_ol1 <= "00";
CoREAHBSRAm_ll1 <= "00";
COREAhbSram_il1 <= "00";
CoreAhbSram_OI1 <= "00";
COREAhbSram_li1 <= "00";
COREAhbSram_ii1 <= "00";
COREAhbSram_o01 <= "00";
CoreAHBSRAM_l01 <= "00";
CoreAhbSram_I01 <= "00";
CoreAhbSram_O11 <= "00";
CorEAHBSRAM_l11 <= "00";
CoreAHBSRAM_i11 <= "00";
COREAHBSram_oool <= "00";
CoreAhbSram_LOOL <= "00";
COREAHBSRam_iool <= "00";
COREAHBSRam_olol <= "00";
CoreAhbSraM_LLOL <= "1111111111111111";
COREAhbSram_ilol <= "1111111111111111";
COREAHBSram_oiol <= "00000000";
COREAhbSram_liOL <= "00000000";
COreAhbSram_IIOL <= "00000000";
CoreAhbSram_O0OL <= "00000000";
COReAhbSram_l0OL <= "00000000";
CoreAhbSrAM_I0OL <= "00000000";
COreAhbSram_O1OL <= "00000000";
CoreAhbSram_L1OL <= "00000000";
COreAhbSram_i1OL <= "00000000";
CoreAhbSraM_OOLL <= "00000000";
COReAhbSram_loLL <= "00000000";
COReAhbSram_iOLL <= "00000000";
CoreAHBSRAM_olll <= "00000000";
CoreAHBSRAM_llll <= "00000000";
CoreAhbSRAM_ILLl <= "00000000";
COReAhbSram_oiLL <= "00000000";
CoreAhbSraM_IIIL <= "000000000000";
CoREAHBSRAm_o0il <= "000000000000";
COREAHBSram_l0il <= "000000000000";
CoREAHBSRAm_i0il <= "000000000000";
CoreAHBSRAM_o1il <= "000000000000";
CoreAhbSram_L1IL <= "000000000000";
COREAhbSram_i1il <= "000000000000";
COREAHBSRam_oo0l <= "000000000000";
COReAhbSram_lO0L <= "000000000000";
COReAhbSram_io0L <= "000000000000";
COREAhbSram_ol0L <= "000000000000";
COreAhbSram_LL0L <= "000000000000";
COREAhbSram_il0L <= "000000000000";
COreAhbSram_OI0L <= "000000000000";
CoreAhbSRAM_LI0l <= "000000000000";
CoreAhbSrAM_II0L <= "000000000000";
CoreAhbSram_O00L <= "000000000000";
CoreAhBSRAM_L00l <= "000000000000";
CoreAhbSrAM_I00L <= "000000000000";
CorEAHBSRAM_o10l <= "000000000000";
CoreAhbSRAM_L10l <= "000000000000";
CoREAHBSRAm_i10l <= "000000000000";
CoreAhbSraM_OO1L <= "000000000000";
COReAhbSram_lo1L <= "000000000000";
CorEAHBSRAM_io1l <= "000000000000";
COREAhbSram_ol1L <= "000000000000";
COREAHBSram_ll1l <= "000000000000";
COreAhbSram_iL1L <= "000000000000";
CoreAHBSRAM_oi1l <= "000000000000";
CoreAhbSRAM_LI1l <= "000000000000";
COreAhbSraM_II1l <= "000000000000";
CoreAHBSram_o01L <= "000000000000";
case (DEPTH) is
when 512 =>
COREAHbSram_ol1 <= "11";
CoreAhbSraM_IIIL <= "000"&COREAHBSRam_o0i(8 downto 0);
CoreAhbSram_O00L <= "000"&COreAhbSram_iII(8 downto 0);
COreAhbSram_oIOL <= COREAhbSram_lii;
COReAhbSram_llOL(0) <= COReAhbSram_l01L;
COREAHbSram_ilol(0) <= CoReAhbSraM_i01L;
COreAhbSraM_L0I <= CoreAhbSRAM_LIll;
when 1024 =>
case (CoREAHBSRAM_lo1) is
when 8 =>
COREAhbSram_ol1 <= "11";
CoreAhbSrAM_LL1 <= "11";
COReAhbSram_iiIL <= "000"&COREAHBSram_o0i(8 downto 0);
COREAHBSram_o0il <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoREAHBSRAm_o00l <= "000"&CoreAhbSram_III(8 downto 0);
CoreAhbSRAM_L00l <= "000"&COREAHbSram_iII(8 downto 0);
CoreAhbSRAM_Oiol <= CoreAhbSRAM_lii;
COreAhbSRAM_liol <= CoreAhbSRAM_lii;
case (COReAhbSraM_O0I(9)) is
when '0' =>
COREAhbSram_llOL(0) <= COREAHBSram_l01l;
when '1' =>
COREAHBSram_llol(1) <= CoreAHBSRAm_l01l;
when others =>
null
;
end case;
case (COREAHBSram_iii(9)) is
when '0' =>
COREAHBSRam_ilol(0) <= COReAhbSram_i01L;
when '1' =>
CoreAHBSRAM_Ilol(1) <= CoreAhbSram_I01L;
when others =>
null
;
end case;
case (CoREAHBSRam_io1(9)) is
when '0' =>
CoreAhbSrAM_L0I <= COREAhbSram_lilL;
when '1' =>
COreAhbSram_L0I <= CoreAhbSram_IILL;
when others =>
null
;
end case;
when others =>
CoreAHBSRAM_Ol1 <= "10";
CoreAhbSram_LL1 <= "10";
CoreAhbSram_IIIL <= "00"&COREAHbSram_o0i(9 downto 0);
CoreAhbSram_O0IL <= "00"&COReAhbSram_o0I(9 downto 0);
COREAhbSram_o00l <= "00"&COREAHBSram_iii(9 downto 0);
COREAhbSram_l00L <= "00"&CoreAhbSraM_III(9 downto 0);
CoreAhbSram_OIOL(3 downto 0) <= CoreAHBSRAM_lii(3 downto 0);
CoreAhbSraM_LIOL(3 downto 0) <= COREAHbSram_lii(7 downto 4);
CoreAhbSRAM_LLOl(1 downto 0) <= CoreAhbSram_L01L&COREAHBSRam_l01l;
CoreAhbSrAM_ILOL(1 downto 0) <= CoreAhBSRAM_I01l&CoreAhbSrAM_I01L;
CoREAHBSRam_l0i <= CoreAhbSram_IILL(3 downto 0)&CoreAhbSraM_LILL(3 downto 0);
end case;
when 1536 =>
case (CoreAhbSram_LO1) is
when 8 =>
COREAhbSram_ol1 <= "11";
CoreAhbSram_LL1 <= "11";
CoreAhbSRAM_IL1 <= "11";
COreAhbSram_iIIL <= "000"&CoreAhbSram_O0I(8 downto 0);
CoreAhbSram_O0IL <= "000"&CoreAhbSram_O0I(8 downto 0);
COREAHbSram_l0il <= "000"&CoreAhbSram_O0I(8 downto 0);
COReAhbSram_o00L <= "000"&CoreAHBSRAM_Iii(8 downto 0);
COREAHBSRam_l00l <= "000"&CoreAhbSrAM_III(8 downto 0);
COreAhbSram_I00L <= "000"&COREAhbSram_iiI(8 downto 0);
COReAhbSram_oiOL <= COREAHBSram_lii;
CoreAHBSRAM_liol <= CoreAhbSRAM_LIi;
CoreAhbSram_IIOL <= CoreAHBSRAM_lii;
case (COREAhbSram_o0i(10 downto 9)) is
when "00" =>
COREAHBSram_llol(0) <= CoreAhbSram_L01L;
when "01" =>
CoREAHBSRAm_llol(1) <= CoreAhbSram_L01L;
when "10" =>
COReAhbSram_llOL(2) <= COREAHBSram_l01l;
when "11" =>
CoreAhbSraM_LLOL(1) <= CoreAHBSRAM_l01l;
when others =>
null
;
end case;
case (COREAHbSram_iii(10 downto 9)) is
when "00" =>
CoreAhbSRAM_ILOl(0) <= COREAhbSram_i01l;
when "01" =>
COREAhbSram_iloL(1) <= COReAhbSram_i01L;
when "10" =>
COREAhbSram_ilOL(2) <= CoreAhbSraM_I01L;
when "11" =>
CoreAhbSram_ILOL(1) <= COREAHBSram_i01l;
when others =>
null
;
end case;
case (CoreAhbSraM_IO1(10 downto 9)) is
when "00" =>
CoreAhbSRAM_L0i <= COREAHBSRam_lill;
when "01" =>
COreAhbSram_l0I <= CoreAHBSRAM_iill;
when "10" =>
CoreAhbSrAM_L0I <= CoreAHBSRAM_o0ll;
when "11" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_IIll;
when others =>
null
;
end case;
when others =>
CoREAHBSRAm_ol1 <= "10";
COREAHBSRam_ll1 <= "10";
COREAhbSram_il1 <= "11";
COREAHbSram_iiil <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhBSRAM_O0il <= "00"&COReAhbSram_o0I(9 downto 0);
CoreAhbSrAM_L0IL <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_O00l <= "00"&CoreAhbSram_iII(9 downto 0);
CoreAhbSram_L00L <= "00"&CoreAhBSRAM_IIi(9 downto 0);
CoreAhbSram_I00L <= "000"&COREAHBSram_iii(8 downto 0);
CorEAHBSram_oIOL(3 downto 0) <= COREAhbSram_lii(3 downto 0);
COREAHBSram_liol(3 downto 0) <= COREAhbSram_lii(7 downto 4);
CoreAhBSRAM_Iiol <= CoreAhbSraM_LII;
case (COreAhbSram_o0I(10 downto 9)) is
when "00" =>
COREAHBSRam_llol(1 downto 0) <= COREAhbSram_l01l&COREAHbSram_l01l;
when "01" =>
COreAhbSram_lLOL(1 downto 0) <= COreAhbSram_L01L&COreAhbSram_L01L;
when "10" =>
CoreAHBSRAM_llol(2) <= COREAhbSram_l01L;
when "11" =>
CoreAhbSram_LLOL(1 downto 0) <= COreAhbSram_L01L&COreAhbSram_l01L;
when others =>
null
;
end case;
case (COreAhbSram_III(10 downto 9)) is
when "00" =>
COREAHBSram_ilol(1 downto 0) <= CoreAhbSRAM_I01l&CoreAhbSRAM_I01l;
when "01" =>
COREAhbSram_ilol(1 downto 0) <= CoreAHBSRAM_I01l&CoreAhBSRAM_I01l;
when "10" =>
CoreAhbSrAM_ILOL(2) <= CoreAhbSRAM_I01l;
when "11" =>
CoreAhbSraM_ILOL(1 downto 0) <= COREAhbSram_i01L&COreAhbSram_I01L;
when others =>
null
;
end case;
case (COREAhbSram_io1(10 downto 9)) is
when "00" =>
CoreAHBSRAM_l0i <= CoreAhbSrAM_IILL(3 downto 0)&COREAhbSram_lilL(3 downto 0);
when "01" =>
COREAhbSram_l0i <= CoreAHBSRAM_iill(3 downto 0)&COREAHBSram_lill(3 downto 0);
when "10" =>
COREAhbSram_l0i <= CoreAhbSrAM_O0LL;
when "11" =>
CoREAHBSRAm_l0i <= CoreAhbSram_IILL(3 downto 0)&CoreAhbSrAM_LILL(3 downto 0);
when others =>
null
;
end case;
end case;
when 2048 =>
case (CoreAhBSRAM_Lo1) is
when 8 =>
CoreAhbSram_OL1 <= "11";
CoreAhBSRAM_Ll1 <= "11";
COREAhbSram_il1 <= "11";
CoreAhBSRAM_oi1 <= "11";
CoreAhbSRAM_iiil <= "000"&COreAhbSrAM_O0I(8 downto 0);
CoreAHBSRAm_o0il <= "000"&CoreAhBSRAM_o0i(8 downto 0);
CoreAhBSRAM_l0il <= "000"&COREAHbSram_O0I(8 downto 0);
COREAhbSram_I0IL <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COREAHbSram_o00L <= "000"&COREAhbSram_III(8 downto 0);
CoreAhbSRAM_L00l <= "000"&CoreAhbSRAM_IIi(8 downto 0);
CoreAhbSRAM_I00l <= "000"&CoreAhbSram_III(8 downto 0);
COREAhbSram_o10L <= "000"&COREAHBSRam_iii(8 downto 0);
COReAhbSram_oiOL <= CoreAhbSrAM_LII;
COREAHBSram_liol <= CoreAhBSRAM_LIi;
COREAhbSram_iiOL <= COREAHbSram_lii;
CoreAhbSraM_O0OL <= CoreAhbSram_LII;
case (COREAHBSram_o0i(10 downto 9)) is
when "00" =>
CoreAHBSRAM_llol(0) <= COreAhbSram_l01L;
when "01" =>
COREAhbSram_lloL(1) <= COreAhbSram_L01L;
when "10" =>
COReAhbSram_llOL(2) <= CoreAHBSRAM_l01l;
when "11" =>
CoreAhbSRAM_LLol(3) <= CoreAhbSrAM_L01L;
when others =>
null
;
end case;
case (CoreAhBSRAM_Iii(10 downto 9)) is
when "00" =>
CoreAhbSRAM_ILol(0) <= CoreAhbSram_I01L;
when "01" =>
CorEAHBSRAM_ilol(1) <= CorEAHBSRAM_i01l;
when "10" =>
COreAhbSram_iLOL(2) <= CoreAhbSRAM_I01l;
when "11" =>
CoreAhbSraM_ILOL(3) <= CoreAhbSraM_I01L;
when others =>
null
;
end case;
case (CoREAHBSRAm_io1(10 downto 9)) is
when "00" =>
CorEAHBSRAM_l0i <= COREAHBSram_lill;
when "01" =>
CoreAhBSRAM_L0i <= COReAhbSram_iILL;
when "10" =>
COREAHBSram_l0i <= COreAhbSram_O0LL;
when "11" =>
CoreAhbSRAM_L0I <= COREAHBSram_l0ll;
when others =>
null
;
end case;
when 4 =>
CoreAhbSRAM_OL1 <= "10";
CoreAhbSram_LL1 <= "10";
CorEAHBSRAm_il1 <= "10";
COREAhbSram_oi1 <= "10";
COREAHBSram_iiil <= "00"&CoreAhbSraM_O0I(9 downto 0);
CoreAhbSraM_O0IL <= "00"&CorEAHBSRAM_o0i(9 downto 0);
COReAhbSram_l0IL <= "00"&COREAHBSram_o0i(9 downto 0);
CoreAHBSRAM_i0il <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhbSraM_O00L <= "00"&COREAHbSram_iii(9 downto 0);
COREAHBSram_l00l <= "00"&COreAhbSram_III(9 downto 0);
CoreAhbSraM_I00L <= "00"&COreAhbSram_iII(9 downto 0);
CoreAhbSRAM_O10l <= "00"&CoreAHBSRAM_iii(9 downto 0);
CoreAHBSRAM_oiol(3 downto 0) <= CoreAhbSrAM_LII(3 downto 0);
CoreAhBSRAM_LIol(3 downto 0) <= CoreAhBSRAM_LIi(7 downto 4);
COreAhbSram_iIOL(3 downto 0) <= CoreAhbSram_LII(3 downto 0);
COREAHBSram_o0ol(3 downto 0) <= COREAhbSram_lii(7 downto 4);
case (CoreAHBSRAM_o0i(10 downto 9)) is
when "00" =>
COREAhbSram_llol(1 downto 0) <= COreAhbSram_l01L&COReAhbSram_l01L;
when "01" =>
COREAhbSram_llol(1 downto 0) <= COreAhbSram_l01L&COreAhbSram_l01L;
when "10" =>
CoreAhbSraM_LLOL(3 downto 2) <= COREAhbSram_l01L&COREAhbSram_l01L;
when "11" =>
CoreAhbSram_LLOL(3 downto 2) <= COREAhbSram_l01L&COREAhbSram_l01L;
when others =>
null
;
end case;
case (CoreAhbSRAM_III(10 downto 9)) is
when "00" =>
COREAhbSram_iloL(1 downto 0) <= COReAhbSram_i01L&COREAhbSram_i01L;
when "01" =>
COREAhbSram_ilol(1 downto 0) <= COreAhbSram_I01L&COreAhbSram_i01L;
when "10" =>
CoreAhbSraM_ILOL(3 downto 2) <= CoreAhbSraM_I01L&CoreAHBSRAM_i01l;
when "11" =>
CoREAHBSRAm_ilol(3 downto 2) <= CoreAhbSram_I01L&CoreAhbSram_I01L;
when others =>
null
;
end case;
case (CoreAHBSRam_io1(10 downto 9)) is
when "00" =>
CoreAhBSRAM_l0i <= COREAHbSram_iILL(3 downto 0)&COREAhbSram_lilL(3 downto 0);
when "01" =>
CoreAHBSRAM_l0i <= CoreAhbSrAM_IILL(3 downto 0)&COReAhbSram_liLL(3 downto 0);
when "10" =>
COREAhbSram_l0I <= CoreAhbSram_L0LL(3 downto 0)&CoreAhbSraM_O0LL(3 downto 0);
when "11" =>
CoreAhbSrAM_L0I <= CoREAHBSRam_l0ll(3 downto 0)&CoREAHBSRam_o0ll(3 downto 0);
when others =>
null
;
end case;
when others =>
CoREAHBSram_ol1 <= "01";
CoreAhbSraM_LL1 <= "01";
COreAhbSram_iL1 <= "01";
COREAhbSram_oi1 <= "01";
CoreAhBSRAM_Iiil <= '0'&COREAHBSram_o0i(10 downto 0);
CoreAhbSram_O0IL <= '0'&CoreAhBSRAM_O0i(10 downto 0);
COreAhbSram_l0IL <= '0'&COREAhbSram_o0I(10 downto 0);
CoreAhbSraM_I0IL <= '0'&COREAHBSram_o0i(10 downto 0);
CoreAHBSRAM_O00l <= '0'&CorEAHBSRAM_iii(10 downto 0);
COREAhbSram_l00L <= '0'&CoreAhbSraM_III(10 downto 0);
COREAHBSram_i00l <= '0'&COREAHBSram_iii(10 downto 0);
CoreAHBSRAM_o10l <= '0'&CoreAhbSRAM_IIi(10 downto 0);
COreAhbSram_oIOL(1 downto 0) <= COREAHbSram_lii(1 downto 0);
COREAhbSram_lioL(1 downto 0) <= COREAHBSRam_lii(3 downto 2);
CoreAhbSRAM_IIOl(1 downto 0) <= CoreAhbSrAM_LII(5 downto 4);
COREAHBSram_o0ol(1 downto 0) <= CoreAHBSRAM_lii(7 downto 6);
COREAHBSram_llol(3 downto 0) <= CoreAhbSRAM_L01l&CoreAhBSRAM_l01l&COREAHBSram_l01l&COreAhbSram_L01L;
COReAhbSram_iLOL(3 downto 0) <= CoreAhbSraM_I01L&COREAhbSram_i01L&COreAhbSram_i01L&CoreAhbSraM_I01L;
COREAHBSram_l0i <= CoreAHBSRAM_L0ll(1 downto 0)&COREAhbSram_o0lL(1 downto 0)&COREAHbSram_iill(1 downto 0)&CoreAhbSram_LILL(1 downto 0);
end case;
when 2560 =>
case (CorEAHBSRAM_lo1) is
when 8 =>
COREAhbSram_ol1 <= "11";
CoreAhbSrAM_LL1 <= "11";
CoreAhbSram_IL1 <= "11";
CorEAHBSRAm_oi1 <= "11";
COreAhbSram_lI1 <= "11";
COREAhbSram_iiiL <= "000"&CoreAHBSRAM_o0i(8 downto 0);
CoREAHBSRAm_o0il <= "000"&CoreAhbSram_O0I(8 downto 0);
CorEAHBSRAm_l0il <= "000"&CoreAHBSRAM_O0i(8 downto 0);
CoreAhBSRAM_I0il <= "000"&CoreAHBSRAM_O0i(8 downto 0);
CoreAHBSram_o1IL <= "000"&CoreAHBSRAm_o0i(8 downto 0);
COREAhbSram_O00L <= "000"&COREAhbSram_III(8 downto 0);
CoreAhbSrAM_L00L <= "000"&CoreAhbSRAM_IIi(8 downto 0);
CoreAhbSraM_I00L <= "000"&CorEAHBSRAM_iii(8 downto 0);
CoreAhbSram_O10L <= "000"&CorEAHBSRAM_iii(8 downto 0);
CoreAhbSrAM_L10L <= "000"&COREAHBSRam_iii(8 downto 0);
CoreAHBSRAM_oiol <= CorEAHBSRAM_lii;
CorEAHBSRAM_liol <= CoreAhbSram_LII;
COReAhbSram_iiOL <= COREAHBSRam_lii;
CoreAHBSRAM_O0ol <= CoreAhbSrAM_LII;
CoreAhbSraM_L0OL <= COREAHbSram_lii;
case (COREAhbSram_o0i(11 downto 9)) is
when "000" =>
CoreAhBSRAM_Llol(0) <= CoreAhbSRAM_L01l;
when "001" =>
COreAhbSram_LLOL(1) <= COREAHBSram_l01l;
when "010" =>
CoreAhbSram_LLOL(2) <= COREAhbSram_L01L;
when "011" =>
COREAHbSram_lLOL(3) <= COREAhbSraM_L01l;
when "100" =>
CoreAhbSRAM_LLol(4) <= CoreAHBSRam_l01l;
when "101" =>
COreAhbSrAM_LLOl(1) <= CoreAHBSRAm_l01l;
when "110" =>
COreAhbSrAM_LLOl(2) <= CoreAHBSRam_l01l;
when "111" =>
COREAhbSram_LLOL(3) <= COREAhbSram_L01L;
when others =>
null
;
end case;
case (COREAhbSram_III(11 downto 9)) is
when "000" =>
COReAhbSraM_ILOL(0) <= CoreAhbSRAM_i01l;
when "001" =>
CoREAHBSram_iLOL(1) <= COREAhbSram_I01L;
when "010" =>
CoreAhbSRAM_ilol(2) <= CoreAhbSRAM_i01l;
when "011" =>
CoreAHBSRAm_ilol(3) <= CoreAhbSRAM_i01l;
when "100" =>
CoreAhbSRAM_Ilol(4) <= CoreAhBSRAM_i01l;
when "101" =>
CoreAhBSRam_ILOL(1) <= COREAHbSram_i01l;
when "110" =>
CoreAHBSRAM_ilol(2) <= CorEAHBSRAM_i01l;
when "111" =>
CoreAhbSrAM_ILOL(3) <= CoreAhbSram_I01L;
when others =>
null
;
end case;
case (CoreAhbSRAM_IO1(11 downto 9)) is
when "000" =>
COreAhbSram_l0I <= CoreAhbSram_LILL;
when "001" =>
CoreAhbSram_L0I <= CoreAhbSRAM_IIll;
when "010" =>
CoreAhbSraM_L0I <= CoREAHBSRam_o0ll;
when "011" =>
COREAhbSram_l0I <= CoreAHBSRAM_L0ll;
when "100" =>
COREAHBSram_l0i <= COreAhbSram_i0LL;
when "101" =>
COreAhbSram_l0I <= CoreAhbSraM_IILL;
when "110" =>
COREAHbSram_l0i <= CoreAhbSraM_O0LL;
when "111" =>
CoreAhbSrAM_L0I <= CoreAhBSRAM_L0ll;
when others =>
null
;
end case;
when 4 =>
CoreAhbSraM_OL1 <= "10";
CoreAhbSrAM_LL1 <= "10";
COREAHBSram_il1 <= "10";
CoREAHBSRAm_oi1 <= "10";
CoreAhbSraM_LI1 <= "11";
CoREAHBSRAm_iiil <= "00"&CoreAHBSRAM_o0i(9 downto 0);
CoREAHBSRam_o0il <= "00"&CoreAhbSrAM_O0I(9 downto 0);
CoreAHBSRAM_l0il <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhbSRAM_I0Il <= "00"&CoreAHBSRAM_o0i(9 downto 0);
CoreAhbSraM_O1IL <= "000"&CoreAhbSram_O0I(8 downto 0);
COReAhbSram_o00L <= "00"&CoreAHBSRAM_Iii(9 downto 0);
CoreAHBSRAM_l00l <= "00"&CoreAhbSrAM_III(9 downto 0);
CoreAHBSRAM_i00l <= "00"&CoreAHBSRAM_Iii(9 downto 0);
COREAHBSram_o10l <= "00"&COreAhbSram_III(9 downto 0);
CoreAHBSRAM_l10l <= "000"&CoreAHBSRAM_iii(8 downto 0);
CoreAhbSRAM_OIol(3 downto 0) <= COREAhbSram_lii(3 downto 0);
CoreAHBSRAM_liol(3 downto 0) <= CorEAHBSRAM_lii(7 downto 4);
CoreAhbSram_IIOL(3 downto 0) <= CoreAhbSrAM_LII(3 downto 0);
CoreAhbSraM_O0OL(3 downto 0) <= CoreAHBSRAM_Lii(7 downto 4);
COREAHBSram_l0ol <= CoreAhbSram_LII;
case (COREAhbSram_o0i(11 downto 9)) is
when "000" =>
CoreAhbSram_LLOL(1 downto 0) <= COREAHBSram_l01l&COREAHbSram_l01l;
when "001" =>
CoreAhbSRAM_LLOL(1 downto 0) <= COreAhbSram_l01L&COReAhbSraM_L01l;
when "010" =>
CoreAhbSRAM_LLOl(3 downto 2) <= CoreAhbSram_L01L&CoreAhbSraM_L01L;
when "011" =>
COREAhbSram_lloL(3 downto 2) <= CoreAhbSram_L01L&CoreAHBSRAM_l01l;
when "100" =>
CoreAhbSRAM_LLOl(4) <= CorEAHBSRAM_l01l;
when "101" =>
COreAhbSram_lLOL(1 downto 0) <= COREAhbSram_l01L&COREAhbSram_l01L;
when "110" =>
CoreAHBSRAM_Llol(3 downto 2) <= CorEAHBSRAm_l01l&CoreAhbSRAM_L01l;
when "111" =>
COReAhbSram_lLOL(3 downto 2) <= CoREAHBSRAm_l01l&CoreAhbSRAM_L01l;
when others =>
null
;
end case;
case (CoreAhbSRAM_III(11 downto 9)) is
when "000" =>
COREAhbSram_ilol(1 downto 0) <= COREAhbSram_i01L&COREAhbSram_i01L;
when "001" =>
CoreAhbSram_ILOL(1 downto 0) <= CoreAhbSram_I01L&CoreAhbSrAM_I01L;
when "010" =>
CoreAhbSRAM_ILOl(3 downto 2) <= COREAhbSram_i01L&CoreAhbSram_I01L;
when "011" =>
COreAhbSram_iLOL(3 downto 2) <= CoreAhbSram_I01L&CoreAhbSraM_I01L;
when "100" =>
CoreAhbSrAM_ILOL(4) <= COREAhbSram_i01L;
when "101" =>
COREAhbSram_iloL(1 downto 0) <= CoreAHBSRAM_i01l&COREAHBSRam_i01l;
when "110" =>
COREAHBSram_ilol(3 downto 2) <= COREAHBSram_i01l&COREAHBSram_i01l;
when "111" =>
COREAhbSram_ilOL(3 downto 2) <= COreAhbSrAM_I01l&COREAHbSram_i01L;
when others =>
null
;
end case;
case (COreAhbSrAM_IO1(11 downto 9)) is
when "000" =>
CorEAHBSRAM_l0i <= CoreAhbSram_IILL(3 downto 0)&CoreAhbSram_LILL(3 downto 0);
when "001" =>
CoreAhbSram_L0I <= COreAhbSram_iILL(3 downto 0)&COREAHBSram_lill(3 downto 0);
when "010" =>
CoreAhbSraM_L0I <= CorEAHBSRAM_l0ll(3 downto 0)&COREAHBSram_o0ll(3 downto 0);
when "011" =>
COREAHbSram_l0i <= CorEAHBSRAM_l0ll(3 downto 0)&CoreAhbSram_O0LL(3 downto 0);
when "100" =>
COREAhbSram_l0i <= COREAhbSram_i0lL;
when "101" =>
CoreAhbSraM_L0I <= COREAHbSram_iill(3 downto 0)&COREAHBSram_lill(3 downto 0);
when "110" =>
CoreAhbSRAM_L0I <= CoreAHBSram_l0lL(3 downto 0)&CoreAHBSRAM_o0ll(3 downto 0);
when "111" =>
CoreAhbSRAM_L0i <= CoreAhbSram_L0LL(3 downto 0)&CoreAhbSraM_O0LL(3 downto 0);
when others =>
null
;
end case;
when others =>
CoreAhbSram_OL1 <= "01";
COREAhbSram_ll1 <= "01";
CoreAhBSRAM_Il1 <= "01";
CoreAhbSRAM_OI1 <= "01";
CoreAhbSRAM_LI1 <= "11";
CoreAhbSram_IIIL <= '0'&CoreAHBSram_o0i(10 downto 0);
COREAhbSram_O0IL <= '0'&CoreAhbSRAM_O0i(10 downto 0);
CorEAHBSram_l0iL <= '0'&COREAHbSram_o0I(10 downto 0);
CoreAhBSRAM_i0il <= '0'&COREAHbSram_O0I(10 downto 0);
CoreAhbSRAM_o1il <= "000"&COReAhbSraM_O0I(8 downto 0);
CoreAhBSRAM_o00l <= '0'&COreAhbSrAM_III(10 downto 0);
COReAhbSraM_L00l <= '0'&CoreAhbSRAM_iii(10 downto 0);
COREAHbSram_I00L <= '0'&CoreAhBSRAM_iii(10 downto 0);
CoreAHBSRam_o10l <= '0'&CoreAHBSram_iiI(10 downto 0);
COreAhbSrAM_L10l <= "000"&CoREAHBSram_iiI(8 downto 0);
COREAHbSram_oIOL(1 downto 0) <= COREAhbSram_LII(1 downto 0);
CoreAhbSRAM_liol(1 downto 0) <= COREAHbSram_lII(3 downto 2);
CoreAhbSram_IIOL(1 downto 0) <= CorEAHBSRAm_lii(5 downto 4);
COREAHBSram_o0ol(1 downto 0) <= CoREAHBSram_lII(7 downto 6);
COREAHBSram_l0ol <= COREAHBSram_lii;
case (CoreAhbSram_O0I(11 downto 9)) is
when "000" =>
CoreAhbSraM_LLOL(3 downto 0) <= COREAhbSram_l01L&COREAHBSram_l01l&CoreAhBSRAM_L01l&CoreAhbSrAM_L01L;
when "001" =>
COREAhbSram_lloL(3 downto 0) <= COreAhbSram_l01L&COReAhbSram_l01L&CoreAhbSRAM_L01l&COreAhbSram_L01L;
when "010" =>
CoreAhbSrAM_LLOL(3 downto 0) <= CoreAhbSraM_L01l&CoreAhBSRAM_L01l&CoreAhbSram_L01L&COREAHbSram_l01l;
when "011" =>
COREAhbSram_lloL(3 downto 0) <= COREAHBSram_l01l&COREAhbSram_l01L&CoreAHBSRAM_L01l&CoreAhbSrAM_L01L;
when "100" =>
CoreAhbSraM_LLOL(4) <= COreAhbSram_L01L;
when "101" =>
CoreAhbSraM_LLOL(3 downto 0) <= COREAHBSram_l01l&COREAhbSram_l01L&CoreAHBSRAM_L01l&CoreAhbSraM_L01L;
when "110" =>
COREAhbSram_llol(3 downto 0) <= CoreAhbSRAM_L01l&CoreAhBSRAM_L01l&COreAhbSram_l01L&COREAhbSram_l01l;
when "111" =>
COREAHBSram_llol(3 downto 0) <= CoreAhbSRAM_L01l&COREAHBSram_l01l&CoreAhbSram_L01L&COREAhbSram_l01l;
when others =>
null
;
end case;
case (COReAhbSram_iiI(11 downto 9)) is
when "000" =>
CoreAhBSRAM_Ilol(3 downto 0) <= CoreAhbSram_I01L&CoreAhbSram_I01L&COREAhbSram_i01l&CorEAHBSRAm_i01l;
when "001" =>
CoreAHBSRAM_Ilol(3 downto 0) <= CoreAhbSram_I01L&CorEAHBSRAM_i01l&CoreAhbSram_I01L&COReAhbSram_i01L;
when "010" =>
CoreAhbSRAM_ILOl(3 downto 0) <= CoreAhbSram_I01L&CoreAhbSram_I01L&CoreAhbSrAM_I01L&COREAhbSram_i01L;
when "011" =>
CoREAHBSRAm_ilol(3 downto 0) <= COREAHBSRam_i01l&COREAhbSram_i01L&CorEAHBSRAM_i01l&CoreAhbSraM_I01L;
when "100" =>
COREAhbSram_iloL(4) <= CoreAHBSRAM_i01l;
when "101" =>
COREAHBSram_ilol(3 downto 0) <= COREAhbSram_i01l&COREAhbSram_i01L&CoreAhbSrAM_I01L&CoreAhbSram_I01L;
when "110" =>
COREAHBSram_ilol(3 downto 0) <= COReAhbSram_i01L&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAHBSRAM_i01l;
when "111" =>
CoreAHBSRAM_ilol(3 downto 0) <= CoreAhbSram_I01L&CoreAhbSrAM_I01L&COREAhbSram_i01L&CorEAHBSRAm_i01l;
when others =>
null
;
end case;
case (CoreAhbSraM_IO1(11 downto 9)) is
when "000" =>
COREAhbSram_l0i <= CoreAhbSram_L0LL(1 downto 0)&CoreAhbSram_O0LL(1 downto 0)&CoreAhbSRAM_IIll(1 downto 0)&CoreAHBSRAM_lill(1 downto 0);
when "001" =>
COREAHBSram_l0i <= CoreAHBSRAM_l0ll(1 downto 0)&CoreAhbSram_O0LL(1 downto 0)&CoreAhbSrAM_IILL(1 downto 0)&CoreAhbSram_LILL(1 downto 0);
when "010" =>
COREAHBSram_l0i <= CoreAhBSRAM_L0ll(1 downto 0)&CoreAhbSram_O0LL(1 downto 0)&CoreAHBSRAM_iill(1 downto 0)&CorEAHBSRAM_lill(1 downto 0);
when "011" =>
CoreAhbSRAM_L0I <= CoreAhbSram_L0LL(1 downto 0)&CoREAHBSRam_o0ll(1 downto 0)&COreAhbSram_iILL(1 downto 0)&COREAhbSram_lilL(1 downto 0);
when "100" =>
COreAhbSRAM_L0i <= CoreAhbSram_I0LL;
when "101" =>
COREAhbSram_l0i <= CorEAHBSRAm_l0ll(1 downto 0)&CoreAHBSRAM_o0ll(1 downto 0)&CoreAHBSRAM_iill(1 downto 0)&COREAhbSram_liLL(1 downto 0);
when "110" =>
COReAhbSram_l0I <= COREAhbSram_l0lL(1 downto 0)&CoreAhbSraM_O0LL(1 downto 0)&COReAhbSram_iILL(1 downto 0)&CoreAhbSRAM_LILL(1 downto 0);
when "111" =>
CoreAHBSRAM_l0i <= CoreAhbSrAM_L0LL(1 downto 0)&CoreAhbSraM_O0LL(1 downto 0)&CorEAHBSRAM_iill(1 downto 0)&CoreAhbSram_LILL(1 downto 0);
when others =>
null
;
end case;
end case;
when 3072 =>
case (COreAhbSram_lO1) is
when 8 =>
CorEAHBSRAM_ol1 <= "11";
CoreAHBSRAM_Ll1 <= "11";
CoreAhbSRAM_IL1 <= "11";
CoreAhbSRAM_oi1 <= "11";
CoreAHBSRAM_li1 <= "11";
CoreAhbSrAM_II1 <= "11";
CoreAHBSRAM_iiil <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoreAhbSraM_O0IL <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_L0Il <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoreAhbSram_I0IL <= "000"&COREAHbSram_o0i(8 downto 0);
COREAHBSRam_o1il <= "000"&CoreAhbSram_O0I(8 downto 0);
CoreAhbSram_L1IL <= "000"&COREAhbSram_o0i(8 downto 0);
CoreAhbSraM_O00L <= "000"&CoREAHBSRAm_iii(8 downto 0);
COREAhbSram_l00L <= "000"&CoreAhbSraM_III(8 downto 0);
CoreAhbSram_I00L <= "000"&COREAhbSram_iii(8 downto 0);
CoreAhbSrAM_O10L <= "000"&CoreAHBSRAM_iii(8 downto 0);
CoreAhbSraM_L10L <= "000"&CoreAhBSRAM_Iii(8 downto 0);
COreAhbSram_i10L <= "000"&COREAhbSram_III(8 downto 0);
CoreAhbSrAM_OIOL <= CoREAHBSRAm_lii;
CoreAhBSRAM_LIol <= CoreAhbSRAM_LII;
COREAhbSram_iiol <= CoreAhbSRAM_LII;
CoreAhbSraM_O0OL <= CoreAhbSram_LII;
COREAHBSRam_l0ol <= COreAhbSram_lII;
CoreAhbSRAM_I0Ol <= CoreAhbSrAM_LII;
case (COreAhbSram_o0I(11 downto 9)) is
when "000" =>
COREAHbSram_llol(0) <= COREAhbSram_l01L;
when "001" =>
CoreAHBSRAM_llol(1) <= CoreAhbSrAM_L01L;
when "010" =>
CorEAHBSRAM_llol(2) <= COREAHBSram_l01l;
when "011" =>
CoreAHBSRAM_Llol(3) <= CorEAHBSRAm_l01l;
when "100" =>
CoreAhbSram_LLOL(4) <= CoreAhbSraM_L01L;
when "101" =>
COREAhbSram_lloL(5) <= CoreAhbSram_L01L;
when "110" =>
CoreAhbSram_LLOL(2) <= COREAHBSRam_l01l;
when "111" =>
CoreAhbSRAM_LLOL(3) <= COREAhbSram_l01L;
when others =>
null
;
end case;
case (CoREAHBSRam_iii(11 downto 9)) is
when "000" =>
CoreAhbSraM_ILOL(0) <= COREAHBSram_i01l;
when "001" =>
CoreAhbSram_ILOL(1) <= COreAhbSram_I01L;
when "010" =>
CoREAHBSRAm_ilol(2) <= CoreAhbSram_I01L;
when "011" =>
CoreAHBSRAM_ilol(3) <= COREAHBSram_i01l;
when "100" =>
CoreAhbSRAM_ILOl(4) <= CoreAHBSRAM_i01l;
when "101" =>
COREAhbSram_ilOL(5) <= COREAHBSram_i01l;
when "110" =>
CoreAHBSRAM_ilol(2) <= CoreAHBSRAM_I01l;
when "111" =>
COREAhbSram_ilOL(3) <= CoreAhbSraM_I01L;
when others =>
null
;
end case;
case (COreAhbSram_iO1(11 downto 9)) is
when "000" =>
CoreAhbSrAM_L0I <= CoreAhbSram_LILL;
when "001" =>
COREAhbSram_l0I <= CoreAHBSRAM_iill;
when "010" =>
COREAHBSRam_l0i <= CoreAhBSRAM_o0ll;
when "011" =>
CoreAHBSRAm_l0i <= CoreAhbSRAM_L0ll;
when "100" =>
COREAhbSraM_L0I <= CorEAHBSram_i0LL;
when "101" =>
COREAhbSram_L0I <= CoreAhBSRAM_o1ll;
when "110" =>
COReAhbSraM_L0I <= CoreAHBSRAm_o0ll;
when "111" =>
CoreAhbSram_L0I <= CoreAhbSRAM_L0ll;
when others =>
null
;
end case;
when 4 =>
CoreAhbSRAM_Ol1 <= "10";
CoreAhBSRAM_ll1 <= "10";
CoreAhBSRAM_il1 <= "10";
CoreAhbSRAM_OI1 <= "10";
COREAHBSram_li1 <= "10";
CoREAHBSRAm_ii1 <= "10";
COREAhbSram_iiiL <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhbSram_O0IL <= "00"&CoreAhbSrAM_O0I(9 downto 0);
CoreAhbSram_L0IL <= "00"&CoreAhbSrAM_O0I(9 downto 0);
CoreAhbSram_I0IL <= "00"&COReAhbSram_o0I(9 downto 0);
COREAHBSram_o1il <= "00"&CoreAhbSram_O0I(9 downto 0);
COREAhbSram_l1iL <= "00"&COREAHbSram_o0i(9 downto 0);
CoreAhbSRAM_O00l <= "00"&CoreAhBSRAM_Iii(9 downto 0);
COReAhbSram_l00L <= "00"&CoreAhbSram_III(9 downto 0);
CoreAhbSram_I00L <= "00"&COREAhbSram_iii(9 downto 0);
CoreAHBSRAM_o10l <= "00"&CoreAhbSraM_III(9 downto 0);
COREAhbSram_l10L <= "00"&CoreAhbSRAM_III(9 downto 0);
CoreAhbSRAM_I10l <= "00"&COREAHbSram_iii(9 downto 0);
CoreAHBSRAM_oiol(3 downto 0) <= CoREAHBSRam_lii(3 downto 0);
COREAhbSram_lioL(3 downto 0) <= COReAhbSram_liI(7 downto 4);
CoreAhbSram_IIOL(3 downto 0) <= CoreAHBSRAM_lii(3 downto 0);
COREAHBSram_o0ol(3 downto 0) <= CoreAHBSRAM_lii(7 downto 4);
CoreAHBSRAM_L0ol(3 downto 0) <= CoreAHBSRAM_lii(3 downto 0);
CoreAhbSRAM_I0ol(3 downto 0) <= COREAHBSram_lii(7 downto 4);
case (CoreAHBSRAM_o0i(11 downto 9)) is
when "000" =>
CoreAhbSrAM_LLOL(1 downto 0) <= COREAHBSRam_l01l&COREAhbSram_l01l;
when "001" =>
CoreAhBSRAM_Llol(1 downto 0) <= CoreAhbSrAM_L01L&CoreAhBSRAM_L01l;
when "010" =>
CorEAHBSram_llOL(3 downto 2) <= COREAhbSram_l01L&COREAHBSram_l01l;
when "011" =>
CoREAHBSRAm_llol(3 downto 2) <= CoreAhbSraM_L01L&CoreAhbSrAM_L01L;
when "100" =>
CorEAHBSRAM_llol(5 downto 4) <= COREAHbSram_l01l&COREAHBSRam_l01l;
when "101" =>
CoreAhbSrAM_LLOL(5 downto 4) <= CoreAHBSRAM_l01l&CoreAhbSRAM_L01l;
when "110" =>
CoreAhbSrAM_LLOL(3 downto 2) <= CoreAhBSRAM_L01l&CoreAhbSRAM_L01l;
when "111" =>
COREAHBSram_llol(3 downto 2) <= CoreAhbSram_L01L&CoreAhbSrAM_L01L;
when others =>
null
;
end case;
case (CoreAhbSraM_III(11 downto 9)) is
when "000" =>
CoreAhbSraM_ILOL(1 downto 0) <= CoreAhbSrAM_I01L&CoreAhbSram_I01L;
when "001" =>
COREAhbSram_ilOL(1 downto 0) <= CoreAhbSram_I01L&COreAhbSram_i01L;
when "010" =>
CorEAHBSRAm_ilol(3 downto 2) <= CoreAhbSram_I01L&CoreAhbSram_I01L;
when "011" =>
COReAhbSram_ilOL(3 downto 2) <= CoreAhbSram_I01L&CoreAhbSraM_I01L;
when "100" =>
CoreAhbSrAM_ILOL(5 downto 4) <= CoreAhbSram_I01L&CoreAhbSram_I01L;
when "101" =>
CoreAhbSraM_ILOL(5 downto 4) <= COREAHBSram_i01l&COREAHBSram_i01l;
when "110" =>
COREAHBSRam_ilol(3 downto 2) <= COREAHbSram_i01l&COREAhbSram_i01L;
when "111" =>
CoreAHBSRAM_ilol(3 downto 2) <= COREAHBSram_i01l&COREAHBSram_i01l;
when others =>
null
;
end case;
case (CoreAHBSRAM_io1(11 downto 9)) is
when "000" =>
CoreAhbSraM_L0I <= CoreAhbSram_IILL(3 downto 0)&CorEAHBSRAM_lill(3 downto 0);
when "001" =>
CoreAHBSRAM_l0i <= CoreAhbSraM_IILL(3 downto 0)&COREAhbSram_lilL(3 downto 0);
when "010" =>
COREAhbSram_l0i <= CoreAhbSrAM_L0ll(3 downto 0)&CoreAHBSRAM_o0ll(3 downto 0);
when "011" =>
COREAHBSRam_l0i <= CoreAhbSrAM_L0LL(3 downto 0)&COReAhbSram_o0LL(3 downto 0);
when "100" =>
COREAhbSram_l0i <= CoreAhbSRAM_O1Ll(3 downto 0)&CoreAhbSrAM_I0LL(3 downto 0);
when "101" =>
CoreAhbSram_L0I <= COREAhbSram_o1lL(3 downto 0)&CoreAhbSRAM_I0ll(3 downto 0);
when "110" =>
CoreAhbSraM_L0I <= CoreAhbSraM_L0LL(3 downto 0)&CoreAhbSrAM_O0LL(3 downto 0);
when "111" =>
CoreAhbSrAM_L0I <= CoREAHBSRAm_l0ll(3 downto 0)&CoreAhbSRAM_O0LL(3 downto 0);
when others =>
null
;
end case;
when others =>
CoreAhbSraM_OL1 <= "01";
COREAhbSram_ll1 <= "01";
CoreAhbSRAM_IL1 <= "01";
COreAhbSraM_OI1 <= "01";
CoreAHBSRAM_li1 <= "10";
CoreAHBSRAM_ii1 <= "10";
CoreAhbSRAM_IIIl <= '0'&COreAhbSram_O0I(10 downto 0);
CoreAHBSRAM_O0il <= '0'&CoreAHBSRAM_O0i(10 downto 0);
CoreAhbSRAM_L0Il <= '0'&CoreAhBSRAM_O0i(10 downto 0);
CoreAhbSRAM_I0il <= '0'&COReAhbSram_o0I(10 downto 0);
COREAHbSram_o1il <= "00"&CoREAHBSRAm_o0i(9 downto 0);
CoreAhbSram_L1IL <= "00"&COreAhbSrAM_O0I(9 downto 0);
COREAhbSram_O00L <= '0'&CoreAhbSRAM_iii(10 downto 0);
COReAhbSraM_L00l <= '0'&CoreAHBSRam_iii(10 downto 0);
CoreAhbSRAM_i00l <= '0'&COREAHbSram_iII(10 downto 0);
CoreAhbSRAM_O10l <= '0'&CoreAhBSRAM_iii(10 downto 0);
CoreAhbSRAM_L10l <= "00"&CoREAHBSram_iiI(9 downto 0);
CoreAhBSRAM_i10l <= "00"&CoreAhBSRAm_iii(9 downto 0);
CoREAHBSram_oiOL(1 downto 0) <= COreAhbSrAM_LIi(1 downto 0);
CorEAHBSram_liOL(1 downto 0) <= COREAhbSram_LII(3 downto 2);
COreAhbSrAM_IIOl(1 downto 0) <= COREAHbSram_LII(5 downto 4);
CoreAhbSRAM_o0ol(1 downto 0) <= COreAhbSrAM_LIi(7 downto 6);
CoreAhBSRAM_l0ol(3 downto 0) <= CoREAHbSram_lII(3 downto 0);
COREAHbSram_i0ol(3 downto 0) <= COreAhbSram_lII(7 downto 4);
case (CoREAHBSRam_o0i(11 downto 9)) is
when "000" =>
CoreAhbSRAM_LLol(3 downto 0) <= COREAhbSram_l01l&COreAhbSram_l01L&CoreAhbSram_L01L&COREAHBSram_l01l;
when "001" =>
COREAHBSram_llol(3 downto 0) <= CoREAHBSram_l01l&COReAhbSram_l01L&COREAHBSRam_l01l&CoreAhbSRAM_L01l;
when "010" =>
COREAHBSram_llol(3 downto 0) <= COREAhbSrAM_L01l&CoreAhbSRAM_L01l&COReAhbSraM_L01l&COreAhbSRAM_L01l;
when "011" =>
COreAhbSram_lLOL(3 downto 0) <= CoreAhbSram_L01L&CoreAHBSRAM_l01l&COreAhbSram_l01L&COREAHBSram_l01l;
when "100" =>
CoreAHBSRAM_llol(5 downto 4) <= COREAhbSram_l01L&COREAhbSram_l01L;
when "101" =>
CoreAhbSRAM_LLol(5 downto 4) <= COREAHBSram_l01l&COREAHBSram_l01l;
when "110" =>
COREAhbSram_lloL(3 downto 0) <= COREAhbSram_L01L&CoreAhBSRAM_l01l&CoreAhbSram_L01L&COREAhbSram_l01L;
when "111" =>
CoreAhbSrAM_LLOL(3 downto 0) <= COREAHBSram_l01l&COREAhbSram_l01L&CoreAhBSRAM_L01l&CoreAhbSram_L01L;
when others =>
null
;
end case;
case (COREAhbSram_iii(11 downto 9)) is
when "000" =>
CoreAhbSraM_ILOL(3 downto 0) <= COREAHBSRam_i01l&COREAhbSram_i01L&COREAHbSram_i01l&COreAhbSRAM_I01l;
when "001" =>
CoreAHBSRAM_Ilol(3 downto 0) <= COREAHBSram_i01l&COREAHBSram_i01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L;
when "010" =>
COREAhbSram_iloL(3 downto 0) <= CoreAHBSRAM_i01l&CoreAhBSRAM_I01l&COREAhbSram_i01L&CorEAHBSRAm_i01l;
when "011" =>
COREAhbSram_iloL(3 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l&COReAhbSram_i01L&COREAHbSram_i01l;
when "100" =>
CoreAhbSram_ILOL(5 downto 4) <= COREAHBSram_i01l&COReAhbSram_i01L;
when "101" =>
CoREAHBSRAm_ilol(5 downto 4) <= COREAHBSram_i01l&COREAHBSram_i01l;
when "110" =>
CoreAHBSRAM_ilol(3 downto 0) <= CorEAHBSRAm_i01l&COREAHbSram_i01l&CoreAhbSRAM_I01l&COREAhbSram_i01L;
when "111" =>
CoreAHBSRAM_ilol(3 downto 0) <= CoreAHBSRAM_i01l&COREAHBSram_i01l&CoreAhbSram_I01L&COREAHBSRam_i01l;
when others =>
null
;
end case;
case (CoreAhbSraM_IO1(11 downto 9)) is
when "000" =>
CoreAHBSRAM_l0i <= COReAhbSram_l0LL(1 downto 0)&CoreAhbSram_O0LL(1 downto 0)&CoREAHBSRAm_iill(1 downto 0)&COREAHBSram_lill(1 downto 0);
when "001" =>
CorEAHBSRam_l0i <= CoreAHBSRAM_l0ll(1 downto 0)&CoreAHBSRAM_O0ll(1 downto 0)&COREAhbSram_iilL(1 downto 0)&CoreAhbSram_LILL(1 downto 0);
when "010" =>
CoreAHBSRAM_l0i <= COREAHBSram_l0ll(1 downto 0)&CoreAhbSram_O0LL(1 downto 0)&COREAHbSram_iill(1 downto 0)&COREAHBSram_lill(1 downto 0);
when "011" =>
COREAhbSram_l0i <= CoreAHBSRAM_l0ll(1 downto 0)&CoreAhbSrAM_O0LL(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&CoreAhbSrAM_LILL(1 downto 0);
when "100" =>
CoreAhbSram_L0I <= COREAhbSram_o1LL(3 downto 0)&COREAHBSRam_i0ll(3 downto 0);
when "101" =>
CoreAhbSRAM_L0I <= CoreAhbSraM_O1LL(3 downto 0)&COREAhbSram_i0LL(3 downto 0);
when "110" =>
CoreAhbSrAM_L0I <= CoreAhBSRAM_L0ll(1 downto 0)&CoreAhbSrAM_O0LL(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&COREAHBSRam_lill(1 downto 0);
when "111" =>
COREAhbSram_l0i <= CoreAhbSram_L0LL(1 downto 0)&CoreAhbSRAM_O0Ll(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&COREAHBSram_lill(1 downto 0);
when others =>
null
;
end case;
end case;
when 3584 =>
case (COReAhbSram_lO1) is
when 8 =>
CoreAhbSRAM_OL1 <= "11";
CoreAhbSraM_LL1 <= "11";
COREAhbSram_il1 <= "11";
CoreAhbSram_OI1 <= "11";
COREAHBSRam_li1 <= "11";
CoreAhbSram_II1 <= "11";
CoreAhbSraM_O01 <= "11";
CoreAhbSram_IIIL <= "000"&CoREAHBSRAm_o0i(8 downto 0);
COREAHBSram_o0il <= "000"&CoreAHBSRAM_o0i(8 downto 0);
CoreAHBSRAM_l0il <= "000"&COREAhbSram_o0i(8 downto 0);
COreAhbSram_i0IL <= "000"&COREAHbSram_o0i(8 downto 0);
COREAHbSram_o1il <= "000"&CoreAHBSRAM_o0i(8 downto 0);
COReAhbSram_l1IL <= "000"&CoreAhbSram_O0I(8 downto 0);
COReAhbSram_i1IL <= "000"&COREAhbSram_o0i(8 downto 0);
COREAHbSram_o00l <= "000"&CoreAhbSraM_III(8 downto 0);
COREAHBSram_l00l <= "000"&COREAhbSram_iii(8 downto 0);
COREAHBSram_i00l <= "000"&COREAHbSram_iii(8 downto 0);
COREAHbSram_o10l <= "000"&CoreAHBSRAM_iii(8 downto 0);
CoreAhbSram_L10L <= "000"&COREAHBSram_iii(8 downto 0);
CoreAHBSRam_i10l <= "000"&COREAHBSram_iii(8 downto 0);
COREAhbSram_oo1L <= "000"&COREAHbSram_iii(8 downto 0);
COreAhbSram_OIOL <= COREAhbSram_lii;
CoreAHBSRAM_liol <= CoreAhbSram_LII;
COREAHBSRam_iiol <= COREAHBSram_lii;
CoreAHBSRAM_o0ol <= CoreAhbSraM_LII;
COREAhbSram_l0ol <= CoreAHBSRAM_lii;
CoreAhbSram_I0OL <= COREAhbSram_lii;
COREAHBSRam_o1ol <= CoreAhbSram_LII;
case (CoreAhbSraM_O0I(11 downto 9)) is
when "000" =>
CoreAhbSraM_LLOL(0) <= CoreAhbSRAM_L01l;
when "001" =>
CorEAHBSRAM_llol(1) <= COREAHBSram_l01l;
when "010" =>
CoreAhBSRAM_Llol(2) <= COREAhbSram_l01l;
when "011" =>
CoreAhbSram_LLOL(3) <= CoreAhbSRAM_L01l;
when "100" =>
CoreAhbSram_LLOL(4) <= CoreAhbSraM_L01L;
when "101" =>
CoREAHBSRam_llol(5) <= CoREAHbSram_l01L;
when "110" =>
COREAhbSram_LLOL(6) <= CoreAhbSram_l01L;
when "111" =>
COREAhbSram_LLOL(3) <= CoreAHBSRAm_l01l;
when others =>
null
;
end case;
case (CoreAHBSram_iiI(11 downto 9)) is
when "000" =>
CoreAHBSram_iloL(0) <= CoreAhBSRAM_i01l;
when "001" =>
COReAhbSraM_ILOL(1) <= CoreAhBSRAM_i01l;
when "010" =>
CoreAhBSRAM_ilol(2) <= CoREAHBSram_i01L;
when "011" =>
COREAhbSram_ILOL(3) <= CoreAHBSRAm_i01l;
when "100" =>
COReAhbSraM_ILOL(4) <= CoreAHBSRam_i01l;
when "101" =>
CoreAhbSRAM_ilol(5) <= COREAhbSram_I01L;
when "110" =>
COREAHBSram_ilol(6) <= CoreAHBSRAM_i01l;
when "111" =>
COREAhbSram_iloL(3) <= CorEAHBSRAM_i01l;
when others =>
null
;
end case;
case (CoreAhbSrAM_IO1(11 downto 9)) is
when "000" =>
CoreAHBSRAM_L0i <= COREAHBSram_lill;
when "001" =>
CoreAhbSram_L0I <= CoreAHBSRAM_iill;
when "010" =>
CoreAhbSRAM_L0i <= COREAhbSram_o0ll;
when "011" =>
CoreAhbSram_L0I <= COREAhbSram_l0lL;
when "100" =>
CoreAhbSram_L0I <= COREAhbSram_i0lL;
when "101" =>
COREAHBSram_l0i <= CoreAHBSRAM_o1ll;
when "110" =>
CoreAhbSRAM_L0i <= CoreAHBSRAM_l1ll;
when "111" =>
COreAhbSram_L0I <= COREAHBSram_l0ll;
when others =>
null
;
end case;
when 4 =>
COREAhbSram_ol1 <= "10";
CoreAhBSRAM_LL1 <= "10";
COREAhbSram_il1 <= "10";
COREAHBSram_oi1 <= "10";
CoreAhbSrAM_LI1 <= "10";
COREAHBSram_ii1 <= "10";
COReAhbSram_o01 <= "11";
COreAhbSram_IIIL <= "00"&COReAhbSram_o0I(9 downto 0);
CorEAHBSRAM_o0il <= "00"&CoreAhbSraM_O0I(9 downto 0);
COREAhbSram_l0IL <= "00"&CoreAhbSram_O0I(9 downto 0);
COREAhbSram_i0iL <= "00"&COREAHbSram_o0i(9 downto 0);
COReAhbSram_o1IL <= "00"&CoreAhbSRAM_O0i(9 downto 0);
COREAHbSram_l1il <= "00"&COREAHbSram_o0i(9 downto 0);
CoreAhbSram_I1IL <= "000"&CoreAhbSram_O0I(8 downto 0);
COREAHbSram_o00l <= "00"&COReAhbSram_iiI(9 downto 0);
COREAHBSRam_l00l <= "00"&CoreAhbSraM_III(9 downto 0);
CorEAHBSRAM_i00l <= "00"&CoreAhbSraM_III(9 downto 0);
CorEAHBSRAm_o10l <= "00"&CoREAHBSRAm_iii(9 downto 0);
CoreAhbSram_L10L <= "00"&CoreAhbSram_III(9 downto 0);
CoreAhbSRAM_I10l <= "00"&CoreAHBSRAM_iii(9 downto 0);
COREAHBSram_oo1l <= "000"&CorEAHBSRAM_iii(8 downto 0);
CoreAhbSRAM_OIol(3 downto 0) <= CoreAhbSram_LII(3 downto 0);
COReAhbSram_lIOL(3 downto 0) <= CoreAHBSRAM_lii(7 downto 4);
CoreAhbSRAM_IIOl(3 downto 0) <= CoREAHBSRAm_lii(3 downto 0);
CoreAhbSRAM_O0Ol(3 downto 0) <= CoreAhBSRAM_Lii(7 downto 4);
COREAHbSram_l0ol(3 downto 0) <= COREAHBSRam_lii(3 downto 0);
CoreAhBSRAM_I0ol(3 downto 0) <= CoreAhbSram_LII(7 downto 4);
CoreAhbSraM_O1OL <= COREAhbSram_lii;
case (COREAHBSram_o0i(11 downto 9)) is
when "000" =>
COREAHbSram_llol(1 downto 0) <= COREAHBSRam_l01l&COREAhbSram_l01L;
when "001" =>
COREAHBSram_llol(1 downto 0) <= COReAhbSram_l01L&COReAhbSram_l01L;
when "010" =>
CoreAhbSraM_LLOL(3 downto 2) <= CoreAhbSram_L01L&CoreAhbSram_L01L;
when "011" =>
COREAHBSRam_llol(3 downto 2) <= COreAhbSram_l01L&COreAhbSram_l01L;
when "100" =>
COREAhbSram_llOL(5 downto 4) <= CoreAhbSraM_L01L&CoreAhbSram_L01L;
when "101" =>
CoreAhbSRAM_LLol(5 downto 4) <= CoreAhBSRAM_l01l&CoreAHBSRam_l01l;
when "110" =>
CoreAhbSRAM_LLol(6) <= CoreAhBSRAm_l01l;
when "111" =>
CoreAhbSRAM_LLol(3 downto 2) <= CoreAhbSram_L01L&CoreAhbSraM_L01L;
when others =>
null
;
end case;
case (COREAHbSram_iii(11 downto 9)) is
when "000" =>
CoreAhbSram_ILOL(1 downto 0) <= CorEAHBSRam_i01l&CoreAHBSRAM_I01l;
when "001" =>
CoreAhbSram_ILOL(1 downto 0) <= COREAHBSram_i01l&COREAhbSram_i01L;
when "010" =>
COReAhbSram_ilOL(3 downto 2) <= CoreAhbSraM_I01L&CorEAHBSRAM_i01l;
when "011" =>
CoREAHBSRAm_ilol(3 downto 2) <= CoreAhbSram_I01L&CoreAhbSrAM_I01L;
when "100" =>
COREAhbSram_iloL(5 downto 4) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l;
when "101" =>
COREAHBSram_ilol(5 downto 4) <= COREAhbSram_i01L&CoreAhbSraM_I01L;
when "110" =>
CoreAhBSRAM_Ilol(6) <= CoreAhbSram_I01L;
when "111" =>
CoreAhbSram_ILOL(3 downto 2) <= CoreAhbSraM_I01L&COReAhbSram_i01L;
when others =>
null
;
end case;
case (CoreAhbSram_IO1(11 downto 9)) is
when "000" =>
CoreAhbSraM_L0I <= COREAHBSram_iill(3 downto 0)&COReAhbSraM_LILL(3 downto 0);
when "001" =>
COREAHBSram_l0i <= CoreAhbSrAM_IILL(3 downto 0)&COREAHBSram_lill(3 downto 0);
when "010" =>
CoreAhbSraM_L0I <= CoreAhbSram_L0LL(3 downto 0)&CoreAhbSRAM_O0Ll(3 downto 0);
when "011" =>
COreAhbSram_l0I <= COREAhbSram_l0lL(3 downto 0)&CoreAhBSRAM_O0ll(3 downto 0);
when "100" =>
COREAHBSram_l0i <= CoreAhbSrAM_O1LL(3 downto 0)&COREAHBSram_i0ll(3 downto 0);
when "101" =>
COREAHbSram_l0i <= COREAHBSRam_o1ll(3 downto 0)&CoreAhbSrAM_I0LL(3 downto 0);
when "110" =>
COReAhbSram_l0I <= CoreAhbSraM_L1LL;
when "111" =>
COREAhbSram_l0I <= CoreAhbSRAM_L0ll(3 downto 0)&CoreAhbSRAM_O0Ll(3 downto 0);
when others =>
null
;
end case;
when others =>
CoreAhbSRAM_OL1 <= "01";
COreAhbSram_lL1 <= "01";
CoreAhbSram_IL1 <= "01";
CoreAhbSraM_OI1 <= "01";
CoreAhbSrAM_LI1 <= "10";
COREAhbSram_ii1 <= "10";
COReAhbSram_o01 <= "11";
COREAhbSram_iiiL <= '0'&CoreAhbSrAM_O0I(10 downto 0);
COREAHBSram_o0il <= '0'&CoreAhbSRAM_O0I(10 downto 0);
CoreAhbSram_L0IL <= '0'&COREAHBSram_o0i(10 downto 0);
COREAHbSram_i0il <= '0'&COReAhbSraM_O0I(10 downto 0);
CorEAHBSram_o1IL <= "00"&CoreAhBSRAM_o0i(9 downto 0);
CoreAhbSRAM_L1il <= "00"&CoreAHBSRAm_o0i(9 downto 0);
CoreAhbSRAM_I1il <= "000"&COREAhbSram_O0I(8 downto 0);
CoreAhbSram_O00L <= '0'&COReAhbSram_iII(10 downto 0);
CoreAhbSram_L00L <= '0'&COREAHbSram_iii(10 downto 0);
COREAhbSram_i00L <= '0'&COREAHbSram_iii(10 downto 0);
CoREAHBSRAm_o10l <= '0'&CoREAHBSRAm_iii(10 downto 0);
CoreAHBSRAM_l10l <= "00"&CoreAhbSram_III(9 downto 0);
CoreAhbSram_I10L <= "00"&COreAhbSram_iII(9 downto 0);
COREAHBSram_oo1l <= "000"&CoreAhbSram_III(8 downto 0);
COreAhbSram_OIOL(1 downto 0) <= COREAhbSram_LII(1 downto 0);
CoreAHBSRam_liol(1 downto 0) <= CoreAhBSRAM_lii(3 downto 2);
CoreAhbSRAM_Iiol(1 downto 0) <= COREAhbSram_LII(5 downto 4);
COREAhbSram_O0OL(1 downto 0) <= COreAhbSRAM_Lii(7 downto 6);
CoreAhbSRAM_L0ol(3 downto 0) <= COreAhbSRAM_Lii(3 downto 0);
CoreAhbSRAM_i0ol(3 downto 0) <= COREAHbSram_lII(7 downto 4);
CoREAHbSram_o1OL <= CoreAhBSRAM_lii;
case (CoreAhbSRAM_o0i(11 downto 9)) is
when "000" =>
COREAhbSram_LLOL(3 downto 0) <= COreAhbSrAM_L01l&CoreAhbSRAM_L01l&CoreAHBSRAm_l01l&CoreAHBSRAM_l01l;
when "001" =>
CoreAhBSRAM_llol(3 downto 0) <= CoreAHBSram_l01L&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COREAhbSraM_L01l;
when "010" =>
COREAhbSram_LLOL(3 downto 0) <= CoREAHBSram_l01L&COreAhbSRAM_L01l&COREAhbSram_L01L&COReAhbSraM_L01L;
when "011" =>
CoreAhbSRAM_Llol(3 downto 0) <= COReAhbSraM_L01l&CorEAHBSRam_l01L&CoreAHBSRam_l01L&CoreAHBSram_l01L;
when "100" =>
COREAHBSram_llol(5 downto 4) <= CoreAhbSRAM_L01l&COREAHBSram_l01l;
when "101" =>
COReAhbSram_llOL(5 downto 4) <= CoreAHBSRAM_l01l&CorEAHBSRAM_l01l;
when "110" =>
COREAHbSram_llol(6) <= COREAHBSram_l01l;
when "111" =>
CoreAhbSrAM_LLOL(3 downto 0) <= COREAhbSram_l01l&COREAhbSram_l01L&CoreAHBSRAM_l01l&CoreAhbSram_L01L;
when others =>
null
;
end case;
case (CoreAhbSrAM_III(11 downto 9)) is
when "000" =>
CoreAhbSraM_ILOL(3 downto 0) <= CorEAHBSRAM_i01l&CoreAhbSraM_I01L&CoreAhbSram_I01L&CorEAHBSRAM_i01l;
when "001" =>
COreAhbSram_iLOL(3 downto 0) <= CoreAhbSRAM_I01l&CoreAhBSRAM_I01l&CoreAhbSraM_I01L&CoreAhbSram_I01L;
when "010" =>
CoreAhbSram_ILOL(3 downto 0) <= COREAHBSRam_i01l&COREAHbSram_i01l&CoreAhbSraM_I01L&CoreAhbSram_I01L;
when "011" =>
CoreAhbSram_ILOL(3 downto 0) <= CoreAhbSRAM_I01l&COREAHBSram_i01l&CoreAhbSraM_I01L&COreAhbSram_i01L;
when "100" =>
COREAhbSram_ilol(5 downto 4) <= COReAhbSraM_I01l&CoreAhbSrAM_I01L;
when "101" =>
CoREAHBSRAm_ilol(5 downto 4) <= CoreAhbSraM_I01L&CoreAhbSram_I01L;
when "110" =>
CoreAHBSRAM_ilol(6) <= COREAHbSram_i01l;
when "111" =>
CorEAHBSRAM_ilol(3 downto 0) <= CoreAHBSRAM_i01l&COREAHBSram_i01l&CoreAhbSraM_I01L&COReAhbSram_i01L;
when others =>
null
;
end case;
case (CoreAhbSRAM_IO1(11 downto 9)) is
when "000" =>
COReAhbSram_l0I <= CoreAhBSRAM_L0ll(1 downto 0)&CoreAhBSRAM_O0ll(1 downto 0)&CoreAhbSRAM_IILl(1 downto 0)&CoreAhbSrAM_LILL(1 downto 0);
when "001" =>
CoreAHBSRAM_l0i <= CoreAhbSrAM_L0LL(1 downto 0)&CoreAhbSram_O0LL(1 downto 0)&COREAhbSram_iilL(1 downto 0)&COREAhbSram_lilL(1 downto 0);
when "010" =>
COreAhbSram_l0I <= COREAHBSram_l0ll(1 downto 0)&COREAHBSram_o0ll(1 downto 0)&COREAHBSram_iill(1 downto 0)&COREAHBSram_lill(1 downto 0);
when "011" =>
CoreAhbSram_L0I <= CoreAhbSraM_L0LL(1 downto 0)&COREAHBSRam_o0ll(1 downto 0)&CoREAHBSRAm_iill(1 downto 0)&COREAHbSram_lill(1 downto 0);
when "100" =>
CoREAHBSRAm_l0i <= CoreAHBSRAM_O1ll(3 downto 0)&COREAHBSram_i0ll(3 downto 0);
when "101" =>
CorEAHBSRAM_l0i <= CoreAhbSraM_O1LL(3 downto 0)&COREAhbSram_i0LL(3 downto 0);
when "110" =>
CoREAHBSRAm_l0i <= COREAhbSram_l1lL;
when "111" =>
COREAhbSram_l0I <= CoREAHBSRAm_l0ll(1 downto 0)&CoreAhbSram_O0LL(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&COReAhbSram_liLL(1 downto 0);
when others =>
null
;
end case;
end case;
when 4096 =>
case (COREAHBSRam_lo1) is
when 8 =>
CoreAhbSram_OL1 <= "11";
CoreAHBSRAM_ll1 <= "11";
CoreAhbSRAM_IL1 <= "11";
CoREAHBSRAm_oi1 <= "11";
CoreAhbSram_LI1 <= "11";
COReAhbSram_ii1 <= "11";
COREAhbSram_o01 <= "11";
CoreAhbSRAM_L01 <= "11";
COREAHBSRam_iiil <= "000"&COREAHBSRam_o0i(8 downto 0);
CoreAHBSRAM_O0il <= "000"&COREAHBSRam_o0i(8 downto 0);
COREAHBSram_l0il <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_I0il <= "000"&CoreAhbSRAM_O0I(8 downto 0);
CoreAhbSram_O1IL <= "000"&CoreAhbSram_O0I(8 downto 0);
COreAhbSram_l1IL <= "000"&CoreAhBSRAM_O0i(8 downto 0);
CoreAhbSram_I1IL <= "000"&CoREAHBSRAm_o0i(8 downto 0);
COREAhbSram_oo0L <= "000"&COREAHbSram_o0i(8 downto 0);
COREAhbSram_o00l <= "000"&COREAhbSram_iiI(8 downto 0);
COREAHBSRam_l00l <= "000"&CoreAhbSram_III(8 downto 0);
COREAHBSRam_i00l <= "000"&COREAHBSram_iii(8 downto 0);
COREAHBSram_o10l <= "000"&CoreAhbSRAM_III(8 downto 0);
CoreAhbSrAM_L10L <= "000"&CoreAhbSraM_III(8 downto 0);
CoreAHBSRAM_I10l <= "000"&CoreAHBSRAM_iii(8 downto 0);
COreAhbSrAM_OO1l <= "000"&CoreAHBSRAM_Iii(8 downto 0);
CoreAHBSRAM_lo1l <= "000"&CoreAhbSram_III(8 downto 0);
COREAHBSram_oiol <= COReAhbSram_LII;
COREAHbSram_lIOL <= CoreAhbSRAM_LII;
CoreAhbSraM_IIOL <= COreAhbSram_lII;
COREAhbSram_o0oL <= CoREAHBSRAm_lii;
CoreAhbSRAM_L0ol <= COreAhbSram_lII;
CoreAHBSRAM_i0ol <= CoreAhbSraM_LII;
COREAhbSram_o1oL <= COREAHbSram_lii;
COREAHBSram_l1ol <= CoreAhbSram_LII;
case (CorEAHBSram_o0I(11 downto 9)) is
when "000" =>
COReAhbSram_llOL(0) <= CorEAHBSram_l01L;
when "001" =>
COreAhbSram_lLOL(1) <= COREAhbSram_l01L;
when "010" =>
CoreAhbSrAM_LLOL(2) <= COREAHBSram_l01l;
when "011" =>
COREAhbSram_lloL(3) <= CoreAhbSram_L01L;
when "100" =>
CoreAhbSRAM_LLOl(4) <= COREAHBSram_l01l;
when "101" =>
CoreAHBSRAM_llol(5) <= CoreAhbSraM_L01L;
when "110" =>
COREAHbSram_llol(6) <= CoreAHBSRAM_L01l;
when "111" =>
COREAHBSRam_llol(7) <= COReAhbSram_l01L;
when others =>
null
;
end case;
case (COREAHBSram_iii(11 downto 9)) is
when "000" =>
COREAHbSram_ilol(0) <= COReAhbSram_i01L;
when "001" =>
CoreAHBSRAM_Ilol(1) <= CoreAhBSRAM_I01l;
when "010" =>
COreAhbSram_iLOL(2) <= CoreAhbSRAM_I01l;
when "011" =>
CoreAhbSram_ILOL(3) <= CoreAhbSrAM_I01L;
when "100" =>
CoreAhbSram_ILOL(4) <= CoreAhbSraM_I01L;
when "101" =>
CoREAHBSRAm_ilol(5) <= CorEAHBSRAm_i01l;
when "110" =>
CoreAhbSram_ILOL(6) <= COREAHbSram_i01l;
when "111" =>
CorEAHBSRAm_ilol(7) <= COREAHbSram_i01l;
when others =>
null
;
end case;
case (CoreAhbSRAM_IO1(11 downto 9)) is
when "000" =>
COREAhbSram_l0i <= COREAHBSRam_lill;
when "001" =>
COReAhbSram_l0I <= CoreAhbSRAM_IIll;
when "010" =>
COREAHbSram_l0i <= COREAHBSram_o0ll;
when "011" =>
COREAHBSRam_l0i <= COREAHBSram_l0ll;
when "100" =>
CoreAhBSRAM_L0i <= CoreAhbSRAM_I0ll;
when "101" =>
CoreAHBSRAM_l0i <= COREAHBSRam_o1ll;
when "110" =>
COReAhbSram_l0I <= COREAhbSram_l1lL;
when "111" =>
CoreAhbSraM_L0I <= COREAhbSram_I1LL;
when others =>
null
;
end case;
when 4 =>
CoreAHBSRAm_ol1 <= "10";
CoreAhbSRAM_ll1 <= "10";
CorEAHBSram_il1 <= "10";
CoreAhbSram_OI1 <= "10";
CoreAhbSraM_LI1 <= "10";
CoreAhbSram_II1 <= "10";
CoreAhbSRAM_O01 <= "10";
COREAhbSram_l01 <= "10";
CoreAhbSram_IIIL <= "00"&COReAhbSram_o0I(9 downto 0);
COREAHBSram_o0il <= "00"&CoreAHBSRAM_O0i(9 downto 0);
CorEAHBSRAm_l0il <= "00"&CoreAHBSRAM_o0i(9 downto 0);
CoreAhbSraM_I0IL <= "00"&COReAhbSram_o0I(9 downto 0);
CoreAhbSraM_O1IL <= "00"&CoreAhbSraM_O0I(9 downto 0);
COREAHbSram_l1il <= "00"&COREAHbSram_o0i(9 downto 0);
CoreAhbSRAM_I1Il <= "00"&CoreAhbSram_O0I(9 downto 0);
COreAhbSram_oO0L <= "00"&CoreAhbSRAM_O0I(9 downto 0);
COREAhbSram_o00L <= "00"&COreAhbSram_iII(9 downto 0);
COREAhbSram_l00l <= "00"&CoreAhbSraM_III(9 downto 0);
COREAHbSram_i00l <= "00"&CoreAhbSraM_III(9 downto 0);
COREAHbSram_o10l <= "00"&CoREAHBSRAm_iii(9 downto 0);
CorEAHBSRAM_l10l <= "00"&COREAhbSram_iii(9 downto 0);
CoreAhbSRAM_I10l <= "00"&CoreAhbSrAM_III(9 downto 0);
CoreAhbSram_OO1L <= "00"&COReAhbSraM_III(9 downto 0);
COREAhbSram_LO1L <= "00"&CoreAhbSRAM_IIi(9 downto 0);
COREAhbSram_OIOL(3 downto 0) <= CoREAHBSRAm_lii(3 downto 0);
COREAHBSRam_liol(3 downto 0) <= CoreAhbSram_LII(7 downto 4);
CoreAhbSram_IIOL(3 downto 0) <= COreAhbSram_lII(3 downto 0);
CoREAHBSRAm_o0ol(3 downto 0) <= CoreAhbSRAM_LII(7 downto 4);
CoreAhbSRAM_L0ol(3 downto 0) <= CoreAhbSraM_LII(3 downto 0);
CoREAHBSRAm_i0ol(3 downto 0) <= COREAHBSram_lii(7 downto 4);
COREAHBSram_o1ol(3 downto 0) <= COreAhbSram_LII(3 downto 0);
COREAHBSram_l1ol(3 downto 0) <= CoreAHBSRAM_lii(7 downto 4);
case (CoreAHBSRAM_o0i(11 downto 9)) is
when "000" =>
COREAhbSram_lloL(1 downto 0) <= CoreAhbSRAM_L01l&CoreAhbSRAM_L01l;
when "001" =>
COREAhbSram_lloL(1 downto 0) <= COREAHbSram_l01l&COREAHBSram_l01l;
when "010" =>
CoreAhBSRAM_Llol(3 downto 2) <= COREAHBSram_l01l&COREAHBSram_l01l;
when "011" =>
CoreAhbSrAM_LLOL(3 downto 2) <= CoreAhbSraM_L01L&COREAHBSram_l01l;
when "100" =>
COREAHBSram_llol(5 downto 4) <= COREAhbSram_l01L&COREAhbSram_l01L;
when "101" =>
CoreAhbSraM_LLOL(5 downto 4) <= CoreAhbSRAM_L01l&CoreAhbSraM_L01L;
when "110" =>
CoreAhbSRAM_LLOl(7 downto 6) <= CoREAHBSRAm_l01l&COREAHBSram_l01l;
when "111" =>
CoreAHBSRAM_llol(7 downto 6) <= CoREAHBSRAm_l01l&CoreAhBSRAM_L01l;
when others =>
null
;
end case;
case (CorEAHBSRam_iii(11 downto 9)) is
when "000" =>
COREAhbSram_iloL(1 downto 0) <= CoreAhbSram_I01L&CorEAHBSRAM_i01l;
when "001" =>
CoreAhbSRAM_ILOl(1 downto 0) <= COREAhbSram_i01l&CoreAhbSram_I01L;
when "010" =>
COREAHBSram_ilol(3 downto 2) <= COreAhbSram_I01L&CoreAhbSrAM_I01L;
when "011" =>
CoREAHBSRAm_ilol(3 downto 2) <= COREAHbSram_i01l&COREAhbSram_I01L;
when "100" =>
CoreAHBSRAM_ilol(5 downto 4) <= COREAhbSram_i01L&COreAhbSram_i01L;
when "101" =>
CoREAHBSRam_ilol(5 downto 4) <= COreAhbSram_I01L&CoreAhbSraM_I01L;
when "110" =>
CoreAhbSRAM_ILol(7 downto 6) <= CoreAhbSraM_I01L&CoreAhBSRAM_I01l;
when "111" =>
CorEAHBSRAm_ilol(7 downto 6) <= COREAHBSram_i01l&COREAHBSram_i01l;
when others =>
null
;
end case;
case (COREAhbSram_IO1(11 downto 9)) is
when "000" =>
CoreAhbSram_L0I <= COREAhbSram_iiLL(3 downto 0)&COREAhbSram_lill(3 downto 0);
when "001" =>
CoreAHBSRAM_l0i <= COREAHBSRam_iill(3 downto 0)&COREAHBSram_lill(3 downto 0);
when "010" =>
CoreAhbSram_L0I <= CoreAHBSRAM_L0ll(3 downto 0)&CoREAHBSRAm_o0ll(3 downto 0);
when "011" =>
CoreAhbSram_L0I <= CoreAHBSRAM_l0ll(3 downto 0)&CoreAhbSrAM_O0LL(3 downto 0);
when "100" =>
CoREAHBSRAm_l0i <= CoreAhbSRAM_O1LL(3 downto 0)&COreAhbSram_I0LL(3 downto 0);
when "101" =>
COREAHBSram_l0i <= CoreAhbSRAM_O1Ll(3 downto 0)&CoreAhbSraM_I0LL(3 downto 0);
when "110" =>
CoreAhBSRAM_L0i <= CoreAhbSrAM_I1LL(3 downto 0)&COREAHBSram_l1ll(3 downto 0);
when "111" =>
CoreAhbSRAM_L0i <= COREAhbSram_I1LL(3 downto 0)&CoreAhBSRAM_l1ll(3 downto 0);
when others =>
null
;
end case;
when 2 =>
COREAhbSram_OL1 <= "01";
COReAhbSrAM_LL1 <= "01";
COREAhbSraM_IL1 <= "01";
COreAhbSrAM_OI1 <= "01";
COreAhbSraM_LI1 <= "01";
CoREAHBSram_ii1 <= "01";
CorEAHBSram_o01 <= "01";
CoreAHBSRam_l01 <= "01";
CoreAhbSRAM_Iiil <= '0'&CoreAhBSRAM_o0i(10 downto 0);
COreAhbSrAM_O0Il <= '0'&CoreAhbSRAM_O0i(10 downto 0);
COREAhbSram_L0IL <= '0'&COreAhbSrAM_O0I(10 downto 0);
COreAhbSrAM_I0Il <= '0'&COREAhbSram_O0I(10 downto 0);
CoreAhbSRAM_O1il <= '0'&CoreAHBSram_o0I(10 downto 0);
CoreAhbSRAM_L1il <= '0'&CoREAHBSram_o0I(10 downto 0);
CoREAHBSram_i1IL <= '0'&COREAhbSram_O0I(10 downto 0);
COREAhbSram_OO0L <= '0'&CoreAhbSRAM_O0i(10 downto 0);
CorEAHBSRAm_o00l <= '0'&COReAhbSram_iiI(10 downto 0);
CoreAhbSram_L00L <= '0'&CoreAhbSraM_III(10 downto 0);
CoreAhbSRAM_I00l <= '0'&CoreAhbSram_III(10 downto 0);
CoreAhbSram_O10L <= '0'&CoreAHBSRAM_Iii(10 downto 0);
COREAHBSram_l10l <= '0'&COREAhbSram_iii(10 downto 0);
CoreAhbSRAM_i10l <= '0'&COReAhbSram_iiI(10 downto 0);
COREAHBSram_oo1l <= '0'&CoreAhbSraM_III(10 downto 0);
CoreAhbSraM_LO1L <= '0'&COREAhbSram_iii(10 downto 0);
COREAHBSram_oiol(1 downto 0) <= CoreAhBSRAM_Lii(1 downto 0);
CoreAHBSRAM_liol(1 downto 0) <= CoREAHBSRAm_lii(3 downto 2);
CoreAhbSram_IIOL(1 downto 0) <= CorEAHBSRAM_lii(5 downto 4);
CoreAhbSRAM_O0Ol(1 downto 0) <= CoreAhbSRAM_LII(7 downto 6);
COREAhbSram_l0oL(1 downto 0) <= COReAhbSram_lII(1 downto 0);
CoREAHBSRAm_i0ol(1 downto 0) <= COreAhbSram_LII(3 downto 2);
CorEAHBSRAM_o1ol(1 downto 0) <= CoreAhbSram_LII(5 downto 4);
COREAhbSram_l1oL(1 downto 0) <= COREAHBSRam_lii(7 downto 6);
case (COREAHBSram_o0i(11 downto 9)) is
when "000" =>
COREAhbSram_lloL(3 downto 0) <= CoreAhbSraM_L01L&CoreAhbSrAM_L01L&COREAhbSram_l01L&CoreAHBSRAM_l01l;
when "001" =>
CoreAHBSRAM_llol(3 downto 0) <= COreAhbSram_l01L&COREAhbSram_l01L&CorEAHBSRAM_l01l&COreAhbSram_L01L;
when "010" =>
COreAhbSram_LLOL(3 downto 0) <= CoreAhbSrAM_L01L&CoreAHBSRAM_l01l&CoreAhbSram_L01L&CoreAhbSrAM_L01L;
when "011" =>
CoreAhbSrAM_LLOL(3 downto 0) <= CoREAHBSRAm_l01l&COREAHBSram_l01l&CorEAHBSRAm_l01l&CoreAhBSRAM_L01l;
when "100" =>
COREAHbSram_llol(7 downto 4) <= COREAhbSram_l01l&COREAHBSram_l01l&CoreAhbSram_L01L&CoREAHBSRam_l01l;
when "101" =>
COREAHbSram_llol(7 downto 4) <= COREAHBSram_l01l&COREAhbSram_l01l&CoreAhbSram_L01L&CoREAHBSRAm_l01l;
when "110" =>
COREAhbSram_lloL(7 downto 4) <= COReAhbSram_l01L&CoreAhbSram_L01L&CorEAHBSRAm_l01l&CoreAhbSram_L01L;
when "111" =>
COREAhbSram_llol(7 downto 4) <= COreAhbSram_L01L&COReAhbSram_l01L&CoreAhBSRAM_L01l&CoreAhbSram_L01L;
when others =>
null
;
end case;
case (CoreAhBSRAM_Iii(11 downto 9)) is
when "000" =>
COREAHBSRam_ilol(3 downto 0) <= CoreAhbSrAM_I01l&CoreAhbSraM_I01L&COReAhbSram_i01L&COREAHBSRam_i01l;
when "001" =>
CoreAhbSram_ILOL(3 downto 0) <= COREAHBSram_i01l&COREAhbSram_i01L&COREAHBSram_i01l&CorEAHBSRAm_i01l;
when "010" =>
COreAhbSram_iLOL(3 downto 0) <= COREAHBSram_i01l&CoreAhbSram_I01L&COReAhbSram_i01L&COREAHBSram_i01l;
when "011" =>
COREAhbSram_iloL(3 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COREAHbSram_i01l;
when "100" =>
CoreAhbSram_ILOL(7 downto 4) <= CorEAHBSram_i01L&CoREAHBSram_i01L&CoreAhbSRAM_i01l&CoreAHBSRam_i01l;
when "101" =>
CoreAhbSram_ILOL(7 downto 4) <= COREAhbSram_i01L&COreAhbSram_i01L&COREAhbSram_i01L&COREAHbSram_i01l;
when "110" =>
CoreAhbSram_ILOL(7 downto 4) <= COReAhbSram_i01L&CoreAhbSrAM_I01L&COReAhbSram_i01L&COREAHBSRam_i01l;
when "111" =>
CorEAHBSRAm_ilol(7 downto 4) <= COReAhbSram_i01L&CoreAhbSraM_I01L&COReAhbSram_i01L&CoreAhbSram_I01L;
when others =>
null
;
end case;
case (CoreAhbSram_IO1(11 downto 9)) is
when "000" =>
CoreAhBSRAM_L0i <= CoreAhbSram_L0LL(1 downto 0)&CoREAHBSRAm_o0ll(1 downto 0)&CoreAHBSRAM_iill(1 downto 0)&CoreAHBSRAM_Lill(1 downto 0);
when "001" =>
COReAhbSram_l0I <= CoreAhbSraM_L0LL(1 downto 0)&CoreAhbSRAM_O0Ll(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&CoreAhbSraM_LILL(1 downto 0);
when "010" =>
CoreAhbSraM_L0I <= CoreAhBSRAM_L0ll(1 downto 0)&CoreAHBSRAM_O0ll(1 downto 0)&COREAhbSram_iilL(1 downto 0)&COREAhbSram_lilL(1 downto 0);
when "011" =>
COReAhbSram_l0I <= CoreAhbSraM_L0LL(1 downto 0)&COREAhbSram_o0lL(1 downto 0)&COreAhbSram_IILL(1 downto 0)&CoreAhbSRAM_LIll(1 downto 0);
when "100" =>
COReAhbSram_l0I <= COreAhbSram_i1LL(1 downto 0)&COReAhbSram_l1LL(1 downto 0)&COREAHBSram_o1ll(1 downto 0)&COREAhbSram_i0lL(1 downto 0);
when "101" =>
COREAhbSram_l0i <= CoreAhbSrAM_I1LL(1 downto 0)&CoREAHBSRam_l1ll(1 downto 0)&COREAHBSram_o1ll(1 downto 0)&CoreAHBSRAm_i0ll(1 downto 0);
when "110" =>
COREAHBSram_l0i <= COREAhbSram_i1LL(1 downto 0)&COREAHBSram_l1ll(1 downto 0)&CoreAhbSRAM_O1Ll(1 downto 0)&COREAHbSram_i0ll(1 downto 0);
when "111" =>
COREAhbSram_l0i <= COREAHbSram_i1ll(1 downto 0)&CorEAHBSRAm_l1ll(1 downto 0)&COREAHBSram_o1ll(1 downto 0)&CoREAHBSRAm_i0ll(1 downto 0);
when others =>
null
;
end case;
when others =>
COREAHBSram_ol1 <= "00";
CoreAhbSram_LL1 <= "00";
COREAHbSram_il1 <= "00";
COREAhbSram_oi1 <= "00";
CoreAhBSRAM_LI1 <= "00";
CoreAhBSRAM_II1 <= "00";
COREAHBSRam_o01 <= "00";
CoreAhbSram_L01 <= "00";
CorEAHBSRAM_iiil <= COREAHBSram_o0i(11 downto 0);
CoreAhBSRAM_O0il <= COREAHBSram_o0i(11 downto 0);
CorEAHBSram_l0iL <= COreAhbSrAM_O0i(11 downto 0);
CoreAHBSRAm_i0il <= COreAhbSRAM_O0i(11 downto 0);
COREAhbSram_O1IL <= CoreAhbSRAM_O0i(11 downto 0);
COreAhbSraM_L1Il <= CoreAhbSRAM_o0i(11 downto 0);
COReAhbSraM_I1Il <= COreAhbSrAM_O0i(11 downto 0);
COREAHbSram_oO0L <= CoreAhbSRAM_o0i(11 downto 0);
CoreAhbSrAM_O00l <= COREAhbSraM_III(11 downto 0);
COReAhbSram_L00L <= CoreAhBSRAM_iii(11 downto 0);
CoreAhbSRAM_i00l <= CoreAhBSRAM_iii(11 downto 0);
COReAhbSraM_O10l <= CoreAhbSRAM_iii(11 downto 0);
COREAHbSram_L10L <= COREAhbSram_III(11 downto 0);
CoreAhbSRAM_I10l <= COREAhbSram_III(11 downto 0);
CoreAHBSRAM_oo1l <= CoreAhBSRAM_iii(11 downto 0);
CoreAhbSRAM_Lo1l <= COreAhbSrAM_III(11 downto 0);
COREAHbSram_oiol(0) <= COREAHBSram_lii(0);
CoreAhbSrAM_LIOL(0) <= COReAhbSram_liI(1);
COREAhbSram_iiOL(0) <= CoreAhbSRAM_LII(2);
CoreAhbSram_O0OL(0) <= CoREAHBSRAm_lii(3);
CoREAHBSRAm_l0ol(0) <= CoreAhbSrAM_LII(4);
COREAhbSram_i0ol(0) <= CoreAhbSram_LII(5);
CoreAhbSram_O1OL(0) <= CoreAhbSram_LII(6);
COREAhbSram_l1ol(0) <= CoreAhbSrAM_LII(7);
case (CoreAhbSram_O0I(11 downto 9)) is
when "000" =>
COREAhbSram_llol(7 downto 0) <= COREAhbSram_l01l&COreAhbSram_l01L&COREAHBSram_l01l&CoreAhbSraM_L01L&CoreAhbSram_L01L&COREAHBSram_l01l&CoreAHBSRAM_l01l&CoreAhbSram_L01L;
when "001" =>
CoreAHBSRAM_llol(7 downto 0) <= COReAhbSram_l01L&COreAhbSram_L01L&COREAHBSram_l01l&CoreAhbSraM_L01L&CoreAHBSRAM_l01l&CoreAhbSraM_L01L&COREAHBSRam_l01l&CoreAhbSrAM_L01L;
when "010" =>
CoreAhbSRAM_LLOl(7 downto 0) <= CoreAhbSraM_L01L&CoreAhbSram_L01L&COREAhbSram_l01L&CoreAHBSRAM_L01l&COREAHbSram_l01l&CoREAHBSRAm_l01l&CoreAhbSraM_L01L&COREAHBSram_l01l;
when "011" =>
CoreAHBSRAM_Llol(7 downto 0) <= COREAHBSram_l01l&COREAhbSram_l01L&CoreAHBSRAM_L01l&CoreAhbSram_L01L&CoreAhBSRAM_L01l&COreAhbSram_l01L&CoreAHBSRAM_l01l&CoreAhbSrAM_L01L;
when "100" =>
COREAHbSram_llol(7 downto 0) <= CoreAHBSRAM_l01l&COREAHBSRam_l01l&CoreAhbSram_L01L&COReAhbSram_l01L&CorEAHBSRAM_l01l&CoreAhbSram_L01L&CorEAHBSRAM_l01l&COreAhbSram_l01L;
when "101" =>
CoreAHBSRAM_llol(7 downto 0) <= CoreAhbSRAM_L01l&CoreAhbSRAM_l01l&COREAhbSrAM_L01l&COReAhbSraM_L01l&COREAHbSram_L01L&COREAHBSram_l01L&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l;
when "110" =>
COReAhbSraM_LLOL(7 downto 0) <= CoREAHBSram_l01L&CoreAhBSRAM_l01l&CorEAHBSram_l01L&CoreAhbSRAM_L01l&CoreAhbSrAM_L01L&CoreAhbSram_L01L&CoREAHBSRAm_l01l&CoreAhbSraM_L01L;
when "111" =>
CoreAhbSram_LLOL(7 downto 0) <= COREAHBSRam_l01l&COREAhbSraM_L01L&CoreAhBSRAM_l01l&CoreAhbSraM_L01L&COREAhbSram_l01L&COREAHBSram_l01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when others =>
null
;
end case;
case (CoreAhbSraM_III(11 downto 9)) is
when "000" =>
CoreAhbSraM_ILOL(7 downto 0) <= COREAhbSram_i01L&COreAhbSram_I01L&COREAhbSram_i01L&CoreAhBSRAM_I01l&CoreAhbSraM_I01L&COREAhbSram_i01L&COREAHbSram_i01l&CorEAHBSRAM_i01l;
when "001" =>
COREAHBSram_ilol(7 downto 0) <= CorEAHBSRAM_i01l&CoreAHBSRAM_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CoreAhBSRAM_I01l&CoreAhbSraM_I01L&COReAhbSram_i01L&CorEAHBSRAM_i01l;
when "010" =>
CoreAhbSram_ILOL(7 downto 0) <= COREAHBSram_i01l&COREAhbSram_i01L&CoreAHBSRAM_I01l&CoreAhbSraM_I01L&COReAhbSram_i01L&COREAHBSram_i01l&CoreAhbSram_I01L&COREAhbSram_i01l;
when "011" =>
COREAHbSram_ilol(7 downto 0) <= CoreAHBSRAM_I01l&COREAhbSram_i01l&CoREAHBSRAm_i01l&CoreAhbSRAM_I01l&CoREAHBSram_i01L&COREAhbSram_I01L&CorEAHBSRAM_i01l&CoreAhbSram_I01L;
when "100" =>
CoreAhbSraM_ILOL(7 downto 0) <= CoreAhbSRAM_I01L&CoreAhbSRAM_I01l&COREAhbSram_i01l&COREAHBSram_i01l&CoreAhbSraM_I01L&CoreAhbSram_I01L&COREAHBSram_i01l&COReAhbSraM_I01l;
when "101" =>
COREAhbSram_iloL(7 downto 0) <= COREAhbSram_i01L&COReAhbSram_i01L&CoreAhBSRAM_i01l&CoreAHBSRAM_I01l&CoreAhbSram_I01L&COREAHbSram_i01l&CoreAhbSRAM_I01l&COreAhbSram_I01L;
when "110" =>
COreAhbSram_iLOL(7 downto 0) <= CoreAhBSRAM_I01l&COREAHBSram_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CorEAHBSRAM_i01l&CoreAhbSRAM_I01l&COReAhbSram_i01L&COREAHBSram_i01l;
when "111" =>
COREAHBSRam_ilol(7 downto 0) <= CoreAhbSram_I01L&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhBSRAM_I01l&CoreAhbSram_I01L&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhbSRAM_I01L;
when others =>
null
;
end case;
case (CoreAhbSrAM_IO1(11 downto 9)) is
when "000" =>
CoreAhbSrAM_L0I <= CoreAhbSram_I1LL(0)&CoreAhBSRAM_L1ll(0)&COREAhbSram_o1lL(0)&CoreAHBSRAM_i0ll(0)&COREAhbSram_l0ll(0)&CoreAhbSram_O0LL(0)&CorEAHBSRAM_iill(0)&COREAhbSram_lilL(0);
when "001" =>
CoreAhbSrAM_L0I <= COREAhbSram_i1ll(0)&COREAhbSram_l1lL(0)&CoreAhbSrAM_O1LL(0)&COREAhbSram_i0LL(0)&COreAhbSram_l0LL(0)&COREAHBSRam_o0ll(0)&COREAHBSRam_iill(0)&CoreAHBSRAM_lill(0);
when "010" =>
COREAhbSram_l0i <= COReAhbSram_i1LL(0)&COREAhbSram_l1lL(0)&CoreAhbSrAM_O1LL(0)&COreAhbSram_i0LL(0)&COREAHBSram_l0ll(0)&CoreAhbSraM_O0LL(0)&CoreAhbSram_IILL(0)&CoreAhbSram_LILL(0);
when "011" =>
COREAHBSram_l0i <= COreAhbSram_i1LL(0)&CoreAhbSRAM_L1Ll(0)&COREAHbSram_o1ll(0)&CoreAhbSrAM_I0ll(0)&CoreAHBSRAM_l0ll(0)&CoreAhbSram_O0LL(0)&COREAhbSram_iill(0)&COREAHBSram_lill(0);
when "100" =>
CoreAhbSram_L0I <= CoreAhBSRAM_I1ll(0)&COReAhbSram_l1LL(0)&CoreAHBSRAM_o1ll(0)&CoreAhbSram_I0LL(0)&CoreAHBSRAM_l0ll(0)&COreAhbSram_o0LL(0)&CoreAhbSraM_IILL(0)&CoreAhbSraM_LILL(0);
when "101" =>
CorEAHBSRAM_l0i <= COREAHbSram_i1ll(0)&COREAHBSram_l1ll(0)&CoreAhBSRAM_O1ll(0)&COREAhbSram_i0lL(0)&COREAHBSram_l0ll(0)&CoreAhbSraM_O0LL(0)&CoreAhbSram_IILL(0)&CoreAhbSRAM_Lill(0);
when "110" =>
COREAHbSram_L0I <= CoreAhBSRAM_i1ll(0)&COReAhbSraM_L1Ll(0)&COREAhbSram_O1LL(0)&COreAhbSrAM_I0Ll(0)&COReAhbSraM_L0LL(0)&CoreAHBSRAm_o0ll(0)&CoreAhbSRAM_Iill(0)&CoreAhbSRAM_LIll(0);
when "111" =>
CoreAHBSRam_l0i <= COreAhbSrAM_I1Ll(0)&CoreAHBSRam_l1lL(0)&CoreAhBSRAM_o1ll(0)&COreAhbSrAM_I0Ll(0)&CoreAhbSRAM_l0ll(0)&CoreAhbSrAM_O0ll(0)&COREAhbSram_IILL(0)&CoreAhBSRAM_lill(0);
when others =>
null
;
end case;
end case;
when 4608 =>
case (CorEAHBSRam_lo1) is
when 8 =>
COreAhbSram_oL1 <= "11";
CoreAhbSram_LL1 <= "11";
COreAhbSram_iL1 <= "11";
CoreAhbSrAM_OI1 <= "11";
CoreAhbSrAM_LI1 <= "11";
CoreAhbSraM_II1 <= "11";
CoreAhBSRAM_O01 <= "11";
CoreAhbSrAM_L01 <= "11";
COREAHBSRam_i01 <= "11";
COREAhbSram_iiiL <= "000"&COREAhbSram_o0i(8 downto 0);
CoreAhbSram_O0IL <= "000"&COREAhbSram_o0i(8 downto 0);
CoreAhbSraM_L0IL <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CoreAhbSram_I0IL <= "000"&COREAhbSram_o0I(8 downto 0);
CoreAHBSRAM_O1il <= "000"&COREAHBSRam_o0i(8 downto 0);
COReAhbSram_l1IL <= "000"&COReAhbSram_o0I(8 downto 0);
CoreAhbSrAM_I1IL <= "000"&CoREAHBSRAm_o0i(8 downto 0);
COREAHBSram_oo0l <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoREAHBSRam_lo0l <= "000"&CoreAhbSram_O0I(8 downto 0);
CoreAhbSraM_O00L <= "000"&CoreAHBSRAM_iii(8 downto 0);
CoreAhbSrAM_L00L <= "000"&COREAHBSram_iii(8 downto 0);
CoreAhbSram_I00L <= "000"&CoreAhbSram_III(8 downto 0);
CoreAhbSrAM_O10L <= "000"&CorEAHBSRAM_iii(8 downto 0);
CorEAHBSRAM_l10l <= "000"&CoreAhbSram_III(8 downto 0);
COREAHBSram_i10l <= "000"&COReAhbSram_iII(8 downto 0);
CoreAhbSRAM_OO1l <= "000"&CoreAhbSRAM_III(8 downto 0);
CoreAhbSrAM_LO1L <= "000"&COREAHBSRam_iii(8 downto 0);
COREAHBSRam_io1l <= "000"&COREAHBSram_iii(8 downto 0);
COreAhbSram_oIOL <= COREAHbSram_lii;
COREAHBSram_liol <= COREAHBSram_lii;
CoreAhBSRAM_Iiol <= COREAHBSram_lii;
COReAhbSram_o0OL <= COREAhbSram_lii;
COReAhbSram_l0OL <= CoreAhbSRAM_LII;
CoreAhbSram_I0OL <= COREAhbSram_liI;
COREAHBSram_o1ol <= CoreAhbSrAM_LII;
CoreAhbSraM_L1OL <= COREAhbSram_lii;
CoreAHBSRam_i1OL <= CoreAhBSRAM_lii;
case (CoreAhbSRAM_o0i(12 downto 9)) is
when "0000" =>
CorEAHBSRAm_llol(0) <= CoreAHBSRAM_l01l;
when "0001" =>
CoreAhbSraM_LLOL(1) <= CoreAhbSRAM_L01l;
when "0010" =>
COREAhbSram_llol(2) <= CoreAHBSRAM_l01l;
when "0011" =>
CoreAHBSRAM_llol(3) <= COREAhbSraM_L01l;
when "0100" =>
COREAHbSram_llol(4) <= CoREAHBSRAm_l01l;
when "0101" =>
COReAhbSram_lLOL(5) <= COREAhbSram_l01L;
when "0110" =>
CoreAhbSRAM_LLol(6) <= CoreAhbSRAM_L01l;
when "0111" =>
CoreAhbSrAM_LLOL(7) <= CoreAhbSram_L01L;
when "1000" =>
CoreAHBSRAM_Llol(8) <= COREAhbSram_l01L;
when "1001" =>
COREAhbSram_llOL(1) <= CoREAHBSRAm_l01l;
when "1010" =>
CoreAhbSram_LLOL(2) <= CoreAhbSram_L01L;
when "1011" =>
CoreAhbSRAM_LLol(3) <= COREAHBSram_l01l;
when "1100" =>
COREAHBSRam_llol(4) <= COREAHBSram_l01l;
when "1101" =>
CoreAhbSraM_LLOL(5) <= COreAhbSram_l01L;
when "1110" =>
CoreAhbSram_LLOL(6) <= COREAHBSram_l01l;
when "1111" =>
CoreAhbSram_LLOL(7) <= CoREAHBSRAm_l01l;
when others =>
null
;
end case;
case (CoreAhbSraM_III(12 downto 9)) is
when "0000" =>
COREAHBSRam_ilol(0) <= COREAHBSRam_i01l;
when "0001" =>
CoreAhbSram_ILOL(1) <= COREAHBSRam_i01l;
when "0010" =>
CoreAHBSRAM_Ilol(2) <= COREAHBSram_i01l;
when "0011" =>
COREAhbSram_iloL(3) <= COREAHBSram_i01l;
when "0100" =>
COREAHBSram_ilol(4) <= CoreAhbSrAM_I01L;
when "0101" =>
COREAHBSram_ilol(5) <= CoreAhbSram_I01L;
when "0110" =>
CoreAhbSrAM_ILOL(6) <= COREAHBSRam_i01l;
when "0111" =>
CoreAhbSram_ILOL(7) <= COREAHbSram_i01l;
when "1000" =>
COREAhbSram_iloL(8) <= CoreAhbSram_I01L;
when "1001" =>
CoreAhbSraM_ILOL(1) <= CoreAhBSRAM_I01l;
when "1010" =>
CoreAhbSrAM_ILOL(2) <= CoreAhbSRAM_I01l;
when "1011" =>
COReAhbSram_ilOL(3) <= CoreAhBSRAM_I01l;
when "1100" =>
CoreAhbSram_ILOL(4) <= COREAHBSRam_i01l;
when "1101" =>
CoreAhBSRAM_Ilol(5) <= CoreAHBSRAM_I01l;
when "1110" =>
COreAhbSram_ILOL(6) <= CoreAHBSRAM_i01l;
when "1111" =>
COREAHBSRam_ilol(7) <= CoreAhbSrAM_I01L;
when others =>
null
;
end case;
case (COreAhbSram_iO1(12 downto 9)) is
when "0000" =>
COreAhbSram_l0I <= CoreAHBSRAM_lill;
when "0001" =>
CoreAhbSraM_L0I <= CoREAHBSRAm_iill;
when "0010" =>
CoreAhbSrAM_L0I <= COREAHbSram_o0ll;
when "0011" =>
COREAHbSram_l0i <= COreAhbSram_L0LL;
when "0100" =>
COREAhbSram_l0i <= CoreAhbSraM_I0LL;
when "0101" =>
COREAhbSram_l0I <= CoreAhbSraM_O1LL;
when "0110" =>
CoreAhbSraM_L0I <= CorEAHBSRAM_l1ll;
when "0111" =>
CoreAhbSraM_L0I <= CoreAHBSRAM_i1ll;
when "1000" =>
CoreAhbSrAM_L0I <= COREAhbSram_ooil;
when "1001" =>
CoreAHBSRAM_l0i <= CorEAHBSRAM_iill;
when "1010" =>
CoreAHBSRAM_l0i <= CoREAHBSRAm_o0ll;
when "1011" =>
CoREAHBSRam_l0i <= CorEAHBSRAM_l0ll;
when "1100" =>
CoreAhbSRAM_L0I <= CorEAHBSRAM_i0ll;
when "1101" =>
COREAHBSram_l0i <= COreAhbSram_o1LL;
when "1110" =>
COREAHBSram_l0i <= COREAHBSram_l1ll;
when "1111" =>
CorEAHBSRAm_l0i <= COREAhbSram_i1lL;
when others =>
null
;
end case;
when 4 =>
CoreAHBSram_ol1 <= "10";
CoreAHBSRam_ll1 <= "10";
CoreAhbSRAM_IL1 <= "10";
CoreAhbSRAM_oi1 <= "10";
CoreAhbSrAM_LI1 <= "10";
COreAhbSram_iI1 <= "10";
COREAHBSram_o01 <= "10";
CoreAhBSRAM_L01 <= "10";
CoreAhbSram_I01 <= "11";
CoreAHBSRAM_iiil <= "00"&CoreAhbSraM_O0I(9 downto 0);
CorEAHBSRAM_o0il <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhbSRAM_L0il <= "00"&CoREAHBSRAm_o0i(9 downto 0);
COReAhbSram_i0IL <= "00"&CorEAHBSRAM_o0i(9 downto 0);
CoreAhbSrAM_O1IL <= "00"&COReAhbSram_o0I(9 downto 0);
COREAhbSram_l1iL <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhbSram_I1IL <= "00"&COREAhbSram_o0i(9 downto 0);
CoreAhbSraM_OO0L <= "00"&CoreAhbSrAM_O0I(9 downto 0);
COREAHBSram_lo0l <= "000"&CoreAhbSRAM_O0I(8 downto 0);
COreAhbSram_o00L <= "00"&COREAHBSRam_iii(9 downto 0);
COREAhbSram_l00l <= "00"&CoREAHBSRAm_iii(9 downto 0);
CoreAhbSRAM_I00l <= "00"&CoreAhbSram_III(9 downto 0);
CoreAhbSrAM_O10L <= "00"&COREAHbSram_iii(9 downto 0);
CoreAhbSRAM_L10l <= "00"&CoreAhbSrAM_III(9 downto 0);
CorEAHBSRAM_i10l <= "00"&COREAHbSram_iii(9 downto 0);
CoreAhbSRAM_OO1l <= "00"&COREAhbSram_iiI(9 downto 0);
COReAhbSram_lo1L <= "00"&COREAHBSram_iii(9 downto 0);
COREAhbSram_io1L <= "000"&COREAhbSram_iii(8 downto 0);
CoreAhbSRAM_OIOl(3 downto 0) <= COREAHBSram_lii(3 downto 0);
CoreAhBSRAM_Liol(3 downto 0) <= COREAhbSram_lii(7 downto 4);
COREAHBSram_iiol(3 downto 0) <= CoreAhbSram_LII(3 downto 0);
CoreAhbSram_O0OL(3 downto 0) <= COREAHBSram_lii(7 downto 4);
CoreAhbSram_L0OL(3 downto 0) <= COREAHBSRam_lii(3 downto 0);
COreAhbSram_i0OL(3 downto 0) <= CoreAhbSram_LII(7 downto 4);
COreAhbSram_O1OL(3 downto 0) <= CoreAhbSraM_LII(3 downto 0);
CoreAhbSraM_L1OL(3 downto 0) <= CoREAHBSram_lii(7 downto 4);
CoreAhbSRAM_i1ol <= CoreAhBSRAM_lii;
case (CoREAHBSram_o0I(12 downto 9)) is
when "0000" =>
CoreAhBSRAM_llol(1 downto 0) <= COreAhbSrAM_L01l&CoreAhBSRAM_l01l;
when "0001" =>
COreAhbSrAM_LLOl(1 downto 0) <= CoreAhbSrAM_L01L&COREAHbSram_l01l;
when "0010" =>
COREAhbSram_lloL(3 downto 2) <= COreAhbSram_l01L&CoreAhbSraM_L01L;
when "0011" =>
COREAHBSram_llol(3 downto 2) <= CoreAhbSram_L01L&COReAhbSram_l01L;
when "0100" =>
COREAHbSram_llol(5 downto 4) <= COREAhbSram_l01L&COreAhbSram_L01L;
when "0101" =>
CoreAhbSRAM_LLOl(5 downto 4) <= CoREAHBSRAm_l01l&CoreAHBSRAM_l01l;
when "0110" =>
CoreAHBSRAM_Llol(7 downto 6) <= CoreAhbSram_L01L&CorEAHBSRam_l01l;
when "0111" =>
COREAhbSram_llOL(7 downto 6) <= CoreAhbSRAM_L01l&CoreAhbSrAM_L01L;
when "1000" =>
CoREAHBSRAm_llol(8) <= COREAHBSram_l01l;
when "1001" =>
CoreAhbSram_LLOL(1 downto 0) <= CoreAhbSraM_L01L&CoreAhbSRAM_L01l;
when "1010" =>
CoreAhbSRAM_LLol(3 downto 2) <= CoreAhbSram_L01L&CoreAhbSraM_L01L;
when "1011" =>
CoreAhbSraM_LLOL(3 downto 2) <= COreAhbSrAM_L01l&CoreAhbSram_L01L;
when "1100" =>
COREAhbSram_llol(5 downto 4) <= CoreAhbSraM_L01L&CoreAhbSRAM_L01l;
when "1101" =>
CoreAhbSram_LLOL(5 downto 4) <= COREAHBSRam_l01l&CoreAhBSRAM_L01l;
when "1110" =>
CoreAhbSrAM_LLOL(7 downto 6) <= CoreAhbSrAM_L01L&CoreAhbSraM_L01L;
when "1111" =>
COREAHBSram_llol(7 downto 6) <= CoreAHBSRAM_L01l&CoreAhbSraM_L01L;
when others =>
null
;
end case;
case (COREAHbSram_iii(12 downto 9)) is
when "0000" =>
COreAhbSram_iLOL(1 downto 0) <= CoreAhbSram_I01L&CoreAhBSRAM_I01l;
when "0001" =>
COREAhbSram_iloL(1 downto 0) <= COreAhbSram_I01L&CoreAhbSram_I01L;
when "0010" =>
COREAHBSram_ilol(3 downto 2) <= COREAHBSRam_i01l&COREAHBSram_i01l;
when "0011" =>
CoreAhbSram_ILOL(3 downto 2) <= CorEAHBSRAM_i01l&CoREAHBSRAm_i01l;
when "0100" =>
CoreAHBSram_ilOL(5 downto 4) <= CoreAhbSRAM_I01L&COREAhbSram_i01L;
when "0101" =>
COREAHBSram_ilol(5 downto 4) <= COREAHBSram_i01l&COreAhbSram_i01L;
when "0110" =>
COREAHbSram_ilol(7 downto 6) <= COreAhbSram_I01L&CoreAhbSram_I01L;
when "0111" =>
CoreAhbSram_ILOL(7 downto 6) <= CoreAHBSRAM_I01l&CoreAHBSRAM_I01l;
when "1000" =>
COREAhbSram_ILOL(8) <= CoreAhbSrAM_I01L;
when "1001" =>
CoreAhbSram_ILOL(1 downto 0) <= CoreAHBSRAM_i01l&COREAHBSRam_i01l;
when "1010" =>
COREAHBSram_ilol(3 downto 2) <= CoreAhbSrAM_I01L&CoreAhbSrAM_I01L;
when "1011" =>
CoreAhbSram_ILOL(3 downto 2) <= CoreAhbSraM_I01L&CoreAhbSram_I01L;
when "1100" =>
CoreAhBSRAM_Ilol(5 downto 4) <= COREAHBSram_i01l&COREAhbSram_i01L;
when "1101" =>
CoreAhbSrAM_ILOL(5 downto 4) <= CoreAhbSraM_I01L&CoreAhbSram_I01L;
when "1110" =>
COReAhbSram_ilOL(7 downto 6) <= COREAhbSram_i01L&COREAhbSram_i01L;
when "1111" =>
COreAhbSram_ILOL(7 downto 6) <= CoreAhbSraM_I01L&CoreAHBSRAM_i01l;
when others =>
null
;
end case;
case (CoreAhBSRAM_IO1(12 downto 9)) is
when "0000" =>
COReAhbSram_l0I <= CoreAHBSRAM_iill(3 downto 0)&CoreAhbSRAM_LIll(3 downto 0);
when "0001" =>
CoreAhbSraM_L0I <= COREAhbSram_iiLL(3 downto 0)&CoreAhbSraM_LILL(3 downto 0);
when "0010" =>
CorEAHBSRAM_l0i <= COREAhbSram_l0ll(3 downto 0)&CorEAHBSRAm_o0ll(3 downto 0);
when "0011" =>
CoREAHBSRAm_l0i <= CoreAhbSraM_L0LL(3 downto 0)&COreAhbSram_o0LL(3 downto 0);
when "0100" =>
CoreAhbSram_L0I <= COREAhbSram_o1ll(3 downto 0)&CoreAhbSrAM_I0LL(3 downto 0);
when "0101" =>
CoreAhbSRAM_L0I <= CoreAhbSraM_O1LL(3 downto 0)&COREAHbSram_i0ll(3 downto 0);
when "0110" =>
CoreAhbSraM_L0I <= COreAhbSram_i1LL(3 downto 0)&CoreAHBSRAM_l1ll(3 downto 0);
when "0111" =>
CoreAhbSram_L0I <= CorEAHBSRAM_i1ll(3 downto 0)&CoREAHBSram_l1LL(3 downto 0);
when "1000" =>
CoreAHBSRAM_l0i <= CoreAhbSRAM_Ooil;
when "1001" =>
CorEAHBSram_l0I <= COREAHbSram_IILL(3 downto 0)&CoreAhbSRAM_lill(3 downto 0);
when "1010" =>
CoreAhBSRAm_l0i <= COreAhbSrAM_L0Ll(3 downto 0)&CoreAhbSRAM_O0ll(3 downto 0);
when "1011" =>
CorEAHbSram_l0I <= COReAhbSraM_L0LL(3 downto 0)&CorEAHBSram_o0LL(3 downto 0);
when "1100" =>
CoreAhBSRAM_l0i <= COREAhbSram_O1LL(3 downto 0)&COREAHbSram_i0LL(3 downto 0);
when "1101" =>
COreAhbSrAM_L0i <= COREAHbSram_o1LL(3 downto 0)&CoreAhBSRAm_i0ll(3 downto 0);
when "1110" =>
CoreAHBSRAM_l0i <= CoreAhBSRAM_i1ll(3 downto 0)&COReAhbSraM_L1LL(3 downto 0);
when "1111" =>
COReAhbSram_L0I <= CoreAHBSRAm_i1ll(3 downto 0)&COREAhbSram_L1LL(3 downto 0);
when others =>
null
;
end case;
when 2 =>
CoreAhbSRAM_ol1 <= "01";
COReAhbSraM_LL1 <= "01";
CoREAHBSram_iL1 <= "01";
CoreAhbSRAM_oi1 <= "01";
CoreAhBSRAM_li1 <= "01";
COREAhbSram_ii1 <= "01";
CoreAhbSrAM_O01 <= "01";
CoreAhbSram_L01 <= "01";
COREAhbSram_i01 <= "11";
CoreAhbSram_IIIL <= '0'&COREAhbSram_o0i(10 downto 0);
CoreAhbSram_O0IL <= '0'&CoREAHBSRAm_o0i(10 downto 0);
CoreAhbSraM_L0IL <= '0'&CoreAHBSRAM_o0i(10 downto 0);
CoreAhbSRAM_I0il <= '0'&COreAhbSram_o0I(10 downto 0);
CoREAHBSRam_o1il <= '0'&CoreAHBSRAM_o0i(10 downto 0);
CoreAHBSRAM_l1il <= '0'&COReAhbSram_o0I(10 downto 0);
COREAhbSram_i1IL <= '0'&CoreAhbSram_O0I(10 downto 0);
CoreAhbSram_OO0L <= '0'&CoreAhbSrAM_O0I(10 downto 0);
CoreAhbSram_LO0L <= "000"&CoreAHBSRAM_o0i(8 downto 0);
COREAhbSram_o00L <= '0'&CoreAhbSram_III(10 downto 0);
COREAHBSram_l00l <= '0'&COReAhbSrAM_IIi(10 downto 0);
COREAHBSram_i00l <= '0'&COREAhbSram_iii(10 downto 0);
COREAHbSram_o10l <= '0'&COREAHbSram_iii(10 downto 0);
COReAhbSram_l10L <= '0'&CoreAhbSrAM_III(10 downto 0);
COreAhbSram_I10L <= '0'&COREAHbSram_iii(10 downto 0);
CoreAhBSRAM_OO1l <= '0'&CoREAHBSRAm_iii(10 downto 0);
CoreAHBSRAM_Lo1l <= '0'&CoreAhBSRAM_Iii(10 downto 0);
CorEAHBSRAm_io1l <= "000"&CoreAhbSram_III(8 downto 0);
CoreAhbSram_OIOL(1 downto 0) <= CoreAhbSram_LII(1 downto 0);
COREAhbSram_liOL(1 downto 0) <= CoreAhbSrAM_LII(3 downto 2);
CoreAhbSram_IIOL(1 downto 0) <= CorEAHBSRAm_lii(5 downto 4);
COreAhbSram_o0OL(1 downto 0) <= CoreAhbSram_LII(7 downto 6);
COREAHBSRam_l0ol(1 downto 0) <= CoreAhbSraM_LII(1 downto 0);
CoreAhbSrAM_I0OL(1 downto 0) <= COREAhbSram_lii(3 downto 2);
COREAhbSram_o1ol(1 downto 0) <= COREAhbSram_lii(5 downto 4);
COREAHBSram_l1ol(1 downto 0) <= COreAhbSram_lII(7 downto 6);
CoreAhbSRAM_I1ol <= CoreAhbSram_LII;
case (COreAhbSram_o0I(12 downto 9)) is
when "0000" =>
COREAhbSram_llol(3 downto 0) <= COREAHbSram_l01l&COREAhbSram_l01L&CoreAHBSRAM_L01l&COReAhbSram_l01L;
when "0001" =>
CoreAhbSRAM_LLOL(3 downto 0) <= COREAhbSram_l01L&CoreAhbSram_L01L&CoreAHBSRAM_l01l&CoreAhbSRAM_L01L;
when "0010" =>
COREAHbSram_llol(3 downto 0) <= CoreAhBSRAM_L01l&CorEAHBSRAM_l01l&COREAhbSram_l01L&CoreAHBSRAM_L01l;
when "0011" =>
CoreAhbSram_LLOL(3 downto 0) <= CorEAHBSRAm_l01l&COREAHbSram_l01l&CoreAhBSRAM_L01l&COreAhbSram_l01L;
when "0100" =>
COREAhbSram_llOL(7 downto 4) <= COREAHBSram_l01l&COREAHBSram_l01l&CoreAhbSrAM_L01L&COREAHBSram_l01l;
when "0101" =>
CorEAHBSRAm_llol(7 downto 4) <= CoreAhBSRAM_L01l&CoreAhbSrAM_L01L&COREAHBSram_l01l&CoreAHBSRAM_L01l;
when "0110" =>
CoreAhbSram_LLOL(7 downto 4) <= COREAHBSram_l01l&COREAHBSram_l01l&CoreAhbSram_L01L&COREAHBSRam_l01l;
when "0111" =>
CorEAHBSRAm_llol(7 downto 4) <= COREAhbSram_l01L&COREAhbSram_l01L&CoreAhbSraM_L01L&COREAHbSram_l01l;
when "1000" =>
COReAhbSram_llOL(8) <= COREAHBSram_l01l;
when "1001" =>
COreAhbSram_lLOL(3 downto 0) <= COREAHBSram_l01l&CorEAHBSRAm_l01l&COreAhbSram_l01L&CoreAhBSRAM_L01l;
when "1010" =>
COREAhbSram_llol(3 downto 0) <= CoreAhbSram_L01L&COREAhbSram_l01L&CoreAHBSRAM_L01l&COREAhbSram_l01L;
when "1011" =>
COREAhbSram_llol(3 downto 0) <= COreAhbSram_l01L&COReAhbSram_l01L&CoreAhbSRAM_L01L&COREAhbSram_l01L;
when "1100" =>
CoreAhbSraM_LLOL(7 downto 4) <= CoreAhbSram_L01L&COreAhbSram_l01L&CoreAHBSRAM_l01l&CoreAhbSram_L01L;
when "1101" =>
COREAHbSram_llol(7 downto 4) <= COREAhbSram_l01L&COREAHbSram_l01l&CoreAhbSRAM_L01l&COREAhbSram_l01L;
when "1110" =>
COREAHBSram_llol(7 downto 4) <= CoreAHBSRAM_L01l&CoreAhbSraM_L01L&COReAhbSram_l01L&CoreAHBSRAM_L01l;
when "1111" =>
COREAHBSram_llol(7 downto 4) <= CoREAHBSRAm_l01l&CoreAHBSRAM_l01l&COreAhbSram_L01L&COREAHbSram_l01l;
when others =>
null
;
end case;
case (CoreAHBSRAM_iii(12 downto 9)) is
when "0000" =>
CoreAhbSraM_ILOL(3 downto 0) <= CoreAhbSraM_I01L&CoreAhbSrAM_I01L&COREAhbSram_i01L&CorEAHBSRAM_i01l;
when "0001" =>
COREAhbSram_iloL(3 downto 0) <= COREAHbSram_i01l&COReAhbSram_i01L&COREAHBSram_i01l&COREAHBSram_i01l;
when "0010" =>
CoreAHBSRAM_Ilol(3 downto 0) <= CoreAhbSram_I01L&CoreAhbSRAM_I01l&COReAhbSram_i01L&CoREAHBSRAm_i01l;
when "0011" =>
CoreAHBSRAM_ilol(3 downto 0) <= CoreAHBSRAM_i01l&CoREAHBSRAm_i01l&CoreAhbSRAM_I01l&CoreAhbSraM_I01L;
when "0100" =>
CoreAHBSRAM_ilol(7 downto 4) <= COREAhbSram_i01L&COReAhbSram_i01L&CoreAHBSRAM_i01l&CoreAhbSRAM_I01l;
when "0101" =>
COreAhbSram_iLOL(7 downto 4) <= COreAhbSram_I01L&COreAhbSram_i01L&COREAHbSram_i01l&CorEAHBSRAM_i01l;
when "0110" =>
CoreAhbSram_ILOL(7 downto 4) <= COREAHBSram_i01l&COREAhbSram_i01L&CoREAHBSRAm_i01l&CoreAHBSRAM_I01l;
when "0111" =>
CoreAhbSrAM_ILOL(7 downto 4) <= CoREAHBSRAm_i01l&COREAHBSram_i01l&CoreAhbSraM_I01L&CoreAhbSraM_I01L;
when "1000" =>
CoreAhBSRAM_Ilol(8) <= COreAhbSram_i01L;
when "1001" =>
COReAhbSram_ilOL(3 downto 0) <= CoreAhbSraM_I01L&CoreAhbSraM_I01L&COREAhbSram_i01L&CoreAHBSRAM_i01l;
when "1010" =>
COreAhbSram_iLOL(3 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COREAHbSram_i01l;
when "1011" =>
COREAHBSRam_ilol(3 downto 0) <= COREAhbSram_i01L&COReAhbSram_i01L&CoREAHBSRAm_i01l&CoreAhbSrAM_I01L;
when "1100" =>
CoreAhbSraM_ILOL(7 downto 4) <= COreAhbSram_i01L&CoreAhBSRAM_I01l&CoreAhbSram_I01L&COREAhbSram_i01L;
when "1101" =>
CoREAHBSRAm_ilol(7 downto 4) <= CoreAhbSRAM_I01l&CoreAHBSRAM_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L;
when "1110" =>
COreAhbSram_iLOL(7 downto 4) <= CoreAhbSraM_I01L&CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAhbSraM_I01L;
when "1111" =>
CoREAHBSRam_ilol(7 downto 4) <= COREAhbSram_i01L&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhBSRAM_I01l;
when others =>
null
;
end case;
case (CoreAhbSRAM_IO1(12 downto 9)) is
when "0000" =>
COreAhbSram_l0I <= COREAhbSram_l0lL(1 downto 0)&CoreAhbSraM_O0LL(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&COREAHBSram_lill(1 downto 0);
when "0001" =>
CoreAhbSRAM_L0i <= COreAhbSram_L0LL(1 downto 0)&COreAhbSram_O0LL(1 downto 0)&COREAHbSram_iILL(1 downto 0)&CoreAHBSRam_lilL(1 downto 0);
when "0010" =>
CoreAhbSRAM_l0i <= COReAhbSrAM_L0Ll(1 downto 0)&CoreAhbSRAM_o0ll(1 downto 0)&COreAhbSRAM_IIll(1 downto 0)&CoreAhBSRAM_lill(1 downto 0);
when "0011" =>
CoreAhbSRAM_L0i <= CoreAHBSRAm_l0ll(1 downto 0)&CoreAHBSRam_o0lL(1 downto 0)&COreAhbSrAM_IILl(1 downto 0)&CoREAHBSram_lILL(1 downto 0);
when "0100" =>
CoreAhbSRAM_l0i <= CoreAHBSRAM_i1ll(1 downto 0)&CoreAhBSRAM_l1ll(1 downto 0)&CoreAHBSRam_o1ll(1 downto 0)&CoreAHBSRAm_i0ll(1 downto 0);
when "0101" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_i1ll(1 downto 0)&COReAhbSraM_L1LL(1 downto 0)&COREAhbSram_O1LL(1 downto 0)&COREAhbSraM_I0LL(1 downto 0);
when "0110" =>
CoreAhbSrAM_L0I <= CoreAhBSRAM_I1ll(1 downto 0)&CoreAHBSRAM_l1ll(1 downto 0)&CoreAHBSRAM_o1ll(1 downto 0)&COReAhbSram_i0LL(1 downto 0);
when "0111" =>
CoreAhbSraM_L0I <= CorEAHBSRAM_i1ll(1 downto 0)&COReAhbSraM_L1ll(1 downto 0)&COReAhbSram_o1LL(1 downto 0)&CoreAhbSrAM_I0LL(1 downto 0);
when "1000" =>
COReAhbSram_l0I <= CoreAhbSRAM_OOIL;
when "1001" =>
COReAhbSram_l0I <= CoreAhbSrAM_L0LL(1 downto 0)&CorEAHBSRAm_o0ll(1 downto 0)&CoreAhbSrAM_IILL(1 downto 0)&COREAhbSram_lilL(1 downto 0);
when "1010" =>
CoreAhbSraM_L0I <= COreAhbSrAM_L0Ll(1 downto 0)&CoreAhbSrAM_O0LL(1 downto 0)&COReAhbSram_iiLL(1 downto 0)&COREAHbSram_lill(1 downto 0);
when "1011" =>
CoreAhbSram_L0I <= CoreAhbSrAM_L0LL(1 downto 0)&COREAHBSram_o0ll(1 downto 0)&CorEAHBSRAm_iill(1 downto 0)&CoREAHBSRAm_lill(1 downto 0);
when "1100" =>
CoreAhbSram_L0I <= CoreAhbSram_I1LL(1 downto 0)&CoreAhbSraM_L1LL(1 downto 0)&CoreAhbSraM_O1LL(1 downto 0)&COreAhbSram_I0LL(1 downto 0);
when "1101" =>
CoreAhbSraM_L0I <= CoreAhbSrAM_I1LL(1 downto 0)&COREAhbSram_l1LL(1 downto 0)&CoreAhbSram_O1LL(1 downto 0)&CoreAhbSram_I0LL(1 downto 0);
when "1110" =>
COREAHBSram_l0i <= CoreAhbSrAM_I1LL(1 downto 0)&COREAHBSram_l1ll(1 downto 0)&COReAhbSram_o1LL(1 downto 0)&CoreAhbSrAM_I0LL(1 downto 0);
when "1111" =>
CoreAhbSrAM_L0I <= CoreAhbSram_I1LL(1 downto 0)&COREAHBSram_l1ll(1 downto 0)&COREAHBSRam_o1ll(1 downto 0)&COREAHbSram_i0ll(1 downto 0);
when others =>
null
;
end case;
when others =>
COREAhbSram_ol1 <= "00";
CoreAhbSRAM_ll1 <= "00";
CoreAhBSRAM_IL1 <= "00";
CoreAHBSRAM_Oi1 <= "00";
COREAHBSram_li1 <= "00";
COREAhbSram_ii1 <= "00";
CoreAhBSRAM_O01 <= "00";
CoreAhbSRAM_L01 <= "00";
COREAHBSram_i01 <= "11";
COREAHBSRam_iiil <= COREAhbSram_o0i(11 downto 0);
CoreAhbSRAM_O0Il <= CoreAhbSRAM_O0i(11 downto 0);
CoreAhbSRAM_L0il <= CoREAHBSRam_o0i(11 downto 0);
COREAHbSram_i0il <= COREAhbSram_o0i(11 downto 0);
CorEAHBSRAM_o1il <= COREAHBSram_o0i(11 downto 0);
COReAhbSram_l1IL <= COReAhbSram_o0I(11 downto 0);
COREAHBSRam_i1il <= COreAhbSram_o0I(11 downto 0);
CoreAHBSRAM_oo0l <= COREAhbSram_o0i(11 downto 0);
COREAHBSram_lo0l <= "000"&COREAHBSram_o0i(8 downto 0);
COREAhbSram_o00L <= COReAhbSram_iiI(11 downto 0);
CoreAHBSRAM_l00l <= CoREAHBSRAm_iii(11 downto 0);
COREAhbSram_i00l <= COReAhbSram_iII(11 downto 0);
CoreAhBSRAM_O10l <= CoreAhbSRAM_IIi(11 downto 0);
COREAhbSram_l10l <= CorEAHBSRAm_iii(11 downto 0);
CoreAhbSraM_I10L <= CoreAHBSRAM_iii(11 downto 0);
CoreAhbSRAM_OO1l <= CoreAhbSRAM_III(11 downto 0);
CoreAhbSraM_LO1L <= CoreAhbSram_III(11 downto 0);
CoreAHBSRAM_Io1l <= "000"&CoreAhBSRAM_Iii(8 downto 0);
CoreAHBSRAM_oioL(0) <= CoreAhBSRAM_Lii(0);
COreAhbSram_lIOL(0) <= CoreAhbSraM_LII(1);
CoreAhbSram_IIOL(0) <= COReAhbSram_liI(2);
COREAhbSram_o0ol(0) <= CoreAhbSrAM_LII(3);
CoreAhbSRAM_L0OL(0) <= COreAhbSram_LII(4);
CoreAHBSRAM_i0ol(0) <= CorEAHBSRAm_lii(5);
CoreAhbSram_O1OL(0) <= COREAHBSram_lii(6);
CoreAhbSraM_L1OL(0) <= CoreAhbSrAM_LII(7);
COREAHBSRam_i1ol <= COREAHBSram_lii;
case (CoreAhbSram_O0I(12 downto 9)) is
when "0000" =>
CoreAHBSRAM_llol(7 downto 0) <= CoreAHBSRAM_l01l&COREAhbSram_l01l&CoREAHBSRAm_l01l&CoreAhbSraM_L01L&COREAHbSram_l01L&COreAhbSrAM_L01l&COreAhbSrAM_L01l&COREAhbSram_L01L;
when "0001" =>
CorEAHBSram_llOL(7 downto 0) <= COReAhbSram_L01L&COREAhbSram_L01L&COreAhbSraM_L01l&COReAhbSraM_L01l&COREAHBSRam_l01l&COREAHBSram_l01l&COREAHBSram_l01l&CoreAhbSRAM_L01l;
when "0010" =>
CoreAhbSRAM_LLol(7 downto 0) <= CoreAhbSRAM_L01l&COREAHbSram_l01l&CoreAHBSRAm_l01l&COREAhbSram_L01L&COREAHbSram_l01L&CoreAhbSRAM_L01l&COREAHbSram_l01L&CoreAhbSRAM_l01l;
when "0011" =>
COREAhbSram_LLOL(7 downto 0) <= CorEAHBSram_l01L&CoREAHBSram_l01L&COreAhbSrAM_L01l&CoreAHBSram_l01L&COREAhbSram_L01L&CoreAhbSRAM_L01l&CoREAHBSram_l01L&CoreAhBSRAM_l01l;
when "0100" =>
CoreAHBSram_llOL(7 downto 0) <= CorEAHBSram_l01L&COREAhbSram_L01L&CoreAhbSRAM_l01l&CoreAHBSRam_l01l&COREAhbSram_L01L&CoreAhbSRAM_L01l&CoreAHBSRAm_l01l&CoreAhbSRAM_L01l;
when "0101" =>
CoreAhbSRAM_llol(7 downto 0) <= CoreAhbSRAM_l01l&CoreAHBSRAm_l01l&COREAHbSram_l01L&CoreAhbSRAM_L01l&CoreAhbSrAM_L01l&COREAhbSram_L01L&CoREAHBSram_l01L&CoreAhbSRAM_L01l;
when "0110" =>
COreAhbSrAM_LLOl(7 downto 0) <= COREAhbSram_L01L&COREAhbSram_L01L&CoreAhbSrAM_L01l&CoreAHBSRam_l01L&COREAhbSram_L01L&COREAHbSram_L01L&CoreAhBSRAM_l01l&CoreAhBSRAM_l01l;
when "0111" =>
COReAhbSram_llOL(7 downto 0) <= CoreAhbSram_L01L&CoreAhbSraM_L01L&CoreAhbSram_L01L&COReAhbSram_L01L&CoreAhBSRAM_L01l&CoreAhbSraM_L01L&COREAhbSram_l01l&CoreAHBSRAM_L01l;
when "1000" =>
COREAHbSram_llol(8) <= COREAHBSram_l01l;
when "1001" =>
COREAHBSRam_llol(7 downto 0) <= CoreAhbSRAM_L01l&CorEAHBSRAm_l01l&CoreAhbSram_L01L&COREAhbSram_l01l&COREAHBSram_l01l&COREAHBSRam_l01l&CoreAhbSrAM_L01L&COREAHbSram_l01l;
when "1010" =>
COREAHbSram_llol(7 downto 0) <= COREAHBSram_l01l&CoREAHBSRAm_l01l&COreAhbSram_L01L&COREAHbSram_l01l&COReAhbSram_l01L&COREAhbSram_l01L&COREAHBSRAm_l01l&CoreAhbSrAM_L01L;
when "1011" =>
CoreAhbSRAM_LLol(7 downto 0) <= CoreAHBSRAM_L01l&CoREAHBSRAm_l01l&CoreAhbSraM_L01L&COREAHBSram_l01l&CoreAhbSraM_L01L&CoreAhbSraM_L01L&COREAhbSram_l01l&CoreAhbSRAM_L01l;
when "1100" =>
COReAhbSram_llOL(7 downto 0) <= CoreAhbSraM_L01L&CoreAhbSRAM_L01l&COREAHBSram_l01l&CoreAHBSRAM_l01l&COReAhbSram_l01L&COREAHBSRam_l01l&CoreAhbSram_L01L&COREAhbSram_l01L;
when "1101" =>
CoreAhbSRAM_llol(7 downto 0) <= COreAhbSrAM_L01l&CoreAhbSRAM_l01l&COREAhbSram_L01L&CoreAhbSRAM_L01l&CoREAHBSram_l01L&CoreAhBSRAM_l01l&CoreAhbSrAM_L01L&COReAhbSram_l01L;
when "1110" =>
CoreAhbSraM_LLOL(7 downto 0) <= CoreAHBSRAM_l01l&COREAhbSram_l01L&CoreAHBSRAM_L01l&CoreAhBSRAM_L01l&CoreAhbSram_L01L&COREAHBSram_l01l&CoreAhbSrAM_L01L&COREAhbSram_l01L;
when "1111" =>
CoreAHBSRAM_llol(7 downto 0) <= CoreAHBSRAM_l01l&CoREAHBSRAm_l01l&CoreAhbSram_L01L&COREAhbSram_l01L&CoreAHBSRAM_L01l&CoreAhbSram_L01L&COREAHBSram_l01l&CoreAhbSraM_L01L;
when others =>
null
;
end case;
case (CoreAHBSRAM_iii(12 downto 9)) is
when "0000" =>
CoREAHBSRAm_ilol(7 downto 0) <= CoreAhbSram_I01L&CoREAHBSRam_i01l&COREAHBSRam_i01l&CoreAhBSRAM_I01l&CoreAhbSram_I01L&CoREAHBSRam_i01l&COREAhbSram_i01L&COREAHBSram_i01l;
when "0001" =>
CoreAhbSraM_ILOL(7 downto 0) <= CoreAhBSRAM_I01l&CoREAHBSRAm_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CoreAhbSRAM_I01l&COReAhbSram_i01L&COREAHBSRam_i01l&CoreAHBSRAM_i01l;
when "0010" =>
CorEAHBSRAm_ilol(7 downto 0) <= CoreAhbSRAM_I01l&CoreAHBSRAM_i01l&CoreAhbSraM_I01L&COREAHbSram_i01l&CoREAHBSRAm_i01l&CoreAhbSrAM_I01L&COREAhbSram_i01L&CoreAHBSRAM_i01l;
when "0011" =>
CoreAhbSram_ILOL(7 downto 0) <= COREAHbSram_i01l&COreAhbSram_i01L&CorEAHBSRAM_i01l&CoreAhbSRAM_I01l&COReAhbSram_i01L&CoREAHBSRAm_i01l&CoreAhbSram_I01L&COReAhbSram_i01L;
when "0100" =>
CoreAHBSRAM_ilol(7 downto 0) <= COreAhbSram_i01L&CoreAhbSram_I01L&COREAhbSram_i01l&CoreAHBSRAM_I01l&COREAhbSram_i01L&COREAhbSram_i01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L;
when "0101" =>
CoreAhbSRAM_ILol(7 downto 0) <= CorEAHBSRAM_i01l&COREAHBSram_i01l&CorEAHBSRAM_i01l&CorEAHBSRAM_i01l&CoreAhbSraM_I01L&COReAhbSraM_I01l&CoreAhbSram_I01L&COREAhbSram_i01l;
when "0110" =>
CoreAhbSRAM_ILol(7 downto 0) <= COREAhbSram_i01L&CoreAhbSram_I01L&COREAhbSram_i01L&COREAHBSRam_i01l&CoreAhbSram_I01L&COREAhbSram_i01L&CorEAHBSRAM_i01l&CoreAhbSRAM_I01l;
when "0111" =>
COReAhbSram_ilOL(7 downto 0) <= CoreAhbSRAM_I01l&CoreAhBSRAM_I01l&CoreAhbSrAM_I01L&CoreAhbSram_I01L&COREAHBSRam_i01l&CoREAHBSRAm_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L;
when "1000" =>
COREAHBSRam_ilol(8) <= CoreAhbSRAM_I01l;
when "1001" =>
COREAHbSram_ilol(7 downto 0) <= COREAHbSram_i01l&COREAhbSram_i01L&COREAHBSRam_i01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhbSRAM_I01l&COREAhbSram_i01L;
when "1010" =>
CoreAhbSRAM_ILOl(7 downto 0) <= CoreAhbSraM_I01L&CoreAHBSRAM_i01l&CoreAhbSram_I01L&COREAhbSram_i01L&CoreAHBSRAM_i01l&CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAhbSRAM_I01l;
when "1011" =>
CoreAhbSram_ILOL(7 downto 0) <= CoreAhbSrAM_I01L&CoreAHBSRAM_i01l&CoreAhbSram_I01L&CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAhbSram_I01L&COREAHBSram_i01l&COREAHBSRam_i01l;
when "1100" =>
CoreAhbSraM_ILOL(7 downto 0) <= COREAhbSram_i01L&COREAhbSram_i01L&CoreAHBSRAM_I01l&CoreAhbSram_I01L&COREAhbSram_i01L&COREAHBSram_i01l&CoreAhbSraM_I01L&COReAhbSram_i01L;
when "1101" =>
CoreAhBSRAM_Ilol(7 downto 0) <= COREAHBSRam_i01l&CoreAhbSram_I01L&COreAhbSram_I01L&COREAhbSram_i01L&CorEAHBSRAM_i01l&CoreAHBSRAM_i01l&CoreAhbSram_I01L&COREAhbSram_i01L;
when "1110" =>
COreAhbSram_iLOL(7 downto 0) <= COREAHbSram_i01l&COReAhbSram_i01L&CoreAHBSRAM_i01l&CoreAhbSram_I01L&CoreAhbSram_I01L&COREAhbSram_i01L&CoreAHBSRAM_i01l&COREAhbSram_i01L;
when "1111" =>
CoreAhbSRAM_ILOl(7 downto 0) <= COREAHBSram_i01l&COREAhbSram_i01L&COREAHBSram_i01l&CoreAHBSRAM_i01l&COREAhbSram_i01L&COREAHBSram_i01l&CoreAhbSRAM_I01l&CoreAhBSRAM_i01l;
when others =>
null
;
end case;
case (CorEAHBSRAM_io1(12 downto 9)) is
when "0000" =>
CoreAHBSRAM_l0i <= CoreAhbSRAM_I1Ll(0)&COREAHbSram_l1ll(0)&CoreAhbSram_O1LL(0)&CoreAhbSrAM_I0LL(0)&CoreAhbSraM_L0LL(0)&CorEAHBSRAM_o0ll(0)&COREAhbSram_iilL(0)&CoreAhbSram_LILL(0);
when "0001" =>
COREAHbSram_l0i <= CoreAhBSRAM_I1ll(0)&CorEAHBSRAM_l1ll(0)&COreAhbSram_O1LL(0)&CoreAhbSrAM_I0LL(0)&CoreAHBSRAM_l0ll(0)&CoreAhbSrAM_O0LL(0)&CorEAHBSRAM_iill(0)&COREAHbSram_lill(0);
when "0010" =>
COREAhbSraM_L0i <= COREAhbSram_I1LL(0)&CoreAHBSRam_l1lL(0)&COREAhbSram_O1LL(0)&COReAhbSraM_I0Ll(0)&CoreAhbSrAM_L0LL(0)&COREAhbSram_o0lL(0)&COREAhbSram_iilL(0)&COREAHbSram_lill(0);
when "0011" =>
COreAhbSram_l0I <= COREAHBSRam_i1ll(0)&COREAHbSram_l1ll(0)&CoreAhbSram_O1LL(0)&COREAhbSram_i0lL(0)&CoreAhbSrAM_L0LL(0)&CoreAHBSRAM_o0ll(0)&CoreAHBSRAM_iill(0)&COREAhbSram_liLL(0);
when "0100" =>
CoreAHBSRAM_l0i <= COREAHBSram_i1ll(0)&CoreAHBSRAM_L1ll(0)&COreAhbSrAM_O1ll(0)&COREAHbSram_i0LL(0)&COREAHbSram_l0LL(0)&CoreAhbSRAM_O0ll(0)&CorEAHBSram_iilL(0)&COReAhbSraM_LILL(0);
when "0101" =>
CoREAHBSram_l0I <= CoreAhBSRAM_i1ll(0)&COREAhbSram_L1LL(0)&CorEAHBSram_o1LL(0)&COReAhbSraM_I0LL(0)&CoreAhBSRAm_l0ll(0)&CorEAHbSram_o0LL(0)&CoREAHBSram_iiLL(0)&CoreAHBSRAm_lill(0);
when "0110" =>
CorEAHBSram_l0I <= CoreAhbSRAM_I1ll(0)&CoreAHBSRam_l1lL(0)&COREAhbSram_O1LL(0)&COreAhbSrAM_I0ll(0)&CoreAHBSRam_l0lL(0)&COreAhbSrAM_O0ll(0)&CorEAHBSram_iilL(0)&COREAHbSram_lILL(0);
when "0111" =>
COReAhbSraM_L0I <= COreAhbSrAM_I1ll(0)&CoreAhBSRAM_l1ll(0)&CoreAhBSRAM_o1ll(0)&CoreAHBSRam_i0ll(0)&COREAhbSraM_L0LL(0)&CoreAHBSRAm_o0ll(0)&COreAhbSrAM_IIll(0)&COreAhbSrAM_LILl(0);
when "1000" =>
CoreAhbSrAM_L0i <= CoreAhBSRAM_ooil;
when "1001" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_i1ll(0)&CoreAhbSRAM_l1ll(0)&CoREAHBSram_o1LL(0)&CoreAHBSRAm_i0ll(0)&CoREAHBSram_l0LL(0)&COREAhbSram_O0LL(0)&CoreAhbSRAM_iill(0)&COreAhbSrAM_LILl(0);
when "1010" =>
CorEAHBSram_l0I <= COReAhbSraM_I1Ll(0)&COReAhbSraM_L1Ll(0)&CoreAhbSRAM_O1ll(0)&COREAHbSram_I0LL(0)&CorEAHBSram_l0lL(0)&COreAhbSRAM_O0ll(0)&CoreAhbSRAM_Iill(0)&CoreAhBSRAM_lill(0);
when "1011" =>
CoREAHbSram_l0I <= CorEAhbSrAM_I1Ll(0)&COReAhbSraM_L1Ll(0)&CoreAhbSRAM_o1ll(0)&COREAhbSram_I0LL(0)&CoreAhBSRAM_l0ll(0)&CoreAhBSRAM_o0ll(0)&CoreAhBSRAM_iill(0)&CoreAhbSRAM_lill(0);
when "1100" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_I1ll(0)&COReAhbSraM_L1Ll(0)&CoreAhbSRAM_O1ll(0)&CoreAHBSRam_i0lL(0)&CorEAHBSram_l0LL(0)&CoreAhbSRAM_o0ll(0)&CoreAHBSRAm_iill(0)&CoreAHBSRam_lilL(0);
when "1101" =>
CorEAHBSram_l0I <= CorEAHBSram_i1LL(0)&CoreAhbSRAM_L1ll(0)&CoREAHBSram_o1LL(0)&COreAhbSrAM_I0Ll(0)&CoreAHBSRam_l0lL(0)&COReAhbSraM_O0Ll(0)&COreAhbSrAM_IILl(0)&COReAhbSraM_LILl(0);
when "1110" =>
COreAhbSrAM_L0i <= CoreAhBSRAM_i1ll(0)&CorEAHBSram_l1LL(0)&COreAhbSRAM_O1ll(0)&COREAhbSram_I0LL(0)&CoreAHBSram_l0lL(0)&CoreAhBSRAM_o0ll(0)&COREAHbSram_iILL(0)&CoreAhbSRAM_lill(0);
when "1111" =>
CoreAHBSram_l0i <= CoreAhBSRAm_i1ll(0)&CoreAhBSRAM_l1ll(0)&COReAhbSraM_O1Ll(0)&COREAHbSram_i0LL(0)&COreAhbSRAM_L0ll(0)&CoREAHbSram_o0LL(0)&CoreAHBSram_iilL(0)&CorEAHBSram_lILL(0);
when others =>
null
;
end case;
end case;
when 5120 =>
case (CoreAHBSRam_lo1) is
when 8 =>
CoreAHBSram_ol1 <= "11";
CoreAhBSRAm_ll1 <= "11";
CoreAHBSRAM_il1 <= "11";
CorEAHBSram_oi1 <= "11";
CoreAhBSRAM_li1 <= "11";
CoreAhbSRAM_II1 <= "11";
CoREAHbSram_o01 <= "11";
COREAhbSram_L01 <= "11";
CoreAHBSram_i01 <= "11";
CorEAHBSram_o11 <= "11";
CoreAhbSRAM_IIil <= "000"&CoreAhBSRAM_o0i(8 downto 0);
CoreAhBSRAm_o0il <= "000"&COREAhbSram_O0I(8 downto 0);
COReAhbSraM_L0IL <= "000"&COreAhbSrAM_O0i(8 downto 0);
CoreAhBSRAM_i0il <= "000"&CoreAhBSRAM_o0i(8 downto 0);
COReAhbSrAM_O1il <= "000"&COREAhbSram_O0I(8 downto 0);
CoreAhBSRAM_l1il <= "000"&CorEAHBSram_o0I(8 downto 0);
COREAhbSram_I1IL <= "000"&CoREAHBSram_o0I(8 downto 0);
CoreAhbSRAM_Oo0l <= "000"&COREAhbSram_O0I(8 downto 0);
CoreAHBSram_lo0L <= "000"&COREAHbSram_o0I(8 downto 0);
CoreAHBSRAM_io0l <= "000"&COReAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_O00l <= "000"&CorEAHBSram_iiI(8 downto 0);
COREAhbSram_L00L <= "000"&COREAhbSram_III(8 downto 0);
COREAhbSram_I00L <= "000"&CoREAHBSram_iiI(8 downto 0);
CoreAhBSRAm_o10l <= "000"&CoreAhBSRAM_iii(8 downto 0);
COReAhbSrAM_L10l <= "000"&CoreAHBSRAm_iii(8 downto 0);
CoreAHBSRam_i10L <= "000"&CoreAhbSRAM_Iii(8 downto 0);
CoreAhBSRAM_oo1l <= "000"&COReAhbSraM_III(8 downto 0);
COREAhbSram_LO1L <= "000"&COreAhbSrAM_III(8 downto 0);
CorEAHBSram_io1L <= "000"&CoreAhBSRAM_iii(8 downto 0);
CoreAhbSRAM_Ol1l <= "000"&CoreAHBSRam_iii(8 downto 0);
CoreAHBSram_oioL <= CoreAHBSRAm_lii;
CoreAhbSRAM_Liol <= CoreAhbSRAM_lii;
COREAhbSram_IIOL <= CoREAHbSram_lII;
CoREAHbSram_o0OL <= COREAHbSram_lII;
CoreAhBSRAM_l0ol <= CoreAhbSRAM_lii;
COREAHbSram_I0OL <= COreAhbSRAM_LIi;
CoREAHBSram_o1OL <= CorEAHBSram_liI;
COreAhbSrAM_L1Ol <= COREAHbSram_LII;
CorEAHBSram_i1OL <= CoreAhbSRAM_lii;
CoreAHBSRAm_oolL <= CoreAHBSRAm_lii;
case (CoreAhbSRAM_o0i(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_Llol(0) <= COREAhbSram_L01L;
when "0001" =>
CoreAhBSRAM_llol(1) <= CorEAHBSram_l01L;
when "0010" =>
CoreAhbSRAM_llol(2) <= COReAhbSraM_L01l;
when "0011" =>
COReAhbSraM_LLOl(3) <= CoreAhBSRAM_l01l;
when "0100" =>
CoreAHBSRAm_llol(4) <= CoreAhbSRAm_l01l;
when "0101" =>
CoreAHBSRAm_llol(5) <= COREAhbSram_L01L;
when "0110" =>
CoreAhbSRAm_llol(6) <= CoreAhBSRAM_l01l;
when "0111" =>
CoreAhbSRAM_Llol(7) <= COReAhbSraM_L01l;
when "1000" =>
CoreAHBSRAm_llol(8) <= COReAhbSraM_L01l;
when "1001" =>
COreAhbSrAM_LLol(9) <= COREAhbSram_L01L;
when "1010" =>
COREAHbSram_lLOL(2) <= CoreAhbSRAM_L01l;
when "1011" =>
COReAhbSraM_LLOL(3) <= CoreAhbSRAM_l01l;
when "1100" =>
CoreAhBSRAM_llol(4) <= CoreAhbSRAM_L01l;
when "1101" =>
COReAhbSraM_LLOL(5) <= CoREAHBSram_l01L;
when "1110" =>
COreAhbSRAM_LLol(6) <= COReAhbSraM_L01l;
when "1111" =>
CoREAHbSram_lLOL(7) <= CoreAhBSRam_l01L;
when others =>
null
;
end case;
case (CoreAHBSRam_iii(12 downto 9)) is
when "0000" =>
CoreAhbSrAM_ILOL(0) <= CoreAHBSRam_i01L;
when "0001" =>
CoreAhbSrAM_ILOL(1) <= COREAHBSRam_i01l;
when "0010" =>
COREAhbSram_iloL(2) <= COREAhbSram_i01l;
when "0011" =>
COreAhbSram_ILOL(3) <= CoreAhbSram_I01L;
when "0100" =>
CorEAHBSRAM_ilol(4) <= COReAhbSram_i01L;
when "0101" =>
CoreAhbSram_ILOL(5) <= CoREAHBSRAm_i01l;
when "0110" =>
COREAHBSram_ilol(6) <= CoreAhbSrAM_I01L;
when "0111" =>
CoreAhbSraM_ILOL(7) <= CoreAhbSraM_I01L;
when "1000" =>
COReAhbSram_iLOL(8) <= CoreAHBSRAM_i01l;
when "1001" =>
COREAHBSram_ilol(9) <= CoreAhbSram_I01L;
when "1010" =>
CoreAhbSram_ILOL(2) <= COREAhbSram_i01l;
when "1011" =>
COreAhbSram_iLOL(3) <= CoreAhbSraM_I01L;
when "1100" =>
CoreAhbSram_ILOL(4) <= COREAhbSram_i01L;
when "1101" =>
CoreAhBSRAm_ilol(5) <= CoreAhbSRAM_I01l;
when "1110" =>
COREAhbSram_iloL(6) <= COREAhbSram_i01L;
when "1111" =>
CorEAHBSRAm_ilol(7) <= COREAhbSram_i01l;
when others =>
null
;
end case;
case (CoreAhbSram_IO1(12 downto 9)) is
when "0000" =>
CoreAhbSraM_L0I <= COREAHbSram_lill;
when "0001" =>
COREAHBSram_l0i <= CoreAhbSram_IILL;
when "0010" =>
CoreAhbSraM_L0I <= CoreAhbSRAM_O0ll;
when "0011" =>
CoreAhbSRAM_L0i <= COREAhbSram_L0LL;
when "0100" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_i0ll;
when "0101" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_O1ll;
when "0110" =>
CoreAHBSRam_l0i <= COREAhbSram_L1LL;
when "0111" =>
CoreAhBSRAM_l0i <= CoreAHBSRam_i1ll;
when "1000" =>
CoreAhBSRAM_l0i <= COREAHbSram_oOIL;
when "1001" =>
CoREAHBSram_l0I <= CoreAHBSRAm_loil;
when "1010" =>
CoREAHbSram_l0I <= CoreAhBSRAM_o0ll;
when "1011" =>
CoreAHBSram_l0I <= CoreAhbSRAM_l0ll;
when "1100" =>
COreAhbSrAM_L0I <= CoreAHBSRAm_i0ll;
when "1101" =>
CoreAhbSRAM_l0i <= COreAhbSrAM_O1Ll;
when "1110" =>
COREAhbSram_L0I <= CoreAHBSRAm_l1ll;
when "1111" =>
COReAhbSraM_L0I <= COREAhbSram_I1LL;
when others =>
null
;
end case;
when 4 =>
CoreAHBSRAm_ol1 <= "10";
CoreAhbSRAM_Ll1 <= "10";
COReAhbSram_il1 <= "10";
CoREAHBSRAm_oi1 <= "10";
CorEAHBSRAM_li1 <= "10";
CoreAhbSram_II1 <= "10";
COreAhbSrAM_O01 <= "10";
CoreAHBSram_l01 <= "10";
COReAhbSraM_I01 <= "10";
COREAhbSram_o11 <= "10";
COREAHBSram_iiil <= "00"&CorEAHBSRAM_o0i(9 downto 0);
CoreAhbSram_O0IL <= "00"&COREAHBSRam_o0i(9 downto 0);
COREAHBSram_l0il <= "00"&COreAhbSram_o0I(9 downto 0);
COREAHBSram_i0il <= "00"&CoreAHBSRAM_O0i(9 downto 0);
COREAhbSram_O1IL <= "00"&COreAhbSrAM_O0i(9 downto 0);
CoreAhbSRAM_L1il <= "00"&COREAHBSram_o0I(9 downto 0);
CoreAhbSraM_I1IL <= "00"&COREAhbSram_o0I(9 downto 0);
CoreAHBSRAM_oo0l <= "00"&COREAHbSram_o0i(9 downto 0);
CoreAhbSRAM_LO0l <= "00"&CoreAhbSrAM_O0I(9 downto 0);
COReAhbSram_io0L <= "00"&CoreAhbSrAM_O0I(9 downto 0);
CoreAhbSram_O00L <= "00"&CoreAHBSRAM_iii(9 downto 0);
CoreAhbSram_L00L <= "00"&COREAHBSram_iii(9 downto 0);
CoreAhbSraM_I00L <= "00"&COreAhbSram_iII(9 downto 0);
CoreAHBSRAM_o10l <= "00"&CoreAhbSrAM_III(9 downto 0);
COREAhbSram_l10L <= "00"&CoreAhbSRAM_III(9 downto 0);
CoreAhbSram_I10L <= "00"&CoreAhBSRAM_iii(9 downto 0);
CoreAhbSRAM_oo1l <= "00"&CoreAhbSRAM_III(9 downto 0);
CoreAhbSraM_LO1L <= "00"&COREAhbSram_iiI(9 downto 0);
CoreAhbSraM_IO1L <= "00"&COREAHBSram_iii(9 downto 0);
COreAhbSram_OL1L <= "00"&COREAHBSram_iii(9 downto 0);
COreAhbSram_oIOL(3 downto 0) <= CoREAHBSRAm_lii(3 downto 0);
CorEAHBSRAm_liol(3 downto 0) <= CoreAHBSRAM_Lii(7 downto 4);
CoreAhBSRAM_Iiol(3 downto 0) <= COREAHbSram_lii(3 downto 0);
COREAHbSram_o0ol(3 downto 0) <= COREAHbSram_lii(7 downto 4);
COREAhbSram_l0oL(3 downto 0) <= CoreAhbSRAM_LIi(3 downto 0);
COREAHBSram_i0ol(3 downto 0) <= CoREAHBSRAm_lii(7 downto 4);
COREAHBSram_o1ol(3 downto 0) <= CoreAHBSRAM_lii(3 downto 0);
CoreAhbSram_L1OL(3 downto 0) <= COREAhbSram_lii(7 downto 4);
COREAHBSram_i1ol(3 downto 0) <= CoreAhbSRAM_LIi(3 downto 0);
CoreAhBSRAM_OOll(3 downto 0) <= COREAHbSram_lii(7 downto 4);
case (CoreAhbSrAM_O0I(12 downto 9)) is
when "0000" =>
CorEAHBSRAM_llol(1 downto 0) <= CoreAhbSram_L01L&CoreAhbSram_L01L;
when "0001" =>
CoreAHBSRAM_llol(1 downto 0) <= CoreAHBSRAM_L01l&CoreAHBSRAM_l01l;
when "0010" =>
COREAHBSram_llol(3 downto 2) <= CoreAhbSram_L01L&COreAhbSram_l01L;
when "0011" =>
COREAHbSram_llol(3 downto 2) <= COReAhbSram_l01L&COReAhbSram_l01L;
when "0100" =>
CoREAHBSRAm_llol(5 downto 4) <= CoreAhbSram_L01L&COREAhbSram_L01L;
when "0101" =>
CoreAHBSRAM_llol(5 downto 4) <= CoreAhbSram_L01L&CoreAhbSram_L01L;
when "0110" =>
COreAhbSram_lLOL(7 downto 6) <= CoreAhbSram_L01L&CoreAhbSRAM_L01l;
when "0111" =>
CoreAhbSram_LLOL(7 downto 6) <= COREAhbSram_l01l&COREAHBSram_l01l;
when "1000" =>
CoreAhbSraM_LLOL(9 downto 8) <= CoreAhbSRAM_L01l&COREAHBSRam_l01l;
when "1001" =>
CoreAhbSraM_LLOL(9 downto 8) <= CoreAhbSraM_L01L&CoreAhbSram_L01L;
when "1010" =>
COREAhbSram_llol(3 downto 2) <= COREAHBSRam_l01l&CorEAHBSRAm_l01l;
when "1011" =>
CoreAhBSRAM_LLol(3 downto 2) <= CoreAhbSrAM_L01L&CoreAhbSram_L01L;
when "1100" =>
COreAhbSram_lLOL(5 downto 4) <= CoreAhbSram_L01L&CoreAhBSRAM_L01l;
when "1101" =>
COreAhbSram_lLOL(5 downto 4) <= COREAhbSram_l01l&COREAHBSRam_l01l;
when "1110" =>
COREAHbSram_llol(7 downto 6) <= CoreAHBSRAM_L01l&CoreAhBSRAM_L01l;
when "1111" =>
CoreAhbSraM_LLOL(7 downto 6) <= COREAHBSram_l01l&COREAHBSram_l01l;
when others =>
null
;
end case;
case (COreAhbSram_III(12 downto 9)) is
when "0000" =>
COREAHbSram_ilol(1 downto 0) <= COREAHBSram_i01l&CorEAHBSRAM_i01l;
when "0001" =>
COREAHbSram_ilol(1 downto 0) <= CoreAhbSraM_I01L&CoreAhbSraM_I01L;
when "0010" =>
COREAHbSram_ilol(3 downto 2) <= CoreAhbSram_I01L&CoreAhbSraM_I01L;
when "0011" =>
CoreAHBSRAM_ilol(3 downto 2) <= COReAhbSram_i01L&COREAhbSram_i01L;
when "0100" =>
COREAHbSram_ilol(5 downto 4) <= CoreAhbSrAM_I01L&CoreAhbSrAM_I01L;
when "0101" =>
CoreAhbSram_ILOL(5 downto 4) <= CorEAHBSRAM_i01l&CorEAHBSRAM_i01l;
when "0110" =>
COreAhbSRAM_Ilol(7 downto 6) <= CorEAHBSRAm_i01l&COReAhbSram_i01L;
when "0111" =>
COREAHbSram_ilol(7 downto 6) <= CoreAhbSRAM_I01l&CoreAHBSRAM_i01l;
when "1000" =>
CoreAhbSRAM_ILOl(9 downto 8) <= CoreAHBSRAM_I01l&COREAHBSram_i01l;
when "1001" =>
CoreAhbSram_ILOL(9 downto 8) <= CoreAhbSram_I01L&CoreAhbSraM_I01L;
when "1010" =>
COREAHBSram_ilol(3 downto 2) <= CoreAhbSRAM_I01l&CoreAhbSraM_I01L;
when "1011" =>
COReAhbSram_ilOL(3 downto 2) <= COREAHBSram_i01l&COREAhbSram_i01L;
when "1100" =>
CoreAHBSRAM_ilol(5 downto 4) <= CoreAhbSrAM_I01L&CorEAHBSRAM_i01l;
when "1101" =>
CoREAHBSRAm_ilol(5 downto 4) <= CoreAhbSrAM_I01L&CoreAhbSraM_I01L;
when "1110" =>
CoreAhbSraM_ILOL(7 downto 6) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l;
when "1111" =>
CoreAhbSram_ILOL(7 downto 6) <= CoreAhbSRAM_i01l&COreAhbSrAM_I01l;
when others =>
null
;
end case;
case (CoreAHBSRAm_io1(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_l0i <= COreAhbSRAM_IIll(3 downto 0)&CorEAHBSram_lilL(3 downto 0);
when "0001" =>
COreAhbSrAM_L0I <= CoreAhbSRAM_Iill(3 downto 0)&COreAhbSrAM_LILl(3 downto 0);
when "0010" =>
COreAhbSrAM_L0i <= CoreAhBSRAM_l0ll(3 downto 0)&COReAhbSraM_O0LL(3 downto 0);
when "0011" =>
COreAhbSrAM_L0i <= CoreAHBSRAM_l0ll(3 downto 0)&CoreAHBSRAm_o0ll(3 downto 0);
when "0100" =>
COreAhbSraM_L0I <= CoreAhbSrAM_O1ll(3 downto 0)&CoreAhBSRAM_i0ll(3 downto 0);
when "0101" =>
CoreAhBSRAM_l0i <= COREAhbSram_O1LL(3 downto 0)&COReAhbSraM_I0LL(3 downto 0);
when "0110" =>
CoreAhbSraM_L0I <= COREAHbSram_i1ll(3 downto 0)&CoREAHBSRAm_l1ll(3 downto 0);
when "0111" =>
CoreAhbSraM_L0I <= CoreAhbSRAM_I1Ll(3 downto 0)&COreAhbSram_L1LL(3 downto 0);
when "1000" =>
CoreAHBSRAM_l0i <= CoreAhBSRAM_Loil(3 downto 0)&COReAhbSram_ooIL(3 downto 0);
when "1001" =>
COreAhbSram_l0I <= CoreAhbSram_LOIL(3 downto 0)&COREAhbSram_OOIL(3 downto 0);
when "1010" =>
CoREAHBSRAm_l0i <= CoreAhbSram_L0LL(3 downto 0)&COREAHBSRam_o0ll(3 downto 0);
when "1011" =>
CoreAHBSRAM_l0i <= CoreAhbSram_L0LL(3 downto 0)&CoreAhbSRAM_O0ll(3 downto 0);
when "1100" =>
COREAhbSram_l0i <= COreAhbSram_o1LL(3 downto 0)&COREAHBSram_i0ll(3 downto 0);
when "1101" =>
CoreAhbSram_L0I <= CoreAhbSrAM_O1LL(3 downto 0)&COREAHbSram_i0ll(3 downto 0);
when "1110" =>
CoreAhbSraM_L0I <= CoREAHBSRAm_i1ll(3 downto 0)&CoreAhbSram_L1LL(3 downto 0);
when "1111" =>
CoREAHBSRAm_l0i <= CoreAhbSraM_I1LL(3 downto 0)&COREAHBSram_l1ll(3 downto 0);
when others =>
null
;
end case;
when 2 =>
CoreAhbSram_OL1 <= "01";
CoreAhbSraM_LL1 <= "01";
COREAhbSram_il1 <= "01";
CoreAHBSRAM_oi1 <= "01";
CoREAHBSRAm_li1 <= "01";
CoreAHBSRAM_Ii1 <= "01";
COREAhbSram_o01 <= "01";
CoreAhbSraM_L01 <= "01";
CoreAhbSram_I01 <= "10";
CoreAhbSram_O11 <= "10";
CoreAhbSRAM_Iiil <= '0'&CoreAhbSram_O0I(10 downto 0);
COReAhbSram_o0IL <= '0'&CoreAhbSraM_O0I(10 downto 0);
COREAHbSram_l0il <= '0'&COREAHBSram_o0i(10 downto 0);
COREAhbSram_i0il <= '0'&COREAHBSram_o0i(10 downto 0);
COREAHbSram_o1il <= '0'&COreAhbSram_O0I(10 downto 0);
CoreAhbSRAM_L1Il <= '0'&COREAHBSRam_o0i(10 downto 0);
CoreAhbSram_I1IL <= '0'&COreAhbSram_o0I(10 downto 0);
CoreAhbSram_OO0L <= '0'&COREAHBSRam_o0i(10 downto 0);
COReAhbSram_lo0L <= "00"&COREAHBSram_o0i(9 downto 0);
CorEAHBSRAM_io0l <= "00"&COREAhbSram_o0I(9 downto 0);
CorEAHBSRAM_o00l <= '0'&CoreAHBSRAM_Iii(10 downto 0);
CoreAhbSram_L00L <= '0'&CoreAhbSraM_III(10 downto 0);
CorEAHBSRAm_i00l <= '0'&CoreAhbSram_III(10 downto 0);
COREAhbSram_o10L <= '0'&COREAhbSram_iiI(10 downto 0);
COREAhbSram_l10L <= '0'&CoreAhbSram_III(10 downto 0);
CoreAhbSRAM_I10l <= '0'&CoreAhbSraM_III(10 downto 0);
COREAHbSram_oo1l <= '0'&COReAhbSram_iII(10 downto 0);
CoreAHBSRAM_lo1l <= '0'&CoreAHBSRAM_iii(10 downto 0);
COreAhbSram_iO1L <= "00"&COREAHbSram_iii(9 downto 0);
CoreAHBSRAM_Ol1l <= "00"&CoreAhBSRAM_Iii(9 downto 0);
CoreAhbSram_OIOL(1 downto 0) <= CoreAhbSRAM_LIi(1 downto 0);
CoreAhbSrAM_LIOL(1 downto 0) <= COREAhbSram_lii(3 downto 2);
COREAhbSram_iioL(1 downto 0) <= COreAhbSram_LII(5 downto 4);
CoreAhbSram_O0OL(1 downto 0) <= CoreAhbSrAM_LII(7 downto 6);
COREAHBSRam_l0ol(1 downto 0) <= COREAHBSram_lii(1 downto 0);
CoreAhbSram_I0OL(1 downto 0) <= COREAhbSram_liI(3 downto 2);
COreAhbSram_o1OL(1 downto 0) <= COREAHBSram_lii(5 downto 4);
COREAHBSram_l1ol(1 downto 0) <= CorEAHBSRAM_lii(7 downto 6);
COREAHBSram_i1ol(3 downto 0) <= CoreAhbSraM_LII(3 downto 0);
COREAhbSram_ooLL(3 downto 0) <= COREAHBSram_lii(7 downto 4);
case (COReAhbSram_o0I(12 downto 9)) is
when "0000" =>
COReAhbSram_llOL(3 downto 0) <= CoreAhbSrAM_L01L&CoreAhbSraM_L01L&COREAHbSram_l01l&CorEAHBSRAM_l01l;
when "0001" =>
COREAHbSram_llol(3 downto 0) <= CoreAhbSRAM_L01l&CoREAHBSRAm_l01l&CoreAhbSraM_L01L&COREAhbSram_l01L;
when "0010" =>
CoreAhbSRAM_LLol(3 downto 0) <= CoreAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhbSraM_L01L&COReAhbSram_l01L;
when "0011" =>
COREAHBSRam_llol(3 downto 0) <= CoreAhBSRAM_L01l&CoreAHBSRAM_l01l&CoreAhbSram_L01L&COREAHBSram_l01l;
when "0100" =>
CoreAhbSRAM_LLOL(7 downto 4) <= CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COREAHBSram_l01l&CoreAhbSraM_L01L;
when "0101" =>
COREAhbSram_llOL(7 downto 4) <= COreAhbSram_L01L&COREAhbSram_l01l&CoreAHBSRAM_l01l&CoreAhbSram_L01L;
when "0110" =>
COReAhbSram_llOL(7 downto 4) <= COREAHBSRam_l01l&COREAHBSRam_l01l&CoreAhbSraM_L01L&COREAhbSram_l01l;
when "0111" =>
CorEAHBSram_llOL(7 downto 4) <= CoREAHBSRAm_l01l&COREAHBSRam_l01l&CoreAhbSraM_L01L&COREAhbSram_l01L;
when "1000" =>
COREAHbSram_llol(9 downto 8) <= COREAhbSram_l01L&COREAHbSram_l01l;
when "1001" =>
COreAhbSram_lLOL(9 downto 8) <= COREAHBSram_l01l&CorEAHBSRAm_l01l;
when "1010" =>
COReAhbSram_llOL(3 downto 0) <= CoreAhbSRAM_L01l&CoreAhbSram_L01L&CoREAHBSRAm_l01l&CoreAhbSrAM_L01L;
when "1011" =>
COREAHbSram_llol(3 downto 0) <= CoreAHBSRAM_l01l&COREAHBSram_l01l&CoreAHBSRAM_l01l&CoreAhbSram_L01L;
when "1100" =>
CoreAhbSraM_LLOL(7 downto 4) <= COREAHBSram_l01l&CoreAHBSRAM_l01l&COREAhbSram_l01L&COREAHBSRam_l01l;
when "1101" =>
COREAHBSRam_llol(7 downto 4) <= CoreAhbSram_L01L&CoreAhbSram_L01L&CoREAHBSRAm_l01l&CoreAhbSraM_L01L;
when "1110" =>
CoREAHBSRAm_llol(7 downto 4) <= COREAhbSram_l01l&COREAHBSram_l01l&CoreAhbSraM_L01L&COREAHbSram_l01L;
when "1111" =>
CoREAHbSram_lLOL(7 downto 4) <= COReAhbSram_l01L&COREAHBSram_l01l&CoreAhBSRAM_L01l&CoreAhbSram_L01L;
when others =>
null
;
end case;
case (COREAhbSram_iiI(12 downto 9)) is
when "0000" =>
COreAhbSram_iLOL(3 downto 0) <= CoreAhbSRAM_I01l&CoREAHBSRAm_i01l&CoreAhbSrAM_I01L&CoreAhbSraM_I01L;
when "0001" =>
CoreAHBSRAM_ilol(3 downto 0) <= CoreAhbSram_I01L&CoreAhbSraM_I01L&CoreAhbSraM_I01L&COREAHBSram_i01l;
when "0010" =>
COREAHBSRam_ilol(3 downto 0) <= CoreAHBSRAM_i01l&CoREAHBSRAm_i01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L;
when "0011" =>
CoreAhbSram_ILOL(3 downto 0) <= COREAHBSRam_i01l&CoREAHBSRAm_i01l&CoreAhbSram_I01L&COREAhbSram_i01L;
when "0100" =>
COREAhbSram_iloL(7 downto 4) <= CoreAhbSRAM_i01l&CoreAHBSram_i01L&COreAhbSRAM_I01l&CoreAHBSRAm_i01l;
when "0101" =>
CoreAhbSram_ILOL(7 downto 4) <= CoreAhbSraM_I01L&CoreAHBSRAM_I01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L;
when "0110" =>
COREAhbSram_iloL(7 downto 4) <= COREAhbSram_i01L&CoreAhbSraM_I01L&COREAhbSram_i01L&COreAhbSram_i01L;
when "0111" =>
COREAHBSram_ilol(7 downto 4) <= COREAhbSram_i01l&COREAhbSram_i01L&CoreAHBSRAM_i01l&CoreAhbSRAM_i01l;
when "1000" =>
CoreAhbSRAM_ILOl(9 downto 8) <= COREAHBSram_i01l&COREAHbSram_i01l;
when "1001" =>
CoreAhbSRAM_ILol(9 downto 8) <= CoREAHBSRAm_i01l&COREAHBSram_i01l;
when "1010" =>
COREAhbSram_ilol(3 downto 0) <= CoREAHBSRAm_i01l&COREAHBSram_i01l&CoreAhbSrAM_I01L&CoreAhbSraM_I01L;
when "1011" =>
CoreAhBSRAM_Ilol(3 downto 0) <= CoreAhbSRAM_I01l&COREAHBSRam_i01l&CoreAhbSram_I01L&COREAHbSram_i01l;
when "1100" =>
CoreAhBSRAM_ilol(7 downto 4) <= CoreAhbSRAM_I01l&CoreAHBSRAm_i01l&COReAhbSraM_I01l&CoreAHBSram_i01L;
when "1101" =>
COREAhbSram_ILOL(7 downto 4) <= COreAhbSrAM_I01l&COREAHbSram_i01L&CorEAHBSram_i01L&CoreAHBSram_i01L;
when "1110" =>
CoreAHBSRAm_ilol(7 downto 4) <= COReAhbSraM_I01l&CoreAhbSRAM_I01l&COreAhbSrAM_I01l&CoreAHBSRam_i01l;
when "1111" =>
CoreAHBSRAm_ilol(7 downto 4) <= COreAhbSraM_I01l&COREAhbSram_I01L&CoreAhbSRAM_i01l&CoreAhBSRAM_i01l;
when others =>
null
;
end case;
case (COREAhbSram_IO1(12 downto 9)) is
when "0000" =>
COREAhbSram_l0i <= COREAHBSram_l0ll(1 downto 0)&CorEAHBSRAm_o0ll(1 downto 0)&CorEAHBSRAm_iill(1 downto 0)&COREAHbSram_lill(1 downto 0);
when "0001" =>
COREAhbSram_l0i <= CoreAHBSRAM_l0ll(1 downto 0)&CoREAHBSRAm_o0ll(1 downto 0)&COREAHbSram_iill(1 downto 0)&CoreAhbSram_LILL(1 downto 0);
when "0010" =>
CoreAhbSRAM_L0i <= COREAhbSram_l0lL(1 downto 0)&COREAHBSram_o0ll(1 downto 0)&COreAhbSram_iILL(1 downto 0)&COREAhbSram_lilL(1 downto 0);
when "0011" =>
COREAHBSRam_l0i <= CoreAhbSram_L0LL(1 downto 0)&CorEAHBSRAm_o0ll(1 downto 0)&CoreAHBSRAM_Iill(1 downto 0)&CoreAhbSRAM_LILL(1 downto 0);
when "0100" =>
CoreAHBSRAM_l0i <= CoreAhbSraM_I1LL(1 downto 0)&CoREAHBSRam_l1ll(1 downto 0)&CoreAhbSRAM_O1ll(1 downto 0)&COREAHBSram_i0ll(1 downto 0);
when "0101" =>
CoreAHBSRAM_L0i <= COREAHBSRam_i1ll(1 downto 0)&COREAHbSram_l1ll(1 downto 0)&COREAhbSram_o1lL(1 downto 0)&COreAhbSram_i0LL(1 downto 0);
when "0110" =>
CoREAHBSRAm_l0i <= CoreAHBSRAM_i1ll(1 downto 0)&COREAhbSram_l1LL(1 downto 0)&CoreAhbSraM_O1LL(1 downto 0)&CoreAhbSram_I0LL(1 downto 0);
when "0111" =>
COreAhbSram_L0I <= CoreAHBSRAM_i1ll(1 downto 0)&CoreAhBSRAM_L1ll(1 downto 0)&CoreAhbSram_O1LL(1 downto 0)&CoREAHBSRam_i0ll(1 downto 0);
when "1000" =>
CoreAhbSRAM_L0i <= COREAhbSram_loiL(3 downto 0)&CoreAHBSRAM_ooil(3 downto 0);
when "1001" =>
CoreAHBSRAM_l0i <= CoreAhbSRAM_LOIL(3 downto 0)&COREAHBSram_ooil(3 downto 0);
when "1010" =>
CoreAHBSRAM_L0i <= CoreAHBSRAM_l0ll(1 downto 0)&CoreAhbSrAM_O0LL(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&CoREAHBSRAm_lill(1 downto 0);
when "1011" =>
CoreAhbSrAM_L0I <= COREAhbSram_l0lL(1 downto 0)&CoreAhBSRAM_o0ll(1 downto 0)&CoREAHBSram_iiLL(1 downto 0)&COReAhbSraM_LILL(1 downto 0);
when "1100" =>
CoreAhbSRAM_L0i <= CoREAHBSram_i1LL(1 downto 0)&COREAhbSram_L1LL(1 downto 0)&CoreAhBSRAM_O1ll(1 downto 0)&COReAhbSrAM_I0Ll(1 downto 0);
when "1101" =>
CoreAhbSram_L0I <= COReAhbSram_i1LL(1 downto 0)&CoreAHBSRAM_l1ll(1 downto 0)&COREAHbSram_o1ll(1 downto 0)&COREAHBSram_i0ll(1 downto 0);
when "1110" =>
COREAHBSram_l0i <= COREAHbSram_i1ll(1 downto 0)&CoreAhbSraM_L1LL(1 downto 0)&CoreAhbSraM_O1LL(1 downto 0)&CoreAhbSRAM_I0Ll(1 downto 0);
when "1111" =>
CoreAhbSram_L0I <= CorEAHBSRAM_i1ll(1 downto 0)&CoreAHBSRAM_L1ll(1 downto 0)&COREAHBSram_o1ll(1 downto 0)&CorEAHBSRAM_i0ll(1 downto 0);
when others =>
null
;
end case;
when others =>
CoreAhbSram_OL1 <= "00";
COREAHbSram_ll1 <= "00";
CoreAHBSRAM_il1 <= "00";
CorEAHBSRAm_oi1 <= "00";
CorEAHBSRAm_li1 <= "00";
CoreAhbSram_II1 <= "00";
COREAHBSram_o01 <= "00";
COreAhbSram_l01 <= "00";
CoreAhbSRAM_I01 <= "10";
COReAhbSram_o11 <= "10";
CorEAHBSRAM_iiil <= CoreAhbSraM_O0I(11 downto 0);
CoreAhbSram_O0IL <= COREAhbSram_o0i(11 downto 0);
CoreAhbSRAM_L0il <= CoreAhbSraM_O0I(11 downto 0);
CorEAHBSRAM_i0il <= CoreAhbSram_O0I(11 downto 0);
CoreAhbSram_O1IL <= COREAHBSRam_o0i(11 downto 0);
COREAHBSram_l1il <= CoreAhbSram_O0I(11 downto 0);
CoreAhbSraM_I1IL <= CoreAhbSrAM_O0I(11 downto 0);
COREAhbSram_oo0l <= COREAHBSRam_o0i(11 downto 0);
CoreAhbSraM_LO0L <= "00"&COreAhbSram_o0I(9 downto 0);
CoREAHBSRAm_io0l <= "00"&CoreAhbSRAM_O0i(9 downto 0);
COREAHbSram_o00l <= CoreAhbSraM_III(11 downto 0);
CoreAhbSram_L00L <= CoreAhBSRAM_iii(11 downto 0);
COREAhbSram_I00L <= COREAhbSram_III(11 downto 0);
COREAHbSram_o10L <= CoREAHBSram_iiI(11 downto 0);
CoreAhbSRAM_l10l <= CoreAHBSram_iii(11 downto 0);
COreAhbSrAM_I10l <= CoreAHBSRAm_iii(11 downto 0);
COREAHbSram_OO1L <= CoreAhBSRAM_iii(11 downto 0);
CoreAhBSRAM_lo1l <= CoreAhbSRAM_Iii(11 downto 0);
CorEAHBSram_io1L <= "00"&CoREAHBSram_iiI(9 downto 0);
CorEAHBSram_ol1L <= "00"&COREAhbSram_III(9 downto 0);
COREAhbSRAM_OIol(0) <= CoreAhbSRAM_Lii(0);
CoreAhBSRAM_liol(0) <= CoreAhbSRAM_Lii(1);
CoreAhBSRAM_iiol(0) <= CoreAhBSRAM_lii(2);
CoreAhbSRAM_O0ol(0) <= COREAhbSram_LII(3);
CoreAhBSRAM_l0ol(0) <= CoreAHBSRam_lii(4);
COREAHbSram_i0OL(0) <= CoreAhBSRAM_lii(5);
COREAhbSram_o1oL(0) <= CoreAhbSram_LII(6);
CoREAHBSRAm_l1ol(0) <= COreAhbSram_lII(7);
CoreAhbSram_I1OL(3 downto 0) <= COREAHBSram_lii(3 downto 0);
CoreAhbSraM_OOLL(3 downto 0) <= CoreAhbSram_LII(7 downto 4);
case (CoreAhbSRAM_O0i(12 downto 9)) is
when "0000" =>
CoreAhbSraM_LLOL(7 downto 0) <= CorEAHBSRAM_l01l&COREAHBSram_l01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L&COREAhbSram_l01L&COREAHBSram_l01l&CoreAHBSRAM_L01l&CoreAhbSram_L01L;
when "0001" =>
CoreAhbSraM_LLOL(7 downto 0) <= CoreAhbSRAM_L01L&CoreAHBSRAM_l01l&CoreAhbSrAM_L01L&CoreAhbSram_L01L&COReAhbSram_l01L&CoreAHBSRAM_l01l&CoreAhbSram_L01L&CoreAhBSRAM_L01l;
when "0010" =>
COREAHBSram_llol(7 downto 0) <= COREAHbSram_l01l&COreAhbSram_l01L&COREAHBSRam_l01l&CoreAhbSraM_L01L&COREAhbSram_l01L&COREAHBSram_l01l&CoreAhbSram_L01L&COREAHBSram_l01l;
when "0011" =>
COREAHBSram_llol(7 downto 0) <= CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COREAHbSram_l01l&CoreAHBSRAM_l01l&CoreAhbSram_L01L&CoREAHBSRam_l01l&CoREAHBSRAm_l01l&COREAHBSram_l01l;
when "0100" =>
COREAHBSram_llol(7 downto 0) <= CoreAhBSRAM_L01l&COREAHBSRam_l01l&CorEAHBSRAm_l01l&CoreAhBSRAM_L01l&COreAhbSram_l01L&COREAhbSram_l01L&CoreAhbSraM_L01L&COreAhbSram_l01L;
when "0101" =>
COREAhbSram_lloL(7 downto 0) <= CoreAhBSRAM_L01l&CorEAHBSRAM_l01l&CoreAhbSraM_L01L&COREAhbSram_l01L&CoreAhBSRAM_L01l&CoreAhbSram_L01L&CoreAHBSRAM_l01l&CoreAhbSram_L01L;
when "0110" =>
CoreAHBSRAM_llol(7 downto 0) <= COReAhbSram_l01L&CoreAhbSram_L01L&COREAHBSRam_l01l&CoreAhbSram_L01L&CorEAHBSRAM_l01l&CoreAhbSraM_L01L&COREAHBSram_l01l&CoreAhbSrAM_L01L;
when "0111" =>
COReAhbSram_llOL(7 downto 0) <= COREAhbSram_l01l&COREAhbSram_l01L&CoreAHBSRAM_l01l&CoreAhbSrAM_L01L&COREAHBSRam_l01l&CoreAhbSrAM_L01L&COREAHBSram_l01l&CoreAhbSRAM_L01l;
when "1000" =>
CoreAhbSram_LLOL(9 downto 8) <= CoREAHBSRAm_l01l&CorEAHBSram_l01L;
when "1001" =>
COREAhbSram_lloL(9 downto 8) <= CoreAhbSrAM_L01L&CoreAhbSrAM_L01L;
when "1010" =>
CoreAhbSRAM_LLol(7 downto 0) <= CoreAhbSram_L01L&CoreAhBSRAM_L01l&CoreAhbSrAM_L01L&COREAhbSram_l01l&CoREAHBSRAm_l01l&CoreAhbSRAM_L01l&COREAhbSram_l01L&CoreAHBSRAM_l01l;
when "1011" =>
CoREAHBSRAm_llol(7 downto 0) <= CoreAhbSrAM_L01L&CoreAhbSRAM_L01l&COReAhbSram_l01L&COREAhbSram_l01l&CoreAhbSRAM_L01l&COReAhbSrAM_l01l&CoreAhbSRAM_L01l&COReAhbSram_l01L;
when "1100" =>
CoREAHBSRAm_llol(7 downto 0) <= CoreAhbSrAM_L01L&CoreAhbSraM_L01L&COREAHBSram_l01l&CoreAhbSraM_L01L&CorEAHBSRAM_l01l&CoreAhBSRAM_L01l&COREAhbSram_l01L&CoreAhbSRAM_L01l;
when "1101" =>
CoreAhbSraM_LLOL(7 downto 0) <= COreAhbSram_l01L&CoreAhbSram_L01L&COREAHBSRam_l01l&CoreAhbSraM_L01L&COREAHBSram_l01l&CoreAhbSram_L01L&CoREAHBSRAm_l01l&CoreAhbSram_L01L;
when "1110" =>
COreAhbSram_lLOL(7 downto 0) <= COREAHBSRam_l01l&COREAHBSram_l01l&CoreAhbSram_L01L&CorEAHBSRAM_l01l&CoreAhbSram_L01L&COReAhbSram_l01L&CoreAhBSRAM_L01l&COREAhbSram_l01L;
when "1111" =>
COReAhbSram_llOL(7 downto 0) <= CoreAhbSraM_L01L&CoreAhbSRAM_L01l&COREAHbSram_l01l&CoreAhbSRAM_L01l&COREAhbSram_l01l&CoreAhbSRAM_L01L&COREAHbSram_l01l&CoreAhBSRAM_L01l;
when others =>
null
;
end case;
case (COreAhbSram_iII(12 downto 9)) is
when "0000" =>
CoreAhbSraM_ILOL(7 downto 0) <= CoreAhbSrAM_I01L&CorEAHBSRAM_i01l&CoreAhbSram_I01L&COREAhbSram_i01l&CoreAHBSRAM_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CoreAHBSRAM_I01l;
when "0001" =>
CoREAHBSRam_ilol(7 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CoreAhbSRAM_I01l&CoreAhbSraM_I01L&COReAhbSram_i01L&COREAHBSram_i01l;
when "0010" =>
CoreAhbSRAM_ILOL(7 downto 0) <= CoREAHBSRAm_i01l&CorEAHBSRAM_i01l&CoreAhbSraM_I01L&COreAhbSram_i01L&COREAHBSRam_i01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COReAhbSram_i01L;
when "0011" =>
CoreAhbSRAM_ILol(7 downto 0) <= COREAhbSram_i01L&CoreAhbSRAM_I01L&COReAhbSram_i01L&COREAhbSram_i01l&CoreAhbSRAM_I01l&CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAHBSRAM_I01l;
when "0100" =>
CoreAhbSram_ILOL(7 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l&COReAhbSram_i01L&COREAHBSram_i01l&CoreAhbSram_I01L&COreAhbSram_I01L&CoreAhbSrAM_I01l&CoreAHBSRAM_i01l;
when "0101" =>
COREAhbSram_iloL(7 downto 0) <= COREAHbSram_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&COREAHBSram_i01l&CoreAHBSRAM_i01l&CoreAhbSRAM_I01l&COreAhbSram_i01L&COREAhbSram_i01L;
when "0110" =>
COREAhbSram_ilol(7 downto 0) <= COReAhbSram_i01L&COreAhbSram_I01L&COREAHBSram_i01l&CorEAHBSRAM_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&COREAHBSRam_i01l&CoreAhBSRAM_I01l;
when "0111" =>
COREAHBSram_ilol(7 downto 0) <= CoreAHBSRAM_i01l&COREAHbSram_i01l&COREAHBSram_i01l&COREAHBSram_i01l&CoreAhBSRAM_I01l&CoreAhbSram_I01L&CoreAhbSraM_I01L&COREAhbSram_i01L;
when "1000" =>
CoreAhbSram_ILOL(9 downto 8) <= CoREAHBSRAm_i01l&COREAHBSram_i01l;
when "1001" =>
CoREAHBSRAm_ilol(9 downto 8) <= COREAhbSram_i01l&COREAHBSram_i01l;
when "1010" =>
CoreAhBSRAM_ILol(7 downto 0) <= COReAhbSram_i01L&CoreAhbSram_I01L&COREAhbSram_i01L&COREAhbSram_i01L&CoreAhBSRAM_I01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CoREAHBSRAm_i01l;
when "1011" =>
CoreAhbSraM_ILOL(7 downto 0) <= CoreAhbSRAM_I01l&COREAHBSram_i01l&CoreAhbSrAM_I01L&COreAhbSram_i01L&COREAHBSram_i01l&CoreAhbSRAM_I01l&COREAhbSram_i01L&COREAHBSram_i01l;
when "1100" =>
CoreAhbSraM_ILOL(7 downto 0) <= CoreAhbSram_I01L&CoreAhbSRAM_I01L&COREAHBSram_i01l&CoreAHBSRAM_i01l&CoreAhbSram_I01L&COREAhbSram_i01L&CoreAhbSrAM_I01L&COREAhbSram_i01L;
when "1101" =>
CoreAhBSRAM_ilol(7 downto 0) <= CoreAhbSRAM_I01l&COREAHBSram_i01l&CoreAHBSRAM_i01l&CoreAhbSrAM_I01L&COREAHbSram_i01l&COREAHbSram_i01l&CoreAhbSRAM_I01l&COReAhbSram_i01L;
when "1110" =>
CoreAhbSram_ILOL(7 downto 0) <= COreAhbSram_i01L&CoreAhbSrAM_I01L&COREAhbSram_i01L&COREAHBSRam_i01l&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhBSRAM_I01l&CoreAhbSram_I01L;
when "1111" =>
COREAHBSram_ilol(7 downto 0) <= CoreAhbSRAM_i01l&CoreAHBSRAM_I01l&CoreAhbSraM_I01L&COREAhbSram_i01L&COREAHBSram_i01l&CoreAHBSRAM_I01l&CoreAhbSram_I01L&COREAHBSram_i01l;
when others =>
null
;
end case;
case (CoreAhbSRAM_IO1(12 downto 9)) is
when "0000" =>
CoreAhbSram_L0I <= COREAhbSram_i1lL(0)&CorEAHBSRAm_l1ll(0)&CoreAhbSrAM_O1LL(0)&CoreAhbSraM_I0LL(0)&CorEAHBSram_l0LL(0)&COreAhbSRAM_O0ll(0)&CoreAhbSRAM_iill(0)&CoREAHBSram_lILL(0);
when "0001" =>
CoREAHBSram_l0I <= COREAhbSram_I1LL(0)&COreAhbSrAM_L1Ll(0)&COREAHbSram_o1LL(0)&CoreAhBSRAM_i0ll(0)&CoreAhBSRAm_l0ll(0)&CoreAhBSRAM_o0ll(0)&CoreAHBSRam_iilL(0)&CoreAhBSRAM_lill(0);
when "0010" =>
COREAhbSram_L0I <= COREAhbSram_I1LL(0)&CoreAHBSRam_l1ll(0)&CoreAhbSRAM_O1ll(0)&CoreAHBSram_i0lL(0)&CoreAhbSraM_L0LL(0)&CoreAhbSrAM_O0LL(0)&CoreAHBSRAM_iill(0)&COReAhbSram_lILL(0);
when "0011" =>
CoreAhbSraM_L0I <= CoreAhBSRAM_I1ll(0)&COREAhbSram_l1ll(0)&CorEAHBSRAM_o1ll(0)&CoreAhbSram_I0LL(0)&CoreAhbSram_L0LL(0)&COReAhbSram_o0LL(0)&CoreAHBSRAM_iill(0)&CoreAhbSram_LILL(0);
when "0100" =>
COREAHBSram_l0i <= CoreAhbSrAM_I1LL(0)&CoreAhbSRAM_L1Ll(0)&CoREAHBSRAm_o1ll(0)&COREAhbSram_i0lL(0)&CoreAhBSRAM_L0ll(0)&COReAhbSram_o0LL(0)&CoreAhbSraM_IILL(0)&CoreAhbSram_LILL(0);
when "0101" =>
COreAhbSram_L0I <= CoreAhbSram_I1LL(0)&COREAHbSram_l1ll(0)&CoreAhbSraM_O1LL(0)&COReAhbSram_i0LL(0)&COREAHBSram_l0ll(0)&CoreAhBSRAM_o0ll(0)&CoreAhbSraM_IILL(0)&CoreAhbSRAM_LILl(0);
when "0110" =>
COREAHBSram_l0i <= CoreAhbSram_I1LL(0)&CoreAhbSraM_L1LL(0)&CoreAHBSRAM_o1ll(0)&COreAhbSram_I0LL(0)&CoreAhbSraM_L0LL(0)&CoreAHBSRAM_o0ll(0)&CorEAHBSRAM_iill(0)&CoreAhbSraM_LILL(0);
when "0111" =>
COREAHBSram_l0i <= CoreAhbSram_I1LL(0)&COREAhbSram_l1ll(0)&CoreAhbSrAM_O1LL(0)&CoreAhbSRAM_I0ll(0)&CoreAhbSraM_L0LL(0)&CoreAhbSraM_O0LL(0)&CoreAhbSram_IILL(0)&CoreAhbSrAM_LILL(0);
when "1000" =>
CoreAhbSram_L0I <= COReAhbSram_lOIL(3 downto 0)&COreAhbSram_oOIL(3 downto 0);
when "1001" =>
CoreAHBSRAM_l0i <= CoreAhbSRAM_LOil(3 downto 0)&CoreAhbSraM_OOIL(3 downto 0);
when "1010" =>
COREAhbSram_l0I <= CoreAhbSRAM_I1ll(0)&COReAhbSram_l1LL(0)&COReAhbSram_o1LL(0)&CoREAHBSRAm_i0ll(0)&CoreAhbSRAM_L0Ll(0)&CoreAhBSRAM_O0ll(0)&COREAhbSram_iilL(0)&CoreAhbSram_LILL(0);
when "1011" =>
CoreAhbSram_L0I <= CoreAhbSRAM_I1ll(0)&COreAhbSram_L1LL(0)&CoreAhbSram_O1LL(0)&COREAHbSram_i0ll(0)&CoreAhbSram_L0LL(0)&CoreAhbSrAM_O0LL(0)&COREAHbSram_iill(0)&CoreAHBSRAM_lill(0);
when "1100" =>
COREAhbSram_l0I <= COREAhbSram_i1ll(0)&COReAhbSram_l1LL(0)&CoreAhbSrAM_O1LL(0)&CoreAHBSRAM_I0ll(0)&CorEAHBSRAm_l0ll(0)&COreAhbSram_o0LL(0)&CoreAhBSRAM_IIll(0)&COREAhbSram_lilL(0);
when "1101" =>
CoreAhBSRAM_l0i <= CoreAhbSRAM_i1ll(0)&CoreAHBSRam_l1ll(0)&COreAhbSrAM_O1ll(0)&COreAhbSram_i0LL(0)&CoREAHBSRAm_l0ll(0)&CoreAhbSraM_O0LL(0)&COreAhbSram_iILL(0)&CoreAhbSRAM_LILl(0);
when "1110" =>
COREAhbSram_l0i <= COReAhbSram_i1LL(0)&COREAhbSram_l1ll(0)&COREAhbSram_o1LL(0)&COReAhbSram_i0LL(0)&COReAhbSram_l0LL(0)&COREAhbSram_o0LL(0)&CoreAhbSram_IILL(0)&COREAhbSram_liLL(0);
when "1111" =>
CoreAhbSrAM_L0I <= CoreAhbSRAM_I1Ll(0)&CoreAhbSram_L1LL(0)&CoreAhbSram_O1LL(0)&COREAHBSram_i0ll(0)&COREAHBSram_l0ll(0)&COREAhbSram_o0LL(0)&CoreAHBSRAM_iill(0)&COREAHBSram_lill(0);
when others =>
null
;
end case;
end case;
when 5632 =>
case (COReAhbSram_lO1) is
when 8 =>
CoreAhbSram_OL1 <= "11";
COREAhbSram_ll1 <= "11";
CoreAhbSram_IL1 <= "11";
COREAhbSram_oi1 <= "11";
CoreAhbSraM_LI1 <= "11";
COReAhbSram_iI1 <= "11";
COREAHBSram_o01 <= "11";
COREAHBSram_l01 <= "11";
CoREAHBSRAm_i01 <= "11";
COReAhbSram_o11 <= "11";
CoreAHBSRAM_l11 <= "11";
COreAhbSram_IIIL <= "000"&CoreAHBSRAM_o0i(8 downto 0);
CoreAhbSraM_O0IL <= "000"&CoreAHBSRAM_o0i(8 downto 0);
COreAhbSrAM_L0Il <= "000"&CoreAHBSRAm_o0i(8 downto 0);
CoreAhBSRAM_i0il <= "000"&COreAhbSrAM_O0I(8 downto 0);
CoreAHBSRam_o1il <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CoreAhbSRAM_L1il <= "000"&CoreAhbSRAM_o0i(8 downto 0);
COREAHbSram_i1IL <= "000"&CoreAhbSRAm_o0i(8 downto 0);
CoreAhbSRAM_OO0l <= "000"&COREAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_lo0l <= "000"&CorEAHBSram_o0I(8 downto 0);
CoreAhbSRAM_io0l <= "000"&CoreAhBSRAM_o0i(8 downto 0);
COreAhbSrAM_OL0l <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CorEAHBSram_o00L <= "000"&CoreAhbSRAM_iii(8 downto 0);
COREAhbSram_L00L <= "000"&CoreAhBSRam_iii(8 downto 0);
COReAhbSraM_I00l <= "000"&CorEAHBSram_iiI(8 downto 0);
COReAhbSram_o10L <= "000"&COREAHBSram_iii(8 downto 0);
CoreAHBSRAM_l10l <= "000"&CoreAhbSram_III(8 downto 0);
COREAHBSRAm_i10l <= "000"&CoreAhbSRAM_III(8 downto 0);
COreAhbSram_oO1L <= "000"&COreAhbSram_iII(8 downto 0);
CoreAhbSraM_LO1L <= "000"&CoreAhbSram_III(8 downto 0);
COREAHbSram_io1l <= "000"&CoreAhbSraM_III(8 downto 0);
COREAhbSram_ol1L <= "000"&COREAhbSram_iiI(8 downto 0);
CoreAhbSRAM_ll1l <= "000"&CoREAHBSRAm_iii(8 downto 0);
CorEAHBSRAm_oiol <= CoreAhbSram_LII;
COreAhbSram_lIOL <= CoreAhbSram_LII;
COREAhbSram_iioL <= COREAHbSram_lii;
COREAhbSram_o0OL <= COREAHBSRam_lii;
CoreAhbSram_L0OL <= COreAhbSram_LII;
COReAhbSram_i0OL <= COREAHBSram_lii;
CoREAHBSRAm_o1ol <= CoreAhbSram_LII;
CoreAhbSrAM_L1OL <= COREAhbSram_lii;
COREAhbSram_i1oL <= CoreAhbSRAM_LII;
CoreAHBSRAM_ooll <= COreAhbSram_lII;
CoreAhbSram_LOLL <= CoREAHBSRAm_lii;
case (COReAhbSraM_O0I(12 downto 9)) is
when "0000" =>
COREAHbSram_lLOL(0) <= COreAhbSRAM_L01l;
when "0001" =>
CoreAhbSRAM_Llol(1) <= COreAhbSrAM_L01L;
when "0010" =>
CoREAHBSRAm_llol(2) <= COREAHbSram_l01l;
when "0011" =>
CoreAhbSRAM_LLOL(3) <= CoreAhbSram_L01L;
when "0100" =>
CoreAHBSRam_lloL(4) <= CoreAhbSraM_L01L;
when "0101" =>
CoreAhBSRAM_Llol(5) <= CoreAhBSRAM_L01l;
when "0110" =>
COREAHBSram_llol(6) <= COREAHBSram_l01l;
when "0111" =>
COreAhbSram_LLOL(7) <= COREAHBSRam_l01l;
when "1000" =>
CoreAhbSrAM_LLOL(8) <= CoreAhBSRAM_L01l;
when "1001" =>
CoREAHBSRam_llol(9) <= CoreAhbSrAM_L01L;
when "1010" =>
CoreAHBSRAm_llol(10) <= COREAHbSram_l01l;
when "1011" =>
CoreAhbSRAM_LLol(3) <= COReAhbSram_l01L;
when "1100" =>
CoreAhbSram_LLOL(4) <= CoreAhbSram_L01L;
when "1101" =>
COREAHBSram_llol(5) <= CoreAhbSRAM_L01l;
when "1110" =>
CoreAhbSram_LLOL(6) <= CoreAhbSraM_L01L;
when "1111" =>
CoREAHBSRam_llol(7) <= COREAhbSram_l01l;
when others =>
null
;
end case;
case (CoreAhbSram_III(12 downto 9)) is
when "0000" =>
CoreAhbSram_ILOL(0) <= CoreAhbSraM_I01L;
when "0001" =>
COREAhbSram_ilol(1) <= CoreAHBSRAM_i01l;
when "0010" =>
COREAhbSram_ilol(2) <= CoreAHBSRam_i01L;
when "0011" =>
CoreAhbSraM_ILOL(3) <= CoreAhbSrAM_I01L;
when "0100" =>
COREAHBSram_ilol(4) <= CoreAhbSraM_I01L;
when "0101" =>
CorEAHBSRAM_ilol(5) <= COReAhbSram_i01L;
when "0110" =>
CoreAHBSRAM_ilol(6) <= COREAHBSRam_i01l;
when "0111" =>
CoREAHBSRAm_ilol(7) <= CoreAhBSRAM_I01l;
when "1000" =>
CoreAHBSRAM_ilol(8) <= CoreAhbSRAM_I01l;
when "1001" =>
COREAHbSram_ilol(9) <= COREAHBSram_i01l;
when "1010" =>
CoreAhbSraM_ILOL(10) <= CoreAHBSRAM_I01l;
when "1011" =>
CoreAhbSram_ILOL(3) <= CorEAHBSRAm_i01l;
when "1100" =>
COREAHBSRam_ilol(4) <= CoreAhbSrAM_I01L;
when "1101" =>
CoreAhbSrAM_ILOL(5) <= CoreAhbSraM_I01L;
when "1110" =>
COREAhbSram_ilOL(6) <= CorEAHBSRAm_i01l;
when "1111" =>
CoreAHBSRam_iloL(7) <= CoreAhbSrAM_I01l;
when others =>
null
;
end case;
case (COreAhbSram_IO1(12 downto 9)) is
when "0000" =>
COREAhbSram_l0i <= CoreAhbSram_LILL;
when "0001" =>
CoreAHBSRAM_l0i <= COREAhbSram_iill;
when "0010" =>
COREAhbSram_l0i <= COREAHBSRam_o0ll;
when "0011" =>
CoreAhbSraM_L0I <= CoreAhbSram_L0LL;
when "0100" =>
CoreAHBSRAM_l0i <= COREAhbSram_i0lL;
when "0101" =>
CoREAHBSRAm_l0i <= COreAhbSram_o1LL;
when "0110" =>
CoreAhbSram_L0I <= CoreAHBSRAM_l1ll;
when "0111" =>
CoreAHBSRAM_l0i <= CoreAhbSrAM_I1LL;
when "1000" =>
CoreAHBSRAM_l0i <= COREAhbSram_ooiL;
when "1001" =>
COREAhbSram_l0I <= COREAHBSram_loil;
when "1010" =>
COreAhbSram_l0I <= CoreAhbSRAM_IOil;
when "1011" =>
CoreAHBSRAM_L0i <= COREAHBSram_l0ll;
when "1100" =>
CoreAhbSram_L0I <= CoreAhbSRAM_I0Ll;
when "1101" =>
CoreAhBSRAM_l0i <= CoreAhbSrAM_O1LL;
when "1110" =>
CorEAHBSRAm_l0i <= COREAhbSram_l1lL;
when "1111" =>
COREAHBSRam_l0i <= CoreAhbSram_I1LL;
when others =>
null
;
end case;
when 4 =>
COreAhbSram_oL1 <= "10";
COREAhbSram_ll1 <= "10";
COREAhbSram_il1 <= "10";
COreAhbSram_oI1 <= "10";
COreAhbSram_LI1 <= "10";
COREAhbSram_ii1 <= "10";
CoREAHBSRAm_o01 <= "10";
CoreAhbSram_L01 <= "10";
CoreAhBSRAM_I01 <= "10";
CoreAhbSram_O11 <= "10";
CoreAhbSram_L11 <= "11";
CorEAHBSRAM_iiil <= "00"&CoreAhbSrAM_O0I(9 downto 0);
CoreAhbSram_O0IL <= "00"&CorEAHBSRAM_o0i(9 downto 0);
COREAHBSram_l0il <= "00"&CoreAhbSRAM_O0I(9 downto 0);
COREAHBSram_i0il <= "00"&COreAhbSram_o0I(9 downto 0);
CoreAHBSRAM_o1il <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhbSraM_L1IL <= "00"&CoreAhbSraM_O0I(9 downto 0);
COREAhbSram_i1iL <= "00"&CorEAHBSRAM_o0i(9 downto 0);
CoreAHBSRAM_oo0l <= "00"&CoreAhbSram_O0I(9 downto 0);
COREAhbSram_lo0l <= "00"&CoreAhbSraM_O0I(9 downto 0);
COReAhbSram_iO0L <= "00"&CoreAHBSRAM_o0i(9 downto 0);
COREAHBSram_ol0l <= "000"&CorEAHBSRAm_o0i(8 downto 0);
COREAHBSram_o00l <= "00"&CoreAhbSrAM_III(9 downto 0);
COREAhbSram_l00L <= "00"&CoreAHBSRAM_iii(9 downto 0);
COREAHbSram_i00l <= "00"&COREAHBSram_iii(9 downto 0);
CoreAhBSRAM_O10l <= "00"&CoREAHBSRAm_iii(9 downto 0);
CoREAHBSRAm_l10l <= "00"&CoreAhbSraM_III(9 downto 0);
COReAhbSram_i10L <= "00"&COreAhbSram_iII(9 downto 0);
CoreAHBSRAM_oo1l <= "00"&CorEAHBSram_iii(9 downto 0);
COREAhbSraM_LO1L <= "00"&CoREAHBSram_iiI(9 downto 0);
CoreAhbSRAM_io1l <= "00"&CoreAhBSRAM_iii(9 downto 0);
COreAhbSrAM_OL1l <= "00"&CoreAhbSRAM_Iii(9 downto 0);
COREAHbSram_lL1L <= "000"&CoreAhbSRAM_iii(8 downto 0);
CoreAHBSRAm_oiol(3 downto 0) <= CoreAHBSRAm_lii(3 downto 0);
CoreAHBSRAm_liol(3 downto 0) <= CoreAhbSRAM_LIi(7 downto 4);
CoREAHBSram_iiOL(3 downto 0) <= CoreAHBSram_liI(3 downto 0);
CoreAhBSRAM_o0ol(3 downto 0) <= COreAhbSrAM_LII(7 downto 4);
CoreAHBSram_l0OL(3 downto 0) <= COreAhbSRAM_LIi(3 downto 0);
COREAhbSram_I0OL(3 downto 0) <= CoreAHBSRam_lii(7 downto 4);
COreAhbSram_o1OL(3 downto 0) <= CoreAhBSRAM_LIi(3 downto 0);
CoREAHBSRAm_l1ol(3 downto 0) <= CoREAHBSram_lII(7 downto 4);
CorEAHBSram_i1OL(3 downto 0) <= COREAHBSram_lii(3 downto 0);
COREAhbSram_oolL(3 downto 0) <= CoreAhbSraM_LII(7 downto 4);
COREAhbSram_lolL <= COREAhbSram_lii;
case (CoreAHBSRAM_O0i(12 downto 9)) is
when "0000" =>
CoreAhbSrAM_LLOL(1 downto 0) <= CoreAhbSraM_L01L&CoreAHBSRAM_l01l;
when "0001" =>
CoreAhbSRAM_LLOl(1 downto 0) <= CoreAhbSram_L01L&CoreAhbSram_L01L;
when "0010" =>
CoreAhbSram_LLOL(3 downto 2) <= COREAhbSram_l01L&COreAhbSram_l01L;
when "0011" =>
COREAHBSram_llol(3 downto 2) <= CoreAHBSRAM_l01l&CoreAhBSRAM_L01l;
when "0100" =>
COREAhbSram_llol(5 downto 4) <= CoreAhbSRAM_L01l&CoreAhbSRAM_L01l;
when "0101" =>
CoreAhbSrAM_LLOL(5 downto 4) <= CoreAhbSram_L01L&CoreAhbSraM_L01L;
when "0110" =>
COReAhbSram_llOL(7 downto 6) <= COREAHBSRam_l01l&COREAHBSRam_l01l;
when "0111" =>
CoreAhbSRAM_LLol(7 downto 6) <= COREAhbSram_l01L&COREAhbSram_l01L;
when "1000" =>
CoreAHBSRAM_llol(9 downto 8) <= CoreAhbSraM_L01L&CoreAhbSram_L01L;
when "1001" =>
CoreAhBSRAM_Llol(9 downto 8) <= COREAHBSram_l01l&COreAhbSrAM_L01l;
when "1010" =>
COReAhbSram_lLOL(10) <= COreAhbSram_l01L;
when "1011" =>
CoreAhbSraM_LLOL(3 downto 2) <= CorEAHBSRAM_l01l&COREAHBSRam_l01l;
when "1100" =>
CoreAhbSrAM_LLOL(5 downto 4) <= COREAHBSram_l01l&CorEAHBSRAM_l01l;
when "1101" =>
COREAHBSram_llol(5 downto 4) <= COREAHBSram_l01l&COREAHBSram_l01l;
when "1110" =>
COreAhbSram_lLOL(7 downto 6) <= CoreAhbSram_L01L&COREAHbSram_l01L;
when "1111" =>
CoreAhBSRAM_Llol(7 downto 6) <= CoREAHBSRAm_l01l&COREAHBSRam_l01l;
when others =>
null
;
end case;
case (CoreAhBSRAM_IIi(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_ILol(1 downto 0) <= COREAHBSram_i01l&COREAhbSram_i01L;
when "0001" =>
CoreAHBSRAM_ilol(1 downto 0) <= COREAhbSram_i01L&CoreAhbSram_I01L;
when "0010" =>
COREAhbSram_iloL(3 downto 2) <= COReAhbSram_i01L&COreAhbSram_I01L;
when "0011" =>
CorEAHBSRAm_ilol(3 downto 2) <= COReAhbSram_i01L&COreAhbSram_i01L;
when "0100" =>
COREAhbSram_iloL(5 downto 4) <= COREAHBSram_i01l&COREAhbSram_i01L;
when "0101" =>
CoREAHBSRAm_ilol(5 downto 4) <= COREAHBSRam_i01l&COREAHbSram_i01l;
when "0110" =>
CoREAHBSRAm_ilol(7 downto 6) <= CoreAHBSRAM_i01l&CoREAHBSRAm_i01l;
when "0111" =>
CoreAHBSRAM_Ilol(7 downto 6) <= COreAhbSram_I01L&CoreAhbSram_I01L;
when "1000" =>
COreAhbSram_iLOL(9 downto 8) <= COreAhbSram_I01L&CoreAhbSram_I01L;
when "1001" =>
COREAhbSram_ilOL(9 downto 8) <= CoreAhbSraM_I01L&CoreAhbSrAM_I01L;
when "1010" =>
CoreAHBSRAM_ilol(10) <= CoreAhbSram_I01L;
when "1011" =>
CoreAhbSraM_ILOL(3 downto 2) <= CoreAhbSraM_I01L&CoreAhbSraM_I01L;
when "1100" =>
CoREAHBSRam_ilol(5 downto 4) <= COREAHBSram_i01l&COREAhbSram_i01l;
when "1101" =>
CorEAHBSRAm_ilol(5 downto 4) <= COREAhbSram_i01L&COreAhbSram_i01L;
when "1110" =>
COREAhbSram_ilol(7 downto 6) <= COReAhbSram_i01L&CoreAhbSraM_I01L;
when "1111" =>
CoreAhbSrAM_ILOL(7 downto 6) <= CoreAhbSraM_I01L&CoreAhbSram_I01L;
when others =>
null
;
end case;
case (COreAhbSraM_Io1(12 downto 9)) is
when "0000" =>
COREAhbSram_l0I <= CoreAhbSraM_IILL(3 downto 0)&CoreAHBSRAM_Lill(3 downto 0);
when "0001" =>
CoreAHBSRAM_l0i <= CoreAhbSram_IILL(3 downto 0)&CorEAHBSRAM_lill(3 downto 0);
when "0010" =>
COREAHBSram_l0i <= CoREAHBSRAm_l0ll(3 downto 0)&CoreAhbSraM_O0LL(3 downto 0);
when "0011" =>
COREAHbSram_l0i <= COREAHBSram_l0ll(3 downto 0)&CoreAhbSrAM_O0LL(3 downto 0);
when "0100" =>
CoreAhbSram_L0I <= CoreAhbSram_O1LL(3 downto 0)&COreAhbSram_i0LL(3 downto 0);
when "0101" =>
CoreAhbSraM_L0I <= CoreAHBSRAM_o1ll(3 downto 0)&CoreAHBSRAM_i0ll(3 downto 0);
when "0110" =>
CoreAhBSRAM_L0i <= CoreAhbSram_I1LL(3 downto 0)&COREAHBSram_l1ll(3 downto 0);
when "0111" =>
COREAHbSram_l0i <= COREAhbSram_i1LL(3 downto 0)&CorEAHBSRAM_l1ll(3 downto 0);
when "1000" =>
CoreAhbSRAM_L0i <= COREAHBSram_loil(3 downto 0)&COreAhbSram_oOIL(3 downto 0);
when "1001" =>
COREAhbSram_l0i <= CoreAhbSraM_LOIL(3 downto 0)&COREAHBSram_ooil(3 downto 0);
when "1010" =>
COReAhbSram_l0I <= CorEAHBSRAM_ioil;
when "1011" =>
COREAhbSram_l0i <= CoreAHBSRAM_l0ll(3 downto 0)&COREAHBSRam_o0ll(3 downto 0);
when "1100" =>
COREAHBSRam_l0i <= CoreAHBSRAM_O1ll(3 downto 0)&COreAhbSram_i0LL(3 downto 0);
when "1101" =>
COreAhbSram_l0I <= COREAhbSram_o1lL(3 downto 0)&CoreAHBSRAM_i0ll(3 downto 0);
when "1110" =>
CoreAhbSram_L0I <= CorEAHBSRAM_i1ll(3 downto 0)&CoreAhbSraM_L1LL(3 downto 0);
when "1111" =>
CorEAHBSRAm_l0i <= CoreAhbSrAM_I1LL(3 downto 0)&CorEAHBSRAm_l1ll(3 downto 0);
when others =>
null
;
end case;
when 2 =>
CoreAhbSram_OL1 <= "01";
CoreAHBSRAM_ll1 <= "01";
CoreAhbSraM_IL1 <= "01";
CoreAhbSrAM_OI1 <= "01";
COREAhbSram_li1 <= "01";
CoreAhbSRAM_Ii1 <= "01";
CorEAHBSram_o01 <= "01";
CoreAHBSRam_l01 <= "01";
CoreAhbSRAM_I01 <= "10";
COReAhbSraM_O11 <= "10";
CoreAhbSRAM_L11 <= "11";
CoreAhbSRAM_Iiil <= '0'&CoreAHBSRam_o0i(10 downto 0);
CoreAhbSRAM_O0il <= '0'&CoreAHBSRAm_o0i(10 downto 0);
COREAhbSraM_L0IL <= '0'&CorEAHBSram_o0i(10 downto 0);
CoreAHBSRAM_i0il <= '0'&COREAHbSram_o0I(10 downto 0);
COREAHbSram_o1IL <= '0'&CoreAhbSRAM_o0i(10 downto 0);
CoreAhbSRAM_L1il <= '0'&COReAhbSraM_O0I(10 downto 0);
CoreAHBSRam_i1il <= '0'&CoreAhbSRAM_O0i(10 downto 0);
CorEAHBSram_oo0L <= '0'&COREAhbSram_O0I(10 downto 0);
CoreAhbSRAM_LO0l <= "00"&COReAhbSraM_O0I(9 downto 0);
CoreAhBSRAM_io0l <= "00"&CoreAhBSRAM_o0i(9 downto 0);
COreAhbSrAM_OL0l <= "000"&CoreAhbSRAM_o0i(8 downto 0);
CoreAHBSRAm_o00l <= '0'&CorEAHBSram_iiI(10 downto 0);
COreAhbSrAM_L00l <= '0'&CoreAHBSRam_iii(10 downto 0);
COREAhbSram_I00L <= '0'&COREAhbSram_III(10 downto 0);
CoreAhBSRAM_o10l <= '0'&CoreAHBSRAm_iii(10 downto 0);
CoreAHBSRAM_L10l <= '0'&COREAHBSram_iii(10 downto 0);
CoreAhbSram_I10L <= '0'&COREAHBSram_iii(10 downto 0);
COREAHBSram_oo1l <= '0'&CoreAhbSram_III(10 downto 0);
CoreAhbSraM_LO1L <= '0'&CoreAhbSrAM_III(10 downto 0);
CoreAhbSram_IO1L <= "00"&COreAhbSRAM_IIi(9 downto 0);
CoreAHBSRAM_ol1l <= "00"&COREAhbSram_iii(9 downto 0);
CoreAhbSRAM_LL1l <= "000"&CoreAhBSRAM_Iii(8 downto 0);
COREAHBSram_oiol(1 downto 0) <= CoreAhbSRAM_LIi(1 downto 0);
COREAhbSram_lioL(1 downto 0) <= COREAHBSram_lii(3 downto 2);
COREAHbSram_iiol(1 downto 0) <= CoreAhBSRAM_LIi(5 downto 4);
CoreAhbSram_O0OL(1 downto 0) <= CoreAhbSRAM_LII(7 downto 6);
COREAhbSram_l0oL(1 downto 0) <= COREAhbSram_lii(1 downto 0);
CoreAhbSrAM_I0OL(1 downto 0) <= CorEAHBSRAM_lii(3 downto 2);
CoreAhbSraM_O1OL(1 downto 0) <= COREAHBSram_lii(5 downto 4);
CoreAhbSram_L1OL(1 downto 0) <= CoreAhbSraM_LII(7 downto 6);
CoreAhbSrAM_I1OL(3 downto 0) <= CoreAhbSram_LII(3 downto 0);
COREAHbSram_ooll(3 downto 0) <= CoreAhBSRAM_Lii(7 downto 4);
CoreAhBSRAM_Loll <= COreAhbSram_lII;
case (CoreAhbSRAM_O0I(12 downto 9)) is
when "0000" =>
CoreAhbSrAM_LLOL(3 downto 0) <= CoreAhbSraM_L01L&COReAhbSram_l01L&CoreAhBSRAM_L01l&CoreAhbSram_L01L;
when "0001" =>
CoreAHBSRAM_llol(3 downto 0) <= CoreAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhbSram_L01L&COREAhbSram_l01l;
when "0010" =>
COREAhbSram_lloL(3 downto 0) <= CoreAhbSraM_L01L&CoreAhbSraM_L01L&COREAHBSram_l01l&CorEAHBSRAM_l01l;
when "0011" =>
COREAhbSram_lloL(3 downto 0) <= COREAhbSram_l01l&COREAHbSram_l01l&CoreAhbSrAM_L01L&CoreAhbSram_L01L;
when "0100" =>
CoreAhbSrAM_LLOL(7 downto 4) <= COREAhbSram_L01L&CorEAHBSram_l01L&CorEAHBSram_l01L&CoREAHBSram_l01L;
when "0101" =>
CoreAhBSRAM_llol(7 downto 4) <= CoreAhbSRAM_L01l&COREAhbSram_L01L&COReAhbSram_l01L&COREAhbSram_l01l;
when "0110" =>
CoreAhbSraM_LLOL(7 downto 4) <= CoreAHBSRAM_L01l&CoREAHBSRAm_l01l&CoreAhbSraM_L01L&COREAhbSram_l01L;
when "0111" =>
CorEAHBSRAm_llol(7 downto 4) <= CoreAhbSram_L01L&CoreAhbSraM_L01L&COREAhbSram_l01L&COREAHbSram_l01l;
when "1000" =>
COREAHBSram_llol(9 downto 8) <= COREAhbSram_l01l&COREAhbSram_l01L;
when "1001" =>
COREAHBSram_llol(9 downto 8) <= COREAhbSram_l01L&COREAhbSram_l01L;
when "1010" =>
CoreAhbSraM_LLOL(10) <= COREAHBSram_l01l;
when "1011" =>
COREAhbSram_lloL(3 downto 0) <= CoreAhbSram_L01L&COreAhbSram_l01L&CoreAhbSram_L01L&COREAhbSram_l01l;
when "1100" =>
CoreAhbSram_LLOL(7 downto 4) <= CoreAhbSRAM_L01l&CorEAHBSRAM_l01l&CoreAhbSram_L01L&COReAhbSram_l01L;
when "1101" =>
COReAhbSram_lLOL(7 downto 4) <= COREAHbSram_l01l&COREAhbSram_l01L&CoreAhBSRAM_L01l&COReAhbSram_l01L;
when "1110" =>
COREAHBSRam_llol(7 downto 4) <= CoreAhBSRAM_L01l&CoreAhBSRAM_L01l&COREAhbSram_l01L&CorEAHBSRAM_l01l;
when "1111" =>
COREAHBSram_llol(7 downto 4) <= COREAHbSram_l01l&COREAHBSram_l01l&CoreAhbSRAM_L01l&COreAhbSram_l01L;
when others =>
null
;
end case;
case (CoreAhBSRAM_Iii(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_ILOl(3 downto 0) <= CoreAhBSRAM_I01l&CoreAHBSRAM_I01l&COreAhbSram_i01L&CoREAHBSRAm_i01l;
when "0001" =>
COREAHBSram_ilol(3 downto 0) <= CoreAhbSraM_I01L&CoreAhbSraM_I01L&COREAHbSram_i01l&COREAHBSram_i01l;
when "0010" =>
COREAhbSram_iloL(3 downto 0) <= COREAHBSram_i01l&COReAhbSram_i01L&CoREAHBSRAm_i01l&CoreAHBSRAM_I01l;
when "0011" =>
CoreAhbSram_ILOL(3 downto 0) <= COReAhbSram_i01L&CoreAhbSram_I01L&COReAhbSram_i01L&COREAHBSram_i01l;
when "0100" =>
COREAhbSram_ilOL(7 downto 4) <= CoreAHBSRAM_i01l&CoREAHBSRAm_i01l&CoreAhbSram_I01L&CoreAhbSram_I01L;
when "0101" =>
CoreAHBSRAM_ilol(7 downto 4) <= COREAhbSram_i01L&CoreAhbSram_I01L&COREAHbSram_i01l&CoreAhbSrAM_I01L;
when "0110" =>
CoreAhbSrAM_ILOL(7 downto 4) <= COREAHBSRam_i01l&COREAHBSram_i01l&CoreAhbSRAM_I01l&COReAhbSram_i01L;
when "0111" =>
CoreAHBSRAM_Ilol(7 downto 4) <= COREAHBSram_i01l&COREAHbSram_i01l&CoreAhbSrAM_I01L&COReAhbSram_i01L;
when "1000" =>
COREAHBSram_ilol(9 downto 8) <= COREAHBSRam_i01l&COREAHBSram_i01l;
when "1001" =>
COREAhbSram_ilol(9 downto 8) <= CoreAhBSRAM_i01l&COREAhbSram_I01L;
when "1010" =>
CoREAHBSram_ilOL(10) <= CoreAHBSRam_i01L;
when "1011" =>
CoreAHBSRam_iloL(3 downto 0) <= CoreAhBSRAm_i01l&CoreAHBSRAM_i01l&CoreAhbSRAM_i01l&COREAhbSram_I01L;
when "1100" =>
COREAHbSram_ILOL(7 downto 4) <= COREAhbSram_I01L&CoREAHBSram_i01L&CoreAhbSRAM_i01l&CoreAhbSRAM_I01l;
when "1101" =>
CoREAHBSram_iLOL(7 downto 4) <= COREAHbSram_I01L&CoreAHBSRAm_i01l&CoreAhBSRAM_i01l&CoREAHBSram_i01L;
when "1110" =>
COREAhbSram_ILOL(7 downto 4) <= COREAhbSram_I01L&COreAhbSrAM_I01l&CoreAhBSRAM_i01l&CoREAHBSram_i01L;
when "1111" =>
CoreAHBSram_iloL(7 downto 4) <= CoreAHBSram_i01L&CoreAHBSRAm_i01l&CoreAhBSRAM_i01l&CoreAhbSrAM_I01l;
when others =>
null
;
end case;
case (CoreAHBSRam_io1(12 downto 9)) is
when "0000" =>
COreAhbSrAM_L0I <= CoreAHBSRam_l0lL(1 downto 0)&COReAhbSraM_O0LL(1 downto 0)&CorEAHBSRAm_iill(1 downto 0)&COREAHBSram_lill(1 downto 0);
when "0001" =>
COREAhbSram_l0I <= CoreAHBSRAM_l0ll(1 downto 0)&CoreAhbSRAM_O0ll(1 downto 0)&CoreAhbSram_IILL(1 downto 0)&COReAhbSram_liLL(1 downto 0);
when "0010" =>
CoreAhbSRAM_L0I <= CoreAHBSRam_l0lL(1 downto 0)&CorEAHBSram_o0LL(1 downto 0)&CoREAHBSram_iiLL(1 downto 0)&COreAhbSram_lILL(1 downto 0);
when "0011" =>
COREAhbSram_l0I <= COreAhbSram_l0LL(1 downto 0)&CoreAhbSraM_O0LL(1 downto 0)&CorEAHBSRAm_iill(1 downto 0)&COREAHbSram_lILL(1 downto 0);
when "0100" =>
CoreAHBSRAM_l0i <= COREAhbSram_i1lL(1 downto 0)&CoreAHBSRAM_L1ll(1 downto 0)&COREAhbSram_o1LL(1 downto 0)&COREAHBSRam_i0ll(1 downto 0);
when "0101" =>
COReAhbSram_l0I <= CoreAHBSRAM_i1ll(1 downto 0)&CoreAhbSRAM_L1Ll(1 downto 0)&COREAhbSram_o1lL(1 downto 0)&COREAHBSram_i0ll(1 downto 0);
when "0110" =>
CoreAhbSraM_L0I <= COReAhbSram_i1LL(1 downto 0)&CoreAhBSRAM_L1ll(1 downto 0)&COREAHbSram_o1ll(1 downto 0)&COREAHBSRam_i0ll(1 downto 0);
when "0111" =>
CoreAhbSram_L0I <= COREAHbSram_i1ll(1 downto 0)&COREAHBSRam_l1ll(1 downto 0)&CoreAhbSram_O1LL(1 downto 0)&COREAHBSRam_i0ll(1 downto 0);
when "1000" =>
CoreAhbSRAM_L0I <= CoreAhbSRAM_LOIl(3 downto 0)&CoreAhbSRAM_OOIl(3 downto 0);
when "1001" =>
CoreAhbSraM_L0I <= CoreAhbSRAM_LOil(3 downto 0)&CoreAhbSrAM_OOIL(3 downto 0);
when "1010" =>
COREAHbSram_l0i <= CoreAhbSRAM_IOIl;
when "1011" =>
COreAhbSram_l0I <= CoreAhbSram_L0LL(1 downto 0)&COREAHbSram_o0ll(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&COREAhbSram_lilL(1 downto 0);
when "1100" =>
COREAhbSram_l0i <= COreAhbSram_I1LL(1 downto 0)&CoreAhbSraM_L1LL(1 downto 0)&CoREAHBSRAm_o1ll(1 downto 0)&CoreAhbSram_I0LL(1 downto 0);
when "1101" =>
COREAhbSram_l0i <= COREAhbSram_i1LL(1 downto 0)&CorEAHBSRAM_l1ll(1 downto 0)&CoreAhbSRAM_O1ll(1 downto 0)&COREAHbSram_i0ll(1 downto 0);
when "1110" =>
CoREAHBSRAm_l0i <= CorEAHBSRAM_i1ll(1 downto 0)&COREAHBSram_l1ll(1 downto 0)&COREAHbSram_o1ll(1 downto 0)&COReAhbSram_i0LL(1 downto 0);
when "1111" =>
COREAHbSram_l0i <= COreAhbSram_I1LL(1 downto 0)&CoreAhbSram_L1LL(1 downto 0)&CoreAhbSRAM_O1ll(1 downto 0)&CorEAHBSRAM_i0ll(1 downto 0);
when others =>
null
;
end case;
when others =>
CoreAhbSram_OL1 <= "00";
COReAhbSram_ll1 <= "00";
CoreAHBSRAM_Il1 <= "00";
CoreAhbSRAM_OI1 <= "00";
COREAHBSram_li1 <= "00";
COreAhbSram_iI1 <= "00";
COReAhbSram_o01 <= "00";
COREAhbSram_l01 <= "00";
CoreAhBSRAM_I01 <= "10";
CorEAHBSRAM_o11 <= "10";
CoreAhbSrAM_L11 <= "11";
CoreAhbSRAM_IIIl <= CoreAhbSraM_O0I(11 downto 0);
CoreAhbSram_O0IL <= CoreAhbSram_O0I(11 downto 0);
CoreAhbSRAM_L0Il <= CoreAHBSRAM_o0i(11 downto 0);
CoreAhBSRAM_I0il <= CoREAHBSRAm_o0i(11 downto 0);
CorEAHBSRAM_o1il <= CoreAhbSRAM_O0I(11 downto 0);
CoreAhbSRAM_L1Il <= COREAHBSram_o0i(11 downto 0);
CoreAhbSraM_I1IL <= COREAHBSram_o0i(11 downto 0);
CoreAHBSRAM_oo0l <= COREAhbSram_o0I(11 downto 0);
COREAHBSRam_lo0l <= "00"&COREAHbSram_o0i(9 downto 0);
COREAhbSram_io0l <= "00"&CoreAhbSRAM_O0i(9 downto 0);
COreAhbSram_OL0L <= "000"&COREAHBSram_o0i(8 downto 0);
CoreAhbSram_O00L <= COREAhbSram_iii(11 downto 0);
COREAhbSram_l00L <= COREAHBSram_iii(11 downto 0);
COREAHBSram_i00l <= CoreAhbSRAM_IIi(11 downto 0);
COreAhbSram_O10L <= CoreAhbSram_III(11 downto 0);
COReAhbSram_L10L <= CorEAHBSram_iiI(11 downto 0);
COreAhbSram_i10L <= COREAHBSram_iii(11 downto 0);
CorEAHBSRAm_oo1l <= CoreAHBSRAM_iii(11 downto 0);
COREAHBSram_lo1l <= COREAHBSram_iii(11 downto 0);
CoreAHBSRAM_io1l <= "00"&COREAHbSram_iii(9 downto 0);
CoreAhbSraM_OL1L <= "00"&COREAHBSram_iii(9 downto 0);
COREAHBSram_ll1l <= "000"&CorEAHBSRAM_iii(8 downto 0);
CoreAhbSrAM_OIOL(0) <= CoreAhbSram_LII(0);
CoreAhbSrAM_LIOL(0) <= COREAhbSram_lii(1);
CorEAHBSRAm_iiol(0) <= COReAhbSram_liI(2);
CoreAhbSraM_O0OL(0) <= CoreAhbSrAM_LII(3);
COREAHBSram_l0ol(0) <= CoreAhbSRAM_LIi(4);
CoreAhbSram_I0OL(0) <= CoreAhbSRAM_Lii(5);
CoreAhbSraM_O1OL(0) <= COREAhbSram_lii(6);
CoreAhbSraM_L1OL(0) <= COreAhbSram_lII(7);
COREAhbSram_i1oL(3 downto 0) <= COREAhbSram_liI(3 downto 0);
CoreAhbSram_OOLL(3 downto 0) <= COREAhbSram_liI(7 downto 4);
COREAhbSram_lolL <= COREAhbSram_lii;
case (CoreAhbSram_O0I(12 downto 9)) is
when "0000" =>
COREAhbSram_llOL(7 downto 0) <= CoREAHBSRAm_l01l&COREAHBSram_l01l&CoreAhbSrAM_L01L&COREAHBSram_l01l&CoreAhBSRAM_L01l&CoreAhbSram_L01L&COREAHbSram_l01l&CoreAHBSRAM_l01l;
when "0001" =>
COREAHBSRam_llol(7 downto 0) <= CoreAhbSram_L01L&CoreAhbSram_L01L&CoreAhBSRAM_L01l&COReAhbSram_l01L&COREAHBSRAm_l01l&CoREAHBSRAm_l01l&CoreAhbSram_L01L&COREAHBSram_l01l;
when "0010" =>
CoreAhbSRAM_Llol(7 downto 0) <= CoreAHBSRAm_l01l&CoreAhBSRAM_l01l&CoreAhbSraM_L01L&COReAhbSram_l01L&CoreAhBSRAM_L01l&CoreAhbSrAM_L01L&CoreAhbSram_L01L&COREAHBSram_l01l;
when "0011" =>
CoreAHBSRAM_llol(7 downto 0) <= CoreAHBSRAM_l01l&COREAHBSRam_l01l&CorEAHBSRAm_l01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L&COReAhbSram_l01L&COREAHBSRam_l01l&CorEAHBSRAM_l01l;
when "0100" =>
CoreAhbSraM_LLOL(7 downto 0) <= COREAHBSram_l01l&COREAHBSram_l01l&CoreAHBSRAM_l01l&CoreAHBSRAM_L01l&COREAHbSram_l01l&CoreAhbSrAM_L01L&COREAhbSram_l01L&CoreAHBSRAM_l01l;
when "0101" =>
CoreAHBSRAM_Llol(7 downto 0) <= COREAHBSram_l01l&COREAhbSram_l01L&CoreAhbSram_L01L&COREAhbSram_l01L&CorEAHBSRAM_l01l&CoreAHBSRAM_L01l&COREAhbSram_l01L&CoreAhBSRAM_L01l;
when "0110" =>
CoreAhbSraM_LLOL(7 downto 0) <= COREAhbSram_l01L&COREAhbSram_l01L&CoreAhBSRAM_L01l&COREAhbSram_l01L&CoreAHBSRAM_l01l&CoreAhbSRAM_l01l&COREAhbSram_L01L&CoreAhbSRAM_l01l;
when "0111" =>
CoreAHBSRAM_llol(7 downto 0) <= COREAhbSram_L01L&COREAhbSram_L01L&CoreAHBSRam_l01L&COreAhbSrAM_L01l&COREAhbSram_L01L&COREAhbSram_l01L&COReAhbSram_l01L&CoreAhbSraM_L01L;
when "1000" =>
CoreAhbSram_LLOL(9 downto 8) <= CoreAhbSraM_L01L&CoreAhbSRAM_L01l;
when "1001" =>
COREAhbSram_lloL(9 downto 8) <= CoreAHBSRAM_l01l&CoreAhbSraM_L01L;
when "1010" =>
CoreAhbSraM_LLOL(10) <= COReAhbSram_l01L;
when "1011" =>
CoreAhbSRAM_LLol(7 downto 0) <= CoreAHBSRAM_l01l&COREAHbSram_l01l&CoreAHBSRAM_l01l&CoreAhbSraM_L01L&CoreAhbSram_L01L&CoreAhbSram_L01L&COreAhbSram_l01L&COREAhbSram_l01L;
when "1100" =>
COReAhbSram_llOL(7 downto 0) <= CoreAhBSRAM_L01l&COREAHBSRam_l01l&CoreAhbSram_L01L&COREAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhbSram_L01L&COREAhbSram_l01L&COReAhbSram_l01L;
when "1101" =>
COreAhbSram_lLOL(7 downto 0) <= COREAhbSram_l01L&COREAhbSram_l01L&CoreAhBSRAM_L01l&COReAhbSram_l01L&CorEAHBSRAM_l01l&CoreAhbSRAM_L01l&COREAHbSram_l01l&CoreAhbSraM_L01L;
when "1110" =>
CoreAhbSraM_LLOL(7 downto 0) <= CoreAhbSraM_L01L&CoreAhbSraM_L01L&COREAHbSram_l01l&CoreAhBSRAM_L01l&CoreAhbSram_L01L&COREAhbSram_l01l&CoreAhbSrAM_L01L&COREAHBSram_l01l;
when "1111" =>
COREAHBSram_llol(7 downto 0) <= CoreAhbSRAM_L01l&CoreAhBSRAM_L01l&COReAhbSram_l01L&CoreAHBSRAM_l01l&COreAhbSram_l01L&COREAHBSram_l01l&CoreAhbSraM_L01L&COreAhbSram_l01L;
when others =>
null
;
end case;
case (CoreAhbSRAM_IIi(12 downto 9)) is
when "0000" =>
CoreAhBSRAM_Ilol(7 downto 0) <= COREAHBSram_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CorEAHBSRAM_i01l&CoreAhbSraM_I01L&COREAhbSram_i01L&CoreAhBSRAM_i01l&COREAHBSram_i01l;
when "0001" =>
CoreAhbSraM_ILOL(7 downto 0) <= COREAHbSram_i01l&CoreAhbSraM_I01L&COREAHbSram_i01l&COREAHBSRam_i01l&CoreAhbSrAM_I01L&CoreAhbSrAM_I01L&COReAhbSram_i01L&CorEAHBSRAM_i01l;
when "0010" =>
COREAhbSram_ilOL(7 downto 0) <= CoreAhbSraM_I01L&CoreAHBSRAM_i01l&CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhbSRAM_I01l;
when "0011" =>
CoreAhBSRAM_Ilol(7 downto 0) <= CoREAHBSram_i01L&COREAhbSram_I01L&COREAhbSram_I01L&COREAhbSram_I01L&CoreAhbSRAM_i01l&COREAhbSram_I01L&CoreAHBSram_i01L&CoreAhbSrAM_I01l;
when "0100" =>
CoreAhbSRAM_ilol(7 downto 0) <= CoreAHBSRAM_i01l&CoreAhbSram_I01L&CoreAhbSram_I01L&CoreAhbSram_I01L&CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COREAhbSram_i01l;
when "0101" =>
COReAhbSram_ilOL(7 downto 0) <= COReAhbSram_i01L&CoreAhbSrAM_I01L&COreAhbSram_I01L&COREAHbSram_i01l&CoreAhbSRAM_I01L&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COreAhbSram_I01L;
when "0110" =>
CoreAHBSRAM_ilol(7 downto 0) <= COREAHBSram_i01l&COReAhbSram_i01L&COREAHBSRam_i01l&CoreAHBSRAM_i01l&CoreAhbSrAM_I01L&CoreAhbSrAM_I01L&COReAhbSram_i01L&COREAHBSRam_i01l;
when "0111" =>
CoreAhbSrAM_ILOL(7 downto 0) <= COREAHBSRam_i01l&CoreAhbSram_I01L&COReAhbSram_i01L&CoreAhBSRAM_I01l&COreAhbSram_i01L&COREAHBSram_i01l&CoreAhbSRAM_I01l&COreAhbSram_I01L;
when "1000" =>
CoreAhbSraM_ILOL(9 downto 8) <= CoreAHBSRAM_i01l&COREAHbSram_i01l;
when "1001" =>
COREAhbSram_iloL(9 downto 8) <= CoreAHBSRAM_i01l&COREAHBSram_i01l;
when "1010" =>
CorEAHBSRAm_ilol(10) <= CoreAhbSraM_I01L;
when "1011" =>
COREAhbSram_iloL(7 downto 0) <= CoreAhbSrAM_I01L&CorEAHBSRAM_i01l&CoreAhbSram_I01L&COREAHbSram_i01l&CoREAHBSRAm_i01l&CoreAhbSrAM_I01L&COReAhbSram_i01L&CoreAhbSram_I01L;
when "1100" =>
COREAHBSRam_ilol(7 downto 0) <= COREAHBSram_i01l&COREAhbSram_i01L&COREAHBSRam_i01l&CoreAHBSRAM_i01l&CoreAhbSRAM_I01l&CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAhbSram_I01L;
when "1101" =>
COREAhbSram_ilOL(7 downto 0) <= CoreAhBSRAM_I01l&COREAHBSram_i01l&CoreAHBSRAM_I01l&CoreAhbSram_I01L&CorEAHBSRAM_i01l&CoreAhbSRAM_I01l&COREAhbSram_i01L&CorEAHBSRAM_i01l;
when "1110" =>
CoreAhbSrAM_ILOL(7 downto 0) <= CoreAhbSraM_I01L&CoreAhbSrAM_I01L&COReAhbSram_i01L&COREAhbSram_i01l&CoreAhBSRAM_I01l&CoreAhbSrAM_I01L&COReAhbSram_i01L&CoREAHBSRAm_i01l;
when "1111" =>
CoreAhbSram_ILOL(7 downto 0) <= COreAhbSram_i01L&CoreAhbSram_I01L&COREAhbSram_i01l&CoREAHBSRAm_i01l&COREAhbSram_i01L&COREAHBSRam_i01l&CoreAhbSram_I01L&COREAhbSram_i01l;
when others =>
null
;
end case;
case (COreAhbSram_IO1(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_I1Ll(0)&COREAhbSram_l1lL(0)&COREAhbSram_o1lL(0)&CoreAHBSRAM_i0ll(0)&CoreAhbSrAM_L0LL(0)&COReAhbSram_o0LL(0)&CoreAhbSrAM_IILL(0)&CoREAHBSRAm_lill(0);
when "0001" =>
COREAhbSram_l0i <= CoreAhbSram_I1LL(0)&COREAHBSram_l1ll(0)&COREAHBSram_o1ll(0)&COREAhbSram_i0lL(0)&COREAhbSram_l0lL(0)&COREAhbSram_o0ll(0)&CoREAHBSRAm_iill(0)&COREAhbSram_lilL(0);
when "0010" =>
CoreAhBSRAM_L0i <= CoreAhbSRAM_I1ll(0)&CoreAhbSraM_L1LL(0)&COREAHbSram_o1ll(0)&CoreAhbSraM_I0LL(0)&COreAhbSram_L0LL(0)&COREAHBSram_o0ll(0)&CoreAhbSRAM_IIll(0)&CoreAHBSRAM_lill(0);
when "0011" =>
CoreAhBSRAM_L0i <= CoREAHBSRAm_i1ll(0)&COREAhbSram_l1ll(0)&CoreAhbSram_O1LL(0)&COREAhbSram_i0LL(0)&CoreAhBSRAM_L0ll(0)&CoreAhbSram_O0LL(0)&CoREAHBSRam_iill(0)&CorEAHBSRAM_lill(0);
when "0100" =>
CoreAhbSraM_L0I <= CoreAhbSram_I1LL(0)&CoreAHBSRAM_l1ll(0)&CoreAhbSram_O1LL(0)&COREAHbSram_i0ll(0)&COreAhbSraM_L0Ll(0)&CoreAHBSRam_o0ll(0)&COREAhbSram_IILL(0)&COReAhbSraM_LILL(0);
when "0101" =>
CoreAHBSRAm_l0i <= COREAhbSram_I1LL(0)&COREAhbSram_L1LL(0)&COREAhbSram_O1LL(0)&CoreAhBSRAM_i0ll(0)&COREAHbSram_l0LL(0)&COReAhbSram_O0LL(0)&CoreAhbSRAm_IILL(0)&COreAhbSrAM_LILl(0);
when "0110" =>
COreAhbSrAM_L0i <= CoreAhbSRAM_i1ll(0)&CoreAHBSRam_l1ll(0)&CorEAHBSram_o1LL(0)&CoreAhBSRAM_i0ll(0)&CoreAhbSRAM_l0ll(0)&CoREAHBSram_o0LL(0)&COreAhbSrAM_IILl(0)&CoreAHBSram_liLL(0);
when "0111" =>
CoreAhbSRAM_L0i <= CoreAhBSRAM_i1ll(0)&COreAhbSrAM_L1Ll(0)&COReAhbSram_O1LL(0)&COreAhbSrAM_I0Ll(0)&CorEAHBSram_l0lL(0)&CoreAhbSRAM_O0ll(0)&CoreAHBSRAm_iill(0)&COReAhbSrAM_LILl(0);
when "1000" =>
CoREAHbSram_l0I <= CoreAhbSrAM_LOIL(3 downto 0)&COREAhbSram_ooiL(3 downto 0);
when "1001" =>
COREAhbSram_l0i <= CoreAhbSRAM_LOIl(3 downto 0)&COREAHBSram_ooil(3 downto 0);
when "1010" =>
COreAhbSram_L0I <= CoreAhbSram_IOIL;
when "1011" =>
CoreAhbSram_L0I <= COREAHBSram_i1ll(0)&CoreAhbSram_L1LL(0)&CoreAhbSrAM_O1LL(0)&CoreAHBSRAM_I0ll(0)&CorEAHBSRAm_l0ll(0)&CoreAhbSram_O0LL(0)&CoreAhbSRAM_IILl(0)&CoreAhbSram_LILL(0);
when "1100" =>
CoreAHBSRAM_l0i <= CoreAhbSraM_I1LL(0)&CoreAhbSram_L1LL(0)&COREAHbSram_o1ll(0)&COREAhbSram_i0LL(0)&CorEAHBSram_l0LL(0)&CoreAhbSRAM_O0ll(0)&COReAhbSram_iiLL(0)&COREAhbSram_lilL(0);
when "1101" =>
CorEAHBSRAM_l0i <= CoREAHBSRAm_i1ll(0)&CoreAHBSRAM_l1ll(0)&CorEAHBSRAm_o1ll(0)&CoreAhbSraM_I0LL(0)&CorEAHBSRAm_l0ll(0)&CoreAhbSraM_O0LL(0)&COREAHBSram_iill(0)&COREAHBSram_lill(0);
when "1110" =>
CoreAhbSram_L0I <= CorEAHBSRAM_i1ll(0)&CoreAHBSRAM_L1ll(0)&COREAHBSRam_o1ll(0)&CoreAhbSram_I0LL(0)&CoreAhbSRAM_L0LL(0)&CoreAhBSRAM_O0ll(0)&COReAhbSram_iiLL(0)&CoreAHBSram_lilL(0);
when "1111" =>
CoreAhbSraM_L0I <= COREAhbSram_i1LL(0)&CoreAhbSraM_L1LL(0)&COREAHBSRam_o1ll(0)&COREAhbSram_i0lL(0)&COREAHBSRam_l0ll(0)&COREAhbSram_o0lL(0)&CoreAHBSRAM_iill(0)&COReAhbSram_liLL(0);
when others =>
null
;
end case;
end case;
when 6144 =>
case (CoreAHBSRAM_lo1) is
when 8 =>
CorEAHBSRAM_ol1 <= "11";
CoreAHBSRAM_ll1 <= "11";
CoreAhBSRAM_IL1 <= "11";
COreAhbSram_oI1 <= "11";
CorEAHBSRAm_li1 <= "11";
COREAhbSram_ii1 <= "11";
COREAHbSram_o01 <= "11";
COREAHBSram_l01 <= "11";
CoreAhbSraM_I01 <= "11";
CoreAhbSRAM_O11 <= "11";
CoREAHBSRam_l11 <= "11";
COReAhbSraM_I11 <= "11";
COREAHBSram_iiil <= "000"&CoreAHBSRAM_o0i(8 downto 0);
COREAhbSram_o0IL <= "000"&COREAhbSram_o0i(8 downto 0);
COReAhbSram_l0IL <= "000"&COREAHbSram_o0i(8 downto 0);
COREAHBSRam_i0il <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CorEAHBSRAm_o1il <= "000"&CoreAhbSram_O0I(8 downto 0);
COREAHbSram_l1il <= "000"&COREAhbSram_o0i(8 downto 0);
CoreAHBSram_i1iL <= "000"&CoreAhbSram_O0I(8 downto 0);
COREAHBSram_oo0l <= "000"&CoREAHBSRAm_o0i(8 downto 0);
COReAhbSram_lo0L <= "000"&CoreAhBSRAM_O0i(8 downto 0);
CoREAHBSRam_io0l <= "000"&COReAhbSram_o0I(8 downto 0);
CoreAhbSram_OL0L <= "000"&CoreAhbSrAM_O0I(8 downto 0);
CoreAhbSRAM_LL0l <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CoreAhbSram_O00L <= "000"&COREAHBSram_iii(8 downto 0);
CoreAhbSrAM_L00L <= "000"&COREAhbSram_iii(8 downto 0);
CoreAHBSRAM_I00l <= "000"&COREAhbSram_iii(8 downto 0);
CorEAHBSRAM_o10l <= "000"&CoREAHBSRAm_iii(8 downto 0);
COREAhbSram_l10L <= "000"&CoreAhbSraM_III(8 downto 0);
CoreAhbSram_I10L <= "000"&CoreAhbSrAM_III(8 downto 0);
CoreAhbSRAM_OO1l <= "000"&CoreAhBSRAM_Iii(8 downto 0);
CoreAhBSRAM_lo1l <= "000"&CoreAhbSram_III(8 downto 0);
CoreAhbSram_IO1L <= "000"&CoreAhbSRAM_III(8 downto 0);
COReAhbSram_oL1L <= "000"&COREAHBSram_iii(8 downto 0);
COReAhbSram_lL1L <= "000"&CoreAhbSraM_III(8 downto 0);
COREAhbSram_il1L <= "000"&CorEAHBSRAm_iii(8 downto 0);
COREAhbSram_oiOL <= COREAHBSRam_lii;
COreAhbSRAM_LIol <= COREAHBSram_lii;
CorEAHBSRAM_iiol <= CoREAHBSRAm_lii;
COREAHbSram_o0ol <= COREAHBSram_lii;
COREAHBSRam_l0ol <= COREAHbSram_lii;
COREAHBSram_i0ol <= CoreAHBSRAM_Lii;
CoREAHBSRAm_o1ol <= COREAHBSRam_lii;
CorEAHBSRAM_l1ol <= CorEAHBSRAM_lii;
CoreAHBSRAM_i1ol <= CorEAHBSRAM_lii;
CoreAhbSrAM_OOLL <= CoreAhbSram_LII;
COREAHBSram_loll <= CoreAhbSram_LII;
CoreAhbSram_IOLL <= COREAHBSram_lii;
case (CoreAhbSrAM_O0I(12 downto 9)) is
when "0000" =>
CoreAHBSRAm_llol(0) <= COREAHbSram_l01L;
when "0001" =>
CoreAhbSRAM_LLol(1) <= CoREAHBSram_l01L;
when "0010" =>
CoreAhbSRAM_Llol(2) <= CoreAhBSRAm_l01l;
when "0011" =>
CoreAHBSRAm_llol(3) <= COREAhbSraM_L01l;
when "0100" =>
COreAhbSrAM_LLOl(4) <= COREAhbSram_L01L;
when "0101" =>
CoREAHBSram_lLOL(5) <= CoreAhbSRAM_l01l;
when "0110" =>
CoREAHbSram_lLOL(6) <= COReAhbSraM_L01l;
when "0111" =>
CoREAHBSram_llOL(7) <= CoreAhbSrAM_L01l;
when "1000" =>
CoreAhbSRAM_llol(8) <= CoreAhbSRAM_l01l;
when "1001" =>
CoreAHBSRAm_llol(9) <= COREAHBSram_l01L;
when "1010" =>
CoreAhBSRAM_llol(10) <= CoreAhbSRAM_L01l;
when "1011" =>
CorEAHBSram_llOL(11) <= CorEAHBSram_l01L;
when "1100" =>
CoreAhBSRAM_LLol(4) <= CoreAhbSrAM_L01L;
when "1101" =>
CoreAhbSram_LLOL(5) <= CoREAHBSRAm_l01l;
when "1110" =>
CoreAhBSRAM_Llol(6) <= CoreAhbSram_L01L;
when "1111" =>
COREAHBSram_llol(7) <= CoreAHBSRAM_L01l;
when others =>
null
;
end case;
case (CoreAhbSraM_III(12 downto 9)) is
when "0000" =>
CoreAhbSraM_ILOL(0) <= CoreAhbSraM_I01L;
when "0001" =>
CoreAhbSrAM_ILOL(1) <= CoreAhBSRAM_I01l;
when "0010" =>
CoreAhbSram_ILOL(2) <= CoreAhbSram_I01L;
when "0011" =>
COREAHBSram_ilol(3) <= COREAHBSram_i01l;
when "0100" =>
COReAhbSram_ilOL(4) <= CoreAHBSRAM_I01l;
when "0101" =>
COREAhbSram_ilol(5) <= CoreAhbSrAM_I01L;
when "0110" =>
CoreAHBSRAM_ilol(6) <= COREAhbSram_i01l;
when "0111" =>
CoreAhbSram_ILOL(7) <= COREAhbSram_i01L;
when "1000" =>
CoreAHBSRAM_ilol(8) <= COREAHbSram_i01l;
when "1001" =>
CoREAHBSram_ilOL(9) <= CoreAhbSrAM_I01L;
when "1010" =>
CoreAhbSram_ILOL(10) <= COREAHBSram_i01l;
when "1011" =>
COREAhbSram_iloL(11) <= CoreAhbSraM_I01L;
when "1100" =>
CoreAhbSram_ILOL(4) <= COreAhbSrAM_I01l;
when "1101" =>
CoreAhbSram_ILOL(5) <= CoreAhbSRAM_I01l;
when "1110" =>
COREAHbSram_ilol(6) <= CoreAhbSRAM_I01l;
when "1111" =>
CoreAHBSRAM_ilol(7) <= COREAhbSram_i01l;
when others =>
null
;
end case;
case (CoreAhBSRAM_Io1(12 downto 9)) is
when "0000" =>
COREAhbSram_l0i <= COREAhbSram_lilL;
when "0001" =>
CoreAhbSraM_L0I <= COREAHBSram_iill;
when "0010" =>
COREAHBSRam_l0i <= CoreAhbSram_O0LL;
when "0011" =>
CoreAhbSRAM_L0i <= COREAhbSram_l0ll;
when "0100" =>
COREAHBSram_l0i <= COREAHBSRAm_i0ll;
when "0101" =>
CorEAHBSRAM_l0i <= CoreAhbSram_O1LL;
when "0110" =>
CoreAhbSram_L0I <= CoreAhbSraM_L1LL;
when "0111" =>
COReAhbSram_l0I <= CoREAHBSRAm_i1ll;
when "1000" =>
COreAhbSram_l0I <= CoreAHBSRAM_Ooil;
when "1001" =>
CoreAhbSRAM_L0i <= COreAhbSram_lOIL;
when "1010" =>
COREAhbSram_l0I <= COREAhbSram_ioiL;
when "1011" =>
COREAhbSram_l0i <= CoreAhbSram_OLIL;
when "1100" =>
COReAhbSram_l0I <= CoreAhbSram_I0LL;
when "1101" =>
COREAHbSram_l0i <= CoreAhbSram_O1LL;
when "1110" =>
CorEAHBSRAm_l0i <= COREAhbSram_l1LL;
when "1111" =>
COREAhbSram_l0i <= COreAhbSram_I1LL;
when others =>
null
;
end case;
when 4 =>
COREAhbSram_ol1 <= "10";
CoreAhbSram_LL1 <= "10";
COREAhbSram_IL1 <= "10";
COREAhbSram_oi1 <= "10";
CorEAHBSRAM_li1 <= "10";
COREAHBSRam_ii1 <= "10";
COREAHBSram_o01 <= "10";
CoreAhbSraM_L01 <= "10";
CoreAhbSram_I01 <= "10";
COREAHBSram_o11 <= "10";
CoreAhbSram_L11 <= "10";
COREAHbSram_i11 <= "10";
CoreAhBSRAM_IIil <= "00"&COReAhbSram_o0I(9 downto 0);
COREAHBSRam_o0il <= "00"&CoreAhbSraM_O0I(9 downto 0);
CoreAhbSram_L0IL <= "00"&CoreAhbSraM_O0I(9 downto 0);
COREAHBSRam_i0il <= "00"&CoreAhbSRAM_O0I(9 downto 0);
CoreAhbSRAM_O1il <= "00"&CoREAHBSRam_o0i(9 downto 0);
CoreAhBSRAM_L1il <= "00"&CoreAhBSRAM_O0i(9 downto 0);
CoreAhbSraM_I1IL <= "00"&COreAhbSram_o0I(9 downto 0);
COReAhbSRAM_Oo0l <= "00"&COReAhbSram_o0I(9 downto 0);
COREAhbSram_lo0L <= "00"&COREAHBSram_o0i(9 downto 0);
CoreAhbSraM_IO0L <= "00"&CoreAhBSRAM_O0i(9 downto 0);
COREAhbSram_ol0L <= "00"&CoreAhbSRAM_O0I(9 downto 0);
COREAhbSram_ll0L <= "00"&CoreAhbSram_O0I(9 downto 0);
CorEAHBSRAM_o00l <= "00"&COREAHBSRam_iii(9 downto 0);
COReAhbSram_L00L <= "00"&COREAHbSram_iii(9 downto 0);
CoreAhbSram_I00L <= "00"&CoREAHBSRam_iii(9 downto 0);
CoreAhbSram_O10L <= "00"&CoreAhbSram_III(9 downto 0);
CorEAHBSRAM_l10l <= "00"&COREAHBSram_iii(9 downto 0);
COREAHbSram_i10l <= "00"&CoreAhbSRAM_IIi(9 downto 0);
CoreAhbSRAM_OO1l <= "00"&CoreAhbSram_III(9 downto 0);
CoreAhbSram_LO1L <= "00"&CoreAhbSram_III(9 downto 0);
CoreAhbSRAM_IO1l <= "00"&COREAHBSRam_iii(9 downto 0);
CoreAhbSRAM_OL1l <= "00"&CoreAhbSraM_III(9 downto 0);
CoreAhbSraM_LL1L <= "00"&COREAHBSRam_iii(9 downto 0);
COREAhbSram_il1L <= "00"&COREAhbSram_iii(9 downto 0);
CoreAhbSram_OIOL(3 downto 0) <= COREAhbSram_lii(3 downto 0);
COreAhbSram_lIOL(3 downto 0) <= COREAhbSram_lii(7 downto 4);
COREAHBSram_iiol(3 downto 0) <= CoreAhbSrAM_LII(3 downto 0);
CoreAhbSraM_O0OL(3 downto 0) <= CoreAhbSram_LII(7 downto 4);
COREAhbSram_l0OL(3 downto 0) <= CoreAhbSram_LII(3 downto 0);
CoreAhbSram_I0OL(3 downto 0) <= CoreAhbSrAM_LII(7 downto 4);
COREAHBSram_o1ol(3 downto 0) <= CorEAHBSram_lii(3 downto 0);
CoreAhbSRAM_L1Ol(3 downto 0) <= COReAhbSram_liI(7 downto 4);
COreAhbSram_I1OL(3 downto 0) <= CoreAhbSraM_LII(3 downto 0);
COREAHBSram_ooll(3 downto 0) <= CoreAhBSRAM_Lii(7 downto 4);
CoreAhbSram_LOLL(3 downto 0) <= CoreAhBSRAM_LIi(3 downto 0);
CoreAhbSrAM_IOLL(3 downto 0) <= COReAhbSram_liI(7 downto 4);
case (CoreAHBSram_o0i(12 downto 9)) is
when "0000" =>
CoreAHBSRam_lloL(1 downto 0) <= CorEAHBSram_l01L&CoreAHBSRAm_l01l;
when "0001" =>
CoreAhbSRAM_LLol(1 downto 0) <= COREAhbSram_L01L&CoREAHBSram_L01L;
when "0010" =>
COreAhbSrAM_LLol(3 downto 2) <= CoreAhbSRAM_l01l&CoreAHBSRAm_l01l;
when "0011" =>
CoreAhBSRAM_llol(3 downto 2) <= CoreAhbSRAM_l01l&COreAhbSRAM_L01l;
when "0100" =>
CoreAhbSRAM_Llol(5 downto 4) <= CoreAhBSRAm_l01l&CoreAhbSRAM_L01l;
when "0101" =>
COreAhbSrAM_LLOl(5 downto 4) <= COREAhbSram_L01L&CorEAHBSram_l01L;
when "0110" =>
COREAHbSram_LLOL(7 downto 6) <= CoreAhBSRAm_l01l&COreAhbSrAM_L01l;
when "0111" =>
CorEAHBSram_llOL(7 downto 6) <= COREAhbSram_L01L&COreAhbSrAM_L01l;
when "1000" =>
CoreAhBSRAm_llol(9 downto 8) <= CoreAhbSRAM_L01l&CoreAhbSRAM_l01l;
when "1001" =>
COReAhbSraM_LLOL(9 downto 8) <= COreAhbSrAM_L01l&CoreAHBSRAM_l01l;
when "1010" =>
COREAhbSram_LLOL(11 downto 10) <= COREAhbSram_L01L&COReAhbSraM_L01l;
when "1011" =>
CoreAhbSRAM_LLol(11 downto 10) <= CoreAhBSRAM_l01l&CoreAhBSRAM_l01l;
when "1100" =>
CoreAhbSRAM_llol(5 downto 4) <= CoreAhbSRAM_L01l&CoreAhbSraM_L01L;
when "1101" =>
COreAhbSram_lLOL(5 downto 4) <= CoreAhbSRAM_L01l&COREAHBSram_l01l;
when "1110" =>
COReAhbSram_llOL(7 downto 6) <= COREAhbSram_l01L&COREAhbSram_l01L;
when "1111" =>
COREAHBSram_llol(7 downto 6) <= COREAhbSram_l01L&COREAhbSram_l01L;
when others =>
null
;
end case;
case (COReAhbSram_iiI(12 downto 9)) is
when "0000" =>
CoreAHBSRAM_Ilol(1 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l;
when "0001" =>
CoreAhbSram_ILOL(1 downto 0) <= COReAhbSram_i01L&CoreAhbSraM_I01L;
when "0010" =>
COREAHBSram_ilol(3 downto 2) <= COREAHbSram_i01l&CoreAhbSRAM_I01L;
when "0011" =>
CoreAhbSrAM_ILOL(3 downto 2) <= CoreAhbSram_I01L&CoreAhbSRAM_I01L;
when "0100" =>
COreAhbSram_ILOL(5 downto 4) <= COReAhbSram_i01L&CoreAhbSraM_I01L;
when "0101" =>
CoREAHBSram_ilOL(5 downto 4) <= COREAhbSram_i01L&CoreAhbSram_I01L;
when "0110" =>
CoreAhbSraM_ILOL(7 downto 6) <= COREAHBSram_i01l&COREAhbSram_i01L;
when "0111" =>
CoreAhbSram_ILOL(7 downto 6) <= COReAhbSraM_I01l&CoreAHBSram_i01L;
when "1000" =>
CoreAhbSraM_ILOL(9 downto 8) <= CoreAhbSRAM_I01l&CoREAHBSRAm_i01l;
when "1001" =>
CoreAhbSrAM_ILOL(9 downto 8) <= CoreAhbSRAM_I01l&CoreAhbSRAM_I01l;
when "1010" =>
CoreAhbSram_ILOL(11 downto 10) <= CoreAhbSram_I01L&CoreAhbSram_I01L;
when "1011" =>
COreAhbSram_iLOL(11 downto 10) <= CoreAhbSRAM_i01l&CorEAHBSRAM_i01l;
when "1100" =>
CoreAhBSRAM_ILol(5 downto 4) <= CoreAhbSRAM_I01l&CoreAhBSRAM_I01l;
when "1101" =>
CoreAhbSRAM_ILol(5 downto 4) <= CoreAhbSrAM_I01L&CoreAhbSraM_I01L;
when "1110" =>
CoreAHBSRAM_ilol(7 downto 6) <= COREAHBSRam_i01l&CoreAhBSRAM_I01l;
when "1111" =>
CoreAhbSRAM_ILOl(7 downto 6) <= CoreAhBSRAM_I01l&CoreAHBSRAM_i01l;
when others =>
null
;
end case;
case (CoreAhbSRAM_Io1(12 downto 9)) is
when "0000" =>
COREAhbSram_l0i <= COREAhbSram_iiLL(3 downto 0)&CoreAHBSRAM_lill(3 downto 0);
when "0001" =>
CoreAhbSraM_L0I <= COreAhbSram_IILL(3 downto 0)&COreAhbSram_lILL(3 downto 0);
when "0010" =>
CorEAHBSRAm_l0i <= COREAHBSram_l0ll(3 downto 0)&COREAHBSRam_o0ll(3 downto 0);
when "0011" =>
COREAHbSram_l0i <= CoreAHBSRAM_L0ll(3 downto 0)&CoreAhbSram_O0LL(3 downto 0);
when "0100" =>
CoreAhbSrAM_L0I <= CoreAhbSram_O1LL(3 downto 0)&COREAhbSram_i0ll(3 downto 0);
when "0101" =>
CoreAhbSRAM_L0i <= CoreAhbSrAM_O1LL(3 downto 0)&COReAhbSram_i0LL(3 downto 0);
when "0110" =>
CoreAhbSRAM_L0I <= CoreAhbSram_I1LL(3 downto 0)&COREAHbSram_l1ll(3 downto 0);
when "0111" =>
CoreAhbSram_L0I <= COREAhbSram_i1LL(3 downto 0)&CoreAhbSraM_L1LL(3 downto 0);
when "1000" =>
COREAhbSram_l0i <= COREAhbSram_loiL(3 downto 0)&CoreAhbSrAM_OOIL(3 downto 0);
when "1001" =>
COreAhbSram_L0I <= COreAhbSram_LOIL(3 downto 0)&CoreAHBSRAM_Ooil(3 downto 0);
when "1010" =>
COREAHBSram_l0i <= COReAhbSram_olIL(3 downto 0)&CoreAHBSRAM_ioil(3 downto 0);
when "1011" =>
CoreAhbSraM_L0I <= CoreAhbSram_OLIL(3 downto 0)&CoreAhbSRAM_IOil(3 downto 0);
when "1100" =>
CoreAhbSrAM_L0I <= CoreAhbSram_O1LL(3 downto 0)&CorEAHBSRAM_i0ll(3 downto 0);
when "1101" =>
CoreAhbSRAM_L0I <= CoreAhbSraM_O1LL(3 downto 0)&CoreAhbSram_I0LL(3 downto 0);
when "1110" =>
COREAHBSram_l0i <= CoREAHBSRAm_i1ll(3 downto 0)&CoreAhbSraM_L1LL(3 downto 0);
when "1111" =>
COREAHBSram_l0i <= CoreAhbSRAM_I1ll(3 downto 0)&COREAHBSram_l1ll(3 downto 0);
when others =>
null
;
end case;
when 2 =>
CoreAhbSRAM_Ol1 <= "01";
COREAhbSram_ll1 <= "01";
CoreAhbSraM_IL1 <= "01";
COREAHbSram_oI1 <= "01";
CoreAHBSRAM_Li1 <= "01";
CoreAhbSRAM_II1 <= "01";
CoreAhbSram_O01 <= "01";
CoreAhbSram_L01 <= "01";
COREAHBSram_i01 <= "01";
CoreAhbSram_O11 <= "01";
COREAhbSram_l11 <= "01";
COREAHBSram_i11 <= "01";
CoreAhbSraM_IIIL <= '0'&CoreAhbSraM_O0I(10 downto 0);
COREAhbSram_o0iL <= '0'&COreAhbSram_O0I(10 downto 0);
COREAHbSram_l0il <= '0'&COreAhbSram_O0I(10 downto 0);
CoreAhbSrAM_I0IL <= '0'&CoreAhbSrAM_O0I(10 downto 0);
CoreAhbSRAM_O1il <= '0'&CoreAHBSRAM_o0i(10 downto 0);
CoreAhBSRAM_L1il <= '0'&CorEAHBSRAM_o0i(10 downto 0);
CoreAhBSRAM_I1il <= '0'&CoreAhbSraM_O0I(10 downto 0);
COREAHbSram_oo0l <= '0'&COREAHbSram_o0i(10 downto 0);
COREAHbSram_lo0l <= '0'&CoREAHBSRAm_o0i(10 downto 0);
CoREAHBSRAm_io0l <= '0'&COreAhbSram_o0I(10 downto 0);
CoreAhbSram_OL0L <= '0'&CoreAhBSRAM_O0i(10 downto 0);
CoREAHBSRam_ll0l <= '0'&CoreAhbSraM_O0I(10 downto 0);
COREAhbSram_o00L <= '0'&COREAhbSram_iii(10 downto 0);
CoREAHBSRAm_l00l <= '0'&CoreAhbSraM_III(10 downto 0);
CoreAhbSRAM_I00l <= '0'&CoreAhbSram_III(10 downto 0);
COREAHBSram_o10l <= '0'&COREAhbSram_iii(10 downto 0);
COREAhbSram_L10L <= '0'&CoreAhbSRAM_iii(10 downto 0);
CoreAHBSram_i10L <= '0'&COReAhbSraM_III(10 downto 0);
CoreAhBSRAM_oo1l <= '0'&COReAhbSraM_III(10 downto 0);
CoreAhBSRAM_lo1l <= '0'&COREAhbSram_III(10 downto 0);
COREAhbSram_IO1L <= '0'&COreAhbSrAM_III(10 downto 0);
CoreAhBSRAM_ol1l <= '0'&COREAhbSram_III(10 downto 0);
COReAhbSram_ll1L <= '0'&CoreAhbSraM_III(10 downto 0);
COREAHBSram_il1l <= '0'&COREAHBSram_iii(10 downto 0);
COREAHbSram_oiol(1 downto 0) <= COREAHBSram_lii(1 downto 0);
CoreAhbSrAM_LIOL(1 downto 0) <= COREAHBSRam_lii(3 downto 2);
COreAhbSram_iIOL(1 downto 0) <= CoreAhbSRAM_LIi(5 downto 4);
COreAhbSram_o0OL(1 downto 0) <= CoreAhbSrAM_LII(7 downto 6);
CoreAhbSraM_L0OL(1 downto 0) <= COREAhbSram_liI(1 downto 0);
CoreAhbSraM_I0OL(1 downto 0) <= CoreAhbSram_LII(3 downto 2);
CoreAhbSRAM_O1Ol(1 downto 0) <= CoREAHBSram_lII(5 downto 4);
CoreAhbSRAM_l1ol(1 downto 0) <= CoREAHBSram_liI(7 downto 6);
COREAhbSraM_I1OL(1 downto 0) <= CoreAhbSRAM_Lii(1 downto 0);
CoreAHBSRAM_ooll(1 downto 0) <= CoreAhbSraM_LII(3 downto 2);
CoreAhbSram_LOLL(1 downto 0) <= CoreAhbSram_LII(5 downto 4);
CorEAHBSRAM_ioll(1 downto 0) <= CoreAHBSRAM_lii(7 downto 6);
case (CoreAhbSram_O0I(12 downto 9)) is
when "0000" =>
CoREAHBSRAm_llol(3 downto 0) <= CoreAhBSRAM_L01l&COREAHBSram_l01l&CoreAhBSRAM_L01l&CoreAhbSram_L01L;
when "0001" =>
CoreAhbSRAM_llol(3 downto 0) <= COREAHBSRam_l01l&COREAHBSram_l01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when "0010" =>
CoreAHBSRAM_llol(3 downto 0) <= CoreAhbSram_L01L&CoreAHBSRAM_l01l&CoreAhbSram_L01L&COREAHBSram_l01l;
when "0011" =>
CoreAhbSRAM_LLOL(3 downto 0) <= CoreAhbSrAM_L01L&CoreAhbSRAM_L01l&COreAhbSram_l01L&COREAHBSram_l01l;
when "0100" =>
COReAhbSram_llOL(7 downto 4) <= COREAhbSram_l01L&COReAhbSram_l01L&CoreAhbSraM_L01L&COREAhbSram_l01L;
when "0101" =>
COREAhbSram_lloL(7 downto 4) <= COreAhbSram_l01L&COreAhbSram_L01L&CoreAHBSRAM_L01l&CoreAhbSraM_L01L;
when "0110" =>
CoreAhbSram_LLOL(7 downto 4) <= CoreAhbSRAM_L01l&CoreAhbSraM_L01L&COREAhbSrAM_L01l&COREAHbSram_l01L;
when "0111" =>
CoreAHBSRAM_llol(7 downto 4) <= CoreAhbSram_L01L&CoreAhbSram_L01L&COREAHBSRam_l01l&CoreAhbSram_L01L;
when "1000" =>
CoreAHBSRAM_llol(11 downto 8) <= CoreAhbSraM_L01L&CoreAhbSraM_L01L&COReAhbSram_l01L&COREAHBSram_l01l;
when "1001" =>
COREAhbSram_lloL(11 downto 8) <= CoreAhbSrAM_L01L&CoreAhBSRAM_L01l&COREAhbSram_l01L&CoreAhbSrAM_L01L;
when "1010" =>
CoreAHBSRAM_llol(11 downto 8) <= CoreAhBSRAM_L01l&CoreAHBSRAM_L01l&COREAHBSRam_l01l&CoreAhbSrAM_L01L;
when "1011" =>
COREAhbSram_lloL(11 downto 8) <= COreAhbSram_l01L&COREAhbSram_l01L&CoreAhbSraM_L01L&COReAhbSraM_L01L;
when "1100" =>
CoreAhbSram_LLOL(7 downto 4) <= COREAhbSram_l01L&COREAHBSram_l01l&CoreAhbSrAM_L01L&COREAhbSram_l01L;
when "1101" =>
CorEAHBSRAM_llol(7 downto 4) <= CoreAhBSRAM_L01l&CoreAhBSRAM_L01l&COREAHBSram_l01l&CoreAhbSram_L01L;
when "1110" =>
COREAhbSram_lloL(7 downto 4) <= COREAHBSram_l01l&CorEAHBSRAm_l01l&COreAhbSram_l01L&COREAHBSram_l01l;
when "1111" =>
CoreAhbSRAM_LLOl(7 downto 4) <= CoreAhBSRAM_l01l&COreAhbSRAM_L01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when others =>
null
;
end case;
case (CoreAhbSram_III(12 downto 9)) is
when "0000" =>
CoreAHBSRAM_ilol(3 downto 0) <= COREAhbSram_i01l&COreAhbSram_i01L&COREAHBSram_i01l&COREAHBSram_i01l;
when "0001" =>
COREAhbSram_iloL(3 downto 0) <= COreAhbSram_I01L&CoreAhbSram_I01L&CoreAhbSraM_I01L&COREAhbSram_I01L;
when "0010" =>
COReAhbSram_ilOL(3 downto 0) <= COREAHBSram_i01l&COREAhbSram_i01L&COREAhbSram_i01L&CorEAHBSRAM_i01l;
when "0011" =>
COREAHbSram_ilol(3 downto 0) <= COReAhbSram_i01L&CoreAhbSraM_I01L&COREAHbSram_i01l&CoreAHBSRAM_i01l;
when "0100" =>
CorEAHBSRAM_ilol(7 downto 4) <= CoreAhbSram_I01L&CoreAhbSram_I01L&COreAhbSram_i01L&COReAhbSram_i01L;
when "0101" =>
CoreAhbSrAM_ILOL(7 downto 4) <= CoREAHBSRAm_i01l&COreAhbSram_i01L&COREAHBSram_i01l&CoREAHBSRAm_i01l;
when "0110" =>
CoreAHBSRAM_Ilol(7 downto 4) <= CoreAhbSraM_I01L&CoreAHBSRAM_i01l&CoreAhbSram_I01L&COREAHBSram_i01l;
when "0111" =>
CoreAhBSRAM_Ilol(7 downto 4) <= CoreAhbSrAM_I01L&CoreAhBSRAM_I01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L;
when "1000" =>
CoreAhbSRAM_ILol(11 downto 8) <= CoreAhbSrAM_I01L&CoreAhbSram_I01L&COREAhbSram_I01l&CoreAhBSRAM_i01l;
when "1001" =>
COREAhbSram_iloL(11 downto 8) <= COREAHBSram_i01l&COREAHbSram_i01l&CoreAhBSRAM_I01l&COreAhbSram_I01L;
when "1010" =>
COREAhbSram_ilOL(11 downto 8) <= COREAHBSRam_i01l&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhbSrAM_I01L;
when "1011" =>
CoREAHBSRAm_ilol(11 downto 8) <= CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&COreAhbSram_I01L&COreAhbSram_i01L;
when "1100" =>
COREAhbSram_ilol(7 downto 4) <= CoreAhbSrAM_I01L&CoreAhBSRAM_I01l&COReAhbSram_i01L&COREAhbSram_i01l;
when "1101" =>
COREAhbSram_ilOL(7 downto 4) <= COReAhbSram_i01L&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhbSrAM_I01L;
when "1110" =>
COREAhbSram_ilol(7 downto 4) <= CoreAhbSraM_I01L&CoreAhbSram_I01L&COREAHbSram_i01l&CoreAHBSRAM_I01l;
when "1111" =>
COREAhbSram_iloL(7 downto 4) <= CoREAHBSRAm_i01l&COREAHBSram_i01l&CoreAhBSRAM_I01l&CoreAhBSRAM_i01l;
when others =>
null
;
end case;
case (CoreAHBSRAM_Io1(12 downto 9)) is
when "0000" =>
COREAhbSram_l0i <= COREAhbSram_l0lL(1 downto 0)&CoreAhbSrAM_O0LL(1 downto 0)&CoreAhbSram_IILL(1 downto 0)&CoreAhbSrAM_LILL(1 downto 0);
when "0001" =>
COREAhbSram_l0i <= CoreAhbSram_L0LL(1 downto 0)&COREAHbSram_o0ll(1 downto 0)&CoreAhbSrAM_IIll(1 downto 0)&COREAhbSram_LILL(1 downto 0);
when "0010" =>
CoreAhbSRAM_l0i <= COreAhbSrAM_L0Ll(1 downto 0)&CoREAHbSram_o0LL(1 downto 0)&COREAhbSram_IILL(1 downto 0)&COREAhbSraM_LILl(1 downto 0);
when "0011" =>
CorEAHBSram_l0I <= CoreAHBSRAm_l0ll(1 downto 0)&COREAHbSram_o0LL(1 downto 0)&COreAhbSrAM_IILl(1 downto 0)&CoreAHBSRam_lill(1 downto 0);
when "0100" =>
CoreAhbSRAM_l0i <= CoreAhBSRAM_i1ll(1 downto 0)&CoreAHBSRAm_l1ll(1 downto 0)&COREAhbSram_O1LL(1 downto 0)&CoreAHBSRam_i0ll(1 downto 0);
when "0101" =>
CorEAHBSRam_l0i <= CoreAhbSRAM_I1ll(1 downto 0)&CoreAhbSRAM_L1ll(1 downto 0)&CoreAhBSRAM_o1ll(1 downto 0)&CoREAHBSram_i0LL(1 downto 0);
when "0110" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_i1ll(1 downto 0)&COReAhbSraM_L1Ll(1 downto 0)&COREAhbSram_O1LL(1 downto 0)&CoreAhbSram_I0LL(1 downto 0);
when "0111" =>
CoreAhbSRAM_L0i <= CorEAHBSRAM_i1ll(1 downto 0)&CoreAhbSram_L1LL(1 downto 0)&CoreAhbSraM_O1LL(1 downto 0)&CoreAHBSRAM_I0ll(1 downto 0);
when "1000" =>
COreAhbSram_l0I <= COREAhbSram_olil(1 downto 0)&CoreAhbSRAM_IOIl(1 downto 0)&CoreAhbSrAM_LOIL(1 downto 0)&CoreAHBSRAM_ooil(1 downto 0);
when "1001" =>
COReAhbSram_l0I <= CoreAhBSRAM_olil(1 downto 0)&COREAHBSram_ioil(1 downto 0)&CoreAhbSraM_LOIL(1 downto 0)&COREAHBSRam_ooil(1 downto 0);
when "1010" =>
COreAhbSram_l0I <= CoreAhbSRAM_OLIL(1 downto 0)&COREAhbSram_ioiL(1 downto 0)&CoreAHBSRAM_loil(1 downto 0)&CoreAhbSraM_OOIL(1 downto 0);
when "1011" =>
CoREAHBSRAm_l0i <= CoreAhbSram_OLIL(1 downto 0)&COREAHbSram_ioil(1 downto 0)&CoreAhbSraM_LOIL(1 downto 0)&CoreAHBSRAM_ooil(1 downto 0);
when "1100" =>
CoreAhbSRAM_L0I <= CoREAHBSRam_i1ll(1 downto 0)&CoreAhbSram_L1LL(1 downto 0)&CoreAhbSRAM_O1ll(1 downto 0)&CorEAHBSRAM_i0ll(1 downto 0);
when "1101" =>
COREAHbSram_l0i <= COREAhbSram_i1lL(1 downto 0)&CoreAhBSRAM_l1ll(1 downto 0)&COREAHbSram_o1ll(1 downto 0)&COREAhbSram_i0lL(1 downto 0);
when "1110" =>
CoreAhBSRAM_L0i <= CoreAhbSRAM_I1ll(1 downto 0)&CoreAhbSram_L1LL(1 downto 0)&CoreAhBSRAM_O1ll(1 downto 0)&CorEAHBSRAm_i0ll(1 downto 0);
when "1111" =>
CoreAhBSRAM_L0i <= COREAHBSram_i1ll(1 downto 0)&COREAHBSram_l1ll(1 downto 0)&CoreAhbSram_O1LL(1 downto 0)&CoreAhbSRAM_I0Ll(1 downto 0);
when others =>
null
;
end case;
when others =>
CorEAHBSRAM_ol1 <= "00";
CoREAHBSRAm_ll1 <= "00";
CoreAhbSRAM_IL1 <= "00";
CoreAhbSrAM_OI1 <= "00";
COreAhbSram_lI1 <= "00";
CoreAhbSRAM_II1 <= "00";
CorEAHBSRAm_o01 <= "00";
CoreAhbSraM_L01 <= "00";
CoREAHBSRAm_i01 <= "01";
COReAhbSram_o11 <= "01";
COREAhbSram_l11 <= "01";
CoreAhbSram_I11 <= "01";
CoreAhbSraM_IIIL <= CoreAhBSRAM_O0i(11 downto 0);
COREAHBSRam_o0il <= CoreAhbSram_O0I(11 downto 0);
COREAhbSram_l0iL <= CoREAHBSRAm_o0i(11 downto 0);
COREAHBSRam_i0il <= COREAhbSram_o0i(11 downto 0);
COREAHBSram_o1il <= COREAhbSram_o0i(11 downto 0);
CoREAHBSRAm_l1il <= CoreAHBSRAm_o0i(11 downto 0);
COreAhbSram_i1IL <= CoREAHBSRAm_o0i(11 downto 0);
COREAhbSram_oo0L <= CoreAhbSRAM_O0i(11 downto 0);
CoreAhbSram_LO0L <= '0'&CoreAhbSram_O0I(10 downto 0);
COREAHBSram_io0l <= '0'&CoreAhbSraM_O0I(10 downto 0);
CoreAhbSRAM_OL0l <= '0'&CoREAHBSRAm_o0i(10 downto 0);
CoreAHBSRAM_ll0l <= '0'&CoreAhbSraM_O0I(10 downto 0);
CoreAhbSrAM_O00L <= CorEAHBSRAM_iii(11 downto 0);
COREAHBSRam_l00l <= COREAHBSram_iii(11 downto 0);
CoreAHBSRAM_i00l <= COREAhbSram_iii(11 downto 0);
COREAHBSram_o10l <= CoreAhBSRAM_IIi(11 downto 0);
CoreAhbSraM_L10L <= COreAhbSram_iII(11 downto 0);
CoreAhbSrAM_I10L <= CoreAHBSRAM_iii(11 downto 0);
CoreAhbSrAM_OO1L <= COREAhbSram_iii(11 downto 0);
CoreAhbSraM_LO1L <= CoreAHBSRAM_Iii(11 downto 0);
COREAHBSram_io1l <= '0'&COREAHbSram_iii(10 downto 0);
CoreAhBSRAM_Ol1l <= '0'&CoreAhbSraM_III(10 downto 0);
COREAhbSram_ll1L <= '0'&CoREAHBSRAm_iii(10 downto 0);
COREAHbSram_il1l <= '0'&CoreAhbSram_III(10 downto 0);
COREAHBSRam_oiol(0) <= CoreAHBSRAM_lii(0);
COREAHBSram_liol(0) <= COREAHbSram_lii(1);
CoreAhbSRAM_IIol(0) <= CoreAhBSRAM_Lii(2);
COREAHBSRam_o0ol(0) <= COREAHBSram_lii(3);
COREAHBSram_l0ol(0) <= CoreAhbSram_LII(4);
COreAhbSram_I0OL(0) <= COREAhbSram_lii(5);
COREAHbSram_o1ol(0) <= CoreAhbSRAM_LII(6);
CoREAHBSRAm_l1ol(0) <= CorEAHBSram_liI(7);
COREAhbSram_i1oL(1 downto 0) <= CoreAhbSram_LII(1 downto 0);
CoreAHBSRAM_ooll(1 downto 0) <= COReAhbSram_liI(3 downto 2);
CoreAhbSram_LOLL(1 downto 0) <= CoREAHBSRam_lii(5 downto 4);
COREAhbSram_iolL(1 downto 0) <= CoreAHBSRAM_lii(7 downto 6);
case (COREAHBSRam_o0i(12 downto 9)) is
when "0000" =>
COREAHBSRam_llol(7 downto 0) <= CoreAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhbSraM_L01L&COREAhbSram_l01L&CoreAhBSRAM_L01l&CoreAhbSraM_L01L&COreAhbSram_l01L&CorEAHBSRAM_l01l;
when "0001" =>
CoreAhbSRAM_LLOl(7 downto 0) <= COREAhbSram_l01L&CoreAhbSram_L01L&COREAhbSram_l01L&CoREAHBSRAm_l01l&COREAhbSram_l01L&COREAHBSram_l01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when "0010" =>
CoREAHBSRam_llol(7 downto 0) <= COREAhbSram_l01L&CoreAhbSram_L01L&COREAHBSram_l01l&CoreAhbSRAM_L01l&COREAhbSram_l01L&CoreAhbSRAM_L01l&COreAhbSram_l01L&CoREAHBSRam_l01l;
when "0011" =>
COReAhbSram_lLOL(7 downto 0) <= CoreAhbSram_L01L&CoreAhbSraM_L01L&COREAHbSram_l01l&CorEAHBSRAM_l01l&CoreAhbSram_L01L&COREAHbSram_l01l&CoreAhbSrAM_L01L&COREAhbSram_l01L;
when "0100" =>
CoreAhbSram_LLOL(7 downto 0) <= CoREAHBSRAm_l01l&COREAHbSram_l01l&CoreAhbSrAM_L01L&COREAHbSram_l01l&CoreAhBSRAM_l01l&CoreAhBSRAM_l01l&COREAhbSraM_L01l&CoreAHBSram_l01L;
when "0101" =>
COREAHBSram_llol(7 downto 0) <= CoreAhbSRAM_L01l&CoREAHBSRAm_l01l&CoreAhbSrAM_L01L&CoreAhbSraM_L01L&COReAhbSram_l01L&COREAHBSram_l01l&CoreAhbSRAM_L01l&COreAhbSram_L01L;
when "0110" =>
COreAhbSram_lLOL(7 downto 0) <= CoreAhbSraM_L01L&CoreAhbSRAM_L01l&CoreAhbSraM_L01L&COREAhbSram_l01L&CoreAHBSRAM_L01l&CoreAhbSRAM_L01l&COREAhbSram_L01L&COREAHBSRam_l01l;
when "0111" =>
COREAHBSRam_llol(7 downto 0) <= COReAhbSram_l01L&CoreAhbSram_L01L&COREAHBSram_l01l&CorEAHBSRAM_l01l&CoreAhbSram_L01L&COreAhbSram_L01L&COREAHBSram_l01l&CoreAhbSraM_L01L;
when "1000" =>
COreAhbSram_lLOL(11 downto 8) <= COREAhbSram_l01L&CoreAhbSram_L01L&CorEAHBSRAM_l01l&CoreAhbSRAM_L01l;
when "1001" =>
CoreAhbSram_LLOL(11 downto 8) <= COREAhbSram_l01l&COREAHbSram_l01l&CoREAHBSRAm_l01l&CoreAhbSRAM_L01L;
when "1010" =>
CorEAHBSRAM_llol(11 downto 8) <= CoreAHBSRAM_L01l&CorEAHBSRAM_l01l&CoreAhbSram_L01L&COREAHBSram_l01l;
when "1011" =>
COREAHbSram_llol(11 downto 8) <= COREAHBSram_l01l&CoREAHBSRAm_l01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when "1100" =>
CoreAhbSraM_LLOL(7 downto 0) <= CoreAhBSRAM_L01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L&COREAhbSram_l01L&CoreAhbSrAM_L01L&COReAhbSram_l01L&CoreAhbSRAM_L01l&CorEAHBSram_l01L;
when "1101" =>
CorEAHBSram_llOL(7 downto 0) <= CoreAhBSRAM_l01l&COreAhbSrAM_L01l&COREAHbSram_L01L&CoreAhbSRAM_L01l&COReAhbSraM_L01l&COREAhbSram_L01L&COREAHbSram_L01L&CoreAHBSRAm_l01l;
when "1110" =>
COREAhbSram_lloL(7 downto 0) <= COREAHBSram_l01l&COReAhbSram_l01L&COREAHbSram_l01l&CoREAHBSRAm_l01l&CoreAhbSRAM_L01l&CoreAhbSraM_L01L&COREAhbSram_l01L&COREAhbSram_L01L;
when "1111" =>
CoreAhBSRam_llol(7 downto 0) <= CoREAHBSram_l01L&CoreAHBSRam_l01l&COREAHbSram_l01L&CoreAhbSRAM_l01l&CoreAhBSRAM_l01l&CoreAHBSRAm_l01l&COREAhbSram_l01L&CoreAhbSram_L01L;
when others =>
null
;
end case;
case (COREAhbSram_iiI(12 downto 9)) is
when "0000" =>
CoreAhbSrAM_ILOL(7 downto 0) <= COREAhbSram_i01L&CoreAhbSram_I01L&COreAhbSram_i01L&COREAHBSram_i01l&CorEAHBSRAM_i01l&CoreAhbSRAM_I01l&CoreAhbSraM_I01L&COREAhbSram_i01L;
when "0001" =>
CoreAhbSRAM_ILOl(7 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l&CoreAhbSram_I01L&CoreAhbSram_I01L&COREAHbSram_i01l&COREAhbSram_i01L&COREAHBSram_i01l&CoREAHBSRAM_i01l;
when "0010" =>
CoreAhbSraM_ILOL(7 downto 0) <= CoreAhbSrAM_I01L&CoreAhbSRAM_I01l&COReAhbSram_i01L&CoreAHBSram_i01L&COREAhbSram_i01L&COreAhbSram_i01L&COREAHBSRam_i01l&CoreAhBSRAM_I01l;
when "0011" =>
COreAhbSram_ILOL(7 downto 0) <= CoreAhbSrAM_I01L&COREAHBSram_i01l&COREAHBSram_i01l&CoreAHBSRAM_i01l&COREAHBSram_i01l&COREAhbSram_i01L&COREAHBSRAm_i01l&CorEAHBSRAM_i01l;
when "0100" =>
COREAhbSram_iloL(7 downto 0) <= COREAhbSram_i01L&COREAHbSram_i01L&CoreAhbSram_I01L&COreAhbSram_I01L&COREAHBSram_i01l&COREAHBSram_i01l&COREAHBSRam_i01l&COREAHBSRam_i01l;
when "0101" =>
CoreAhbSram_ILOL(7 downto 0) <= CoreAHBSRAM_i01l&COREAhbSram_i01L&COREAHBSRAm_i01l&CoreAhbSRAM_I01l&CoreAhbSrAM_I01L&CoREAHBSRAm_i01l&CoreAhbSraM_I01L&COreAhbSram_i01L;
when "0110" =>
CoreAhBSRAM_ilol(7 downto 0) <= CoreAHBSRAM_I01l&CoreAhbSram_I01L&COreAhbSram_i01L&COREAhbSram_i01L&CoreAHBSRAm_i01l&CoreAhBSRAM_i01l&CoreAhBSRAM_i01l&CoREAHBSram_i01L;
when "0111" =>
COREAhbSram_ILOL(7 downto 0) <= COREAhbSram_I01L&CorEAHBSram_i01L&CoreAHBSRAm_i01l&COreAhbSrAM_I01l&CoreAhbSRAM_I01l&CoreAHBSRAM_i01l&CoreAhbSRAM_i01l&CoREAHBSram_i01L;
when "1000" =>
CoreAhBSRAM_ilol(11 downto 8) <= COREAHbSram_i01L&CoreAhbSRAM_I01l&CoreAhBSRAM_i01l&CoreAHBSRam_i01L;
when "1001" =>
CoreAhBSRAM_ilol(11 downto 8) <= CoreAhbSRAM_i01l&COREAhbSram_I01L&COREAhbSram_I01L&CoreAhBSRAM_i01l;
when "1010" =>
CoreAHBSRAM_ilol(11 downto 8) <= COREAhbSram_i01L&CoreAhbSram_I01L&COREAhbSram_i01L&COREAHBSram_i01l;
when "1011" =>
CoreAHBSRAM_ilol(11 downto 8) <= CoreAhbSraM_I01L&COREAhbSram_i01L&COREAHBSram_i01l&CoreAHBSRAM_i01l;
when "1100" =>
CoreAhbSRAM_ILOl(7 downto 0) <= CoREAHBSRAm_i01l&COREAHBSram_i01l&CoreAhbSRAM_I01l&CoreAhbSrAM_I01L&CoreAhbSram_I01L&COReAhbSram_i01L&COREAHBSram_i01l&CoREAHBSRAm_i01l;
when "1101" =>
COREAhbSram_iloL(7 downto 0) <= CoreAHBSRAM_i01l&COREAHBSRam_i01l&CoreAhbSram_I01L&COreAhbSram_I01L&COREAHBSram_i01l&COREAhbSram_i01L&CoreAHBSRAM_I01l&CoreAhbSRAM_I01l;
when "1110" =>
CoreAhBSRAM_Ilol(7 downto 0) <= CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAhBSRAM_I01l&CoreAhbSram_I01L&COREAhbSram_i01L&COREAHbSram_i01l&CoreAhbSRAM_I01l&CoreAhbSraM_I01L;
when "1111" =>
COREAhbSram_ilol(7 downto 0) <= CorEAHBSRAM_i01l&COREAHbSram_i01l&CoreAhbSraM_I01L&COReAhbSram_i01L&COREAHbSram_i01l&COREAHBSRam_i01l&CoreAhbSraM_I01L&CoreAhbSraM_I01L;
when others =>
null
;
end case;
case (CoreAhbSram_IO1(12 downto 9)) is
when "0000" =>
COReAhbSram_l0I <= CoreAHBSRAM_i1ll(0)&CoreAhbSrAM_L1LL(0)&CoreAhbSrAM_O1LL(0)&COreAhbSram_i0LL(0)&COREAHbSram_l0ll(0)&COREAHBSram_o0ll(0)&CoreAHBSRAM_Iill(0)&COREAhbSram_lilL(0);
when "0001" =>
CoreAhbSraM_L0I <= CoREAHBSRam_i1ll(0)&COreAhbSram_L1LL(0)&COREAhbSram_o1ll(0)&CoreAHBSRAM_i0ll(0)&CoreAHBSRAM_l0ll(0)&COReAhbSram_o0LL(0)&COREAHbSram_iill(0)&COREAHBSRam_lill(0);
when "0010" =>
COREAhbSram_l0I <= CoreAHBSRAM_I1ll(0)&COREAhbSram_l1LL(0)&COREAHBSram_o1ll(0)&CoreAhbSram_I0LL(0)&COREAhbSram_l0lL(0)&COREAHBSram_o0ll(0)&COReAhbSram_iiLL(0)&COReAhbSram_liLL(0);
when "0011" =>
COreAhbSram_l0I <= CoreAhBSRAM_I1ll(0)&CorEAHBSRAm_l1ll(0)&CoreAHBSRAM_o1ll(0)&CoreAhBSRAM_i0ll(0)&CoreAhbSrAM_L0ll(0)&CoREAHBSram_o0LL(0)&CoreAhbSRAM_iill(0)&COReAhbSraM_LILL(0);
when "0100" =>
CoreAhbSRAM_l0i <= CoreAHBSRAm_i1ll(0)&COREAhbSram_L1LL(0)&CorEAHBSram_o1LL(0)&CoreAHBSRam_i0lL(0)&COREAhbSram_L0LL(0)&CoREAHBSram_o0LL(0)&CoREAHBSram_iiLL(0)&CoreAHBSRAm_lill(0);
when "0101" =>
CoreAHBSRAm_l0i <= COreAhbSrAM_I1Ll(0)&COREAHbSram_l1LL(0)&COreAhbSrAM_O1Ll(0)&CorEAHBSram_i0LL(0)&COreAhbSrAM_L0ll(0)&COREAhbSram_O0LL(0)&CoreAhbSRAM_iill(0)&COREAhbSram_LILL(0);
when "0110" =>
CoreAHBSRam_l0i <= COREAHbSram_i1ll(0)&CorEAHBSRAM_l1ll(0)&COreAhbSram_O1LL(0)&COREAHBSram_i0ll(0)&COreAhbSram_L0LL(0)&CoreAhbSram_O0LL(0)&COREAHBSram_iill(0)&CoreAhbSram_LILL(0);
when "0111" =>
COReAhbSram_l0I <= COREAHBSRam_i1ll(0)&CorEAHBSRAm_l1ll(0)&CoreAhbSraM_O1LL(0)&CoreAhbSRAM_I0ll(0)&CorEAHBSRAM_l0ll(0)&CorEAHBSRAM_o0ll(0)&COREAHbSram_iill(0)&COREAhbSram_lilL(0);
when "1000" =>
CorEAHBSRAM_l0i <= COREAhbSram_oliL(1 downto 0)&COREAhbSram_ioIL(1 downto 0)&COREAHBSram_loil(1 downto 0)&COreAhbSram_oOIL(1 downto 0);
when "1001" =>
CoreAhbSram_L0I <= CoreAhBSRAM_Olil(1 downto 0)&CoreAhbSRAM_IOil(1 downto 0)&CoreAhbSRAM_LOIl(1 downto 0)&CoreAhbSrAM_OOIL(1 downto 0);
when "1010" =>
COReAhbSram_l0I <= CoreAHBSRAM_Olil(1 downto 0)&CoreAHBSRAM_ioil(1 downto 0)&CoreAhbSraM_LOIL(1 downto 0)&CoreAhBSRAM_OOil(1 downto 0);
when "1011" =>
CoreAHBSRAM_l0i <= COREAHBSram_olil(1 downto 0)&CoreAHBSRAM_ioil(1 downto 0)&CoreAhbSram_LOIL(1 downto 0)&COREAHBSram_ooil(1 downto 0);
when "1100" =>
COREAHBSram_l0i <= COREAHBSram_i1ll(0)&COreAhbSram_l1LL(0)&CoreAhbSram_O1LL(0)&CoreAhbSraM_I0LL(0)&CoreAhbSraM_L0LL(0)&CorEAHBSRAM_o0ll(0)&CoreAhbSraM_IILL(0)&CorEAHBSRAM_lill(0);
when "1101" =>
COREAHbSram_l0i <= COREAhbSram_i1lL(0)&COREAhbSram_l1lL(0)&CoreAhBSRAM_O1ll(0)&CoreAHBSRAM_i0ll(0)&COReAhbSram_l0LL(0)&COReAhbSram_o0LL(0)&COREAhbSram_iiLL(0)&COReAhbSram_lILL(0);
when "1110" =>
COREAHBSram_l0i <= COReAhbSram_i1LL(0)&CoreAhbSrAM_L1LL(0)&CoREAHBSRAm_o1ll(0)&COREAHBSram_i0ll(0)&COREAhbSraM_L0ll(0)&CoreAhbSRAM_O0ll(0)&COReAhbSram_iiLL(0)&CoreAhbSraM_LILL(0);
when "1111" =>
COreAhbSram_l0I <= COREAHbSram_i1ll(0)&COREAHbSram_l1ll(0)&CoreAhbSRAM_O1ll(0)&COREAhbSram_i0lL(0)&COREAhbSram_l0ll(0)&CoreAhbSraM_O0LL(0)&CoreAhbSRAM_IIll(0)&COREAHbSram_lill(0);
when others =>
null
;
end case;
end case;
when 6656 =>
case (COREAHbSram_lo1) is
when 8 =>
CoreAHBSRAM_ol1 <= "11";
COREAHBSram_ll1 <= "11";
CoreAhbSrAM_IL1 <= "11";
CoreAhbSram_OI1 <= "11";
CoreAhbSRAM_LI1 <= "11";
CorEAHBSRAm_ii1 <= "11";
COreAhbSram_O01 <= "11";
CoREAHBSram_l01 <= "11";
CoreAhbSram_I01 <= "11";
COreAhbSram_o11 <= "11";
CoreAHBSRAM_l11 <= "11";
CoreAhbSRAM_I11 <= "11";
CoreAHBSRAM_oool <= "11";
CoreAHBSRAM_iiil <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoreAhbSrAM_O0IL <= "000"&CoreAhbSraM_O0I(8 downto 0);
COReAhbSram_l0IL <= "000"&COReAhbSram_o0I(8 downto 0);
COREAhbSram_i0iL <= "000"&CoreAhbSraM_O0I(8 downto 0);
COREAHbSram_o1il <= "000"&CoreAhbSraM_O0I(8 downto 0);
CoreAhbSraM_L1IL <= "000"&CoreAhBSRAM_O0i(8 downto 0);
CoreAHBSRAM_i1il <= "000"&CoreAhbSrAM_O0I(8 downto 0);
COreAhbSram_oO0L <= "000"&CoreAhbSRAM_O0I(8 downto 0);
COREAHBSram_lo0l <= "000"&CoreAHBSRAM_O0i(8 downto 0);
CoreAhbSram_IO0L <= "000"&COREAHBSram_o0i(8 downto 0);
CoreAhbSraM_OL0L <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COREAhbSram_ll0l <= "000"&COREAHbSram_o0i(8 downto 0);
COreAhbSram_iL0L <= "000"&COReAhbSram_o0I(8 downto 0);
CoreAhbSraM_O00L <= "000"&CoreAhbSraM_III(8 downto 0);
CoreAhbSRAM_L00l <= "000"&COreAhbSram_iII(8 downto 0);
COREAHbSram_i00l <= "000"&COREAHbSram_iii(8 downto 0);
CoreAhbSram_O10L <= "000"&CoreAhBSRAM_iii(8 downto 0);
CorEAHBSRAM_l10l <= "000"&CoreAhbSram_III(8 downto 0);
COREAhbSram_i10L <= "000"&CoreAhbSraM_III(8 downto 0);
COReAhbSram_oo1L <= "000"&CoreAhbSRAM_III(8 downto 0);
COreAhbSram_LO1L <= "000"&CoreAhbSraM_III(8 downto 0);
CorEAHBSRAM_io1l <= "000"&COREAHbSram_iii(8 downto 0);
COREAhbSram_ol1L <= "000"&CoreAhBSRAM_Iii(8 downto 0);
CoreAhbSRAM_LL1l <= "000"&COREAHbSram_iii(8 downto 0);
COREAHBSram_il1l <= "000"&CoreAHBSRAM_iii(8 downto 0);
CoreAhbSram_OI1L <= "000"&CoREAHBSRAm_iii(8 downto 0);
COREAHBSram_oiol <= CorEAHBSRAM_lii;
CoreAhbSrAM_LIOL <= COREAhbSram_lii;
CoreAhBSRAM_Iiol <= COREAhbSram_liI;
COREAhbSram_o0oL <= COREAHBSRam_lii;
COREAHBSRam_l0ol <= CoreAhbSRAM_LII;
CoreAhbSraM_I0OL <= CoreAhbSrAM_LII;
COreAhbSram_o1OL <= CorEAHBSRAM_lii;
COReAhbSram_l1OL <= COREAHBSram_lii;
CoreAhbSRAM_I1ol <= COREAhbSram_lii;
CoREAHBSRAm_ooll <= CoreAhbSrAM_LII;
CoreAhbSram_LOLL <= CoreAhbSraM_LII;
COREAhbSram_iolL <= CorEAHBSRAM_lii;
CoreAhbSRAM_OLll <= CoreAhbSram_LII;
case (CoREAHBSRam_o0i(12 downto 9)) is
when "0000" =>
COREAHBSRam_llol(0) <= CoreAHBSRAM_L01l;
when "0001" =>
CoreAHBSRAM_Llol(1) <= CoreAhbSram_L01L;
when "0010" =>
CoreAhbSRAM_llol(2) <= COREAHbSram_L01L;
when "0011" =>
CoREAHBSram_lLOL(3) <= COREAhbSram_L01L;
when "0100" =>
COREAHBSram_llol(4) <= COREAHBSram_l01l;
when "0101" =>
CoreAhbSRAM_LLOL(5) <= COREAhbSram_l01L;
when "0110" =>
COreAhbSram_lLOL(6) <= COreAhbSram_L01L;
when "0111" =>
COREAhbSram_llOL(7) <= CoreAHBSRAM_L01l;
when "1000" =>
CoreAhbSraM_LLOL(8) <= CoreAhbSraM_L01L;
when "1001" =>
CoreAhbSrAM_LLOL(9) <= COREAHBSram_l01l;
when "1010" =>
COREAHBSram_llol(10) <= COREAHBSram_l01l;
when "1011" =>
CoreAHBSRAM_llol(11) <= COREAhbSram_l01L;
when "1100" =>
COREAHBSram_llol(12) <= COReAhbSram_l01L;
when "1101" =>
COREAhbSram_lloL(5) <= CoreAhbSrAM_L01L;
when "1110" =>
CoreAhbSrAM_LLOL(6) <= CoreAHBSRAM_l01l;
when "1111" =>
COREAhbSram_lloL(7) <= COREAhbSram_l01l;
when others =>
null
;
end case;
case (CorEAHBSRAm_iii(12 downto 9)) is
when "0000" =>
CoreAhBSRAM_Ilol(0) <= COreAhbSram_i01L;
when "0001" =>
COREAHbSram_ilol(1) <= COreAhbSram_i01L;
when "0010" =>
CoreAhbSram_ILOL(2) <= CoreAhbSRAM_I01l;
when "0011" =>
CoreAhbSram_ILOL(3) <= CorEAHBSRAM_i01l;
when "0100" =>
CoreAhBSRAM_Ilol(4) <= CoreAhbSram_I01L;
when "0101" =>
CoreAhbSraM_ILOL(5) <= CoreAhbSRAM_I01l;
when "0110" =>
CorEAHBSRAM_ilol(6) <= CoreAhbSram_I01L;
when "0111" =>
CoreAhbSram_ILOL(7) <= COREAHBSram_i01l;
when "1000" =>
COREAHBSram_ilol(8) <= COreAhbSrAM_I01l;
when "1001" =>
COReAhbSraM_ILOL(9) <= COReAhbSraM_I01l;
when "1010" =>
CoreAHBSram_iloL(10) <= COREAhbSram_i01L;
when "1011" =>
CoreAhbSrAM_ILOL(11) <= COREAhbSram_i01l;
when "1100" =>
COREAHbSram_ilol(12) <= COREAHBSram_i01l;
when "1101" =>
COreAhbSram_iLOL(5) <= CoreAhbSram_I01L;
when "1110" =>
COReAhbSram_ilOL(6) <= CoreAhbSrAM_I01L;
when "1111" =>
COREAHBSRam_ilol(7) <= COREAHbSram_i01l;
when others =>
null
;
end case;
case (COREAHbSram_io1(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_L0I <= CoreAhBSRAM_Lill;
when "0001" =>
COREAHBSram_l0i <= CoreAhbSrAM_IILL;
when "0010" =>
CoreAHBSRAM_l0i <= COReAhbSram_o0LL;
when "0011" =>
CoreAhbSRAM_l0i <= CoreAhbSraM_L0LL;
when "0100" =>
CoreAhbSrAM_L0I <= COREAHbSram_i0ll;
when "0101" =>
COReAhbSram_l0I <= CorEAHBSRAM_o1ll;
when "0110" =>
CoreAhbSraM_L0I <= CoREAHBSRAm_l1ll;
when "0111" =>
COREAhbSram_l0i <= CoreAhbSraM_I1LL;
when "1000" =>
CoreAhbSram_L0I <= CoreAhbSrAM_OOIL;
when "1001" =>
CoreAHBSRAM_l0i <= COreAhbSram_lOIL;
when "1010" =>
COREAHBSram_l0i <= CorEAHBSRAM_ioil;
when "1011" =>
CoreAhbSram_L0I <= COREAHBSram_olil;
when "1100" =>
CorEAHBSram_l0I <= COREAhbSram_LLIL;
when "1101" =>
CoreAHBSRAm_l0i <= CoreAhBSRAM_o1ll;
when "1110" =>
CorEAHBSram_l0I <= COreAhbSrAM_L1ll;
when "1111" =>
CoreAhBSRAM_l0i <= COREAhbSram_I1LL;
when others =>
null
;
end case;
when 4 =>
CoreAhbSRAM_ol1 <= "10";
COReAhbSrAM_LL1 <= "10";
COREAhbSram_IL1 <= "10";
CoreAhbSRAM_oi1 <= "10";
CoreAHBSram_li1 <= "10";
COreAhbSraM_II1 <= "10";
CoreAhbSRAM_o01 <= "10";
CoreAHBSRAM_L01 <= "10";
COREAHBSram_i01 <= "10";
CoreAhbSraM_O11 <= "10";
COREAHBSram_l11 <= "10";
COreAhbSram_i11 <= "10";
COREAhbSram_ooOL <= "11";
COREAHBSRam_iiil <= "00"&CoreAHBSRAM_o0i(9 downto 0);
COREAHBSRam_o0il <= "00"&COREAhbSram_o0i(9 downto 0);
CoreAhbSRAM_L0IL <= "00"&COREAHBSram_o0i(9 downto 0);
CorEAHBSRAM_i0il <= "00"&CoreAHBSRAM_o0i(9 downto 0);
CoreAHBSRAM_o1il <= "00"&CoreAHBSRAM_o0i(9 downto 0);
CoreAhbSram_L1IL <= "00"&COREAhbSram_o0i(9 downto 0);
CoreAhbSram_I1IL <= "00"&CoreAhbSram_O0I(9 downto 0);
CoreAhbSram_OO0L <= "00"&CorEAHBSRAm_o0i(9 downto 0);
CoreAhbSraM_LO0L <= "00"&COREAhbSram_o0I(9 downto 0);
CoreAHBSRAM_io0l <= "00"&CoreAhbSraM_O0I(9 downto 0);
COREAHbSram_ol0l <= "00"&CoreAhbSraM_O0I(9 downto 0);
COREAhbSram_LL0L <= "00"&COREAHBSram_o0i(9 downto 0);
CoreAhBSRAM_il0l <= "000"&COreAhbSram_O0I(8 downto 0);
COreAhbSram_o00L <= "00"&COReAhbSram_iiI(9 downto 0);
CoreAHBSRAM_l00l <= "00"&COReAhbSram_iiI(9 downto 0);
CoreAhbSraM_I00L <= "00"&CoREAHBSRam_iii(9 downto 0);
CoreAhbSrAM_O10L <= "00"&CoREAHBSRAm_iii(9 downto 0);
COREAHBSRam_l10l <= "00"&COREAHbSram_iii(9 downto 0);
COREAHBSRam_i10l <= "00"&COREAHBSram_iii(9 downto 0);
COreAhbSram_oO1L <= "00"&CoreAHBSRAM_iii(9 downto 0);
CoreAhbSraM_LO1L <= "00"&CoreAhbSraM_III(9 downto 0);
CoreAHBSRAM_io1l <= "00"&CoreAhbSram_III(9 downto 0);
CoreAhBSRAM_OL1l <= "00"&CoreAhbSram_III(9 downto 0);
COreAhbSrAM_LL1l <= "00"&COREAHBSram_iii(9 downto 0);
COreAhbSram_iL1L <= "00"&COREAhbSram_iii(9 downto 0);
CoREAHBSRAm_oi1l <= "000"&CoreAhbSram_III(8 downto 0);
COREAhbSram_oiOL(3 downto 0) <= CoreAhbSRAM_LIi(3 downto 0);
CorEAHBSRAM_liol(3 downto 0) <= CoreAhbSram_LII(7 downto 4);
CorEAHBSRAM_iiol(3 downto 0) <= CoreAhbSram_LII(3 downto 0);
CoreAhbSraM_O0OL(3 downto 0) <= COREAhbSram_lii(7 downto 4);
CoreAhbSraM_L0OL(3 downto 0) <= COREAHBSram_lii(3 downto 0);
COREAHBSram_i0ol(3 downto 0) <= COREAhbSram_lii(7 downto 4);
CoreAhbSraM_O1OL(3 downto 0) <= CoreAhbSram_LII(3 downto 0);
CoreAHBSRAM_L1ol(3 downto 0) <= COREAHBSram_lii(7 downto 4);
CoreAhbSram_I1OL(3 downto 0) <= COReAhbSram_liI(3 downto 0);
CoreAhbSram_OOLL(3 downto 0) <= CoreAhbSraM_LII(7 downto 4);
COREAhbSram_lolL(3 downto 0) <= CoreAHBSRAM_lii(3 downto 0);
CoREAHBSRAm_ioll(3 downto 0) <= COReAhbSram_liI(7 downto 4);
COREAHBSram_olll <= CoreAhbSram_LII;
case (CoreAhBSRAM_o0i(12 downto 9)) is
when "0000" =>
COreAhbSrAM_LLOl(1 downto 0) <= CoREAHbSram_l01L&COReAhbSraM_L01l;
when "0001" =>
CoreAHBSRAm_llol(1 downto 0) <= COREAhbSram_L01L&COreAhbSrAM_L01l;
when "0010" =>
CoreAHBSRAM_llol(3 downto 2) <= CoreAhbSRAM_l01l&CoreAhbSrAM_L01l;
when "0011" =>
CorEAHBSram_lloL(3 downto 2) <= CoreAhBSRAM_l01l&COREAhbSram_L01L;
when "0100" =>
CoREAHBSram_llOL(5 downto 4) <= CoreAhbSRAM_L01l&CoreAhBSRAM_l01l;
when "0101" =>
CoreAhbSRAM_Llol(5 downto 4) <= CoreAhbSRAM_l01l&CoreAhbSRAM_l01l;
when "0110" =>
CoreAhbSRAM_llol(7 downto 6) <= CoreAhbSRAM_L01l&COREAhbSraM_L01L;
when "0111" =>
CoreAHBSRAm_llol(7 downto 6) <= COREAhbSram_L01L&CoREAHBSram_l01L;
when "1000" =>
CoreAhBSRAM_llol(9 downto 8) <= CoREAHBSram_l01L&COREAhbSram_L01L;
when "1001" =>
CoreAhbSRAM_Llol(9 downto 8) <= COreAhbSrAM_L01l&CoreAHBSRAm_l01l;
when "1010" =>
CoreAhbSRAM_Llol(11 downto 10) <= CoreAHBSRAM_l01l&COREAHBSram_l01l;
when "1011" =>
CoreAhbSram_LLOL(11 downto 10) <= COreAhbSram_L01L&CoreAHBSRAM_L01l;
when "1100" =>
COREAhbSram_llOL(12) <= COreAhbSrAM_L01l;
when "1101" =>
CorEAHBSram_lLOL(5 downto 4) <= CoreAhbSrAM_L01l&COREAhbSram_L01L;
when "1110" =>
COREAHBSRam_llol(7 downto 6) <= CoREAHBSRAm_l01l&COREAhbSram_l01l;
when "1111" =>
CoreAhbSraM_LLOL(7 downto 6) <= COREAhbSram_l01L&COREAHBSram_l01l;
when others =>
null
;
end case;
case (CoreAHBSRAM_iii(12 downto 9)) is
when "0000" =>
CorEAHBSRAM_ilol(1 downto 0) <= COREAhbSram_i01L&CoreAhbSRAM_I01l;
when "0001" =>
COREAHbSram_ilol(1 downto 0) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l;
when "0010" =>
CoreAhbSrAM_ILOL(3 downto 2) <= CoreAhbSRAM_I01l&COREAhbSram_i01L;
when "0011" =>
COReAhbSram_ilOL(3 downto 2) <= CoREAHBSRAm_i01l&COREAHbSram_i01l;
when "0100" =>
CoreAhbSrAM_ILOL(5 downto 4) <= CoREAHBSRAm_i01l&COREAhbSram_i01L;
when "0101" =>
COREAHbSram_ilol(5 downto 4) <= CoreAHBSRAM_i01l&COREAHBSram_i01l;
when "0110" =>
CoREAHBSRAm_ilol(7 downto 6) <= CoreAhbSram_I01L&CoreAhbSrAM_I01L;
when "0111" =>
CoreAhbSRAM_ILol(7 downto 6) <= CoreAhBSRAM_I01l&CoreAhBSRAM_I01l;
when "1000" =>
CoreAhbSram_ILOL(9 downto 8) <= CoreAhbSraM_I01L&CoreAhbSraM_I01L;
when "1001" =>
CoreAhbSraM_ILOL(9 downto 8) <= COREAhbSram_i01l&COREAHBSram_i01l;
when "1010" =>
COREAHBSram_ilol(11 downto 10) <= COREAhbSram_i01l&COReAhbSram_i01L;
when "1011" =>
COREAhbSram_iloL(11 downto 10) <= CoreAhbSram_I01L&CoreAhbSraM_I01L;
when "1100" =>
CoreAhBSRAM_Ilol(12) <= COREAhbSram_i01l;
when "1101" =>
CoreAhbSram_ILOL(5 downto 4) <= CoreAhbSraM_I01L&CoreAhbSRAM_I01l;
when "1110" =>
COREAHBSram_ilol(7 downto 6) <= CoreAHBSRAM_i01l&COREAHBSRam_i01l;
when "1111" =>
CoreAhbSram_ILOL(7 downto 6) <= CoreAhbSram_I01L&CoreAhbSram_I01L;
when others =>
null
;
end case;
case (CoreAHBSRAM_io1(12 downto 9)) is
when "0000" =>
COReAhbSram_l0I <= CoreAhbSRAM_IILl(3 downto 0)&CoreAhbSRAM_LILL(3 downto 0);
when "0001" =>
COREAHBSRam_l0i <= COReAhbSram_iiLL(3 downto 0)&COREAHBSRam_lill(3 downto 0);
when "0010" =>
CoreAHBSRAM_l0i <= COREAHBSram_l0ll(3 downto 0)&CoreAhbSram_O0LL(3 downto 0);
when "0011" =>
COreAhbSram_L0I <= COReAhbSram_l0LL(3 downto 0)&CoreAhbSRAM_O0ll(3 downto 0);
when "0100" =>
CoreAHBSRAM_l0i <= CoreAhbSrAM_O1LL(3 downto 0)&CoreAhbSram_I0LL(3 downto 0);
when "0101" =>
CoreAHBSRAM_L0i <= CoreAhbSraM_O1LL(3 downto 0)&COREAHBSram_i0ll(3 downto 0);
when "0110" =>
COREAHbSram_l0i <= COREAHbSram_i1ll(3 downto 0)&COREAHBSram_l1ll(3 downto 0);
when "0111" =>
COREAhbSram_l0I <= COReAhbSram_i1LL(3 downto 0)&CoreAhBSRAM_L1ll(3 downto 0);
when "1000" =>
COREAhbSram_l0i <= CoreAhbSraM_LOIL(3 downto 0)&CoreAhbSrAM_OOIL(3 downto 0);
when "1001" =>
CorEAHBSRAm_l0i <= CoreAhbSrAM_LOIL(3 downto 0)&CoreAhbSraM_OOIL(3 downto 0);
when "1010" =>
CoreAhbSram_L0I <= CoreAhbSraM_OLIL(3 downto 0)&COreAhbSram_IOIL(3 downto 0);
when "1011" =>
CoreAhbSram_L0I <= CoreAhbSraM_OLIL(3 downto 0)&CoreAhbSrAM_IOIL(3 downto 0);
when "1100" =>
CoreAHBSRAM_L0i <= CoreAHBSRAM_Llil;
when "1101" =>
COReAhbSram_l0I <= CoreAhBSRAM_O1ll(3 downto 0)&COREAhbSram_i0lL(3 downto 0);
when "1110" =>
CoreAhbSram_L0I <= COREAhbSram_i1lL(3 downto 0)&CoreAhbSraM_L1LL(3 downto 0);
when "1111" =>
COReAhbSram_l0I <= CoreAHBSRAM_i1ll(3 downto 0)&COreAhbSram_l1LL(3 downto 0);
when others =>
null
;
end case;
when 2 =>
COReAhbSram_ol1 <= "01";
CoreAhbSrAM_LL1 <= "01";
COreAhbSram_iL1 <= "01";
COREAhbSram_oi1 <= "01";
CoreAhbSram_LI1 <= "01";
COReAhbSram_ii1 <= "01";
CoreAhbSRAM_O01 <= "01";
COREAhbSram_l01 <= "01";
COREAHBSRam_i01 <= "01";
CoreAhbSrAM_O11 <= "01";
CoreAHBSRAM_l11 <= "01";
CoreAhbSraM_I11 <= "01";
COreAhbSram_OOOL <= "11";
CoreAhBSRAM_Iiil <= '0'&CoreAhbSrAM_O0I(10 downto 0);
CoreAHBSRAM_O0il <= '0'&COREAHBSram_o0i(10 downto 0);
COREAhbSram_l0il <= '0'&CoreAhbSRAM_O0i(10 downto 0);
CoreAHBSRAM_i0il <= '0'&CoreAhbSrAM_O0I(10 downto 0);
COReAhbSram_o1IL <= '0'&CoreAhbSram_O0I(10 downto 0);
COReAhbSram_l1IL <= '0'&COReAhbSram_o0I(10 downto 0);
CorEAHBSRAM_i1il <= '0'&CoreAhbSraM_O0I(10 downto 0);
CoreAhbSrAM_OO0L <= '0'&COREAhbSram_o0i(10 downto 0);
CoreAHBSRAM_lo0l <= '0'&CoreAhbSraM_O0I(10 downto 0);
CoreAhbSrAM_IO0l <= '0'&COREAHBSram_o0i(10 downto 0);
COreAhbSram_oL0L <= '0'&CoreAhbSrAM_O0I(10 downto 0);
COreAhbSram_lL0L <= '0'&CoreAhbSRAM_O0i(10 downto 0);
COREAhbSram_il0l <= "000"&CorEAHBSRAM_o0i(8 downto 0);
COREAHBSRam_o00l <= '0'&COreAhbSram_iII(10 downto 0);
COReAhbSram_l00L <= '0'&COreAhbSram_iII(10 downto 0);
CoreAHBSRAM_I00l <= '0'&COReAhbSram_iiI(10 downto 0);
COREAHBSram_o10l <= '0'&CoreAHBSRAM_iii(10 downto 0);
CoreAHBSRAM_l10l <= '0'&CoREAHBSRam_iii(10 downto 0);
CoreAhBSRAM_I10l <= '0'&CoreAHBSRAM_iii(10 downto 0);
CoreAhbSRAM_OO1l <= '0'&COreAhbSram_iII(10 downto 0);
CoreAhbSrAM_LO1L <= '0'&CoreAhbSRAM_IIi(10 downto 0);
CoreAhbSraM_IO1L <= '0'&COreAhbSram_iII(10 downto 0);
COREAHBSram_ol1l <= '0'&COREAhbSram_iii(10 downto 0);
COREAHBSRam_ll1l <= '0'&CoreAhbSraM_III(10 downto 0);
COReAhbSram_il1L <= '0'&COREAHBSram_iii(10 downto 0);
COREAhbSram_OI1L <= "000"&COREAhbSraM_III(8 downto 0);
CoreAhbSRAm_oiol(1 downto 0) <= CoreAhbSRAM_Lii(1 downto 0);
CoREAHBSram_lIOL(1 downto 0) <= CorEAHBSram_lii(3 downto 2);
COREAHbSram_IIOL(1 downto 0) <= CoREAHbSram_lII(5 downto 4);
CoreAhbSRAM_O0ol(1 downto 0) <= CoreAhBSRAM_Lii(7 downto 6);
CoreAHBSRAM_L0ol(1 downto 0) <= COREAHbSram_lII(1 downto 0);
COREAhbSram_I0OL(1 downto 0) <= CoreAhBSRAM_lii(3 downto 2);
CoreAhbSraM_O1OL(1 downto 0) <= COreAhbSram_lII(5 downto 4);
COREAHBSram_l1ol(1 downto 0) <= CoreAhbSram_LII(7 downto 6);
CoreAhbSRAM_I1OL(1 downto 0) <= COREAHBSram_lii(1 downto 0);
COReAhbSram_ooLL(1 downto 0) <= CoreAhbSram_LII(3 downto 2);
CoreAhBSRAM_LOll(1 downto 0) <= CoreAhbSram_LII(5 downto 4);
COREAhbSram_iolL(1 downto 0) <= COREAHBSram_lii(7 downto 6);
COreAhbSram_oLLL <= COREAhbSram_liI;
case (COReAhbSram_o0I(12 downto 9)) is
when "0000" =>
CoreAhBSRAM_LLol(3 downto 0) <= CoreAhbSRAM_L01l&COREAHbSram_l01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when "0001" =>
CoreAhbSraM_LLOL(3 downto 0) <= CoreAhbSram_L01L&CoreAhbSram_L01L&COREAhbSram_l01L&CoreAhbSRAM_L01l;
when "0010" =>
COreAhbSram_lLOL(3 downto 0) <= COREAhbSram_l01L&CoreAhbSram_L01L&CoREAHBSRam_l01l&CoreAhbSram_L01L;
when "0011" =>
COREAhbSram_lloL(3 downto 0) <= CoREAHBSRam_l01l&COREAHbSram_l01l&CoreAhbSraM_L01L&COREAHBSram_l01l;
when "0100" =>
CoreAhbSRAM_LLOL(7 downto 4) <= CorEAHBSRAM_l01l&COREAHBSram_l01l&CoreAhBSRAM_L01l&COreAhbSram_L01L;
when "0101" =>
CoREAHBSRAm_llol(7 downto 4) <= COREAHBSram_l01l&CoreAHBSRAM_l01l&CoreAhbSram_L01L&COREAHBSram_l01l;
when "0110" =>
CoreAhbSram_LLOL(7 downto 4) <= CorEAHBSRAM_l01l&CoreAHBSRAM_l01l&COreAhbSram_l01L&COREAHBSRam_l01l;
when "0111" =>
COREAhbSram_llOL(7 downto 4) <= CoreAhbSRAM_L01l&COREAHBSRam_l01l&COReAhbSram_l01L&CorEAHBSRAM_l01l;
when "1000" =>
CoREAHBSRAm_llol(11 downto 8) <= COREAHBSram_l01l&COREAhbSram_l01l&CoreAHBSRAM_L01l&CoreAhbSram_L01L;
when "1001" =>
CoREAHBSRam_llol(11 downto 8) <= CoreAhbSRAM_L01l&CorEAHBSRAM_l01l&CoreAhbSRAM_L01l&CoreAhbSrAM_L01L;
when "1010" =>
CoreAhbSram_LLOL(11 downto 8) <= CoREAHBSRAm_l01l&COREAHBSram_l01l&CoreAhbSram_L01L&COREAhbSram_l01L;
when "1011" =>
CoreAhbSRAM_LLol(11 downto 8) <= COREAHBSRam_l01l&COREAhbSram_l01L&CoreAhbSrAM_L01L&COReAhbSram_l01L;
when "1100" =>
COREAHbSram_llol(12) <= COReAhbSram_l01L;
when "1101" =>
CoreAhbSram_LLOL(7 downto 4) <= CoreAhbSraM_L01L&CoreAhbSRAM_L01l&COREAhbSram_l01l&CoreAhbSram_L01L;
when "1110" =>
CoreAhbSrAM_LLOL(7 downto 4) <= COREAHBSram_l01l&COREAhbSram_l01L&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when "1111" =>
CoreAhbSram_LLOL(7 downto 4) <= COReAhbSram_l01L&COREAhbSram_l01L&CoreAhbSRAM_L01l&COREAhbSram_l01L;
when others =>
null
;
end case;
case (CoreAhbSram_III(12 downto 9)) is
when "0000" =>
CoreAHBSRAM_Ilol(3 downto 0) <= CoreAhbSRAM_I01l&COREAHbSram_i01l&COREAHBSRam_i01l&CoreAHBSRAM_I01l;
when "0001" =>
CoREAHBSRam_ilol(3 downto 0) <= CoreAhbSram_I01L&CoreAhbSraM_I01L&COREAhbSram_i01L&COREAHBSRam_i01l;
when "0010" =>
CoreAhbSRAM_ILOL(3 downto 0) <= CoreAhbSram_I01L&CoreAhbSrAM_I01L&COreAhbSram_i01L&COREAHbSram_i01l;
when "0011" =>
COREAhbSram_iloL(3 downto 0) <= CoreAhbSrAM_I01L&CoreAhbSRAM_I01l&COReAhbSram_i01L&CoREAHBSRAm_i01l;
when "0100" =>
CoREAHBSRAm_ilol(7 downto 4) <= CoreAhbSram_I01L&CoreAhbSraM_I01L&COREAhbSram_i01L&CoREAHBSRAm_i01l;
when "0101" =>
CoreAhBSRAM_Ilol(7 downto 4) <= CoreAHBSRAM_i01l&CorEAHBSRAm_i01l&CoreAhbSram_I01L&COREAhbSram_i01L;
when "0110" =>
COreAhbSram_iLOL(7 downto 4) <= CoreAhbSRAM_I01l&CoreAHBSRAM_i01l&CoreAhbSRAM_I01l&CoreAhbSraM_I01L;
when "0111" =>
COREAhbSram_iloL(7 downto 4) <= CoreAHBSRAM_i01l&COREAhbSram_i01l&CoreAhbSRAM_I01l&CoreAhbSrAM_I01L;
when "1000" =>
COREAHbSram_ilol(11 downto 8) <= COreAhbSraM_I01L&CoreAhbSrAM_I01L&CoreAHBSRam_i01l&COreAhbSrAM_I01l;
when "1001" =>
CoreAhbSRAM_ILOl(11 downto 8) <= CorEAHBSRAM_i01l&COREAHbSram_i01l&CoreAHBSRAM_i01l&CoreAhbSram_I01L;
when "1010" =>
CoreAHBSRAM_ilol(11 downto 8) <= CoreAhbSrAM_I01L&CoreAhbSRAM_I01l&CoreAhbSrAM_I01L&COReAhbSram_i01L;
when "1011" =>
CoreAhbSRAM_ILol(11 downto 8) <= COREAhbSram_i01l&COREAhbSram_i01l&COREAHBSram_i01l&CoreAHBSRAM_i01l;
when "1100" =>
CoreAhBSRAM_Ilol(12) <= COREAhbSram_i01L;
when "1101" =>
CoreAhbSrAM_ILOL(7 downto 4) <= CoreAhbSRAM_I01l&CoREAHBSRam_i01l&CoreAhbSRAM_I01l&COreAhbSram_i01L;
when "1110" =>
COREAHBSram_ilol(7 downto 4) <= COREAhbSram_i01L&COREAhbSram_i01L&CoreAHBSRAM_i01l&CoreAhbSraM_I01L;
when "1111" =>
CorEAHBSRAM_ilol(7 downto 4) <= CoreAhbSRAM_I01l&CoreAHBSRAM_i01l&COreAhbSram_i01L&COREAHBSram_i01l;
when others =>
null
;
end case;
case (COREAHbSram_iO1(12 downto 9)) is
when "0000" =>
CoREAHBSram_l0I <= COreAhbSraM_L0Ll(1 downto 0)&CoreAhbSRAM_O0ll(1 downto 0)&CoreAhbSRAM_IIll(1 downto 0)&COREAHBSram_lILL(1 downto 0);
when "0001" =>
CoREAHbSram_l0I <= COReAhbSraM_L0LL(1 downto 0)&COREAHbSram_O0LL(1 downto 0)&COREAhbSram_IILL(1 downto 0)&COREAHbSram_LILL(1 downto 0);
when "0010" =>
CoREAHbSRAM_l0i <= CoREAHBSram_l0LL(1 downto 0)&COREAhbSram_O0LL(1 downto 0)&CoreAHBSram_iilL(1 downto 0)&CoreAhBSRAm_lill(1 downto 0);
when "0011" =>
CoreAhbSrAM_L0I <= CoreAhbSrAM_L0LL(1 downto 0)&CoreAhbSRAM_O0Ll(1 downto 0)&CoreAhbSram_IILL(1 downto 0)&CoreAhbSraM_LILL(1 downto 0);
when "0100" =>
CoREAHBSRam_l0i <= CoreAhBSRAM_I1ll(1 downto 0)&CoreAhbSraM_L1LL(1 downto 0)&CoREAHBSRAm_o1ll(1 downto 0)&CoREAHBSRAm_i0ll(1 downto 0);
when "0101" =>
CoreAhbSram_L0I <= CoreAhbSRAM_I1Ll(1 downto 0)&CoreAhBSRAM_L1ll(1 downto 0)&COREAhbSram_o1ll(1 downto 0)&CoreAhbSRAM_I0Ll(1 downto 0);
when "0110" =>
CoreAhbSram_L0I <= CoreAhbSram_I1LL(1 downto 0)&COreAhbSram_L1LL(1 downto 0)&CorEAHBSRAM_o1ll(1 downto 0)&CoreAhbSram_I0LL(1 downto 0);
when "0111" =>
COREAhbSram_l0i <= COReAhbSram_i1LL(1 downto 0)&COREAHbSram_l1ll(1 downto 0)&CoreAHBSRAM_o1ll(1 downto 0)&COREAhbSram_i0lL(1 downto 0);
when "1000" =>
COREAhbSram_L0I <= CoreAHBSRam_olil(1 downto 0)&COREAhbSram_IOIL(1 downto 0)&CoreAhBSRAm_loil(1 downto 0)&CoreAhbSRAM_ooil(1 downto 0);
when "1001" =>
CoreAhbSram_L0I <= COREAhbSram_olIL(1 downto 0)&COREAHBSram_ioil(1 downto 0)&CoreAhbSRAM_Loil(1 downto 0)&COREAHBSram_ooil(1 downto 0);
when "1010" =>
COREAhbSram_l0i <= COREAhbSram_olIL(1 downto 0)&CoreAHBSRAM_ioil(1 downto 0)&COreAhbSram_lOIL(1 downto 0)&CoreAhbSraM_OOIL(1 downto 0);
when "1011" =>
COREAhbSram_l0I <= COREAhbSram_oliL(1 downto 0)&COReAhbSram_iOIL(1 downto 0)&COReAhbSram_loIL(1 downto 0)&CoreAhBSRAM_OOil(1 downto 0);
when "1100" =>
COREAHbSram_l0i <= COREAHBSram_llil;
when "1101" =>
COREAHBSram_l0i <= COReAhbSram_i1LL(1 downto 0)&COREAHbSram_l1ll(1 downto 0)&CoreAHBSRAM_o1ll(1 downto 0)&COReAhbSram_i0LL(1 downto 0);
when "1110" =>
COREAHBSram_l0i <= COREAhbSram_i1lL(1 downto 0)&COREAhbSram_l1LL(1 downto 0)&COREAhbSram_O1LL(1 downto 0)&COReAhbSraM_I0Ll(1 downto 0);
when "1111" =>
COREAhbSram_l0i <= COREAhbSram_i1lL(1 downto 0)&CoreAHBSRAM_l1ll(1 downto 0)&CoreAhbSraM_O1LL(1 downto 0)&COReAhbSram_i0LL(1 downto 0);
when others =>
null
;
end case;
when others =>
COREAHBSram_ol1 <= "00";
CoreAhbSRAM_LL1 <= "00";
CoreAhBSRAM_Il1 <= "00";
CoreAhbSraM_OI1 <= "00";
CoreAhbSraM_LI1 <= "00";
CoREAHBSRAm_ii1 <= "00";
CoREAHBSRAm_o01 <= "00";
CoreAhbSram_L01 <= "00";
CorEAHBSRAm_i01 <= "01";
CoreAhbSram_O11 <= "01";
CoreAhbSrAM_L11 <= "01";
COREAHBSRam_i11 <= "01";
CoreAhbSram_OOOL <= "11";
COREAhbSram_iiil <= COREAhbSram_o0I(11 downto 0);
CorEAHBSRAM_o0il <= CoreAhbSram_O0I(11 downto 0);
COREAHbSram_L0IL <= CoreAhbSRAM_o0i(11 downto 0);
CoreAhbSRAM_i0il <= CoreAhbSRAM_O0i(11 downto 0);
CoreAhbSram_O1IL <= CoreAhbSraM_O0I(11 downto 0);
COREAhbSram_l1IL <= CoreAhbSRAM_O0i(11 downto 0);
COREAhbSram_i1iL <= CoreAhbSRAM_O0i(11 downto 0);
COREAhbSram_oo0L <= COREAHBSram_o0i(11 downto 0);
CoreAhbSram_LO0L <= '0'&COREAHbSram_o0i(10 downto 0);
COreAhbSram_iO0L <= '0'&COREAHBSram_o0i(10 downto 0);
CoreAhbSrAM_OL0L <= '0'&CoreAhbSram_O0I(10 downto 0);
CoreAHBSRAM_ll0l <= '0'&CoreAhbSraM_O0I(10 downto 0);
CoreAhbSraM_IL0L <= "000"&CoreAhbSrAM_O0I(8 downto 0);
CoreAhbSraM_O00L <= CoreAhbSraM_III(11 downto 0);
CoreAhbSram_L00L <= COREAHBSram_iii(11 downto 0);
CoreAhbSrAM_I00L <= COREAHbSram_iii(11 downto 0);
CoREAHBSRAm_o10l <= CoreAhbSrAM_III(11 downto 0);
COReAhbSram_l10L <= COreAhbSram_iII(11 downto 0);
CoreAhbSRAM_I10l <= COREAHbSram_iii(11 downto 0);
CoreAhBSRAM_Oo1l <= COREAHBSram_iii(11 downto 0);
CoreAhbSram_LO1L <= COREAHBSram_iii(11 downto 0);
CoreAhbSrAM_IO1L <= '0'&CoreAhBSRAM_iii(10 downto 0);
COREAhbSram_ol1L <= '0'&CoreAhbSrAM_III(10 downto 0);
CoreAhbSRAM_LL1l <= '0'&CoreAhbSram_III(10 downto 0);
COREAHBSRam_il1l <= '0'&CoreAhBSRAM_Iii(10 downto 0);
COREAhbSram_oi1l <= "000"&CoreAHBSRAM_iii(8 downto 0);
COREAHBSRam_oiol(0) <= COREAHBSRam_lii(0);
CoreAHBSRAM_liol(0) <= COREAhbSram_LII(1);
CoreAhbSram_IIOL(0) <= CoreAHBSRAM_lii(2);
CoreAHBSRAM_o0ol(0) <= CoreAhbSram_LII(3);
CoreAhbSram_L0OL(0) <= COreAhbSram_lII(4);
CoreAhbSram_I0OL(0) <= COREAHBSram_lii(5);
CoreAHBSRAM_o1ol(0) <= CoreAhbSram_LII(6);
CoreAhbSraM_L1OL(0) <= COREAHBSram_lii(7);
COReAhbSram_i1OL(1 downto 0) <= CoreAhbSrAM_LII(1 downto 0);
COREAHbSram_ooll(1 downto 0) <= CoreAhbSRAM_LII(3 downto 2);
CoreAhbSram_LOLL(1 downto 0) <= CorEAHBSRAM_lii(5 downto 4);
CoreAhbSraM_IOLL(1 downto 0) <= CoreAhbSRAM_LII(7 downto 6);
COREAHBSram_olll <= CoREAHBSRAm_lii;
case (CoreAhbSRAM_o0i(12 downto 9)) is
when "0000" =>
CoreAHBSRam_lloL(7 downto 0) <= CoreAhbSrAM_L01l&CoREAHBSram_l01L&CoreAhbSRAM_l01l&CoreAHBSRAm_l01l&COreAhbSrAM_L01l&CoreAHBSRAm_l01l&COREAhbSram_L01L&CoreAhbSRAM_L01l;
when "0001" =>
COREAhbSram_LLOL(7 downto 0) <= CoreAhBSRAM_l01l&CoreAhbSRAM_L01l&CoreAHBSRAm_l01l&COREAHbSram_L01L&CoreAhbSrAM_L01l&COREAhbSram_L01L&COREAhbSram_L01L&CoreAhbSRAM_l01l;
when "0010" =>
CoreAhBSRAM_llol(7 downto 0) <= CorEAHBSram_l01L&CoreAhBSRAM_l01l&CoreAhBSRAM_l01l&CoreAhbSRAM_l01l&CoreAhbSRAM_l01l&COREAHbSram_l01L&COREAhbSram_L01L&COREAhbSram_L01L;
when "0011" =>
CoreAhbSRAM_Llol(7 downto 0) <= COReAhbSrAM_L01l&CoREAHBSram_l01L&COREAHbSram_l01L&CoreAhBSRAM_l01l&CoreAHBSRam_l01l&CoreAHBSRam_l01L&COReAhbSraM_L01l&CoreAHBSRAM_l01l;
when "0100" =>
COREAHBSram_llol(7 downto 0) <= CoreAhbSram_L01L&COREAHBSram_l01l&COREAHbSram_l01l&CoreAhbSRAM_l01l&COREAHbSram_l01l&COREAhbSram_l01L&CoREAHBSRAm_l01l&CoreAHBSRAM_L01l;
when "0101" =>
COreAhbSram_lLOL(7 downto 0) <= CoreAHBSRAM_l01l&COREAhbSram_l01L&COREAhbSram_l01l&COREAHBSram_l01l&CoREAHBSRAm_l01l&CoREAHBSRAm_l01l&CoreAhbSraM_L01L&COREAhbSram_l01L;
when "0110" =>
COREAHbSram_llol(7 downto 0) <= COREAHBSram_l01l&COREAhbSram_l01L&CoreAHBSRAM_l01l&CoreAhBSRAM_L01l&CoreAhbSram_L01L&COreAhbSram_L01L&CoreAhbSram_L01L&COREAhbSram_l01L;
when "0111" =>
CoreAhbSRAM_llol(7 downto 0) <= CorEAHBSram_l01L&CoreAhBSRAM_l01l&COREAHBSRAm_l01l&COREAhbSram_l01l&COREAHBSRam_l01l&CoreAHBSRAM_L01l&CoreAhbSrAM_L01L&COReAhbSram_l01L;
when "1000" =>
COREAhbSram_lloL(11 downto 8) <= COreAhbSram_l01L&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&CoreAhbSram_L01L;
when "1001" =>
CoreAhbSram_LLOL(11 downto 8) <= COREAHBSram_l01l&CoreAhbSram_L01L&CoreAhbSraM_L01L&COREAhbSram_l01L;
when "1010" =>
CoreAhbSram_LLOL(11 downto 8) <= CoreAhbSRAM_L01l&CoreAHBSRAM_l01l&CoreAhbSraM_L01L&COreAhbSram_l01L;
when "1011" =>
CoreAHBSRAM_Llol(11 downto 8) <= CoreAhbSraM_L01L&CoreAhbSram_L01L&COREAhbSram_l01l&CoREAHBSRAm_l01l;
when "1100" =>
CoreAhbSram_LLOL(12) <= CoreAHBSRAM_l01l;
when "1101" =>
CoreAhbSram_LLOL(7 downto 0) <= CoreAHBSRAM_L01l&CoREAHBSRAm_l01l&CoreAhbSram_L01L&COREAhbSram_l01l&CoreAHBSRAM_l01l&CoreAhbSrAM_L01L&CoREAHBSRam_l01l&CoreAhbSraM_L01L;
when "1110" =>
CoREAHBSRAm_llol(7 downto 0) <= COREAHbSram_l01l&COREAHbSram_l01l&CoreAhbSram_L01L&CoreAhbSram_L01L&COREAHBSram_l01l&COREAHBSram_l01l&CoreAhbSRAM_L01l&COreAhbSram_l01L;
when "1111" =>
COREAHBSram_llol(7 downto 0) <= COREAHBSram_l01l&COREAHBSram_l01l&CoreAhbSRAM_L01L&CoreAhbSRAM_l01l&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COREAhbSram_l01l&CoREAHBSRAm_l01l;
when others =>
null
;
end case;
case (CoreAhbSraM_III(12 downto 9)) is
when "0000" =>
COREAhbSram_iloL(7 downto 0) <= CoreAhbSraM_I01L&COREAHbSram_i01l&CoreAHBSRAM_I01l&CoreAhbSram_I01L&COREAHBSRam_i01l&CoreAhBSRAM_I01l&CoreAhbSraM_I01L&CoreAhbSraM_I01L;
when "0001" =>
CoreAhbSraM_ILOL(7 downto 0) <= COREAHbSram_i01l&COREAhbSram_I01L&COreAhbSram_i01L&COREAHBSram_i01l&CoreAhbSraM_I01L&COreAhbSram_i01L&COREAhbSram_i01l&CorEAHBSRAM_i01l;
when "0010" =>
COreAhbSram_iLOL(7 downto 0) <= COREAhbSram_i01L&CoreAhbSram_I01L&COREAhbSram_i01L&COREAHBSram_i01l&CoreAhbSRAM_I01l&CoreAhbSram_I01L&COREAhbSram_i01L&CorEAHBSRAM_i01l;
when "0011" =>
COREAhbSram_iloL(7 downto 0) <= CoreAHBSRAM_i01l&COREAHBSram_i01l&CoreAhbSrAM_I01L&CoreAhbSraM_I01L&COREAHBSram_i01l&CoreAhbSRAM_I01l&CoreAhbSrAM_I01l&CoreAhbSraM_I01L;
when "0100" =>
CoREAHBSRAm_ilol(7 downto 0) <= CoreAHBSRAM_i01l&COREAhbSram_i01L&CoreAHBSRAM_I01l&CoreAhbSram_I01L&COREAHBSRam_i01l&CoreAHBSRAM_I01l&CoreAhbSram_I01L&COREAhbSram_i01L;
when "0101" =>
CoreAhbSRAM_ILOl(7 downto 0) <= CoreAhBSRAM_I01l&COREAHBSram_i01l&CoreAhBSRAM_I01l&CoreAhbSRAM_I01l&COreAhbSram_i01L&COREAHBSram_i01l&CoreAhbSrAM_I01L&CoreAhbSRAM_I01l;
when "0110" =>
CoreAhbSRAM_ILOl(7 downto 0) <= CorEAHBSRAm_i01l&COREAHBSram_i01l&CoreAhbSRAM_I01l&COreAhbSram_i01L&COREAHBSRam_i01l&CoREAHBSRAm_i01l&CoreAhbSraM_I01L&COReAhbSram_i01L;
when "0111" =>
CoREAHBSRAm_ilol(7 downto 0) <= COreAhbSram_I01L&CoreAhbSraM_I01L&COREAhbSram_i01L&COREAhbSram_i01l&CoreAHBSRAM_i01l&CoreAhbSram_I01L&CoreAhbSram_I01L&COREAhbSram_i01L;
when "1000" =>
CoreAhbSrAM_ILOL(11 downto 8) <= CoreAhbSraM_I01L&CoreAhbSram_I01L&COREAHBSram_i01l&COREAHbSram_I01L;
when "1001" =>
COREAhbSram_iloL(11 downto 8) <= CoreAHBSRAM_I01l&COREAHBSRam_i01l&CoreAhbSRAM_I01L&COReAhbSram_i01L;
when "1010" =>
COREAhbSram_iloL(11 downto 8) <= CoreAhbSRAM_I01l&CoreAHBSRAM_i01l&CoreAhbSrAM_I01L&COreAhbSram_i01L;
when "1011" =>
COREAhbSram_ilol(11 downto 8) <= CoreAhbSram_I01L&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAHBSRAM_I01l;
when "1100" =>
COReAhbSram_ilOL(12) <= CoreAhbSram_I01L;
when "1101" =>
CoreAhBSRAM_Ilol(7 downto 0) <= CorEAHBSRAm_i01l&COREAhbSram_i01L&CoREAHBSRAm_i01l&CoreAhBSRAM_I01l&COREAhbSram_i01L&COREAHBSram_i01l&CoreAhbSrAM_I01L&COReAhbSram_i01L;
when "1110" =>
CoreAhbSrAM_ILOL(7 downto 0) <= CoreAhbSraM_I01L&CoreAHBSRAM_I01l&CoreAhbSram_I01L&COREAhbSram_i01L&CoreAHBSRAM_i01l&CoreAHBSRAM_I01l&COREAhbSram_i01L&CoreAhBSRAM_I01l;
when "1111" =>
CoreAhbSraM_ILOL(7 downto 0) <= COreAhbSram_I01L&CoreAhbSRAM_I01L&COReAhbSram_i01L&CoREAHBSRAm_i01l&CoreAhbSram_I01L&COREAHBSram_i01l&CoreAhbSram_I01L&COREAHBSram_i01l;
when others =>
null
;
end case;
case (CoreAhbSrAM_IO1(12 downto 9)) is
when "0000" =>
COREAHBSram_l0i <= COREAhbSram_i1lL(0)&CoreAhbSram_L1LL(0)&COREAhbSram_o1ll(0)&CoreAhbSRAM_I0Ll(0)&CoreAHBSRAm_l0ll(0)&COReAhbSram_o0LL(0)&COREAHbSram_iill(0)&COReAhbSram_liLL(0);
when "0001" =>
CoREAHBSRAm_l0i <= CoreAhbSram_I1LL(0)&CoreAhbSrAM_L1LL(0)&CoreAhbSram_O1LL(0)&CoreAhbSraM_I0LL(0)&CoREAHBSRam_l0ll(0)&CoreAhbSrAM_O0LL(0)&CoREAHBSRam_iill(0)&CoREAHBSRam_lill(0);
when "0010" =>
CoreAhbSRAM_L0I <= CoreAhbSram_I1LL(0)&COREAHbSram_l1ll(0)&CoreAhbSrAM_O1LL(0)&COReAhbSram_i0LL(0)&CoreAhbSRAM_L0Ll(0)&COREAHbSram_o0ll(0)&CoreAhbSram_IILL(0)&CoreAhbSram_LILL(0);
when "0011" =>
COReAhbSraM_L0I <= CorEAHBSram_i1LL(0)&COReAhbSraM_L1LL(0)&COREAHBSram_o1ll(0)&CoreAhbSram_I0LL(0)&COREAHBSram_l0ll(0)&COREAhbSram_o0LL(0)&CoreAhbSram_IILL(0)&CoreAhBSRAM_LIll(0);
when "0100" =>
CorEAHBSRAM_l0i <= COReAhbSram_i1LL(0)&CoreAhbSRAM_L1ll(0)&COREAHbSram_o1ll(0)&CoREAHBSRAm_i0ll(0)&CoreAhbSRAM_L0LL(0)&CoREAHBSRAm_o0ll(0)&CoreAhbSram_IILL(0)&CoreAhbSraM_LILL(0);
when "0101" =>
CorEAHBSRAM_l0i <= COreAhbSram_I1LL(0)&CoreAHBSRam_l1ll(0)&CoreAhBSRAM_o1ll(0)&COREAhbSram_I0LL(0)&COREAhbSram_L0LL(0)&CoreAhbSRAM_O0ll(0)&CorEAHBSram_iilL(0)&CoreAhbSRAM_LIll(0);
when "0110" =>
CoREAHBSram_l0I <= COREAhbSram_I1LL(0)&CorEAHBSram_l1LL(0)&COReAhbSraM_O1Ll(0)&CoreAHBSRAm_i0ll(0)&CoreAhbSRAM_L0ll(0)&CorEAHBSram_o0LL(0)&CoreAhBSRAM_iill(0)&CoreAhBSRAM_lill(0);
when "0111" =>
CoreAhBSRAM_l0i <= CoreAhbSrAM_I1ll(0)&CoreAhbSRAM_L1ll(0)&CoREAHBSram_o1LL(0)&CoreAhBSRAM_i0ll(0)&CorEAHBSram_l0LL(0)&COREAHbSraM_O0LL(0)&COreAhbSram_iILL(0)&COReAhbSram_lILL(0);
when "1000" =>
CorEAHBSRAM_l0i <= CoreAhbSram_OLIL(1 downto 0)&COREAhbSram_ioIL(1 downto 0)&CoreAhbSram_LOIL(1 downto 0)&COREAhbSram_ooiL(1 downto 0);
when "1001" =>
CoreAhbSram_L0I <= CoreAhBSRAM_Olil(1 downto 0)&COREAHBSram_ioil(1 downto 0)&COREAHBSram_loil(1 downto 0)&CoreAhbSraM_OOIL(1 downto 0);
when "1010" =>
COREAHBSRam_l0i <= CoreAhbSram_OLIL(1 downto 0)&CoreAhbSram_IOIL(1 downto 0)&COREAHBSram_loil(1 downto 0)&COREAHBSram_ooil(1 downto 0);
when "1011" =>
CoreAhbSraM_L0I <= COREAHBSram_olil(1 downto 0)&CoREAHBSRAm_ioil(1 downto 0)&CoreAHBSRAM_loil(1 downto 0)&COReAhbSram_ooIL(1 downto 0);
when "1100" =>
CoreAhbSram_L0I <= CoreAhbSraM_LLIL;
when "1101" =>
COREAHBSram_l0i <= COReAhbSram_i1LL(0)&COREAHbSram_l1ll(0)&CoREAHBSRAm_o1ll(0)&CoreAHBSRAM_i0ll(0)&CoreAhbSRAM_L0Ll(0)&CoreAhbSram_O0LL(0)&CorEAHBSRAM_iill(0)&CoREAHbSram_lILL(0);
when "1110" =>
COREAHbSram_L0I <= CoreAhbSRAM_i1ll(0)&CoreAhbSRAM_l1ll(0)&CoreAHBSram_o1lL(0)&CorEAHBSram_i0LL(0)&CoreAHBSRAM_l0ll(0)&CoREAHBSram_o0LL(0)&CoreAhBSRAM_iill(0)&COREAHBSram_lILL(0);
when "1111" =>
COREAhbSram_L0I <= CoreAhbSRAM_i1ll(0)&COREAhbSram_L1LL(0)&CoREAHBSram_o1LL(0)&CoREAHbSram_i0LL(0)&COReAhbSrAM_L0ll(0)&CoreAhbSRAM_o0ll(0)&CorEAHBSram_iiLL(0)&COREAHbSram_lILL(0);
when others =>
null
;
end case;
end case;
when 7168 =>
case (COReAhbSraM_LO1) is
when 8 =>
COREAHbSram_oL1 <= "11";
COREAHbSram_LL1 <= "11";
COreAhbSrAM_IL1 <= "11";
CoreAHBSRAm_oi1 <= "11";
CoreAhBSRAM_li1 <= "11";
CorEAHBSram_ii1 <= "11";
CoREAHBSram_o01 <= "11";
CoreAhbSRAM_L01 <= "11";
COReAhbSrAM_I01 <= "11";
COREAhbSraM_O11 <= "11";
CoreAHBSRAm_l11 <= "11";
COReAhbSram_I11 <= "11";
CoreAHBSRAM_oool <= "11";
COREAHbSram_lOOL <= "11";
CorEAHBSram_iiiL <= "000"&CorEAHBSram_o0I(8 downto 0);
CoreAhBSRAM_o0il <= "000"&CorEAHBSram_o0I(8 downto 0);
COReAhbSraM_L0Il <= "000"&CoREAHBSram_o0I(8 downto 0);
COReAhbSram_I0IL <= "000"&CoreAhBSRAM_o0i(8 downto 0);
CorEAHBSram_o1iL <= "000"&CoreAhBSRAM_o0i(8 downto 0);
CoreAhbSRAM_l1il <= "000"&COReAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_i1il <= "000"&COReAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_oo0l <= "000"&CorEAHBSram_O0I(8 downto 0);
COREAHbSram_lO0L <= "000"&CorEAHBSram_o0i(8 downto 0);
COREAHbSram_iO0L <= "000"&COREAhbSram_O0I(8 downto 0);
COREAHbSram_oL0L <= "000"&CoreAhBSRAM_o0i(8 downto 0);
CoreAhBSRAM_ll0l <= "000"&COREAHBSram_o0I(8 downto 0);
COreAhbSrAM_IL0l <= "000"&CoreAhbSrAM_O0i(8 downto 0);
CoreAhbSRAM_oi0l <= "000"&COREAhbSram_O0I(8 downto 0);
COREAhbSram_O00L <= "000"&COReAhbSraM_III(8 downto 0);
CoreAhbSRAM_L00l <= "000"&CoreAhBSRAM_iii(8 downto 0);
COREAHbSram_i00L <= "000"&COREAHbSram_iII(8 downto 0);
CoreAHBSRam_o10l <= "000"&COREAhbSram_III(8 downto 0);
CoREAHBSram_l10L <= "000"&CoreAhbSRAM_iii(8 downto 0);
COREAhbSraM_I10L <= "000"&CoreAhBSRAM_iii(8 downto 0);
CoreAhbSRAM_oo1l <= "000"&COREAhbSram_III(8 downto 0);
COREAhbSram_LO1L <= "000"&CoreAHBSRAm_iii(8 downto 0);
CoreAhbSRAM_io1l <= "000"&COREAHbSram_iII(8 downto 0);
CoreAhbSRAM_ol1l <= "000"&COREAHbSram_iII(8 downto 0);
CorEAHBSram_ll1L <= "000"&CoREAHBSram_iiI(8 downto 0);
COreAhbSrAM_IL1l <= "000"&CoreAhbSRAM_iii(8 downto 0);
COREAhbSram_OI1L <= "000"&COREAHbSram_iII(8 downto 0);
COREAhbSram_LI1L <= "000"&CoREAHBSram_iiI(8 downto 0);
COREAhbSram_OIOL <= CoREAHBSram_liI;
CoreAHBSRAm_liol <= COREAhbSram_LII;
COReAhbSraM_IIOl <= CoreAhBSRAM_lii;
CoreAhbSRAM_O0ol <= CoreAHBSRam_lii;
COreAhbSRAM_L0ol <= COreAhbSrAM_LIi;
COReAhbSraM_I0OL <= COREAHbSram_lII;
COreAhbSrAM_O1Ol <= CoreAhbSRAM_lii;
CoreAHBSRam_l1oL <= CoreAHBSRAm_lii;
COREAhbSram_I1OL <= CoREAHBSram_liI;
CoreAhbSRAM_ooll <= CoreAHBSRam_lii;
COreAhbSRAM_LOll <= CoreAhbSRAM_Lii;
CoreAHBSRAM_ioll <= CoreAHBSRAm_lii;
COREAHbSram_oLLL <= CoreAHBSRam_lii;
CoreAhbSRAM_llll <= CoreAHBSRAM_lii;
case (CoreAhbSRAM_O0i(12 downto 9)) is
when "0000" =>
CoreAHBSRAm_llol(0) <= CoreAHBSRAm_l01l;
when "0001" =>
COReAhbSraM_LLOL(1) <= CoreAhbSRAM_l01l;
when "0010" =>
CoreAhbSRAM_Llol(2) <= COREAhbSram_L01L;
when "0011" =>
CoreAhbSRAM_LLol(3) <= CoreAhBSRAM_l01l;
when "0100" =>
COReAhbSraM_LLOL(4) <= CoreAHBSRAm_l01l;
when "0101" =>
CorEAHBSram_lloL(5) <= CoREAHBSram_l01L;
when "0110" =>
COREAhbSram_LLOL(6) <= COREAHBSram_l01L;
when "0111" =>
CoreAhBSRAM_llol(7) <= COreAhbSrAM_L01l;
when "1000" =>
CoreAhBSRAm_llol(8) <= CoreAhbSRAM_L01l;
when "1001" =>
CoreAhBSRAM_llol(9) <= CoreAhbSRAM_L01l;
when "1010" =>
COREAHbSram_lLOL(10) <= CoREAHBSram_l01L;
when "1011" =>
CoreAhbSRAM_Llol(11) <= CoreAHBSRam_l01L;
when "1100" =>
COREAHbSram_LLOL(12) <= CoreAHBSram_l01L;
when "1101" =>
CoreAhbSRAM_LLol(13) <= CoREAHBSram_l01L;
when "1110" =>
COREAHbSram_LLOL(6) <= COReAhbSraM_L01l;
when "1111" =>
CoREAHBSram_llOL(7) <= CoREAHBSram_l01L;
when others =>
null
;
end case;
case (CoreAhBSRAM_iii(12 downto 9)) is
when "0000" =>
COReAhbSraM_ILOl(0) <= CoreAhbSRAM_i01l;
when "0001" =>
CoreAHBSram_iloL(1) <= COReAhbSraM_I01l;
when "0010" =>
CoreAHBSRAm_ilol(2) <= COReAhbSraM_I01l;
when "0011" =>
COREAHbSram_iLOL(3) <= CoreAhbSRAM_i01l;
when "0100" =>
CoreAhbSRAM_ilol(4) <= CoreAhBSRAM_i01l;
when "0101" =>
COREAhbSram_ILOL(5) <= CorEAHBSram_i01L;
when "0110" =>
CoreAhbSRAM_ILol(6) <= COreAhbSrAM_I01l;
when "0111" =>
CoreAhbSRAM_ilol(7) <= CoreAhBSRAM_i01l;
when "1000" =>
CoREAHBSram_ilOL(8) <= CoreAhBSRAM_i01l;
when "1001" =>
COreAhbSrAM_ILOl(9) <= CoreAhBSRAM_i01l;
when "1010" =>
CoreAhbSRAM_Ilol(10) <= CoREAHBSram_i01L;
when "1011" =>
COreAhbSrAM_ILol(11) <= CoreAHBSRAm_i01l;
when "1100" =>
COreAhbSraM_ILOL(12) <= CoreAhbSRAM_I01l;
when "1101" =>
COREAhbSram_ILOL(13) <= CoREAHBSram_i01L;
when "1110" =>
CoreAhbSRAM_Ilol(6) <= CoreAhbSRAM_I01l;
when "1111" =>
COreAhbSrAM_ILol(7) <= CoREAHBSram_i01L;
when others =>
null
;
end case;
case (COREAhbSram_IO1(12 downto 9)) is
when "0000" =>
CoreAHBSRAM_l0i <= CoreAHBSRam_lilL;
when "0001" =>
COReAhbSRAM_L0i <= CoreAhbSRAM_IIll;
when "0010" =>
COreAhbSraM_L0I <= COReAhbSraM_O0Ll;
when "0011" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_l0ll;
when "0100" =>
COreAhbSrAM_L0I <= COReAhbSraM_I0Ll;
when "0101" =>
CoreAHBSRAm_l0i <= COREAhbSram_O1LL;
when "0110" =>
CoreAhBSRAM_l0i <= CoreAhbSRAM_l1ll;
when "0111" =>
CoreAhbSRAM_L0i <= COreAhbSRAM_I1ll;
when "1000" =>
CoreAhbSRAM_l0i <= COreAhbSrAM_OOil;
when "1001" =>
CorEAHBSram_l0i <= CorEAHBSram_loiL;
when "1010" =>
COREAHbSram_l0I <= CoreAhbSRAM_ioil;
when "1011" =>
COREAHbSram_L0I <= CorEAHBSram_oliL;
when "1100" =>
COREAhbSram_L0I <= COreAhbSraM_LLIl;
when "1101" =>
COREAhbSram_L0I <= COREAhbSram_ILIL;
when "1110" =>
COreAhbSrAM_L0i <= COREAHBSram_l1LL;
when "1111" =>
COREAHbSram_l0I <= CorEAHBSram_i1lL;
when others =>
null
;
end case;
when 4 =>
CoreAhBSRAM_ol1 <= "10";
CoreAhbSRAM_ll1 <= "10";
CoREAHBSram_il1 <= "10";
CorEAHBSram_oi1 <= "10";
CoREAHBSram_li1 <= "10";
CoreAhbSRAM_II1 <= "10";
CoreAHBSRAm_o01 <= "10";
COREAhbSram_L01 <= "10";
CorEAHBSram_i01 <= "10";
CoREAHBSram_o11 <= "10";
CoreAhBSRAM_l11 <= "10";
CoreAhBSRAM_i11 <= "10";
CoreAhbSRAM_oool <= "10";
CoREAHBSram_loOL <= "10";
CoREAHBSram_iiIL <= "00"&CoreAHBSRAm_o0i(9 downto 0);
COreAhbSrAM_O0Il <= "00"&CoreAhBSRAM_o0i(9 downto 0);
CoreAHBSRam_l0iL <= "00"&CoreAhBSRAM_o0i(9 downto 0);
CoreAhbSRAM_i0il <= "00"&COREAHBSram_o0I(9 downto 0);
COREAhbSram_O1IL <= "00"&COReAhbSraM_O0I(9 downto 0);
COREAHBSram_l1IL <= "00"&CoreAHBSRam_o0i(9 downto 0);
CoreAhBSRAM_i1il <= "00"&CoreAHBSRam_o0i(9 downto 0);
CoreAhBSRAM_oo0l <= "00"&COReAhbSraM_O0I(9 downto 0);
CoREAHBSram_lo0L <= "00"&COREAhbSram_O0I(9 downto 0);
CoreAhBSRAM_io0l <= "00"&CoreAHBSRAm_o0i(9 downto 0);
CoreAhbSRAM_Ol0l <= "00"&CoreAhBSRAM_o0i(9 downto 0);
COREAhbSram_LL0L <= "00"&CoreAHBSRam_o0i(9 downto 0);
CoreAHBSRAm_il0l <= "00"&CoreAhbSRAM_O0i(9 downto 0);
CoreAhbSRAM_oi0l <= "00"&CoreAhbSRAM_O0i(9 downto 0);
CoREAHBSram_o00L <= "00"&COREAhbSram_III(9 downto 0);
CoREAhbSram_L00L <= "00"&CoreAHBSRam_iii(9 downto 0);
CoreAhBSRAm_i00l <= "00"&COREAhbSram_III(9 downto 0);
CoreAHBSram_o10L <= "00"&COREAHbSram_iII(9 downto 0);
CoreAhbSRAM_l10l <= "00"&COreAhbSrAM_IIi(9 downto 0);
COREAhbSram_I10L <= "00"&CoreAhbSRAM_IIi(9 downto 0);
COREAhbSram_OO1L <= "00"&COREAHbSram_iII(9 downto 0);
COReAhbSraM_LO1l <= "00"&CorEAHBSram_iii(9 downto 0);
CoREAHBSram_io1L <= "00"&CoreAhbSRAM_Iii(9 downto 0);
COREAhbSram_OL1L <= "00"&CoreAHBSRAm_iii(9 downto 0);
CoreAHBSRAm_ll1l <= "00"&COREAhbSram_III(9 downto 0);
CoREAHBSram_il1L <= "00"&COREAhbSram_III(9 downto 0);
CoREAHBSram_oI1L <= "00"&CoreAHBSram_iii(9 downto 0);
COReAhbSraM_LI1l <= "00"&COreAhbSRAM_IIi(9 downto 0);
CoreAhbSRAM_OIol(3 downto 0) <= CoreAhBSRAm_lii(3 downto 0);
COREAhbSram_LIOL(3 downto 0) <= CoREAHBSram_liI(7 downto 4);
CoREAHBSram_iiOL(3 downto 0) <= COReAhbSraM_LII(3 downto 0);
COreAhbSrAM_O0Ol(3 downto 0) <= COREAHbSram_lII(7 downto 4);
CorEAHbSram_L0OL(3 downto 0) <= COREAhbSram_LII(3 downto 0);
CoreAhBSRAM_i0ol(3 downto 0) <= CoreAhbSRAM_lii(7 downto 4);
COReAhbSraM_O1OL(3 downto 0) <= CoreAhbSRAM_LIi(3 downto 0);
CoreAhBSRAM_l1ol(3 downto 0) <= CoreAHBSRam_lii(7 downto 4);
CoREAHBSram_i1OL(3 downto 0) <= COREAhbSram_LII(3 downto 0);
CoreAHBSram_oolL(3 downto 0) <= CoreAhbSRAM_Lii(7 downto 4);
COreAhbSraM_LOLl(3 downto 0) <= COREAHbSram_lII(3 downto 0);
CoreAhBSRAM_ioll(3 downto 0) <= COreAhbSrAM_LII(7 downto 4);
COReAhbSrAM_OLLl(3 downto 0) <= COREAhbSram_LII(3 downto 0);
COReAhbSrAM_LLLl(3 downto 0) <= COREAhbSram_LII(7 downto 4);
case (COREAhbSram_O0I(12 downto 9)) is
when "0000" =>
CoreAhBSRAM_llol(1 downto 0) <= CoreAhbSRAM_L01l&CorEAHBSRam_l01L;
when "0001" =>
CoreAHBSRam_lloL(1 downto 0) <= CoreAhbSRAM_L01l&CoreAHBSRAm_l01l;
when "0010" =>
COREAhbSram_LLOL(3 downto 2) <= COREAhbSram_L01L&COREAhbSram_L01L;
when "0011" =>
CoreAHBSRAm_llol(3 downto 2) <= CoREAHBSram_l01L&COREAHbSram_l01L;
when "0100" =>
COreAhbSraM_LLOl(5 downto 4) <= COREAhbSram_L01L&COREAhbSraM_L01L;
when "0101" =>
CorEAHBSram_lloL(5 downto 4) <= COreAhbSraM_L01l&CoreAhbSRAM_l01l;
when "0110" =>
COReAhbSram_LLOL(7 downto 6) <= CoreAhbSRAM_L01l&CoreAHBSRam_l01l;
when "0111" =>
CoREAHBSram_llOL(7 downto 6) <= COReAhbSram_L01L&COREAhbSram_L01L;
when "1000" =>
CoreAhbSRAM_Llol(9 downto 8) <= CoreAhBSRAM_l01l&COReAhbSraM_L01l;
when "1001" =>
CoreAhbSRAM_llol(9 downto 8) <= CoreAhbSRAM_l01l&CoreAhBSRAM_l01l;
when "1010" =>
COReAhbSraM_LLOl(11 downto 10) <= CoreAHBSRam_l01l&CoreAhBSRAM_l01l;
when "1011" =>
COReAhbSraM_LLOL(11 downto 10) <= COReAhbSraM_L01L&COReAhbSraM_L01l;
when "1100" =>
COReAhbSrAM_LLOl(13 downto 12) <= CoreAHBSRAm_l01l&CorEAHBSram_l01L;
when "1101" =>
CoREAHBSram_llOL(13 downto 12) <= COreAhbSrAM_L01l&CoreAhbSRAM_l01l;
when "1110" =>
COReAhbSraM_LLOl(7 downto 6) <= COReAhbSraM_L01L&CoreAHBSRAm_l01l;
when "1111" =>
CoreAhbSRAM_Llol(7 downto 6) <= COreAhbSrAM_L01l&COReAhbSraM_L01l;
when others =>
null
;
end case;
case (COREAhbSram_III(12 downto 9)) is
when "0000" =>
CoreAhBSRAM_ilol(1 downto 0) <= COREAhbSram_I01L&CoreAhBSRAM_i01l;
when "0001" =>
CoreAhbSRAM_Ilol(1 downto 0) <= COreAhbSrAM_I01l&COREAHbSram_i01L;
when "0010" =>
CoREAHBSram_ilOL(3 downto 2) <= CoreAHBSRam_i01l&COReAhbSraM_I01l;
when "0011" =>
CoreAhBSRAM_ilol(3 downto 2) <= COREAhbSram_I01L&COReAhbSraM_I01l;
when "0100" =>
COReAhbSraM_ILOL(5 downto 4) <= CoreAhbSRAM_i01l&CoreAHBSRam_i01l;
when "0101" =>
CoREAHBSram_ilOL(5 downto 4) <= CoreAHBSRam_i01L&COREAhbSram_I01L;
when "0110" =>
COREAhbSram_ILOL(7 downto 6) <= CoreAhBSRAM_i01l&COREAHbSram_i01L;
when "0111" =>
CoreAhBSRAM_ilol(7 downto 6) <= COREAhbSram_I01L&CoreAhbSRAM_i01l;
when "1000" =>
CoreAhbSRAM_Ilol(9 downto 8) <= CoreAhBSRAM_i01l&COreAhbSrAM_I01l;
when "1001" =>
CoreAhbSRAM_Ilol(9 downto 8) <= COREAhbSram_I01L&COREAhbSram_I01L;
when "1010" =>
CoreAhBSRAM_ilol(11 downto 10) <= COREAhbSram_I01L&COreAhbSrAM_I01l;
when "1011" =>
COReAhbSraM_ILOl(11 downto 10) <= COREAhbSram_I01L&CoreAhbSRAM_I01l;
when "1100" =>
CoreAhBSRAM_ilol(13 downto 12) <= CoreAHBSRAM_i01l&COREAHbSram_i01L;
when "1101" =>
CoreAHBSRAm_ilol(13 downto 12) <= CoreAhbSRAM_I01l&COREAHbSram_I01L;
when "1110" =>
CoREAHBSram_ilOL(7 downto 6) <= CoreAHBSram_i01L&CorEAHBSram_i01L;
when "1111" =>
CoreAhbSRAM_ilol(7 downto 6) <= CoreAhbSRAM_i01l&COREAHBSram_i01L;
when others =>
null
;
end case;
case (CorEAHBSram_io1(12 downto 9)) is
when "0000" =>
CoreAHBSRAm_l0i <= COReAhbSraM_IILl(3 downto 0)&CorEAHBSram_liLL(3 downto 0);
when "0001" =>
CoREAHBSram_l0I <= CoreAhbSRAM_Iill(3 downto 0)&CoreAhBSRAM_lill(3 downto 0);
when "0010" =>
CoreAhBSRAM_l0i <= COReAhbSraM_L0Ll(3 downto 0)&COREAhbSram_O0LL(3 downto 0);
when "0011" =>
CorEAHBSram_l0I <= CoreAhbSRAM_l0ll(3 downto 0)&CoreAHBSRam_o0lL(3 downto 0);
when "0100" =>
COREAHbSram_l0I <= CoreAHBSRam_o1ll(3 downto 0)&CoreAHBSRAm_i0ll(3 downto 0);
when "0101" =>
CoreAhBSRAM_l0i <= COREAhbSram_O1LL(3 downto 0)&COREAHbSram_i0LL(3 downto 0);
when "0110" =>
CoreAhbSRAM_L0i <= COREAhbSram_I1LL(3 downto 0)&COREAhbSram_L1LL(3 downto 0);
when "0111" =>
CoreAhBSRAM_l0i <= CoreAHBSRAM_i1ll(3 downto 0)&CoreAHBSRAm_l1ll(3 downto 0);
when "1000" =>
CorEAHBSram_l0i <= CoreAhbSrAM_LOil(3 downto 0)&CoreAhbSRAM_OOil(3 downto 0);
when "1001" =>
CoreAhbSRAM_L0i <= COREAHbSram_lOIL(3 downto 0)&CoreAhbSRAM_ooil(3 downto 0);
when "1010" =>
CorEAHBSram_l0I <= CoreAHBSRam_oliL(3 downto 0)&COreAhbSrAM_IOIl(3 downto 0);
when "1011" =>
COreAhbSraM_L0I <= COreAhbSrAM_OLil(3 downto 0)&CoreAhBSRAM_ioil(3 downto 0);
when "1100" =>
CorEAHBSram_l0i <= CoREAHBSram_ilIL(3 downto 0)&COREAHbSram_lLIL(3 downto 0);
when "1101" =>
CoREAHBSram_l0I <= COREAhbSraM_ILIL(3 downto 0)&COREAHbSram_lLIL(3 downto 0);
when "1110" =>
CoreAHBSRAm_l0i <= CoreAhbSRAM_I1ll(3 downto 0)&COREAhbSram_L1LL(3 downto 0);
when "1111" =>
CoreAhbSRAM_l0i <= COreAhbSrAM_I1ll(3 downto 0)&CoreAhbSrAM_L1ll(3 downto 0);
when others =>
null
;
end case;
when 2 =>
CoreAHBSRAm_ol1 <= "01";
COReAhbSraM_LL1 <= "01";
CorEAHBSram_il1 <= "01";
CoreAhbSRAM_Oi1 <= "01";
CoreAhbSRAM_li1 <= "01";
CorEAHBSram_ii1 <= "01";
CoreAhBSRAM_o01 <= "01";
COREAHbSram_l01 <= "01";
CoreAhbSRAM_I01 <= "01";
CorEAHBSram_o11 <= "01";
CoreAHBSRam_l11 <= "01";
CoreAhbSRAM_I11 <= "01";
COREAhbSram_OOOL <= "10";
CorEAHBSram_looL <= "10";
COReAhbSrAM_IIIl <= '0'&CorEAHBSram_o0I(10 downto 0);
CoreAHBSRam_o0il <= '0'&CorEAHBSram_o0i(10 downto 0);
CoreAhbSRAM_L0il <= '0'&COREAhbSram_O0I(10 downto 0);
CoreAhBSRAM_i0il <= '0'&CoREAHBSram_o0I(10 downto 0);
CoREAHBSram_o1IL <= '0'&COREAhbSram_O0I(10 downto 0);
CoreAhBSRAM_l1il <= '0'&CoREAHBSram_o0I(10 downto 0);
CoreAhBSRAM_i1il <= '0'&COreAhbSrAM_O0I(10 downto 0);
CorEAHBSram_oo0L <= '0'&CoreAhBSRAM_o0i(10 downto 0);
CoreAhbSRAM_lo0l <= '0'&CoREAHBSram_o0I(10 downto 0);
CorEAHBSram_io0L <= '0'&COREAhbSram_O0I(10 downto 0);
CorEAHBSram_ol0L <= '0'&COreAhbSRAM_O0i(10 downto 0);
CoreAhbSRAM_Ll0l <= '0'&CoreAhbSRAM_o0i(10 downto 0);
COreAhbSRAM_IL0l <= "00"&COREAhbSraM_O0I(9 downto 0);
CoreAhbSRAM_Oi0l <= "00"&COreAhbSrAM_O0i(9 downto 0);
CoreAHBSRAm_o00l <= '0'&COREAhbSram_III(10 downto 0);
CoreAHBSRAm_l00l <= '0'&COREAhbSram_III(10 downto 0);
CoreAhBSRAM_i00l <= '0'&COReAhbSraM_III(10 downto 0);
COreAhbSrAM_O10l <= '0'&CorEAHBSram_iiI(10 downto 0);
COREAHbSram_l10L <= '0'&COreAhbSrAM_III(10 downto 0);
COREAhbSram_I10L <= '0'&CoreAhbSRAM_iii(10 downto 0);
COReAhbSraM_OO1l <= '0'&CorEAHBSram_iii(10 downto 0);
COreAhbSRAM_LO1l <= '0'&CoreAhbSRAM_iii(10 downto 0);
COReAhbSraM_IO1l <= '0'&CoreAhbSRAM_Iii(10 downto 0);
COREAhbSraM_OL1L <= '0'&COreAhbSRAM_IIi(10 downto 0);
CoREAHBSram_ll1L <= '0'&CoREAHBSram_iiI(10 downto 0);
CoreAHBSRam_il1l <= '0'&COReAhbSraM_III(10 downto 0);
CoreAhBSRAM_oi1l <= "00"&COREAHBSram_iII(9 downto 0);
COReAhbSraM_LI1L <= "00"&CorEAHBSram_iII(9 downto 0);
COReAhbSraM_OIOL(1 downto 0) <= CoreAHBSRam_lii(1 downto 0);
COReAhbSraM_LIOL(1 downto 0) <= COreAhbSrAM_LII(3 downto 2);
CoreAhbSRAM_iiol(1 downto 0) <= CoreAHBSRam_lii(5 downto 4);
CoreAhbSRAM_O0ol(1 downto 0) <= CoreAhbSRAM_lii(7 downto 6);
CoreAhBSRAM_l0ol(1 downto 0) <= COREAhbSraM_LII(1 downto 0);
CoREAHBSram_i0OL(1 downto 0) <= CoreAhbSRAM_lii(3 downto 2);
CoreAhBSRAM_o1ol(1 downto 0) <= CoreAhbSRAM_lii(5 downto 4);
CoreAhbSRAM_l1ol(1 downto 0) <= CoreAhBSRAm_lii(7 downto 6);
COREAhbSram_I1OL(1 downto 0) <= CoreAhBSRAM_lii(1 downto 0);
CoreAhbSRAM_Ooll(1 downto 0) <= CoreAhbSRAM_lii(3 downto 2);
COREAHbSram_lOLL(1 downto 0) <= CorEAHBSram_liI(5 downto 4);
CoreAhbSRAM_ioll(1 downto 0) <= CoreAHBSRAm_lii(7 downto 6);
COREAHBSram_oLLL(3 downto 0) <= COREAHbSram_lII(3 downto 0);
CoreAhBSRAM_llll(3 downto 0) <= COREAhbSram_LII(7 downto 4);
case (CoreAhbSRAM_O0i(12 downto 9)) is
when "0000" =>
COreAhbSrAM_LLOl(3 downto 0) <= COREAhbSraM_L01l&CoreAHBSRAm_l01l&CoreAhBSRAM_l01l&COreAhbSrAM_L01l;
when "0001" =>
COReAhbSraM_LLOl(3 downto 0) <= CoreAHBSRam_l01L&CoREAHBSram_l01L&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "0010" =>
CoreAhBSRAM_llol(3 downto 0) <= CoREAHBSram_l01L&CoREAHBSram_l01L&COREAHbSram_l01L&COREAhbSram_L01L;
when "0011" =>
CoreAHBSram_lloL(3 downto 0) <= CoreAhbSRAM_L01l&CoreAhBSRAM_l01l&COreAhbSrAM_L01l&COReAhbSrAM_L01l;
when "0100" =>
CoreAhBSRAM_llol(7 downto 4) <= COREAhbSram_L01L&CoreAHBSRAm_l01l&COreAhbSrAM_L01l&COREAhbSram_L01L;
when "0101" =>
COREAhbSram_LLOL(7 downto 4) <= COREAHbSram_l01L&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COREAhbSram_L01L;
when "0110" =>
CoreAhBSRAM_llol(7 downto 4) <= CoreAhbSRAM_l01l&CoreAHBSRam_l01l&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "0111" =>
CoreAhbSRAM_llol(7 downto 4) <= CoreAHBSRAm_l01l&CoreAhbSRAM_L01l&COREAhbSram_L01L&COREAHbSram_l01L;
when "1000" =>
COReAhbSraM_LLOL(11 downto 8) <= CoreAhbSRAM_L01l&COreAhbSraM_L01l&COREAhbSram_L01L&CoreAhbSRAM_l01l;
when "1001" =>
CoREAHBSram_llOL(11 downto 8) <= CoreAHBSRAm_l01l&CoreAHBSRAM_l01l&COREAhbSram_L01L&CoREAHBSram_l01L;
when "1010" =>
CoreAhbSRAM_llol(11 downto 8) <= CorEAHBSram_l01L&CorEAHBSram_l01L&COreAhbSrAM_L01l&CoreAHBSRAm_l01l;
when "1011" =>
COREAhbSram_LLOL(11 downto 8) <= CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COREAHBSram_l01L&CoREAHBSram_l01L;
when "1100" =>
COreAhbSrAM_LLOl(13 downto 12) <= COReAhbSraM_L01l&COREAhbSram_L01L;
when "1101" =>
CoreAhbSRAM_Llol(13 downto 12) <= CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "1110" =>
COreAhbSrAM_LLOl(7 downto 4) <= CorEAHBSram_l01L&CoREAHBSram_l01L&CoreAhBSRAM_l01l&COreAhbSrAM_L01l;
when "1111" =>
CoreAhBSRAM_llol(7 downto 4) <= CoreAhBSRAM_l01l&CoREAHBSram_l01L&CoreAhbSRAM_l01l&COreAhbSrAM_L01l;
when others =>
null
;
end case;
case (COREAHbSram_iII(12 downto 9)) is
when "0000" =>
CoREAhbSram_ILOL(3 downto 0) <= COREAHbSram_i01L&CoreAhBSRAM_i01l&CoreAhbSRAM_i01l&CoreAhbSRAM_I01l;
when "0001" =>
CoreAHBSram_iloL(3 downto 0) <= CoreAhBSRAM_i01l&CorEAHBSRam_i01L&CoreAHBSRam_i01L&CoREAHBSram_i01L;
when "0010" =>
CoreAHBSram_ilOL(3 downto 0) <= CoreAHBSRAm_i01l&CoreAhbSRAM_i01l&COreAhbSRAM_I01l&CorEAHBSram_i01L;
when "0011" =>
CoreAhbSRAM_ILol(3 downto 0) <= COREAhbSram_I01L&COREAHbSram_i01L&COREAHbSram_I01L&CoreAhbSRAM_I01l;
when "0100" =>
CoreAhBSRam_iloL(7 downto 4) <= COREAHbSram_i01L&CoreAhbSRAM_i01l&CoreAhbSRAM_i01l&CoreAHBSRAm_i01l;
when "0101" =>
CoreAhbSRAM_ilol(7 downto 4) <= CoreAHBSRam_i01L&COReAhbSraM_I01l&COreAhbSrAM_I01l&COReAhbSrAM_I01l;
when "0110" =>
COreAhbSrAM_ILOl(7 downto 4) <= COReAhbSraM_I01l&COreAhbSrAM_I01l&COReAhbSraM_I01l&CoreAhBSRAM_i01l;
when "0111" =>
COreAhbSrAM_ILOl(7 downto 4) <= COReAhbSRAM_I01l&COREAhbSram_I01L&COREAhbSram_I01L&CoreAhbSRAM_i01l;
when "1000" =>
CorEAHBSram_iloL(11 downto 8) <= CoreAHBSRam_i01L&COREAhbSram_I01L&COREAhbSram_I01L&COreAhbSrAM_I01l;
when "1001" =>
COREAHbSram_iLOL(11 downto 8) <= CorEAHBSRam_i01L&COREAhbSram_I01L&COREAHBSram_i01L&COREAhbSram_I01L;
when "1010" =>
CoreAhbSRAM_Ilol(11 downto 8) <= CoreAhbSRAM_i01l&CoreAHBSRam_i01l&CoreAhbSrAM_I01l&CoreAhBSRAM_i01l;
when "1011" =>
CoreAHBSRam_ilol(11 downto 8) <= CorEAHBSram_i01L&COREAHBSram_i01L&CoREAHBSram_i01L&COREAhbSram_I01L;
when "1100" =>
COREAhbSram_ILOL(13 downto 12) <= COReAhbSraM_I01l&COreAhbSrAM_I01l;
when "1101" =>
COreAhbSrAM_ILOl(13 downto 12) <= CoreAHBSRam_i01l&COREAHBSram_i01L;
when "1110" =>
CorEAHBSram_iloL(7 downto 4) <= CoreAHBSRAm_i01l&COREAhbSram_I01L&COREAhbSram_I01L&COreAhbSrAM_I01l;
when "1111" =>
CoreAHBSRAm_ilol(7 downto 4) <= COreAhbSrAM_I01l&CoreAhbSRAM_I01l&COREAhbSram_I01L&CoreAhbSRAM_I01l;
when others =>
null
;
end case;
case (CoreAhBSRAM_io1(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_l0ll(1 downto 0)&COREAHbSram_o0LL(1 downto 0)&COreAhbSrAM_IIll(1 downto 0)&COREAhbSram_LILL(1 downto 0);
when "0001" =>
COREAHbSram_l0I <= COREAHbSram_l0LL(1 downto 0)&COREAhbSram_O0LL(1 downto 0)&CoreAhBSRAM_iill(1 downto 0)&COreAhbSraM_LILl(1 downto 0);
when "0010" =>
COREAhbSram_L0I <= COREAHbSram_l0LL(1 downto 0)&CoreAhbSRAM_O0ll(1 downto 0)&CoREAHBSram_iiLL(1 downto 0)&CoreAhbSRAM_lill(1 downto 0);
when "0011" =>
CoREAHBSram_l0I <= CoreAhBSRAM_l0ll(1 downto 0)&CoreAhbSRAM_O0ll(1 downto 0)&COreAhbSrAM_IILl(1 downto 0)&CoreAHBSRAm_lill(1 downto 0);
when "0100" =>
CoreAhBSRAM_l0i <= CoreAhbSRAM_I1ll(1 downto 0)&CoreAhbSrAM_L1ll(1 downto 0)&CoREAHBSram_o1LL(1 downto 0)&CoreAhbSRAM_i0ll(1 downto 0);
when "0101" =>
COREAHBSram_l0I <= CoreAhbSrAM_I1ll(1 downto 0)&COREAhbSram_L1LL(1 downto 0)&CoreAhbSRAM_O1ll(1 downto 0)&COReAhbSraM_I0LL(1 downto 0);
when "0110" =>
CorEAHBSram_l0I <= CoreAhBSRAM_i1ll(1 downto 0)&CoreAhbSRAM_L1ll(1 downto 0)&CoreAhBSRAM_o1ll(1 downto 0)&CoreAHBSRAm_i0ll(1 downto 0);
when "0111" =>
COREAHbSram_l0I <= COreAhbSrAM_I1Ll(1 downto 0)&COREAhbSram_L1LL(1 downto 0)&CorEAHBSram_o1lL(1 downto 0)&CoreAHBSRam_i0lL(1 downto 0);
when "1000" =>
CoreAhbSrAM_L0i <= CoreAhbSRAM_Olil(1 downto 0)&COReAhbSraM_IOIl(1 downto 0)&CoreAhbSRAM_loil(1 downto 0)&COREAhbSram_OOIL(1 downto 0);
when "1001" =>
CoreAHBSRAm_l0i <= CoREAHBSram_olIL(1 downto 0)&CorEAHBSram_ioIL(1 downto 0)&CoreAHBSRAM_loil(1 downto 0)&COREAHbSram_oOIL(1 downto 0);
when "1010" =>
CoreAhbSRAM_l0i <= CoREAHBSram_olIL(1 downto 0)&CorEAHBSram_ioIL(1 downto 0)&COreAhbSrAM_LOIl(1 downto 0)&CoreAhbSRAM_Ooil(1 downto 0);
when "1011" =>
CoREAHbSram_l0I <= COreAhbSrAM_OLil(1 downto 0)&COreAhbSrAM_IOIl(1 downto 0)&COREAhbSram_LOIL(1 downto 0)&CoreAHBSRAM_ooil(1 downto 0);
when "1100" =>
COREAHbSram_l0I <= COREAhbSram_ILIL(3 downto 0)&CoreAhbSRAM_LLil(3 downto 0);
when "1101" =>
CorEAHBSram_l0I <= CorEAHBSram_ilIL(3 downto 0)&COREAhbSram_LLIL(3 downto 0);
when "1110" =>
CoreAhBSRAm_l0i <= COREAhbSram_I1LL(1 downto 0)&CoREAHBSram_l1LL(1 downto 0)&CoreAhBSRAM_o1ll(1 downto 0)&CoreAHBSRam_i0lL(1 downto 0);
when "1111" =>
CoreAHBSRAm_l0i <= CoreAhbSRAM_i1ll(1 downto 0)&COREAHBSram_l1LL(1 downto 0)&CoreAHBSRAm_o1ll(1 downto 0)&CorEAHBSram_i0lL(1 downto 0);
when others =>
null
;
end case;
when others =>
COReAhbSraM_OL1 <= "00";
COREAhbSram_LL1 <= "00";
COREAhbSram_IL1 <= "00";
CoreAhbSRAM_OI1 <= "00";
COReAhbSraM_LI1 <= "00";
CoreAhbSRAM_II1 <= "00";
CorEAHBSram_o01 <= "00";
COREAhbSram_L01 <= "00";
COReAhbSraM_I01 <= "01";
CoreAhBSRAM_o11 <= "01";
CoreAHBSRAm_l11 <= "01";
CoreAhBSRAM_i11 <= "01";
CorEAHBSRam_oooL <= "10";
COREAhbSram_LOOL <= "10";
CoreAhbSRAM_iiil <= CoreAhBSRAM_o0i(11 downto 0);
COreAhbSrAM_O0il <= COREAHbSram_o0I(11 downto 0);
COREAhbSram_L0IL <= COreAhbSrAM_O0I(11 downto 0);
COREAhbSram_I0IL <= CoreAHBSRAm_o0i(11 downto 0);
COREAhbSram_O1IL <= COREAhbSram_O0I(11 downto 0);
CoreAhbSRAM_L1il <= CoreAHBSRAm_o0i(11 downto 0);
CoreAhbSRAM_I1il <= COREAHbSram_o0I(11 downto 0);
COREAhbSram_OO0L <= CoreAhbSRAM_O0i(11 downto 0);
CoreAhBSRAM_lo0l <= '0'&CoreAhbSRAM_o0i(10 downto 0);
CoreAHBSram_io0L <= '0'&COreAhbSrAM_O0I(10 downto 0);
CorEAHBSram_ol0L <= '0'&CoreAhbSRAM_o0i(10 downto 0);
COREAhbSram_LL0L <= '0'&CoreAhBSRAM_o0i(10 downto 0);
CoREAHBSram_il0L <= "00"&CorEAHBSram_o0i(9 downto 0);
CoreAhbSRAM_Oi0l <= "00"&COREAHbSram_o0I(9 downto 0);
COREAHbSram_o00L <= COREAhbSram_III(11 downto 0);
CoREAHBSram_l00L <= COREAhbSram_III(11 downto 0);
CorEAHBSram_i00L <= CoreAhBSRAM_iii(11 downto 0);
CoreAHBSRam_o10l <= COREAHbSram_iII(11 downto 0);
COREAhbSram_L10L <= CorEAHBSram_iiI(11 downto 0);
COREAhbSram_I10L <= CoREAHBSram_iiI(11 downto 0);
CoreAhBSRAM_oo1l <= CoreAhBSRAM_iii(11 downto 0);
COREAHbSram_LO1L <= COREAhbSram_III(11 downto 0);
CoreAhbSRAM_Io1l <= '0'&CoreAhbSRAM_Iii(10 downto 0);
CoreAHBSRam_ol1l <= '0'&COREAHbSram_iII(10 downto 0);
COReAhbSraM_LL1l <= '0'&CoreAhbSRAM_Iii(10 downto 0);
COReAhbSraM_IL1L <= '0'&COREAHBSram_iII(10 downto 0);
CoreAhBSRAM_oi1l <= "00"&CoreAhbSRAM_IIi(9 downto 0);
COREAhbSram_LI1L <= "00"&COREAHbSram_iII(9 downto 0);
CoreAhbSRAM_oiol(0) <= COREAhbSram_LII(0);
CoreAhbSRAM_Liol(0) <= COReAhbSraM_LII(1);
CoreAhbSRAM_Iiol(0) <= CoreAHBSram_lii(2);
COREAhbSram_O0OL(0) <= CoreAhBSRAM_lii(3);
CoreAHBSRam_l0ol(0) <= CoreAhBSRAM_lii(4);
COReAhbSram_I0OL(0) <= COreAhbSrAM_LII(5);
CoreAhBSRAm_o1ol(0) <= CoreAHBSRAM_lii(6);
CoreAhbSRAM_L1ol(0) <= CorEAHBSram_liI(7);
COREAhbSram_I1OL(1 downto 0) <= COREAhbSram_LII(1 downto 0);
COreAhbSrAM_OOLl(1 downto 0) <= CoreAhbSRAM_lii(3 downto 2);
CoreAhbSRAM_loll(1 downto 0) <= CoreAhBSRAM_lii(5 downto 4);
CoreAhbSRAM_IOll(1 downto 0) <= CoreAHBSram_lii(7 downto 6);
COREAhbSram_OLLL(3 downto 0) <= CoreAhbSRAM_Lii(3 downto 0);
COREAhbSram_LLLL(3 downto 0) <= COREAHbSram_lII(7 downto 4);
case (COreAhbSrAM_O0I(12 downto 9)) is
when "0000" =>
CoreAHBSRAm_llol(7 downto 0) <= CoREAHBSram_l01L&COreAhbSrAM_L01l&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COreAhbSraM_L01l&COREAhbSram_L01L&COreAhbSrAM_L01l&COREAHbSram_L01L;
when "0001" =>
CorEAHBSram_lloL(7 downto 0) <= CoreAhbSRAM_l01l&COReAhbSraM_L01L&COREAHBSram_l01L&COREAhbSram_L01L&COREAHbSram_l01L&CoreAHBSRam_l01l&COReAhbSram_L01L&CoreAhbSRAM_l01l;
when "0010" =>
COREAHBSram_llOL(7 downto 0) <= CoreAhbSRAM_l01l&COReAhbSraM_L01L&CoREAHBSram_l01L&CoREAHBSram_l01L&CoreAHBSRAM_l01l&CoreAHBSRAm_l01l&COreAhbSrAM_L01l&CoreAhbSRAM_L01l;
when "0011" =>
CoreAhbSRAM_Llol(7 downto 0) <= CoREAHBSram_l01L&CoreAhbSRAM_l01l&COReAhbSraM_L01l&CorEAHBSRam_l01L&CoreAHBSRam_l01l&CoreAhbSRAM_l01l&CoreAhbSRAM_L01l&CoreAhbSrAM_L01l;
when "0100" =>
COREAhbSram_LLOL(7 downto 0) <= CoreAhbSRAM_L01l&CoreAHBSRAm_l01l&COREAhbSram_L01L&CoreAhbSRAM_l01l&CoreAhbSRAM_L01l&CoreAhBSRAM_l01l&COREAHbSram_l01L&CoreAhbSRAM_L01l;
when "0101" =>
CoreAHBSRam_lloL(7 downto 0) <= CoreAhbSRAM_l01l&COREAhbSram_L01L&COREAHBSram_l01L&CorEAHBSram_l01L&COreAhbSraM_L01l&CoreAhbSRAM_l01l&CoreAhbSRAM_L01l&COREAhbSram_L01L;
when "0110" =>
CoreAhbSRAM_llol(7 downto 0) <= COreAhbSrAM_L01l&CoreAhbSRAM_L01l&CoreAHBSRam_l01l&COReAhbSraM_L01l&COREAHbSram_l01L&COREAhbSram_L01L&COREAHBSram_l01L&COreAhbSrAM_L01l;
when "0111" =>
COREAhbSram_LLOL(7 downto 0) <= COReAhbSram_L01L&CoreAHBSRAM_l01l&COReAhbSraM_L01l&COREAhbSram_L01L&CorEAHBSram_l01L&CoreAHBSRam_l01l&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "1000" =>
CoreAhbSRAM_llol(11 downto 8) <= COREAhbSram_L01L&CoreAHBSRam_l01l&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "1001" =>
CoreAhbSRAM_llol(11 downto 8) <= CoreAhbSRAM_l01l&CoreAHBSRAm_l01l&COREAhbSram_L01L&CoreAHBSRam_l01l;
when "1010" =>
CorEAHBSram_lloL(11 downto 8) <= CoreAhbSRAM_l01l&CorEAHBSram_l01L&CoreAHBSRAm_l01l&COreAhbSraM_L01l;
when "1011" =>
CoreAHBSram_llOL(11 downto 8) <= CoreAHBSRam_l01l&CoreAHBSRAm_l01l&CoreAhbSRAM_l01l&CoreAhBSRAM_l01l;
when "1100" =>
COREAhbSram_LLOL(13 downto 12) <= CoreAhbSRAM_L01l&CoreAHBSRam_l01l;
when "1101" =>
COreAhbSrAM_LLol(13 downto 12) <= CoreAHBSRam_l01l&COREAHbSram_l01L;
when "1110" =>
CorEAHBSRam_lloL(7 downto 0) <= CoreAHBSRAm_l01l&CoreAHBSRam_l01l&COReAhbSraM_L01l&COREAhbSram_L01L&CoREAHBSram_l01L&CoreAHBSRam_l01l&CorEAHBSram_l01L&COREAhbSram_L01L;
when "1111" =>
CorEAHBSram_lloL(7 downto 0) <= COreAhbSrAM_L01l&CoreAhBSRAM_l01l&COREAHbSram_l01L&CoreAHBSRam_l01l&CoreAHBSRam_l01L&COREAhbSram_L01L&CoreAHBSRam_l01L&CoREAHBSram_l01L;
when others =>
null
;
end case;
case (CoreAHBSRAM_iii(12 downto 9)) is
when "0000" =>
CoreAHBSRAm_ilol(7 downto 0) <= CoreAhbSRAM_i01l&COREAHbSram_i01L&COreAhbSrAM_I01l&COReAhbSraM_I01l&COreAhbSRAM_I01l&COREAhbSram_I01L&COReAhbSraM_I01l&CoreAhbSRAM_i01l;
when "0001" =>
COReAhbSrAM_ILOl(7 downto 0) <= CoreAhbSRAM_I01l&COREAHbSram_i01L&COREAhbSram_I01L&COReAhbSraM_I01l&COREAhbSram_i01L&CoreAhbSRAM_I01l&COREAhbSram_I01L&COreAhbSRAM_I01l;
when "0010" =>
CoREAHBSram_iLOL(7 downto 0) <= CoreAHBSRAM_i01l&COreAhbSrAM_I01l&CoreAhbSrAM_I01l&CorEAHBSram_i01L&CoreAHBSRAm_i01l&CoreAHbSraM_I01l&COREAHbSram_i01L&COREAhbSram_I01L;
when "0011" =>
COREAhbSram_ILOL(7 downto 0) <= CoreAhBSRAm_i01l&COREAhbSram_I01L&CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&COReAhbSraM_I01L&CoreAhbSRAM_i01l&COREAhbSram_I01L&COReAhbSram_I01L;
when "0100" =>
COREAhbSram_ILOL(7 downto 0) <= CorEAHBSram_i01L&COREAhbSraM_I01L&CoREAHBSram_i01L&CoreAHBSRam_i01l&CorEAHBSram_i01L&CoreAHBSRAM_i01l&CoreAHBSRAM_i01l&CorEAHBSram_i01L;
when "0101" =>
CoREAHBSram_ilOL(7 downto 0) <= COREAhbSram_I01L&CoreAhBSRAM_i01l&COreAhbSrAM_I01l&CoreAHBSRam_i01L&CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&CoreAhbSRAM_i01l&COREAHbSram_i01L;
when "0110" =>
CoreAhbSRAM_ilol(7 downto 0) <= COREAhbSram_I01L&CoreAhbSRAM_i01l&COreAhbSrAM_I01l&CoreAhbSRAM_i01l&COREAhbSram_I01L&COREAhbSram_I01L&CoREAHBSram_i01L&CorEAHBSram_i01L;
when "0111" =>
CoreAhBSRAM_ilol(7 downto 0) <= CoreAHBSram_i01L&CoreAhbSRAM_i01l&CoreAhbSRAM_i01l&CoreAhbSRAM_I01l&CoreAhbSRAM_i01l&COREAhbSram_I01L&CoreAHBSRAM_i01l&COReAhbSraM_I01l;
when "1000" =>
CoreAhBSRAM_ilol(11 downto 8) <= CoreAhbSRAM_I01l&COREAHbSram_i01L&COreAhbSrAM_I01l&CoreAhbSRAM_I01l;
when "1001" =>
CoREAHbSram_ilOL(11 downto 8) <= CoreAHBSRam_i01l&COREAhbSram_I01L&COREAHBSram_i01L&CoREAHBSram_i01L;
when "1010" =>
COreAhbSraM_ILOl(11 downto 8) <= COREAHbSram_i01L&CoreAHBSRAM_i01l&CoreAhbSRAM_i01l&CoreAhBSRAM_i01l;
when "1011" =>
CoreAHBSram_iloL(11 downto 8) <= CoreAhbSRAM_I01l&COREAhbSram_I01L&COREAHbSram_i01L&COReAhbSrAM_I01l;
when "1100" =>
CoreAhbSRAM_ILol(13 downto 12) <= CorEAHBSram_i01L&CoreAHBSRAm_i01l;
when "1101" =>
CoreAHBSRAM_ilol(13 downto 12) <= CoreAhBSRAM_i01l&COREAHBSram_i01L;
when "1110" =>
COREAhbSram_ILOL(7 downto 0) <= COREAhbSram_I01L&CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&CorEAHBSram_i01L&CoreAHBSRAm_i01l&CoreAhbSRAM_I01l&CoreAhBSRAM_i01l&CoreAhbSRAM_i01l;
when "1111" =>
CoreAHBSram_ilOL(7 downto 0) <= CorEAHBSram_i01L&CoreAhbSRAM_I01l&COreAhbSrAM_I01l&CorEAHBSRam_i01l&COreAhbSrAM_I01l&CoreAHBSRAm_i01l&COREAhbSram_I01L&COREAhbSram_I01L;
when others =>
null
;
end case;
case (COREAhbSram_IO1(12 downto 9)) is
when "0000" =>
CoreAhbSrAM_L0I <= CoreAHBSRAm_i1ll(0)&COREAHbSram_l1LL(0)&CoreAhbSRAM_O1ll(0)&COREAHBSram_i0LL(0)&CoreAHBSRam_l0ll(0)&CoreAhbSRAM_O0ll(0)&CorEAHBSram_iilL(0)&CoreAhBSRAM_lill(0);
when "0001" =>
COREAhbSram_L0I <= COreAhbSrAM_I1ll(0)&COreAhbSraM_L1LL(0)&CoreAhBSRAm_o1ll(0)&COREAhbSram_I0LL(0)&CorEAHBSram_l0lL(0)&COreAhbSrAM_O0Ll(0)&COREAhbSram_IILL(0)&COReAhbSraM_LILL(0);
when "0010" =>
CoreAHBSRAM_l0i <= COREAhbSram_I1LL(0)&CoreAhbSRAM_l1ll(0)&CoreAhbSRAM_o1ll(0)&COREAhbSram_I0LL(0)&CoreAHBSram_l0lL(0)&COreAhbSRAM_O0ll(0)&COREAhbSram_IILL(0)&CoreAHBSRam_lill(0);
when "0011" =>
CoreAhbSRAM_l0i <= COREAhbSram_I1LL(0)&CoREAHBSram_l1LL(0)&CoreAhBSRAM_o1ll(0)&CorEAHBSRam_i0lL(0)&CoreAhBSRAM_l0ll(0)&CoREAHBSram_o0LL(0)&COREAhbSram_IILL(0)&CoreAhbSRAM_LIll(0);
when "0100" =>
CoREAHbSram_l0I <= CorEAHBSram_i1LL(0)&CoREAHBSram_l1LL(0)&CoreAhbSRAM_O1ll(0)&COREAhbSram_I0LL(0)&COREAHbSram_l0LL(0)&CoreAHBSRam_o0ll(0)&CoreAHBSRam_iill(0)&COREAhbSram_LILL(0);
when "0101" =>
CoreAhBSRAm_l0i <= CorEAHBSram_i1lL(0)&CoreAhbSRAM_L1ll(0)&CoreAhBSRAM_o1ll(0)&CoreAhbSRAM_i0ll(0)&CoreAHBSRam_l0ll(0)&COREAhbSram_O0LL(0)&COreAhbSrAM_IILl(0)&COREAhbSram_LILL(0);
when "0110" =>
CoreAhbSRAM_L0i <= COREAHbSram_i1LL(0)&CoreAHBSRAM_l1ll(0)&CoreAhbSRAM_o1ll(0)&COreAhbSRAM_I0ll(0)&COREAhbSraM_L0Ll(0)&COREAHbSram_o0LL(0)&CoREAHBSram_iiLL(0)&CoreAhBSRAM_lill(0);
when "0111" =>
COREAhbSram_L0I <= CoreAhbSRAM_i1ll(0)&COreAhbSRAM_L1ll(0)&COREAhbSram_O1LL(0)&COREAhbSram_I0LL(0)&CoREAHBSram_l0LL(0)&CoreAhBSRAM_o0ll(0)&CoreAhBSRAm_iill(0)&CoREAHBSram_lILL(0);
when "1000" =>
COREAhbSram_L0I <= COReAhbSraM_OLIl(1 downto 0)&CoreAhbSRAM_IOil(1 downto 0)&CoreAHBSram_loiL(1 downto 0)&CoreAhbSRAM_Ooil(1 downto 0);
when "1001" =>
CoreAHBSram_l0i <= COREAHbSram_oLIL(1 downto 0)&CoreAhBSRAM_ioil(1 downto 0)&COreAhbSrAM_LOil(1 downto 0)&CoreAHBSRAM_ooil(1 downto 0);
when "1010" =>
CorEAhbSram_L0I <= CorEAHBSram_olIL(1 downto 0)&CoreAHBSRAm_ioil(1 downto 0)&CoreAhBSRAm_loil(1 downto 0)&CoreAHBSram_oOIL(1 downto 0);
when "1011" =>
COReAhbSraM_L0I <= CoreAHBSRam_oliL(1 downto 0)&COREAHbSram_iOIL(1 downto 0)&COReAhbSraM_LOIl(1 downto 0)&COREAhbSram_OOIL(1 downto 0);
when "1100" =>
COReAhbSraM_L0I <= COReAhbSrAM_ILIl(3 downto 0)&CoREAHBSram_llIL(3 downto 0);
when "1101" =>
COREAhbSraM_L0I <= COREAhbSram_ILIL(3 downto 0)&CoreAhbSrAM_LLil(3 downto 0);
when "1110" =>
CoreAHBSRAM_l0i <= COREAHbSram_I1LL(0)&CoreAHBSRam_l1lL(0)&CoreAhbSRAM_o1ll(0)&COReAhbSraM_I0LL(0)&COREAHbSram_l0LL(0)&CoreAhbSRAM_o0ll(0)&CoreAHBSram_iilL(0)&CoreAHBSRam_lilL(0);
when "1111" =>
CoREAHBSram_l0I <= COreAhbSRAM_I1ll(0)&CoreAhbSRAM_l1ll(0)&CorEAHBSRam_o1lL(0)&CorEAHBSram_i0lL(0)&COREAhbSram_L0LL(0)&CoreAhBSRAm_o0ll(0)&COReAhbSrAM_IILl(0)&CoreAHBSRam_lilL(0);
when others =>
null
;
end case;
end case;
when 7680 =>
case (CorEAHBSram_lo1) is
when 8 =>
CorEAHbSram_oL1 <= "11";
COReAhbSraM_LL1 <= "11";
CoreAhbSRAM_IL1 <= "11";
CoreAHBSRam_oi1 <= "11";
COReAhbSraM_LI1 <= "11";
CorEAHBSRam_ii1 <= "11";
COReAhbSraM_O01 <= "11";
CoreAhbSRAM_l01 <= "11";
COReAhbSraM_I01 <= "11";
CoreAhbSRAM_o11 <= "11";
CoreAHBSram_l11 <= "11";
COReAhbSrAM_I11 <= "11";
CoreAHBSram_oooL <= "11";
CoreAhBSRAM_lool <= "11";
COreAhbSrAM_IOol <= "11";
COREAhbSram_IIIL <= "000"&CoreAhbSRAM_o0i(8 downto 0);
COreAhbSraM_O0Il <= "000"&COREAHbSram_o0I(8 downto 0);
CoreAhbSRAM_L0il <= "000"&CoreAhBSRAM_o0i(8 downto 0);
CoREAHBSram_i0IL <= "000"&COREAHbSram_o0I(8 downto 0);
CoreAhbSRAM_o1il <= "000"&CoreAhbSRAM_o0i(8 downto 0);
CoreAhbSRAM_L1il <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CoreAHBSram_i1iL <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COreAhbSrAM_OO0l <= "000"&COReAhbSraM_O0I(8 downto 0);
COReAhbSram_LO0L <= "000"&COReAhbSraM_O0I(8 downto 0);
COReAhbSraM_IO0L <= "000"&CoreAHBSRam_o0i(8 downto 0);
CoreAHBSRAm_ol0l <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COREAhbSram_LL0L <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COREAhbSram_IL0L <= "000"&CoreAHBSRam_o0i(8 downto 0);
CorEAHBSram_oi0L <= "000"&CoREAHBSram_o0I(8 downto 0);
COREAhbSram_LI0L <= "000"&CoREAHBSram_o0I(8 downto 0);
COReAhbSraM_O00L <= "000"&COReAhbSraM_III(8 downto 0);
COReAhbSraM_L00l <= "000"&CoREAHBSram_iiI(8 downto 0);
COREAhbSram_I00L <= "000"&COReAhbSraM_III(8 downto 0);
COREAhbSram_O10L <= "000"&CoreAhBSRAM_iii(8 downto 0);
CoreAhBSRAm_l10l <= "000"&CoreAhbSRAM_Iii(8 downto 0);
CorEAHBSram_i10L <= "000"&CoreAHBSRAm_iii(8 downto 0);
CoREAHbSram_oO1L <= "000"&COreAhbSrAM_III(8 downto 0);
COreAhbSrAM_LO1l <= "000"&CoreAHBSRam_iii(8 downto 0);
COReAhbSraM_IO1l <= "000"&COREAHbSram_iII(8 downto 0);
COREAhbSram_OL1L <= "000"&CoreAhbSRAM_iii(8 downto 0);
COReAhbSram_LL1L <= "000"&CorEAHBSRam_iii(8 downto 0);
CoreAHBSRAM_il1l <= "000"&CoreAhbSRAM_iii(8 downto 0);
CoreAhbSRAM_OI1l <= "000"&CoREAHBSram_iiI(8 downto 0);
CoreAhBSRAM_li1l <= "000"&COREAhbSram_III(8 downto 0);
CoreAhBSRAM_ii1l <= "000"&CoreAhbSRAM_iii(8 downto 0);
CorEAHBSram_oIOL <= CoREAHBSram_lII;
CoreAHBSRam_liol <= CorEAHBSram_liI;
COReAhbSraM_IIOl <= CorEAHBSram_liI;
CoreAhBSRAM_o0ol <= COREAhbSram_LII;
COREAhbSram_L0OL <= CorEAHBSram_liI;
CoreAhbSRAM_i0ol <= COReAhbSraM_LII;
COREAHBSram_o1OL <= CoreAhBSRAM_lii;
COREAhbSram_L1OL <= CoREAHBSram_lII;
CoreAhBSRAM_i1ol <= CoreAHBSRAm_lii;
CoreAhbSRAM_ooll <= CoreAhbSRAM_Lii;
CorEAHBSram_loLL <= COREAhbSram_LII;
CoreAhbSRAM_ioll <= CoreAhbSRAM_lii;
COReAhbSram_OLLL <= COREAhbSram_LII;
COreAhbSrAM_LLLl <= COREAHbSram_lII;
CoreAhbSRAM_Illl <= CorEAHBSram_liI;
case (CoreAhBSRAM_o0i(12 downto 9)) is
when "0000" =>
CoreAhBSRAM_llol(0) <= CoreAHBSRAm_l01l;
when "0001" =>
COREAhbSram_LLOL(1) <= CoreAhbSRAM_L01l;
when "0010" =>
COREAhbSram_LLOL(2) <= CorEAHBSram_l01L;
when "0011" =>
COreAhbSrAM_LLOl(3) <= CoreAhbSRAM_L01l;
when "0100" =>
CoreAhBSRAM_llol(4) <= CoreAhbSRAM_L01l;
when "0101" =>
CoreAHBSram_lloL(5) <= CoREAHBSram_l01L;
when "0110" =>
CoreAhBSRAm_llol(6) <= CoreAHBSRAm_l01l;
when "0111" =>
CoreAhbSRAM_Llol(7) <= CoreAhBSRAM_l01l;
when "1000" =>
COreAhbSrAM_LLOl(8) <= CoreAhbSRAM_L01l;
when "1001" =>
CoreAhbSRAM_Llol(9) <= CoreAhbSRAM_l01l;
when "1010" =>
CoreAHBSram_lloL(10) <= COREAhbSram_L01L;
when "1011" =>
COReAhbSraM_LLOL(11) <= CoreAhbSRAM_L01l;
when "1100" =>
COreAhbSRAM_LLol(12) <= CoreAHBSRam_l01L;
when "1101" =>
CoREAHBSram_lLOL(13) <= CoREAHBSram_l01L;
when "1110" =>
COREAhbSram_LLOL(14) <= COreAhbSrAM_L01l;
when "1111" =>
COreAhbSrAM_LLOl(7) <= CoreAHBSRAM_l01l;
when others =>
null
;
end case;
case (CoreAHBSRAM_iii(12 downto 9)) is
when "0000" =>
COreAhbSrAM_ILOl(0) <= COREAhbSram_I01L;
when "0001" =>
CoreAhbSRAM_Ilol(1) <= CoreAhBSRAM_i01l;
when "0010" =>
CoreAhBSRAM_ilol(2) <= CoREAHBSram_i01L;
when "0011" =>
CoreAhbSRAM_ILol(3) <= CoreAHBSRAm_i01l;
when "0100" =>
CoreAhbSRAM_ilol(4) <= COREAhbSram_I01L;
when "0101" =>
CoreAhbSRAM_Ilol(5) <= CoreAhbSRAM_i01l;
when "0110" =>
CoreAhBSRAM_ilol(6) <= COREAhbSram_I01L;
when "0111" =>
CoreAhbSRAM_Ilol(7) <= CoreAhBSRAM_i01l;
when "1000" =>
CorEAHBSram_iloL(8) <= CoreAhbSRAM_I01l;
when "1001" =>
CoreAhbSRAM_Ilol(9) <= CorEAHBSram_i01L;
when "1010" =>
COREAhbSram_ILOL(10) <= CoreAhBSRAm_i01l;
when "1011" =>
CoreAhbSRAM_ilol(11) <= COreAhbSRAM_I01l;
when "1100" =>
CoreAHBSRam_ilol(12) <= CoreAhbSRAM_I01l;
when "1101" =>
CoreAhbSRAM_Ilol(13) <= CoreAhbSRAM_i01l;
when "1110" =>
COREAHbSram_iLOL(14) <= CoREAHBSram_i01L;
when "1111" =>
CoreAHBSRAm_ilol(7) <= COREAhbSram_I01L;
when others =>
null
;
end case;
case (COREAhbSram_IO1(12 downto 9)) is
when "0000" =>
CoreAHBSram_l0I <= COreAhbSRAM_LIll;
when "0001" =>
COREAHBSram_l0I <= CoreAHBSRam_iilL;
when "0010" =>
COREAhbSram_L0I <= CoreAhbSRAM_o0ll;
when "0011" =>
CoreAHBSRAm_l0i <= CoreAHBSRAm_l0ll;
when "0100" =>
CoREAHBSram_l0I <= COREAHbSram_i0LL;
when "0101" =>
CoreAhbSrAM_L0i <= CorEAHBSram_o1lL;
when "0110" =>
CoreAhBSRAM_l0i <= COreAhbSrAM_L1Ll;
when "0111" =>
COREAhbSram_L0I <= COReAhbSraM_I1LL;
when "1000" =>
COreAhbSrAM_L0I <= CoreAHBSRAm_ooil;
when "1001" =>
COreAhbSrAM_L0i <= COReAhbSraM_LOIL;
when "1010" =>
CoreAHBSRAm_l0i <= CoreAhbSRAM_IOil;
when "1011" =>
COReAhbSraM_L0I <= COREAHbSram_oLIL;
when "1100" =>
COreAhbSrAM_L0I <= CoreAhbSRAM_llil;
when "1101" =>
COReAhbSraM_L0I <= COReAhbSram_ILIL;
when "1110" =>
CoREAHBSram_l0I <= CoreAHBSRAm_oiil;
when "1111" =>
CoreAhbSRAM_L0i <= CorEAHBSRam_i1lL;
when others =>
null
;
end case;
when 4 =>
CoreAHBSram_ol1 <= "10";
CoreAhbSRAM_Ll1 <= "10";
CoreAhbSRAM_IL1 <= "10";
CoreAhbSRAM_OI1 <= "10";
COReAhbSraM_LI1 <= "10";
CoreAhbSRAM_II1 <= "10";
COREAhbSram_O01 <= "10";
CoreAhBSRAM_l01 <= "10";
CoreAhBSRAM_i01 <= "10";
CoreAhbSRAM_o11 <= "10";
COReAhbSram_L11 <= "10";
COreAhbSraM_I11 <= "10";
COREAhbSram_OOOL <= "10";
COreAhbSrAM_LOOl <= "10";
CoreAhbSRAM_IOol <= "11";
CoreAhBSRAM_iiil <= "00"&CoreAhbSRAM_O0i(9 downto 0);
COreAhbSrAM_O0il <= "00"&CoreAhbSRAM_o0i(9 downto 0);
CorEAHBSram_l0IL <= "00"&CoreAhBSRAM_o0i(9 downto 0);
CorEAHBSram_i0iL <= "00"&CorEAHBSram_o0I(9 downto 0);
CoREAHBSram_o1IL <= "00"&COREAhbSram_O0I(9 downto 0);
CoreAhBSRAM_l1il <= "00"&CorEAHBSram_o0i(9 downto 0);
COReAhbSraM_I1Il <= "00"&CoreAhBSRAM_o0i(9 downto 0);
CoREAHBSram_oO0L <= "00"&CoREAHBSram_o0I(9 downto 0);
CoreAhbSRAM_LO0l <= "00"&CoreAhBSRAM_o0i(9 downto 0);
CorEAHBSram_io0L <= "00"&COREAhbSram_O0I(9 downto 0);
CoreAHBSRam_ol0L <= "00"&CoreAhBSRAM_o0i(9 downto 0);
COREAHBSram_lL0L <= "00"&COREAhbSram_O0I(9 downto 0);
COREAhbSram_IL0L <= "00"&CoreAhbSRAM_o0i(9 downto 0);
COreAhbSrAM_OI0l <= "00"&CoreAhBSRAM_o0i(9 downto 0);
CoREAHBSram_lI0L <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COREAhbSram_O00L <= "00"&COreAhbSrAM_IIi(9 downto 0);
CoreAHBSRAm_l00l <= "00"&CoreAhbSRAM_iii(9 downto 0);
COREAhbSram_I00L <= "00"&CoreAHBSRAm_iii(9 downto 0);
CoreAhbSRAM_o10l <= "00"&CoreAhbSRAM_Iii(9 downto 0);
CoreAHBSRAm_l10l <= "00"&CoreAhBSRAM_iii(9 downto 0);
CoreAHBSRam_i10l <= "00"&CoREAHBSram_iiI(9 downto 0);
COreAhbSrAM_OO1l <= "00"&COREAhbSram_III(9 downto 0);
COREAHbSram_lO1L <= "00"&CoREAHBSram_iiI(9 downto 0);
CoreAHBSRam_io1L <= "00"&COReAhbSraM_III(9 downto 0);
CoreAHBSRAm_ol1l <= "00"&COREAHbSram_III(9 downto 0);
CoreAhbSRAM_LL1l <= "00"&COReAhbSraM_III(9 downto 0);
CoreAhbSRAM_il1l <= "00"&CoreAhBSRAM_iii(9 downto 0);
COREAhbSram_OI1L <= "00"&CorEAHBSram_iiI(9 downto 0);
COREAhbSram_LI1L <= "00"&CorEAHBSram_iii(9 downto 0);
CorEAHBSram_ii1L <= "000"&CoreAHBSRAm_iii(8 downto 0);
CorEAHBSram_oiOL(3 downto 0) <= CorEAHBSram_lii(3 downto 0);
COREAhbSram_LIOL(3 downto 0) <= CoreAhBSRAM_lii(7 downto 4);
COREAhbSram_IIOL(3 downto 0) <= CoreAHBSRAm_lii(3 downto 0);
CorEAHBSram_o0OL(3 downto 0) <= COReAhbSraM_LII(7 downto 4);
CorEAHBSRam_l0oL(3 downto 0) <= CoreAhbSRAM_lii(3 downto 0);
COREAhbSram_I0OL(3 downto 0) <= CoreAhBSRAM_lii(7 downto 4);
COReAhbSraM_O1Ol(3 downto 0) <= CoreAhBSRAM_lii(3 downto 0);
CoreAhBSRAm_l1ol(3 downto 0) <= CoreAhbSRAM_lii(7 downto 4);
COreAhbSrAM_I1Ol(3 downto 0) <= COREAhbSram_LII(3 downto 0);
CoreAhbSRAM_Ooll(3 downto 0) <= COreAhbSrAM_LIi(7 downto 4);
COReAhbSraM_LOLl(3 downto 0) <= CoreAHBSRam_lii(3 downto 0);
COREAhbSram_IOLL(3 downto 0) <= COREAhbSram_LII(7 downto 4);
CoREAHBSram_olLL(3 downto 0) <= COReAhbSrAM_LII(3 downto 0);
COREAHBSram_lLLL(3 downto 0) <= COreAhbSrAM_LII(7 downto 4);
CoreAhBSRAM_illl <= CorEAHBSram_liI;
case (CoreAHBSRam_o0i(12 downto 9)) is
when "0000" =>
CoREAHBSram_lLOL(1 downto 0) <= CoreAhBSRAM_l01l&CorEAHBSram_l01L;
when "0001" =>
CoREAHBSram_llOL(1 downto 0) <= CorEAHBSram_l01L&CoreAhbSRAM_L01l;
when "0010" =>
COREAHbSram_lLOL(3 downto 2) <= CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "0011" =>
CoreAHBSRam_lloL(3 downto 2) <= CoreAHBSram_l01L&CoreAhBSRAM_l01l;
when "0100" =>
COREAhbSram_LLOL(5 downto 4) <= COREAhbSram_L01L&COREAHbSram_l01L;
when "0101" =>
CoreAHBSRAm_llol(5 downto 4) <= CoreAhbSrAM_L01l&COreAhbSrAM_L01l;
when "0110" =>
CoreAHBSRAm_llol(7 downto 6) <= CoreAhBSRAM_l01l&CoreAhbSRAM_l01l;
when "0111" =>
CoreAhBSRAM_llol(7 downto 6) <= CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "1000" =>
CoreAHBSRam_llol(9 downto 8) <= CoreAHBSRAM_l01l&CoreAhbSRAM_l01l;
when "1001" =>
COReAhbSraM_LLOl(9 downto 8) <= COREAhbSram_L01L&CoreAHBSRAm_l01l;
when "1010" =>
CoreAhBSRAM_llol(11 downto 10) <= CoreAhBSRAM_l01l&CoREAHBSram_l01L;
when "1011" =>
CoreAhBSRAm_llol(11 downto 10) <= COREAhbSram_l01L&CorEAHBSram_l01L;
when "1100" =>
CoreAHBSram_lLOL(13 downto 12) <= CoreAhbSRAM_l01l&CoreAhbSRAM_l01l;
when "1101" =>
CorEAHBSraM_LLOL(13 downto 12) <= CoreAhbSRAM_L01l&CoreAHBSRam_l01l;
when "1110" =>
COREAhbSram_LLOL(14) <= CoreAhBSram_l01L;
when "1111" =>
CoreAHBSRam_lLOL(7 downto 6) <= CorEAHBSram_L01L&CoreAhbSRAm_l01l;
when others =>
null
;
end case;
case (COreAhbSrAM_Iii(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_ilol(1 downto 0) <= CoREAhbSram_I01L&COReAhbSrAM_I01l;
when "0001" =>
COReAhbSraM_ILol(1 downto 0) <= COReAhbSRAM_I01l&CorEAHBSram_i01L;
when "0010" =>
CoreAHBSRAM_iloL(3 downto 2) <= CoreAhBSRAM_i01L&CoreAhbSRAM_i01l;
when "0011" =>
CoreAhBSRAM_ilol(3 downto 2) <= COreAhbSrAM_I01l&COREAhbSram_I01L;
when "0100" =>
CoREAHBSram_ILOL(5 downto 4) <= COREAhbSram_I01L&COREAHBSram_i01L;
when "0101" =>
CoreAhbSRAM_Ilol(5 downto 4) <= CoreAhbSRAM_i01l&CoreAHBSRAm_i01l;
when "0110" =>
CoreAHBSram_iloL(7 downto 6) <= CoREAHBSram_i01L&CoreAhbSRAM_I01l;
when "0111" =>
CorEAHBSram_iloL(7 downto 6) <= CoREAHBSram_i01L&COReAhbSraM_I01l;
when "1000" =>
COREAhbSram_ILOL(9 downto 8) <= CoreAhBSRAM_i01l&CoreAHBSRAM_i01L;
when "1001" =>
COreAhbSrAM_ILol(9 downto 8) <= CoreAhbSRAM_i01l&CoreAhbSRAM_i01l;
when "1010" =>
CoreAHBSRam_ilol(11 downto 10) <= CoreAhBSRAM_i01l&COReAhbSraM_I01L;
when "1011" =>
COREAhbSram_ILOL(11 downto 10) <= CoreAhBSRAM_i01l&COreAhbSrAM_I01l;
when "1100" =>
COREAhbSram_ILOL(13 downto 12) <= CoreAhbSRAM_I01l&CoreAhbSRAM_I01l;
when "1101" =>
COReAhbSraM_ILOl(13 downto 12) <= CoreAhBSRAM_i01l&COREAHbSram_i01L;
when "1110" =>
CoreAhbSRAM_ILol(14) <= CoreAhbSRAM_I01l;
when "1111" =>
CoreAHBSRAm_ilol(7 downto 6) <= CoreAhbSRAM_i01l&CorEAHBSram_i01L;
when others =>
null
;
end case;
case (CoreAhbSRAM_io1(12 downto 9)) is
when "0000" =>
CoREAHbSram_l0I <= CorEAHBSram_iiLL(3 downto 0)&CoreAhbSRAM_lill(3 downto 0);
when "0001" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_IIll(3 downto 0)&CoREAHBSram_liLL(3 downto 0);
when "0010" =>
CoreAhbSRAM_L0i <= CoreAHBSram_l0lL(3 downto 0)&CoreAhBSRAM_o0ll(3 downto 0);
when "0011" =>
CoreAhbSRAM_L0i <= COREAhbSram_L0LL(3 downto 0)&COReAhbSraM_O0Ll(3 downto 0);
when "0100" =>
COREAhbSram_L0I <= CoreAhbSRAM_O1ll(3 downto 0)&CoreAhbSRAM_I0ll(3 downto 0);
when "0101" =>
CoreAhbSRAM_l0i <= COREAhbSram_O1LL(3 downto 0)&CoREAHBSram_i0LL(3 downto 0);
when "0110" =>
COReAhbSraM_L0I <= COREAHbSram_i1LL(3 downto 0)&COREAhbSram_L1LL(3 downto 0);
when "0111" =>
COREAHBSram_l0I <= COREAhbSram_I1LL(3 downto 0)&COREAhbSram_L1LL(3 downto 0);
when "1000" =>
COreAhbSrAM_L0I <= COreAhbSRAM_LOil(3 downto 0)&CoreAhBSRAM_ooil(3 downto 0);
when "1001" =>
CoreAHBSram_l0i <= CoreAHBSRAm_loil(3 downto 0)&COreAhbSRAM_OOil(3 downto 0);
when "1010" =>
COreAhbSraM_L0I <= COreAhbSrAM_OLil(3 downto 0)&COReAhbSrAM_IOIl(3 downto 0);
when "1011" =>
CoreAhBSRAM_l0i <= COReAhbSraM_OLIl(3 downto 0)&COREAhbSram_IOIL(3 downto 0);
when "1100" =>
CoreAHBSram_l0i <= COreAhbSrAM_ILil(3 downto 0)&COREAhbSram_LLIL(3 downto 0);
when "1101" =>
CoREAHBSram_l0I <= CoreAHBSRAm_ilil(3 downto 0)&COreAhbSRAM_LLil(3 downto 0);
when "1110" =>
COREAHbSram_L0I <= COREAhbSram_OIIL;
when "1111" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_I1ll(3 downto 0)&CoreAhbSRAM_l1ll(3 downto 0);
when others =>
null
;
end case;
when 2 =>
CoreAhBSRam_ol1 <= "01";
COREAHbSram_LL1 <= "01";
CoreAHBSram_il1 <= "01";
CoreAhbSRAM_oi1 <= "01";
CoREAHBSram_li1 <= "01";
COREAHbSram_II1 <= "01";
CorEAHBSram_o01 <= "01";
CoreAHBSRam_l01 <= "01";
COreAhbSRAM_I01 <= "01";
CoREAHBSram_o11 <= "01";
CoreAHBSRam_l11 <= "01";
COReAhbSraM_I11 <= "01";
CoreAHBSram_oooL <= "10";
CoreAhBSRAM_lool <= "10";
CoREAHBSram_iOOL <= "11";
CorEAHBSram_iiIL <= '0'&CorEAHBSram_o0I(10 downto 0);
COReAhbSraM_O0IL <= '0'&COREAhbSram_O0I(10 downto 0);
CoreAhbSRAM_L0il <= '0'&CoreAhbSRAM_O0i(10 downto 0);
COreAhbSrAM_I0il <= '0'&CoreAhbSRAM_O0i(10 downto 0);
CorEAHBSram_o1iL <= '0'&COREAHbSram_o0I(10 downto 0);
CoreAHBSram_l1iL <= '0'&CoreAHBSRam_o0i(10 downto 0);
CoreAhbSRAM_i1il <= '0'&CoreAHBSram_o0i(10 downto 0);
COreAhbSRAM_Oo0l <= '0'&CoreAhbSRAM_O0i(10 downto 0);
CoreAHBSRAm_lo0l <= '0'&COREAhbSram_O0I(10 downto 0);
CoreAhbSRAM_io0l <= '0'&CoreAhbSRAM_O0i(10 downto 0);
CoreAHBSRAM_ol0l <= '0'&COREAHbSram_o0I(10 downto 0);
CoreAhBSRAM_ll0l <= '0'&CoreAHBSRAm_o0i(10 downto 0);
CoreAhbSRAM_IL0l <= "00"&CoreAHBSRam_o0i(9 downto 0);
CoreAhbSRAM_oi0l <= "00"&CoreAhbSRAM_o0i(9 downto 0);
CoreAhBSRAM_li0l <= "000"&CoreAHBSRam_o0i(8 downto 0);
CoREAHbSram_o00L <= '0'&COreAhbSraM_III(10 downto 0);
CoreAhbSRAM_L00l <= '0'&CoreAHBSRam_iii(10 downto 0);
COREAhbSram_I00L <= '0'&CoreAHBSRam_iii(10 downto 0);
CorEAHBSram_o10L <= '0'&COReAhbSraM_III(10 downto 0);
CoreAhBSRAm_l10l <= '0'&COReAhbSraM_III(10 downto 0);
COREAhbSram_I10L <= '0'&CoreAHBSRam_iii(10 downto 0);
CoreAHBSRam_oo1L <= '0'&CoreAhbSRAM_Iii(10 downto 0);
CoreAhbSRAM_lo1l <= '0'&COREAHbSram_iII(10 downto 0);
COREAhbSram_IO1L <= '0'&CoreAhbSRAM_Iii(10 downto 0);
CoreAHBSRAm_ol1l <= '0'&CoreAhBSRAM_iii(10 downto 0);
COREAhbSram_LL1L <= '0'&COREAhbSram_III(10 downto 0);
COREAhbSram_IL1L <= '0'&CoreAHBSRam_iii(10 downto 0);
CorEAHBSram_oi1L <= "00"&CoreAhBSRAM_iii(9 downto 0);
CoreAHBSRAm_li1l <= "00"&COreAhbSrAM_III(9 downto 0);
COreAhbSRAM_II1l <= "000"&CoreAhBSRAM_iii(8 downto 0);
CoreAHBSRAm_oiol(1 downto 0) <= CoreAHBSRAm_lii(1 downto 0);
CorEAHBSram_lioL(1 downto 0) <= CoREAHBSram_lII(3 downto 2);
CoreAhBSRAM_iiol(1 downto 0) <= COREAhbSram_LII(5 downto 4);
COREAhbSram_O0OL(1 downto 0) <= CoreAhbSRAM_Lii(7 downto 6);
COREAhbSram_L0OL(1 downto 0) <= CoreAhbSRAM_LIi(1 downto 0);
CoreAHBSram_i0oL(1 downto 0) <= COREAhbSram_LII(3 downto 2);
CoreAhbSRAM_o1ol(1 downto 0) <= CoreAhBSRAM_lii(5 downto 4);
CoreAhbSRAM_l1ol(1 downto 0) <= CorEAHBSram_liI(7 downto 6);
CoreAHBSRam_i1oL(1 downto 0) <= CoreAhbSRAM_lii(1 downto 0);
CoreAhbSRAM_OOll(1 downto 0) <= COREAhbSram_LII(3 downto 2);
COReAhbSraM_LOLL(1 downto 0) <= COreAhbSrAM_LII(5 downto 4);
COreAhbSrAM_Ioll(1 downto 0) <= CorEAHBSram_liI(7 downto 6);
COREAHbSram_OLLL(3 downto 0) <= CoREAHBSram_liI(3 downto 0);
CoreAhBSRAM_llll(3 downto 0) <= CoreAhbSRAM_lii(7 downto 4);
CoreAHBSRam_illL <= CoreAHBSRam_lii;
case (CoreAhBSRAM_o0i(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_Llol(3 downto 0) <= CoreAhbSrAM_L01l&CorEAHBSRam_l01L&COREAHbSram_l01L&CoreAhbSRAM_L01l;
when "0001" =>
CoreAhBSRAM_llol(3 downto 0) <= CoreAhbSRAM_L01l&CoREAHBSram_l01L&CorEAHBSram_l01L&CorEAHBSram_l01L;
when "0010" =>
CorEAHBSram_llOL(3 downto 0) <= COREAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhBSRAM_l01l&CoreAhbSRAM_l01l;
when "0011" =>
CoreAhbSRAM_llol(3 downto 0) <= CoreAHBSRam_l01l&CoreAhbSRAM_l01l&CoreAhbSRAM_l01l&CoreAHBSRam_l01L;
when "0100" =>
COREAHbSram_LLOL(7 downto 4) <= CoreAhBSRAM_l01l&COREAHbSram_L01L&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when "0101" =>
COreAhbSrAM_LLOl(7 downto 4) <= CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&CoreAhbSRAM_l01l&CorEAHBSram_l01l;
when "0110" =>
CoreAhBSRAM_llol(7 downto 4) <= COREAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhBSRAM_l01l&CoREAHBSram_L01l;
when "0111" =>
CoreAHBSRAm_llol(7 downto 4) <= CoreAhbSRAM_l01l&CoreAHBSRam_l01L&CoREAHBSram_l01L&COREAhbSraM_L01l;
when "1000" =>
COREAhbSram_LLOL(11 downto 8) <= COREAHbSram_L01L&CorEAHBSram_l01L&CoreAHBSRam_l01L&CoREAHbSram_L01L;
when "1001" =>
CoreAhBSRAM_llol(11 downto 8) <= CoreAhbSRAM_l01l&COreAhbSrAM_L01l&CoreAhbSRAM_L01l&COREAHbSram_l01L;
when "1010" =>
CoreAhbSRAM_Llol(11 downto 8) <= CoreAhBSRAM_l01l&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&CoreAhbSrAM_L01l;
when "1011" =>
COreAhbSRAM_LLol(11 downto 8) <= CoreAHBSRam_l01L&CoREAHBSram_l01L&CorEAHBSram_l01L&CoreAHBSRAm_l01l;
when "1100" =>
COREAhbSraM_LLOl(13 downto 12) <= COREAHbSram_L01L&COREAhbSram_L01L;
when "1101" =>
CoreAhBSRAM_llol(13 downto 12) <= CoreAhbSRAM_l01l&COreAhbSrAM_L01l;
when "1110" =>
CoreAHBSRam_lloL(14) <= CoreAhbSRAM_l01l;
when "1111" =>
CorEAHBSram_llOL(7 downto 4) <= CoreAHBSRAM_l01l&CorEAHBSram_l01L&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l;
when others =>
null
;
end case;
case (COReAhbSraM_III(12 downto 9)) is
when "0000" =>
CoreAHBSram_iloL(3 downto 0) <= COReAhbSraM_I01l&CoreAHBSram_i01L&CoreAhbSRAM_i01l&CoreAhbSRAM_I01l;
when "0001" =>
COREAHbSram_iLOL(3 downto 0) <= COreAhbSRAM_I01l&COREAHbSram_I01L&CoreAhbSRAM_i01l&CoreAHBSram_i01L;
when "0010" =>
COREAhbSram_ILOL(3 downto 0) <= CoREAHBSram_i01L&CoreAhBSRAM_i01l&CoREAHBSram_i01L&CorEAHBSram_i01L;
when "0011" =>
COREAhbSram_ILOL(3 downto 0) <= COREAhbSram_I01L&COreAhbSrAM_I01l&COReAhbSraM_I01l&CoreAhBSRAM_i01l;
when "0100" =>
CoreAHBSram_iloL(7 downto 4) <= CoreAhbSRAM_i01l&COREAhbSram_I01L&CorEAHBSram_i01L&CoreAHBSRAm_i01l;
when "0101" =>
CoreAhbSRAM_ilol(7 downto 4) <= COReAhbSram_I01L&CoreAhbSRAM_I01l&COREAhbSram_I01L&CoreAHBSram_i01L;
when "0110" =>
COREAhbSram_ILOL(7 downto 4) <= CoreAhbSRAM_I01l&CoreAHBSRAm_i01l&CoreAhbSRAM_I01l&COReAhbSraM_I01l;
when "0111" =>
COReAhbSrAM_ILOl(7 downto 4) <= CoreAhbSRAM_i01l&CoREAHBSram_i01L&COreAhbSrAM_I01l&COREAHbSram_I01L;
when "1000" =>
COREAhbSram_ILOL(11 downto 8) <= CoreAHBSRam_i01L&CoreAHBSRam_i01l&CorEAHBSram_i01L&CoreAhbSRAM_i01l;
when "1001" =>
CoreAhbSRAM_ilol(11 downto 8) <= CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&CoreAHBSRam_i01l&CoreAhbSRAM_I01l;
when "1010" =>
CoreAhbSRAM_ilol(11 downto 8) <= CoreAhbSRAM_I01l&CoREAHBSram_i01L&COREAhbSram_I01L&CoreAhbSRAM_I01l;
when "1011" =>
COREAHBSram_iLOL(11 downto 8) <= CoreAhbSRAM_I01l&COREAhbSram_I01L&CoreAhbSRAM_I01l&COreAhBSRAM_i01l;
when "1100" =>
COReAhbSraM_ILOL(13 downto 12) <= CorEAHBSram_i01L&CoreAHBSram_i01L;
when "1101" =>
CoreAhbSRAM_Ilol(13 downto 12) <= CorEAHBSram_i01L&CoreAhbSRAM_I01l;
when "1110" =>
COReAhbSrAM_ILOl(14) <= COREAHbSram_i01L;
when "1111" =>
CoreAHBSRAm_ilol(7 downto 4) <= CoreAHBSRam_i01L&COReAhbSrAM_I01l&CoreAhBSRAM_i01L&CoreAHBSRAM_i01l;
when others =>
null
;
end case;
case (COREAHbSram_iO1(12 downto 9)) is
when "0000" =>
COreAhbSrAM_L0I <= COREAhbSram_L0LL(1 downto 0)&COREAhbSram_O0LL(1 downto 0)&COREAHbSram_iILL(1 downto 0)&CoREAHBSram_liLL(1 downto 0);
when "0001" =>
COreAhbSRAM_L0i <= COreAhbSrAM_L0Ll(1 downto 0)&COREAHbSram_O0LL(1 downto 0)&CoreAHBSRam_iilL(1 downto 0)&COreAhbSrAM_LIll(1 downto 0);
when "0010" =>
COreAhbSrAM_L0i <= COREAhbSram_L0LL(1 downto 0)&CoreAhbSRAM_O0ll(1 downto 0)&CoreAhbSRAM_Iill(1 downto 0)&COREAHbSram_LILL(1 downto 0);
when "0011" =>
COReAhbSrAM_L0I <= CoreAHBSRAm_l0ll(1 downto 0)&CoreAHBSRAm_o0ll(1 downto 0)&CoreAHBSRam_iilL(1 downto 0)&COreAhbSrAM_LILl(1 downto 0);
when "0100" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_i1ll(1 downto 0)&CoreAHBSRAM_l1ll(1 downto 0)&CoreAhbSRAM_O1ll(1 downto 0)&COreAhbSrAM_I0Ll(1 downto 0);
when "0101" =>
COreAhbSrAM_L0i <= COReAhbSraM_I1LL(1 downto 0)&CorEAHBSram_l1LL(1 downto 0)&CorEAHBSram_o1lL(1 downto 0)&COREAhbSram_I0LL(1 downto 0);
when "0110" =>
CoreAHBSRAm_l0i <= CoreAHBSRam_i1lL(1 downto 0)&COREAhbSraM_L1LL(1 downto 0)&CoreAHBSram_o1lL(1 downto 0)&CoreAhBSRAM_i0ll(1 downto 0);
when "0111" =>
COREAhbSram_L0I <= COREAhbSram_I1LL(1 downto 0)&CoREAHBSram_l1LL(1 downto 0)&COreAhbSrAM_O1ll(1 downto 0)&CoreAhBSRAM_i0ll(1 downto 0);
when "1000" =>
COReAhbSraM_L0I <= CoreAhbSRAM_OLil(1 downto 0)&CoreAhbSRAM_ioil(1 downto 0)&CoreAhbSRAM_loil(1 downto 0)&CoreAhBSRAM_ooil(1 downto 0);
when "1001" =>
CoREAHBSram_l0I <= CorEAHBSram_olIL(1 downto 0)&COreAhbSrAM_IOIl(1 downto 0)&COreAhbSrAM_LOIl(1 downto 0)&CoreAhbSRAM_OOil(1 downto 0);
when "1010" =>
COreAhbSrAM_L0I <= CoreAhbSRAM_olil(1 downto 0)&COREAHbSram_IOIL(1 downto 0)&CoREAHBSram_lOIL(1 downto 0)&CoreAHBSRam_ooiL(1 downto 0);
when "1011" =>
COreAhbSRAM_L0i <= CoreAHBSram_oliL(1 downto 0)&CoreAhbSRAM_IOil(1 downto 0)&CoreAhBSRAM_loil(1 downto 0)&CoreAhbSRAM_OOil(1 downto 0);
when "1100" =>
COReAhbSrAM_L0i <= CoREAHBSram_ilIL(3 downto 0)&CorEAHBSram_llIL(3 downto 0);
when "1101" =>
CoreAHBSRam_l0i <= CoREAHBSram_ilIL(3 downto 0)&CoREAHBSram_lLIL(3 downto 0);
when "1110" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_oiil;
when "1111" =>
CoreAHBSRAm_l0i <= CorEAHBSram_i1LL(1 downto 0)&COReAhbSraM_L1Ll(1 downto 0)&CoREAHBSram_o1LL(1 downto 0)&CoreAhbSRAM_I0ll(1 downto 0);
when others =>
null
;
end case;
when others =>
CoREAHbSram_oL1 <= "00";
COREAHbSram_lL1 <= "00";
COreAhbSrAM_IL1 <= "00";
CoreAhbSRAM_OI1 <= "00";
CoREAHBSram_li1 <= "00";
CoreAhbSRAM_Ii1 <= "00";
CoreAHBSRAm_o01 <= "00";
CorEAHBSram_l01 <= "00";
CoREAHBSram_i01 <= "01";
CoreAhBSRAM_o11 <= "01";
CoreAhBSRAM_l11 <= "01";
CoREAHBSram_i11 <= "01";
COREAhbSram_OOOL <= "10";
CoreAHBSRam_looL <= "10";
CoreAHBSram_iooL <= "11";
COreAhbSrAM_IIil <= CoREAHBSram_o0I(11 downto 0);
CoreAHBSRAM_o0il <= CoreAhbSRAM_o0i(11 downto 0);
CorEAHBSram_l0IL <= CoreAHBSRam_o0i(11 downto 0);
COREAHbSram_i0IL <= COREAHbSram_o0I(11 downto 0);
CoreAHBSRAm_o1il <= COReAhbSraM_O0I(11 downto 0);
CoreAhBSRam_l1il <= CoREAHBSram_o0I(11 downto 0);
CoreAhbSRAM_I1il <= COREAhbSram_O0I(11 downto 0);
CoreAhbSRAM_OO0l <= COreAhbSrAM_O0i(11 downto 0);
CoreAHBSram_lo0L <= '0'&CoreAHBSRam_o0i(10 downto 0);
CoreAhbSRAM_io0l <= '0'&CoreAhbSRAM_o0i(10 downto 0);
COreAhbSrAM_Ol0l <= '0'&CoreAHBSRam_o0i(10 downto 0);
COreAhbSrAM_LL0l <= '0'&CoreAhBSRAM_o0i(10 downto 0);
CoREAHBSram_il0L <= "00"&CoreAhbSRAM_o0i(9 downto 0);
CoreAhbSrAM_OI0l <= "00"&COreAhbSrAM_O0I(9 downto 0);
COREAHBSram_lI0L <= "000"&COReAhbSraM_O0I(8 downto 0);
CoreAhbSRAM_O00l <= CoreAhbSRAM_IIi(11 downto 0);
CoREAHBSram_l00L <= CoreAhbSRAM_Iii(11 downto 0);
CoreAHBSRAm_i00l <= COReAhbSraM_III(11 downto 0);
COReAhbSraM_O10L <= COReAhbSraM_III(11 downto 0);
CoreAhbSRAM_l10l <= COReAhbSrAM_III(11 downto 0);
COREAHbSram_I10L <= CoreAHBSRAm_iii(11 downto 0);
CoreAhbSRAM_oo1l <= CorEAHBSram_iiI(11 downto 0);
CoreAhbSRAM_lo1l <= CoreAhBSRAM_iii(11 downto 0);
CoREAHBSram_io1L <= '0'&COREAHbSram_III(10 downto 0);
CorEAHBSram_ol1L <= '0'&CoREAHBSram_iiI(10 downto 0);
COReAhbSraM_LL1l <= '0'&CoreAhbSRAM_Iii(10 downto 0);
COREAhbSraM_IL1L <= '0'&COREAHbSram_iII(10 downto 0);
COReAhbSraM_OI1l <= "00"&CoreAHBSRam_iii(9 downto 0);
COREAHbSram_lI1L <= "00"&CoreAhbSRAM_IIi(9 downto 0);
COREAhbSram_II1L <= "000"&CoreAhBSRAM_iii(8 downto 0);
COreAhbSrAM_OIOl(0) <= COREAhbSram_LII(0);
CoreAhbSRAM_liol(0) <= CoreAhBSRAM_lii(1);
CorEAHBSram_iiOL(0) <= CoreAhbSRAM_lii(2);
CoreAHBSRAm_o0ol(0) <= COREAhbSram_LII(3);
CorEAHBSram_l0oL(0) <= COREAHbSram_lII(4);
CoreAHBSRam_i0oL(0) <= COREAhbSram_LII(5);
CoREAHBSram_o1OL(0) <= CoreAhBSRAm_lii(6);
COREAhbSram_L1OL(0) <= COREAhbSraM_LII(7);
CoreAhbSRAM_I1ol(1 downto 0) <= COREAhbSram_LII(1 downto 0);
CorEAHBSram_oolL(1 downto 0) <= COREAhbSram_LII(3 downto 2);
COreAhbSrAM_LOll(1 downto 0) <= CoreAHBSRam_lii(5 downto 4);
COREAHbSram_iOLL(1 downto 0) <= CoreAHBSRam_lii(7 downto 6);
COReAhbSrAM_OLLl(3 downto 0) <= CoreAhbSRAM_lii(3 downto 0);
CoreAHBSRAm_llll(3 downto 0) <= COREAhbSram_LII(7 downto 4);
CorEAHBSram_ilLL <= CoreAhBSRAM_lii;
case (COREAhbSram_O0I(12 downto 9)) is
when "0000" =>
CoREAHBSram_lLOL(7 downto 0) <= CoreAhBSRAM_l01l&COreAhbSrAM_L01l&COREAhbSram_L01L&COReAhbSraM_L01l&COReAhbSraM_L01l&COreAhbSRAM_L01l&COreAhbSRAM_L01l&CoreAhBSRAM_l01l;
when "0001" =>
CoREAHBSram_lLOL(7 downto 0) <= CoreAHBSram_l01L&COReAhbSraM_L01l&CoreAhbSRAM_l01L&COREAhbSram_L01L&CoreAhbSRAM_L01l&CoreAHBSram_l01L&COREAhbSram_L01L&COREAhbSram_L01L;
when "0010" =>
CoreAhBSRAM_llol(7 downto 0) <= CorEAHBSram_l01L&COReAhbSraM_L01l&COREAhbSram_L01L&CoREAHBSram_l01L&CoreAhbSRAM_l01l&CoREAHBSram_l01L&CoreAHBSRam_l01L&CoREAHBSram_l01L;
when "0011" =>
CoreAHBSRAm_llol(7 downto 0) <= COREAhbSram_L01L&CoREAHBSram_l01L&COREAhbSram_L01L&COreAhbSRAM_L01l&COreAhbSRAM_L01l&CoREAHBSram_l01L&CoreAhbSRAM_l01l&CoREAHBSram_l01L;
when "0100" =>
COreAhbSrAM_LLOl(7 downto 0) <= CoreAhBSRAM_l01l&CoreAHBSRAm_l01l&COREAhbSram_L01L&COREAhbSram_L01L&CoreAHBSRam_l01l&CoREAHBSram_l01L&CoreAhbSRAM_L01l&CoreAhbSRAM_l01l;
when "0101" =>
CoREAHBSram_llOL(7 downto 0) <= CoreAhbSRAM_l01l&COReAhbSraM_L01l&COReAhbSraM_L01l&COREAHbSram_l01L&CoREAHBSram_l01L&CoREAHBSram_l01L&COREAhbSram_L01L&COREAhbSram_L01L;
when "0110" =>
COREAhbSram_LLOL(7 downto 0) <= COREAhbSraM_L01l&CoreAHBSRAm_l01l&COreAhbSRAM_L01l&CorEAHBSram_l01L&CoreAhbSRAM_l01l&CoreAhbSRAM_L01l&COreAhbSrAM_L01l&COReAhbSraM_L01L;
when "0111" =>
CoreAhbSRAm_llol(7 downto 0) <= CoreAhbSRAM_l01l&COREAhbSram_L01L&CoreAhBSRAM_l01l&CorEAHBSram_l01L&COReAhbSrAM_L01l&COREAhbSram_L01L&COReAhbSraM_L01l&CoreAhBSRAM_l01l;
when "1000" =>
CoREAHBSram_llOL(11 downto 8) <= COREAhbSram_L01L&COREAhbSraM_L01l&CoreAHBSRam_l01l&CorEAHBSram_l01L;
when "1001" =>
CoreAHBSRam_lloL(11 downto 8) <= COreAhbSrAM_L01l&CorEAHBSram_l01L&COReAhbSraM_L01L&COreAhbSRAM_L01l;
when "1010" =>
CoreAHBSRam_lloL(11 downto 8) <= COREAHBSram_l01L&COreAhbSrAM_L01l&COREAhbSram_L01L&CoreAhbSrAM_L01l;
when "1011" =>
CoreAhBSRAM_llol(11 downto 8) <= CoreAhBSRam_l01l&CoreAhBSRAM_l01l&COREAhbSram_L01L&CoreAhbSRAM_L01l;
when "1100" =>
CorEAHBSram_llOL(13 downto 12) <= CoreAHBSRAM_l01l&CoREAHBSram_l01L;
when "1101" =>
COReAhbSraM_LLOL(13 downto 12) <= COREAhbSram_L01L&CoreAHBSRam_l01l;
when "1110" =>
CoreAhBSRAm_llol(14) <= CoreAHBSRam_l01l;
when "1111" =>
CorEAHBSRam_lloL(7 downto 0) <= CoreAHBSRAm_l01l&CorEAHBSram_l01L&CoreAhbSRAM_L01l&CorEAHBSram_l01L&CoREAHBSram_l01L&COReAhbSram_L01L&COREAhbSram_L01L&CoreAhbSRAM_L01l;
when others =>
null
;
end case;
case (CoREAHbSram_III(12 downto 9)) is
when "0000" =>
COREAhbSram_ILOL(7 downto 0) <= CoreAHBSram_i01L&COREAHbSram_i01L&CorEAHBSram_i01L&CoREAHBSram_i01L&COREAhbSram_I01L&COREAhbSram_I01L&CorEAHBSram_i01L&COreAhbSRAM_I01l;
when "0001" =>
CoreAhbSRAM_ilol(7 downto 0) <= COREAhbSram_I01L&CoreAhBSRAM_i01l&CoreAHBSRam_i01l&COReAhbSraM_I01l&CoreAHBSRam_i01L&CoreAhBSRAM_i01l&CoreAHBSRam_i01L&COREAhbSram_I01L;
when "0010" =>
CoreAHBSRAm_ilol(7 downto 0) <= CoreAhBSRAM_i01l&COREAhbSram_I01L&CoreAhbSRAM_i01l&CoreAHBSRam_i01L&COREAhbSram_I01l&CorEAHBSram_i01L&COreAhbSrAM_I01l&COREAhbSram_I01L;
when "0011" =>
COreAhbSrAM_ILOl(7 downto 0) <= CoreAHBSRam_i01L&COREAhbSraM_I01l&COREAhbSram_I01L&CorEAHBSram_i01L&CoreAHBSRAm_i01l&CoreAhbSRAM_i01l&COREAHbSram_I01L&CoreAhbSRAM_I01l;
when "0100" =>
CoREAHBSram_ilOL(7 downto 0) <= CorEAHBSram_i01L&CoreAhbSRAM_I01l&CoreAhBSRAM_i01l&CoreAHBSRAm_i01l&CoreAhBSRAM_i01l&CoREAHBSram_i01L&CoreAHBSRam_i01l&CoreAhBSRAm_i01l;
when "0101" =>
CoreAhbSRAM_ilol(7 downto 0) <= CoreAhBSRAM_i01l&COREAhbSram_I01L&COReAhbSraM_I01l&CoreAhBSRAm_i01l&COREAhbSraM_I01l&CoreAhbSRAM_I01l&CorEAHBSram_i01L&CoreAHBSRam_i01L;
when "0110" =>
COREAHbSram_iLOL(7 downto 0) <= CoreAhbSRAM_I01l&COREAHbSram_i01L&COReAhbSrAM_I01l&CoreAhbSRAM_i01l&CoreAHBSRam_i01L&CoreAHBSRAm_i01l&CoreAHBSRAM_i01l&COreAhbSrAM_I01l;
when "0111" =>
CoreAhBSRAM_ilol(7 downto 0) <= CoreAHBSRam_i01l&CoreAhBSRAM_i01l&COREAhbSram_I01L&COREAhbSraM_I01l&CoreAHBSRAm_i01l&COREAHbSram_i01L&COREAhbSram_I01L&COREAHbSram_I01L;
when "1000" =>
CoreAhBSRAM_ilol(11 downto 8) <= CoreAhbSRAM_i01l&CoreAhBSRAM_i01l&CoreAhbSRAM_i01l&CoreAHBSRam_i01L;
when "1001" =>
CoreAhbSRAM_ilol(11 downto 8) <= COREAhbSram_I01L&CoreAhBSRAM_i01l&CoREAHBSram_i01L&COreAhbSRAM_I01l;
when "1010" =>
CoreAHBSram_iloL(11 downto 8) <= COReAhbSraM_I01l&COREAHBSram_i01L&CoreAHBSRAm_i01l&COREAHbSram_i01L;
when "1011" =>
CoreAhBSRAM_ilol(11 downto 8) <= CoreAhbSRAM_I01l&CoREAHBSram_i01L&CoREAHBSram_i01L&CoREAHBSram_i01L;
when "1100" =>
COREAhbSram_ILOL(13 downto 12) <= CoreAhBSRAM_i01l&CorEAHBSram_i01L;
when "1101" =>
CoreAhbSRAM_ilol(13 downto 12) <= COREAHbSram_I01L&COReAhbSraM_I01l;
when "1110" =>
COreAhbSrAM_ILol(14) <= COREAHbSram_I01L;
when "1111" =>
COreAhbSrAM_ILol(7 downto 0) <= COreAhbSrAM_I01l&COREAhbSram_I01L&COReAhbSraM_I01l&CoREAHBSram_i01L&CoreAHBSRam_i01L&COREAHBSram_i01L&CoreAHBSRam_i01L&COreAhbSrAM_I01l;
when others =>
null
;
end case;
case (CoreAhbSRAM_Io1(12 downto 9)) is
when "0000" =>
CoreAHBSram_l0I <= COreAhbSrAM_I1Ll(0)&COREAhbSraM_L1LL(0)&CorEAHBSram_o1LL(0)&CoreAhbSRAM_i0ll(0)&CorEAHBSram_l0lL(0)&CoreAhBSRAM_o0ll(0)&CoreAHBSRAM_iill(0)&COreAhbSrAM_LILl(0);
when "0001" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_i1ll(0)&COREAhbSram_L1LL(0)&COReAhbSram_O1LL(0)&COReAhbSraM_I0LL(0)&COREAHbSram_L0LL(0)&COREAhbSram_O0LL(0)&CoreAHBSRAM_iill(0)&CoreAHBSRam_lilL(0);
when "0010" =>
COREAhbSram_L0I <= CoreAhBSRAm_i1ll(0)&CoREAHBSram_l1LL(0)&COReAhbSraM_O1Ll(0)&COREAhbSraM_I0Ll(0)&CoreAhbSRAM_l0ll(0)&COREAhbSram_O0LL(0)&COREAhbSram_IILL(0)&CorEAHBSram_liLL(0);
when "0011" =>
COreAhbSrAM_L0i <= CoREAHBSram_i1LL(0)&COReAhbSraM_L1LL(0)&CoreAHBSRAm_o1ll(0)&CoreAhBSRAm_i0ll(0)&CoreAhbSRAM_L0ll(0)&COREAhbSraM_O0LL(0)&CoREAHBSram_iiLL(0)&CoreAhbSRAM_LIll(0);
when "0100" =>
CoreAhBSRAm_l0i <= CoreAHBSRam_i1lL(0)&CoreAhBSRAM_l1ll(0)&CoreAHBSRAm_o1ll(0)&CorEAHBSram_i0lL(0)&CoreAhbSRAM_L0ll(0)&CoreAhBSRAM_o0ll(0)&CorEAHBSram_iilL(0)&COREAhbSram_LILL(0);
when "0101" =>
COREAhbSram_l0I <= CoreAhbSRAM_I1ll(0)&CoreAHBSRAM_l1ll(0)&CoreAhbSRAM_O1ll(0)&CoreAhBSRAM_i0ll(0)&COREAHbSram_L0LL(0)&CoreAhBSRAM_o0ll(0)&COREAhbSram_IILL(0)&COREAhbSram_LILL(0);
when "0110" =>
COReAhbSraM_L0I <= CoreAhbSRAM_I1ll(0)&COREAHbSram_l1LL(0)&CoREAHbSram_o1LL(0)&COreAhbSRAM_I0ll(0)&CoreAHBSRam_l0ll(0)&CoreAHBSRam_o0ll(0)&COREAHbSram_iILL(0)&COREAhbSram_LILL(0);
when "0111" =>
COReAhbSram_L0I <= CoreAHBSRAm_i1ll(0)&CoreAhBSRAM_l1ll(0)&CoreAhbSrAM_O1ll(0)&CoreAhbSRAM_I0ll(0)&CoreAhbSRAM_L0ll(0)&CorEAHBSram_o0lL(0)&CoreAhBSRAM_iill(0)&CoreAhBSRAM_lill(0);
when "1000" =>
CoreAHBSRam_l0i <= CoreAhbSRAM_Olil(1 downto 0)&COREAhbSram_IOIL(1 downto 0)&CoreAhbSrAM_LOil(1 downto 0)&COREAhbSram_OOIL(1 downto 0);
when "1001" =>
COREAhbSraM_L0I <= CoreAhbSRAM_olil(1 downto 0)&CoreAhBSRAM_ioil(1 downto 0)&CoreAhbSRAM_LOil(1 downto 0)&COREAhbSram_OOIL(1 downto 0);
when "1010" =>
COREAHbSram_l0I <= CoreAHBSRAM_olil(1 downto 0)&COReAhbSraM_IOIL(1 downto 0)&COReAhbSraM_LOIL(1 downto 0)&CoreAHBSRAm_ooil(1 downto 0);
when "1011" =>
CoreAhbSRAM_l0i <= CoreAHBSRam_olil(1 downto 0)&COReAhbSraM_IOIL(1 downto 0)&COREAhbSram_LOIL(1 downto 0)&CoreAHBSRAm_ooil(1 downto 0);
when "1100" =>
COreAhbSrAM_L0I <= COReAhbSraM_ILIL(3 downto 0)&COREAHbSram_lLIL(3 downto 0);
when "1101" =>
CoreAhbSRAM_L0i <= COreAhbSrAM_ILIl(3 downto 0)&COREAHbSram_lLIL(3 downto 0);
when "1110" =>
CoreAhbSRAM_L0i <= CoreAHBSRam_oiil;
when "1111" =>
CoreAhBSRAm_l0i <= CorEAHBSram_i1lL(0)&CoreAhBSRAM_l1ll(0)&COREAhbSram_O1LL(0)&CoreAhBSRAM_i0ll(0)&CoreAhbSRAM_l0ll(0)&CoREAHBSram_o0LL(0)&CoreAHBSRam_iill(0)&COREAhbSram_LILL(0);
when others =>
null
;
end case;
end case;
when others =>
case (CoreAhbSRam_lo1) is
when 8 =>
COREAHBSram_ol1 <= "11";
CoreAhbSRAM_Ll1 <= "11";
COREAhbSram_IL1 <= "11";
COREAhbSram_OI1 <= "11";
COReAhbSraM_LI1 <= "11";
COREAhbSram_II1 <= "11";
CoreAhbSRAM_O01 <= "11";
COReAhbSraM_L01 <= "11";
COreAhbSrAM_I01 <= "11";
CoREAHBSram_o11 <= "11";
COREAhbSram_L11 <= "11";
COreAhbSrAM_I11 <= "11";
COreAhbSraM_OOOL <= "11";
COREAHBSram_lOOL <= "11";
COreAhbSrAM_IOOl <= "11";
CoreAhbSRAM_olol <= "11";
CoreAhBSRAM_iiil <= "000"&COREAhbSram_o0I(8 downto 0);
CoreAhbSRAM_O0il <= "000"&CoREAHBSram_o0I(8 downto 0);
CoREAHBSram_l0IL <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CoREAHBSram_i0IL <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COreAhbSrAM_O1Il <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CoreAhBSRAM_l1il <= "000"&CorEAHBSram_o0I(8 downto 0);
CoreAHBSRam_i1il <= "000"&CoreAhbSRAM_o0i(8 downto 0);
COREAhbSram_OO0L <= "000"&CoreAhbSRAM_O0i(8 downto 0);
CorEAHBSram_lo0L <= "000"&CorEAHBSram_o0i(8 downto 0);
CoreAhbSRAM_io0l <= "000"&CoreAHBSRAm_o0i(8 downto 0);
CoreAhBSRAM_ol0l <= "000"&CoREAHBSram_o0I(8 downto 0);
CoreAhBSRAM_ll0l <= "000"&CoreAHBSRAm_o0i(8 downto 0);
COreAhbSrAM_IL0l <= "000"&CoreAhbSRAM_o0i(8 downto 0);
CoreAhbSRAM_Oi0l <= "000"&CoreAHBSRAM_o0i(8 downto 0);
CoreAhbSRAM_Li0l <= "000"&CorEAHBSram_o0i(8 downto 0);
COREAHbSram_iI0L <= "000"&CoreAhbSRAM_O0i(8 downto 0);
COREAhbSram_O00L <= "000"&CoreAhBSRAM_iii(8 downto 0);
CoreAHBSRAM_l00l <= "000"&CoreAhbSRAM_IIi(8 downto 0);
CoREAHBSram_i00L <= "000"&CoreAHBSRAm_iii(8 downto 0);
COreAhbSraM_O10l <= "000"&COReAhbSraM_III(8 downto 0);
COreAhbSrAM_L10l <= "000"&CoreAhBSRAM_iii(8 downto 0);
COREAhbSram_I10L <= "000"&COreAhbSrAM_IIi(8 downto 0);
CoreAHBSRAM_oo1l <= "000"&CoreAhbSRAM_IIi(8 downto 0);
CoreAHBSRam_lo1L <= "000"&CoreAhBSRAm_iii(8 downto 0);
CoREAHBSram_io1L <= "000"&COReAhbSraM_III(8 downto 0);
CoreAHBSRAm_ol1l <= "000"&COREAHbSram_iII(8 downto 0);
CoreAHBSRam_ll1l <= "000"&COReAhbSraM_III(8 downto 0);
CoreAhbSRAm_il1l <= "000"&CoreAhbSRAM_iii(8 downto 0);
COreAhbSrAM_OI1l <= "000"&COreAhbSrAM_III(8 downto 0);
COReAhbSrAM_LI1l <= "000"&CoreAHBSRAm_iii(8 downto 0);
COREAhbSraM_II1L <= "000"&COReAhbSraM_III(8 downto 0);
CoreAHBSRam_o01l <= "000"&COreAhbSRAM_IIi(8 downto 0);
COREAhbSram_OIOL <= COReAhbSraM_LII;
COreAhbSrAM_LIOl <= CoreAHBSRAm_lii;
COReAhbSraM_IIOl <= COReAhbSraM_LII;
COreAhbSrAM_O0ol <= COReAhbSraM_LII;
CoreAHBSram_l0oL <= CoreAhBSRAM_lii;
COREAhbSram_I0OL <= COreAhbSraM_LII;
CoREAHBSram_o1OL <= CoreAHBSRAm_lii;
CoreAhBSRAM_l1ol <= COReAhbSraM_LII;
COREAHBSram_i1OL <= COREAHbSram_lII;
COREAhbSram_OOLL <= COReAhbSraM_LII;
CoreAhbSRAM_LOll <= CoreAhbSRAM_Lii;
CoreAhbSRAM_ioll <= CoreAhBSRAm_lii;
COReAhbSraM_OLLL <= CoreAhBSRAM_lii;
CoreAHBSRam_llll <= CoreAHBSram_lii;
CorEAHBSram_ilLL <= CoreAhBSRAm_lii;
CoreAhBSRAm_oill <= CoREAHBSram_liI;
case (CoreAhBSRAM_o0i(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_llol(0) <= COREAhbSram_L01L;
when "0001" =>
CoreAhBSRAM_llol(1) <= CoreAHBSRAm_l01l;
when "0010" =>
COReAhbSrAM_LLOl(2) <= CoreAhbSRAM_L01l;
when "0011" =>
CoREAHBSram_llOL(3) <= CoreAhbSRAM_l01l;
when "0100" =>
COREAhbSram_LLOL(4) <= CoreAHBSRam_l01L;
when "0101" =>
CoreAhbSRAM_Llol(5) <= CoreAHBSRAM_l01l;
when "0110" =>
COReAhbSrAM_LLOl(6) <= CoreAhbSRAM_L01l;
when "0111" =>
COREAhbSram_LLOL(7) <= COReAhbSraM_L01l;
when "1000" =>
CoreAhbSRAM_Llol(8) <= CoreAhbSRAM_L01l;
when "1001" =>
CoreAHBSRAm_llol(9) <= COREAhbSraM_L01l;
when "1010" =>
CoreAhbSRAM_llol(10) <= CorEAHBSram_l01L;
when "1011" =>
COreAhbSrAM_LLol(11) <= CoreAhbSRAM_L01l;
when "1100" =>
CoreAhbSRAM_llol(12) <= CorEAHBSram_l01L;
when "1101" =>
COREAhbSram_LLOL(13) <= CoreAhBSRAM_l01l;
when "1110" =>
COReAhbSraM_LLOl(14) <= COreAhbSrAM_L01l;
when "1111" =>
CoreAhBSRAM_llol(15) <= CoreAhbSRAM_l01l;
when others =>
null
;
end case;
case (COreAhbSrAM_III(12 downto 9)) is
when "0000" =>
CoREAHbSram_iLOL(0) <= CoreAhbSRAM_i01l;
when "0001" =>
CoreAhbSRAM_Ilol(1) <= CorEAHBSram_i01L;
when "0010" =>
CoreAHBSRAm_ilol(2) <= COREAhbSraM_I01l;
when "0011" =>
COREAHbSram_ILOL(3) <= CoreAHBSram_i01L;
when "0100" =>
CoreAHBSRam_ilol(4) <= COReAhbSraM_I01l;
when "0101" =>
CoreAhbSRAM_Ilol(5) <= COREAHbSram_i01L;
when "0110" =>
CoreAhbSRAM_Ilol(6) <= CoreAHBSRam_i01l;
when "0111" =>
CoreAhbSRAM_ilol(7) <= CoREAHBSram_i01L;
when "1000" =>
COreAhbSrAM_ILOl(8) <= COREAhbSram_I01L;
when "1001" =>
CoreAhbSRAM_ilol(9) <= CoreAhBSRAM_i01l;
when "1010" =>
COreAhbSRAM_ILol(10) <= CoreAHBSRam_i01l;
when "1011" =>
CoreAHBSRAm_ilol(11) <= CoREAHBSram_i01L;
when "1100" =>
CorEAHBSram_iloL(12) <= COReAhbSraM_I01l;
when "1101" =>
CoreAhBSRAM_ilol(13) <= COReAhbSraM_I01l;
when "1110" =>
CoreAhbSRAM_Ilol(14) <= CoreAHBSRam_i01l;
when "1111" =>
COreAhbSrAM_ILol(15) <= CoreAhbSRAM_I01l;
when others =>
null
;
end case;
case (CoREAHbSram_iO1(12 downto 9)) is
when "0000" =>
COREAhbSram_L0I <= COReAhbSraM_LILl;
when "0001" =>
COreAhbSRAM_L0i <= CorEAHBSram_iiLL;
when "0010" =>
CoreAHBSram_l0i <= COREAHbSram_O0LL;
when "0011" =>
CoreAHBSRAm_l0i <= CoreAhbSRAM_L0ll;
when "0100" =>
COREAhbSram_L0I <= CorEAHBSram_i0LL;
when "0101" =>
COreAhbSRAM_L0i <= CoreAhBSRAM_o1ll;
when "0110" =>
COreAhbSrAM_L0I <= CorEAHBSram_l1LL;
when "0111" =>
CoreAhbSRAM_l0i <= COReAhbSrAM_I1ll;
when "1000" =>
COreAhbSrAM_L0I <= CorEAhbSram_OOIL;
when "1001" =>
COreAhbSrAM_L0i <= COreAhbSrAM_loil;
when "1010" =>
CoreAhBSRAM_l0i <= COREAhbSram_IOIL;
when "1011" =>
CoreAhbSRAM_L0i <= CoreAhbSrAM_OLIl;
when "1100" =>
CoreAhBSRAM_l0i <= CoreAhbSRAM_LLil;
when "1101" =>
CoreAhbSRAM_l0i <= CoreAhBSRAM_iliL;
when "1110" =>
CoreAHBSRam_l0i <= COreAhbSRAM_OIil;
when "1111" =>
CorEAHBSram_l0I <= COREAhbSram_LIIL;
when others =>
null
;
end case;
when 4 =>
COREAhbSram_OL1 <= "10";
COREAhbSraM_LL1 <= "10";
CoreAHBSRAM_il1 <= "10";
CoreAhbSRAM_Oi1 <= "10";
COReAhbSraM_LI1 <= "10";
CoreAhbSRAM_Ii1 <= "10";
COreAhbSrAM_O01 <= "10";
CoreAHBSRAm_l01 <= "10";
COReAhbSraM_I01 <= "10";
COreAhbSrAM_O11 <= "10";
CoREAHBSram_l11 <= "10";
COREAhbSraM_I11 <= "10";
CoreAhbSRAM_Oool <= "10";
CoreAhBSRAM_lool <= "10";
COREAhbSram_IOOL <= "10";
CoREAHBSram_olOL <= "10";
COREAhbSram_IIIL <= "00"&COReAhbSraM_O0I(9 downto 0);
COREAhbSram_O0IL <= "00"&COREAhbSram_O0I(9 downto 0);
COReAhbSraM_L0Il <= "00"&CoreAHBSRam_o0i(9 downto 0);
COReAhbSraM_I0Il <= "00"&CoreAHBSRAM_o0i(9 downto 0);
CoreAhbSRAM_O1il <= "00"&CoreAhBSRAM_o0i(9 downto 0);
COREAhbSraM_L1Il <= "00"&COREAhbSram_O0I(9 downto 0);
CoreAHBSram_i1iL <= "00"&CoreAhbSRAM_o0i(9 downto 0);
COREAHbSram_oO0L <= "00"&COreAhbSrAM_O0I(9 downto 0);
CorEAHBSram_lo0L <= "00"&CorEAHBSram_o0I(9 downto 0);
COREAHBSram_iO0L <= "00"&CorEAHBSram_o0I(9 downto 0);
CoREAHBSram_ol0L <= "00"&CoreAhbSRAM_O0i(9 downto 0);
CoreAhBSRAM_ll0l <= "00"&CoreAhbSRAM_O0i(9 downto 0);
CoreAhbSrAM_IL0l <= "00"&COREAhbSram_O0I(9 downto 0);
COREAhbSram_OI0L <= "00"&CoreAhbSRAM_O0i(9 downto 0);
COreAhbSrAM_LI0l <= "00"&COReAhbSrAM_O0I(9 downto 0);
COReAhbSraM_II0l <= "00"&COREAhbSraM_O0I(9 downto 0);
CoreAhBSRAM_o00l <= "00"&CoreAHBSRAm_iii(9 downto 0);
COREAHBSram_l00L <= "00"&CoreAhbSRAM_IIi(9 downto 0);
CoreAhbSRAM_i00l <= "00"&COREAhbSram_III(9 downto 0);
COreAHBSRAm_o10l <= "00"&CoreAhbSRAM_iii(9 downto 0);
CoreAhbSRAM_L10l <= "00"&CoREAHBSram_iII(9 downto 0);
COREAHbSram_i10L <= "00"&COReAhbSraM_III(9 downto 0);
CoreAhBSRAM_oo1l <= "00"&CoreAHBSRam_iiI(9 downto 0);
CoreAhbSRAM_lo1l <= "00"&CoreAhbSRAM_IIi(9 downto 0);
CoreAHBSRAm_io1l <= "00"&CoreAHBSRAm_iii(9 downto 0);
COREAHbSram_oL1L <= "00"&COREAhbSram_III(9 downto 0);
CoreAhbSRAM_Ll1l <= "00"&COreAhbSrAM_IIi(9 downto 0);
CoreAHBSRAm_il1l <= "00"&CoreAhbSRAM_Iii(9 downto 0);
COREAhbSram_OI1L <= "00"&CoreAhBSRAM_iii(9 downto 0);
CoreAhbSRAM_Li1l <= "00"&CoreAhBSRAM_iii(9 downto 0);
COREAhbSram_II1L <= "00"&CoreAHBSRam_iii(9 downto 0);
COREAhbSram_O01L <= "00"&CoreAhbSRAM_Iii(9 downto 0);
CoreAhbSRAM_Oiol(3 downto 0) <= CoreAHBSRAm_lii(3 downto 0);
COREAhbSram_LIOL(3 downto 0) <= CoREAHBSram_lII(7 downto 4);
COREAhbSram_IIOL(3 downto 0) <= COREAhbSram_LII(3 downto 0);
COREAhbSram_O0OL(3 downto 0) <= COreAhbSrAM_LIi(7 downto 4);
COREAhbSram_L0OL(3 downto 0) <= CoreAHBSRAm_lii(3 downto 0);
CorEAHBSram_i0OL(3 downto 0) <= CoREAHBSram_liI(7 downto 4);
COReAhbSraM_O1OL(3 downto 0) <= CorEAHBSram_liI(3 downto 0);
CorEAHBSram_l1oL(3 downto 0) <= COREAhbSram_LII(7 downto 4);
CoreAhbSRAM_i1ol(3 downto 0) <= COREAhbSram_LII(3 downto 0);
CoreAHBSRam_oolL(3 downto 0) <= CoreAhbSRAM_LIi(7 downto 4);
CoreAhbSRAM_Loll(3 downto 0) <= CoreAhbSRAM_lii(3 downto 0);
COreAhbSrAM_IOll(3 downto 0) <= CoreAhbSRAM_LIi(7 downto 4);
COREAhbSram_OLLL(3 downto 0) <= CoreAHBSRAm_lii(3 downto 0);
COREAhbSram_LLLl(3 downto 0) <= COReAhbSraM_LII(7 downto 4);
CoREAHBSram_ilLL(3 downto 0) <= CoreAHBSram_liI(3 downto 0);
COreAhbSRAM_OIll(3 downto 0) <= COreAhbSrAM_LII(7 downto 4);
case (COReAhbSraM_O0I(12 downto 9)) is
when "0000" =>
CoreAHBSram_lloL(1 downto 0) <= CoreAhbSRAM_l01l&COREAhbSram_L01L;
when "0001" =>
CoreAhBSRAM_llol(1 downto 0) <= COreAhbSrAM_L01l&COREAhbSram_L01L;
when "0010" =>
COREAHbSram_lLOL(3 downto 2) <= CoreAhbSRAM_L01l&CoreAhbSRAM_l01l;
when "0011" =>
CoreAHBSRam_lloL(3 downto 2) <= CoREAHBSram_l01L&COREAHbSram_l01L;
when "0100" =>
CoreAHBSram_lloL(5 downto 4) <= CoreAhBSRAm_l01l&CorEAHBSram_l01L;
when "0101" =>
COReAhbSraM_LLOL(5 downto 4) <= CoREAHBSram_l01L&CoreAHBSRam_l01L;
when "0110" =>
COreAhbSrAM_LLol(7 downto 6) <= CoreAHBSRam_l01l&COREAHbSram_L01L;
when "0111" =>
COREAhbSram_LLOL(7 downto 6) <= COREAHbSram_l01L&COreAhbSrAM_L01l;
when "1000" =>
CoreAhBSRAM_llol(9 downto 8) <= CoreAhBSRAM_l01l&CoREAHBSram_l01L;
when "1001" =>
COReAhbSraM_LLOL(9 downto 8) <= COReAhbSraM_L01l&CoreAHBSRam_l01l;
when "1010" =>
CoREAhbSram_LLOL(11 downto 10) <= COREAhbSram_L01L&COREAhbSram_L01L;
when "1011" =>
CorEAHBSram_llOL(11 downto 10) <= CoreAhBSRAm_l01l&COReAhbSraM_L01L;
when "1100" =>
COReAhbSrAM_LLOl(13 downto 12) <= CoreAhbSRAM_l01l&COReAhbSrAM_L01l;
when "1101" =>
CoreAhbSRAM_llol(13 downto 12) <= COReAhbSraM_L01l&CoreAhbSRAM_l01l;
when "1110" =>
CoreAhbSRAM_Llol(15 downto 14) <= CoreAhBSRAm_l01l&CorEAHBSRam_l01L;
when "1111" =>
CorEAHBSram_lLOL(15 downto 14) <= COREAhbSram_L01L&CoreAHBSRAm_l01l;
when others =>
null
;
end case;
case (COREAhbSram_III(12 downto 9)) is
when "0000" =>
CoREAHbSram_iLOL(1 downto 0) <= COReAhbSraM_I01L&CoreAhBSRAM_i01l;
when "0001" =>
COREAhbSram_ILOL(1 downto 0) <= COREAhbSraM_I01L&CoreAHBSRAm_i01l;
when "0010" =>
CoreAHBSram_iloL(3 downto 2) <= CoreAhbSRAM_i01l&CoreAhBSRAM_i01l;
when "0011" =>
COREAhbSram_ILOL(3 downto 2) <= COReAhbSraM_I01l&CoreAhbSRAM_i01l;
when "0100" =>
CoREAHbSram_iLOL(5 downto 4) <= CoREAHBSram_i01L&CorEAHBSram_i01L;
when "0101" =>
CorEAHBSram_iloL(5 downto 4) <= CorEAHBSram_i01L&CoreAhbSRAM_i01l;
when "0110" =>
CoreAhbSRAM_ilol(7 downto 6) <= COREAhbSram_I01L&COreAhbSrAM_I01l;
when "0111" =>
CoREAHbSram_iLOL(7 downto 6) <= COreAhbSrAM_I01l&CoreAhbSRAM_I01l;
when "1000" =>
CoreAHBSram_ilOL(9 downto 8) <= COREAhbSram_I01L&CoreAHBSRam_i01L;
when "1001" =>
CoreAhbSRAM_ilol(9 downto 8) <= CoreAHBSRAm_i01l&COREAhbSram_I01L;
when "1010" =>
COreAhbSRAM_ILol(11 downto 10) <= CoreAHBSRAm_i01l&CorEAHBSram_i01L;
when "1011" =>
CoreAHBSram_ilOL(11 downto 10) <= COREAHbSram_i01L&COreAhbSrAM_I01l;
when "1100" =>
COreAhbSrAM_ILOl(13 downto 12) <= CoreAhbSRAM_i01l&COREAhbSram_I01L;
when "1101" =>
COREAhbSram_ILOL(13 downto 12) <= CoreAHBSram_i01L&CorEAHBSram_i01L;
when "1110" =>
CoreAhBSRAM_ilol(15 downto 14) <= COReAhbSraM_I01l&CoreAhBSRAM_i01l;
when "1111" =>
CorEAHBSram_ilOL(15 downto 14) <= COREAHbSram_i01L&COReAhbSraM_I01l;
when others =>
null
;
end case;
case (COREAHbSram_IO1(12 downto 9)) is
when "0000" =>
COreAhbSrAM_L0I <= CoreAhbSRAM_Iill(3 downto 0)&CoreAhBSRAM_lill(3 downto 0);
when "0001" =>
CoreAhbSRAM_l0i <= COreAhbSrAM_IILl(3 downto 0)&COReAhbSraM_LILL(3 downto 0);
when "0010" =>
COREAhbSram_L0I <= CoreAhbSRAM_L0ll(3 downto 0)&CoreAhbSRAM_o0ll(3 downto 0);
when "0011" =>
CoreAHBSRam_l0i <= CoreAhbSRAM_L0ll(3 downto 0)&CoreAHBSRAm_o0ll(3 downto 0);
when "0100" =>
CoreAHBSram_l0I <= CoreAhbSRAM_O1ll(3 downto 0)&CoreAhBSRAM_i0ll(3 downto 0);
when "0101" =>
CoreAHBSRam_l0i <= CoreAHBSRAm_o1ll(3 downto 0)&CoREAHBSram_i0LL(3 downto 0);
when "0110" =>
COREAhbSram_L0I <= CoreAhbSrAM_I1ll(3 downto 0)&CoreAhBSRAM_l1ll(3 downto 0);
when "0111" =>
CoreAhBSRAM_l0i <= CoreAhbSRAM_I1ll(3 downto 0)&CoreAhBSRam_l1ll(3 downto 0);
when "1000" =>
COreAhbSrAM_L0i <= CoREAhbSram_LOIL(3 downto 0)&CoreAhbSRAM_Ooil(3 downto 0);
when "1001" =>
COREAhbSram_L0I <= COREAhbSram_LOIL(3 downto 0)&COreAhbSrAM_OOil(3 downto 0);
when "1010" =>
CoreAhbSRAM_L0i <= CoreAhbSRAM_OLil(3 downto 0)&CorEAHBSram_ioIL(3 downto 0);
when "1011" =>
CoreAHBSRam_l0i <= COreAhbSraM_OLIl(3 downto 0)&CoREAHBSram_ioIL(3 downto 0);
when "1100" =>
CoreAHBSRam_l0i <= COReAhbSrAM_ILIl(3 downto 0)&CoreAhBSRAM_llil(3 downto 0);
when "1101" =>
CoreAHBSram_l0I <= COREAHbSram_iLIL(3 downto 0)&COREAHbSram_lLIL(3 downto 0);
when "1110" =>
CoreAHBSRam_l0i <= COReAhbSraM_LIIL(3 downto 0)&CoreAhBSRAM_oiil(3 downto 0);
when "1111" =>
COReAhbSraM_L0I <= CoreAhbSRAM_liil(3 downto 0)&COREAhbSram_OIIL(3 downto 0);
when others =>
null
;
end case;
when 2 =>
CoreAHBSRAM_ol1 <= "01";
CoreAhbSRAM_LL1 <= "01";
CoREAHBSram_il1 <= "01";
CoreAhbSRAM_Oi1 <= "01";
CoreAhbSRAM_li1 <= "01";
COreAhbSrAM_II1 <= "01";
CoreAhbSRAM_o01 <= "01";
CoreAHBSRam_l01 <= "01";
COREAhbSram_I01 <= "01";
CoreAhbSRAM_o11 <= "01";
CoREAHBSram_l11 <= "01";
CoreAhbSRAM_I11 <= "01";
COREAhbSram_OOOL <= "01";
COREAhbSraM_LOOl <= "01";
CoreAhbSRAM_Iool <= "01";
CoreAhbSRAM_Olol <= "01";
CorEAHBSram_iiIL <= '0'&COREAhbSram_O0I(10 downto 0);
COREAhbSraM_O0IL <= '0'&CoreAhbSRAM_O0i(10 downto 0);
COreAhbSrAM_L0il <= '0'&CoreAhBSRAM_o0i(10 downto 0);
CoreAhBSRAM_i0il <= '0'&COREAhbSram_O0I(10 downto 0);
CoreAhbSRAM_O1il <= '0'&COREAHbSram_o0I(10 downto 0);
CoreAHBSRAM_l1il <= '0'&CoreAhBSRAM_o0i(10 downto 0);
CoREAHBSram_i1IL <= '0'&CorEAHBSram_o0i(10 downto 0);
COreAhbSrAM_OO0l <= '0'&COReAhbSraM_O0I(10 downto 0);
CoREAHBSram_lo0L <= '0'&CoREAHBSram_o0I(10 downto 0);
COReAhbSraM_IO0L <= '0'&CoreAhBSRAM_o0i(10 downto 0);
CoreAhbSRAM_Ol0l <= '0'&COReAhbSraM_O0I(10 downto 0);
CoreAhBSRAM_ll0l <= '0'&CoreAHBSRAm_o0i(10 downto 0);
CoreAHBSRAm_il0l <= '0'&CoreAHBSRam_o0i(10 downto 0);
CoREAHBSram_oi0L <= '0'&COreAhbSrAM_O0i(10 downto 0);
CoreAhbSRAM_li0l <= '0'&CoREAHBSram_o0I(10 downto 0);
COREAHbSram_iI0L <= '0'&CoreAHBSram_o0i(10 downto 0);
CoreAhbSRAM_o00l <= '0'&COREAhbSram_III(10 downto 0);
COREAhbSram_L00L <= '0'&CoreAHBSram_iii(10 downto 0);
CoreAhbSRAM_i00l <= '0'&CoreAhbSRAM_Iii(10 downto 0);
COReAhbSrAM_O10l <= '0'&CoreAHBSRAm_iii(10 downto 0);
CoreAhbSRAM_L10l <= '0'&CoREAhbSram_III(10 downto 0);
COReAhbSraM_I10l <= '0'&COREAHbSram_iII(10 downto 0);
CoreAhBSRAM_oo1l <= '0'&COREAhbSram_III(10 downto 0);
CoreAhbSRAM_Lo1l <= '0'&CoreAHBSram_iii(10 downto 0);
CoreAHBSRAm_io1l <= '0'&CoREAHBSram_iiI(10 downto 0);
COREAhbSram_OL1L <= '0'&CoREAHBSram_iiI(10 downto 0);
CoreAHBSRam_ll1L <= '0'&COREAHbSram_iII(10 downto 0);
CoreAhBSRAM_il1l <= '0'&COREAhbSram_III(10 downto 0);
CoreAHBSRam_oi1L <= '0'&CoreAhbSRAM_iii(10 downto 0);
CoreAHBSRam_li1L <= '0'&COREAhbSram_III(10 downto 0);
CoreAhBSRAm_ii1l <= '0'&CoREAHBSram_iiI(10 downto 0);
CoreAHBSRam_o01L <= '0'&CoreAhbSRAM_iii(10 downto 0);
COReAhbSraM_OIOL(1 downto 0) <= COREAhbSram_LII(1 downto 0);
COreAhbSrAM_LIol(1 downto 0) <= CoreAHBSRam_lii(3 downto 2);
COREAhbSram_IIOL(1 downto 0) <= COReAhbSrAM_LII(5 downto 4);
CoreAhbSRAM_O0ol(1 downto 0) <= COREAhbSram_LII(7 downto 6);
COReAhbSraM_L0Ol(1 downto 0) <= COREAhbSram_LII(1 downto 0);
CoreAhbSRAM_i0ol(1 downto 0) <= COreAhbSrAM_LII(3 downto 2);
COreAhbSrAM_O1Ol(1 downto 0) <= CorEAHBSram_liI(5 downto 4);
COREAhbSram_L1OL(1 downto 0) <= CoreAHBSRAm_lii(7 downto 6);
CoreAhbSRAM_I1ol(1 downto 0) <= CoreAhBSRAM_lii(1 downto 0);
CoreAhbSRAM_ooll(1 downto 0) <= CoreAhBSRAM_lii(3 downto 2);
COREAhbSram_LOLL(1 downto 0) <= CoreAhBSRAM_lii(5 downto 4);
COREAhbSram_IOLL(1 downto 0) <= COREAhbSraM_LII(7 downto 6);
CoreAHBSRAm_olll(1 downto 0) <= CoreAHBSRam_lii(1 downto 0);
CoreAhBSRAM_llll(1 downto 0) <= CoreAHBSRAm_lii(3 downto 2);
COreAhbSrAM_ILLl(1 downto 0) <= COREAhbSram_LII(5 downto 4);
CorEAHBSram_oilL(1 downto 0) <= COREAhbSram_LII(7 downto 6);
case (CoreAhBSRam_o0i(12 downto 9)) is
when "0000" =>
CoreAHBSram_llOL(3 downto 0) <= COReAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhBSRAM_l01l&CoreAHBSRam_l01l;
when "0001" =>
CoreAHBSram_llOL(3 downto 0) <= CoreAHBSRAm_l01l&CoreAHBSRAm_l01l&CoreAhbSRAM_L01l&CorEAHBSram_l01L;
when "0010" =>
COReAhbSraM_LLOL(3 downto 0) <= COREAhbSram_L01L&COReAhbSraM_L01l&CoreAhBSRAM_l01l&CoreAhbSRAM_l01l;
when "0011" =>
CoreAHBSRAm_llol(3 downto 0) <= CoreAhbSRAM_l01l&COreAhbSrAM_L01l&COreAhbSRAM_L01l&COReAhbSraM_L01l;
when "0100" =>
COREAhbSram_LLOL(7 downto 4) <= COReAhbSraM_L01l&CoreAHBSRAm_l01l&CoreAHBSRAM_l01l&CorEAHBSRam_l01L;
when "0101" =>
CoreAhbSRAM_llol(7 downto 4) <= CoreAHBSRAm_l01l&COreAhbSrAM_L01l&COREAhbSram_L01L&CorEAHBSram_l01L;
when "0110" =>
COREAhbSram_LLOL(7 downto 4) <= CoreAhBSRAM_l01l&COREAhbSram_L01L&CoreAhBSRAM_l01l&COReAhbSraM_L01l;
when "0111" =>
COREAhbSram_LLOL(7 downto 4) <= CoreAHBSRAm_l01l&CoREAhbSram_L01L&COREAhbSram_L01L&CoreAhbSRAM_L01l;
when "1000" =>
COREAhbSram_LLOL(11 downto 8) <= COREAhbSraM_L01l&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l&CoreAHBSRAM_l01l;
when "1001" =>
COReAhbSraM_LLOL(11 downto 8) <= COreAhbSrAM_L01l&CoreAHBSRAm_l01l&CoreAhbSRAM_L01l&COReAhbSraM_L01l;
when "1010" =>
CoreAHBSRam_llol(11 downto 8) <= COREAHbSram_l01L&CoreAHBSRAm_l01l&CoreAHBSRAm_l01l&COreAhbSrAM_L01l;
when "1011" =>
CoreAhbSRAM_llol(11 downto 8) <= COREAHbSram_l01L&COREAhbSram_L01L&COreAhbSRAM_l01l&CorEAHBSram_l01L;
when "1100" =>
COREAhbSram_LLOL(15 downto 12) <= COREAhbSram_L01L&CoreAhBSRAM_l01l&CoreAhbSRAM_L01l&COreAhbSrAM_L01l;
when "1101" =>
CoreAhBSRAM_llol(15 downto 12) <= COREAhbSram_l01L&CoreAHBSRam_l01L&CoreAhBSRAM_l01l&COreAhbSrAM_L01l;
when "1110" =>
COReAhbSraM_LLOl(15 downto 12) <= CoreAHBSram_l01L&COREAHbSram_l01L&CoreAHBSRam_l01L&COREAHbSram_l01L;
when "1111" =>
CoreAhbSRAM_Llol(15 downto 12) <= CoreAhbSRAM_L01l&CoreAhbSRAM_l01l&COREAHbSram_l01L&CoreAhbSRAM_L01l;
when others =>
null
;
end case;
case (COreAhbSrAM_III(12 downto 9)) is
when "0000" =>
CoREAHBSram_iLOL(3 downto 0) <= CoREAHbSram_i01L&CoreAhBSRAM_i01l&COREAHbSram_I01L&CoreAHBSRam_i01l;
when "0001" =>
COReAhbSrAM_ILOl(3 downto 0) <= CoreAHBSram_i01L&COREAhbSram_I01L&CoreAhbSRAM_I01l&CoreAhbSRAM_I01l;
when "0010" =>
CorEAHBSram_ilOL(3 downto 0) <= CoreAhBSRAM_i01l&COREAhbSraM_I01l&CoreAhbSRAM_i01l&CorEAHBSram_i01L;
when "0011" =>
CoreAHBSRAm_ilol(3 downto 0) <= CoreAHBSRam_i01l&COREAhbSram_I01L&COREAHbSram_i01L&CoreAhbSRAM_I01l;
when "0100" =>
CoreAHBSRAm_ilol(7 downto 4) <= COREAHBSram_i01L&CoreAHBSRAM_i01l&COREAHbSram_i01L&CorEAHBSram_i01L;
when "0101" =>
CoreAhBSRAM_ilol(7 downto 4) <= COREAhbSram_I01L&CorEAHBSram_i01L&CoreAhbSRAM_I01l&CoreAhbSRAM_I01l;
when "0110" =>
COreAhbSrAM_ILol(7 downto 4) <= CoreAhbSRAM_i01l&CorEAHBSram_i01L&CoreAhbSRAM_i01l&CoreAHBSRAm_i01l;
when "0111" =>
CoreAhbSRAM_ilol(7 downto 4) <= CorEAHBSram_i01L&CoreAhbSRAM_I01l&COReAhbSraM_I01L&CoREAHBSram_i01L;
when "1000" =>
CoreAhBSRAM_ilol(11 downto 8) <= CoREAHbSram_i01L&CoreAHBSRAm_i01l&COREAHbSram_i01L&CoreAhbSRAM_I01l;
when "1001" =>
COreAhbSrAM_ILol(11 downto 8) <= CoREAHBSram_i01L&CoREAHBSram_i01L&CoREAHBSram_i01L&CoreAhBSRAM_i01l;
when "1010" =>
CoreAhBSRAM_iloL(11 downto 8) <= CoreAHBSRAm_i01l&COREAHbSram_i01L&COReAhbSraM_I01l&CoREAHBSram_i01L;
when "1011" =>
CoreAHBSRam_ilol(11 downto 8) <= CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&CoreAhbSRAM_I01l&COreAhbSrAM_I01l;
when "1100" =>
CoreAhbSRAM_ilol(15 downto 12) <= COReAhbSrAM_I01l&CoreAhBSRAM_i01l&CorEAHBSram_i01L&CoreAhbSRAM_I01l;
when "1101" =>
CoreAhbSRAM_Ilol(15 downto 12) <= CoreAhBSRAM_i01l&COREAhbSram_I01L&COREAhbSram_I01L&COREAhbSram_I01L;
when "1110" =>
CoreAHBSRam_iloL(15 downto 12) <= CoreAhbSRAM_I01l&CoREAHBSram_i01L&CoreAhBSRAM_i01l&CoreAhbSRAM_I01l;
when "1111" =>
CoreAhBSRAM_ilol(15 downto 12) <= COreAhbSrAM_I01l&COREAhbSram_I01L&CoreAhbSRAM_I01l&COREAhbSram_I01L;
when others =>
null
;
end case;
case (CoreAhBSRAM_io1(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_l0ll(1 downto 0)&CoreAhbSrAM_O0ll(1 downto 0)&COReAhbSraM_IILl(1 downto 0)&CoreAhBSRAM_lill(1 downto 0);
when "0001" =>
CoreAHBSRam_l0i <= CoreAhBSRAM_l0ll(1 downto 0)&CoreAhbSRAM_O0ll(1 downto 0)&COREAHbSram_iILL(1 downto 0)&CoreAHBSRam_lill(1 downto 0);
when "0010" =>
COREAhbSram_L0I <= COreAhbSrAM_L0Ll(1 downto 0)&COreAhbSrAM_O0ll(1 downto 0)&CoreAhbSraM_IILL(1 downto 0)&COReAhbSraM_LILl(1 downto 0);
when "0011" =>
CoreAhBSRAM_l0i <= CoREAHBSram_l0LL(1 downto 0)&CoreAHBSRAm_o0ll(1 downto 0)&CoreAhBSRAM_iill(1 downto 0)&COReAhbSraM_LILl(1 downto 0);
when "0100" =>
CoREAHBSram_l0I <= CoreAhbSRAM_I1ll(1 downto 0)&CoreAHBSRam_l1ll(1 downto 0)&COREAhbSraM_O1Ll(1 downto 0)&CoreAhbSrAM_I0ll(1 downto 0);
when "0101" =>
CoREAHBSram_l0I <= COreAhbSrAM_I1ll(1 downto 0)&COREAhbSram_L1LL(1 downto 0)&CoreAhBSRAm_o1ll(1 downto 0)&CoreAHBSRAm_i0ll(1 downto 0);
when "0110" =>
CoreAHBSram_l0i <= COReAhbSraM_I1Ll(1 downto 0)&COReAhbSraM_L1LL(1 downto 0)&CoreAHBSram_o1LL(1 downto 0)&COreAhbSrAM_I0ll(1 downto 0);
when "0111" =>
CoreAhbSRAM_L0i <= CorEAHBSram_i1LL(1 downto 0)&CoreAHBSRAm_l1ll(1 downto 0)&COReAhbSraM_O1Ll(1 downto 0)&COreAhbSrAM_I0ll(1 downto 0);
when "1000" =>
CoreAHBSRAm_l0i <= CorEAHBSram_olIL(1 downto 0)&CoreAhBSRAM_ioil(1 downto 0)&CoreAhBSRAM_loil(1 downto 0)&CoreAhBSRAM_ooil(1 downto 0);
when "1001" =>
COreAhbSrAM_L0I <= CoreAHBSRam_oliL(1 downto 0)&CoreAHBSRAM_ioil(1 downto 0)&CoreAhBSRAM_loil(1 downto 0)&CoreAHBSRAm_ooil(1 downto 0);
when "1010" =>
COREAhbSram_L0I <= CoreAHBSRam_oliL(1 downto 0)&CoreAhBSRAM_ioil(1 downto 0)&CoreAHBSRAm_loil(1 downto 0)&CorEAHBSram_ooIL(1 downto 0);
when "1011" =>
COREAhbSram_L0I <= COREAHbSram_oLIL(1 downto 0)&CoreAhBSRAM_ioil(1 downto 0)&CoreAhBSRAM_loil(1 downto 0)&CoreAhBSRAM_ooil(1 downto 0);
when "1100" =>
CoreAHBSRAm_l0i <= CoreAhBSRAM_liil(1 downto 0)&CoreAhbSRAM_OIil(1 downto 0)&COreAhbSrAM_ILIl(1 downto 0)&COreAhbSrAM_LLIl(1 downto 0);
when "1101" =>
COreAhbSraM_L0I <= CoreAhbSrAM_LIil(1 downto 0)&COREAhbSram_OIIL(1 downto 0)&CoreAhbSRAM_ILil(1 downto 0)&COreAhbSrAM_LLIl(1 downto 0);
when "1110" =>
CoREAHBSram_l0I <= CorEAHBSram_liiL(1 downto 0)&CoreAhBSRAM_oiil(1 downto 0)&CoreAhbSRAM_ilil(1 downto 0)&CoreAHBSRam_lliL(1 downto 0);
when "1111" =>
COREAhbSram_L0I <= CoreAhbSRAM_LIil(1 downto 0)&CoreAhbSRAM_OIil(1 downto 0)&COREAhbSram_ILIL(1 downto 0)&COREAHbSram_LLIL(1 downto 0);
when others =>
null
;
end case;
when others =>
CoreAHBSram_ol1 <= "00";
CoreAhBSRAM_ll1 <= "00";
CoreAhBSRAM_il1 <= "00";
COREAhbSram_OI1 <= "00";
COREAHbSram_lI1 <= "00";
COReAhbSraM_II1 <= "00";
COReAhbSrAM_O01 <= "00";
CoreAhBSRAM_l01 <= "00";
COreAhbSrAM_I01 <= "00";
CoreAHBSRAM_o11 <= "00";
COReAhbSraM_L11 <= "00";
COREAhbSram_I11 <= "00";
COREAhbSraM_OOOL <= "00";
CoreAhBSRAM_lool <= "00";
COREAhbSram_IOOL <= "00";
COreAhbSrAM_OLOl <= "00";
COReAhbSraM_IIIl <= COREAHbSram_o0I(11 downto 0);
CoreAhbSRAM_o0il <= CoreAHBSram_o0I(11 downto 0);
CoREAHBSram_l0IL <= CoreAHBSRam_o0i(11 downto 0);
COreAhbSRAM_I0il <= CoreAhbSRAM_O0i(11 downto 0);
COreAhbSraM_O1Il <= CoreAHBSRAM_o0i(11 downto 0);
COREAHbSram_l1IL <= CorEAHBSram_o0i(11 downto 0);
CorEAHBSram_i1IL <= CoreAHBSRAM_o0i(11 downto 0);
CoreAhbSRAM_Oo0l <= CoreAhbSRAM_O0i(11 downto 0);
CoreAHBSRam_lo0l <= COREAhbSram_O0I(11 downto 0);
COREAHbSram_iO0L <= COREAhbSram_O0I(11 downto 0);
CoreAhbSRAM_ol0l <= CoreAHBSRam_o0i(11 downto 0);
CoreAHBSRAm_ll0l <= COREAhbSram_O0I(11 downto 0);
CorEAHBSram_il0L <= CoreAhBSRAM_o0i(11 downto 0);
CoreAHBSRam_oi0L <= CoreAhBSRAM_o0i(11 downto 0);
COReAhbSram_LI0L <= CoreAhBSRAm_o0i(11 downto 0);
CoreAHBSram_ii0L <= COREAHbSram_o0I(11 downto 0);
COReAhbSraM_O00l <= COREAhbSraM_III(11 downto 0);
COreAhbSrAM_L00l <= COREAHbSram_iII(11 downto 0);
CoREAHBSram_i00L <= COREAhbSram_III(11 downto 0);
COreAhbSraM_O10l <= CoreAhbSRAM_iii(11 downto 0);
CoreAHBSRAM_l10l <= COReAhbSrAM_III(11 downto 0);
CoreAhBSRAM_i10l <= CoreAhbSrAM_IIi(11 downto 0);
COREAHBSram_oo1L <= CoreAhBSRAM_iii(11 downto 0);
CoreAhBSRAM_lo1l <= COReAhbSraM_III(11 downto 0);
CoreAhbSRAM_Io1l <= CoreAHBSRAm_iii(11 downto 0);
COREAHbSram_oL1L <= COREAhbSram_III(11 downto 0);
CoreAHBSRAM_ll1l <= CoreAHBSRam_iii(11 downto 0);
CorEAHBSram_il1L <= COREAhbSram_III(11 downto 0);
CoreAHBSram_oi1L <= CoreAhbSRAM_iii(11 downto 0);
COREAhbSram_LI1L <= CorEAHBSRam_iii(11 downto 0);
COreAhbSrAM_II1l <= CoreAhbSRAM_iii(11 downto 0);
CoreAhBSRAM_o01l <= COREAhbSram_III(11 downto 0);
CorEAHBSram_oIOL(0) <= COReAhbSraM_LII(0);
CoreAhbSRAM_Liol(0) <= CoREAHbSram_lII(1);
CoreAhBSRAM_iiol(0) <= COreAhbSrAM_LII(2);
CoreAhBSRAM_o0ol(0) <= COreAhbSrAM_LII(3);
CorEAHBSram_l0OL(0) <= COReAhbSraM_LII(4);
CoreAhbSrAM_I0ol(0) <= COREAhbSram_LII(5);
CoREAHBSram_O1OL(0) <= CorEAHBSram_lII(6);
CoreAhbSRAM_l1ol(0) <= COReAhbSRAM_Lii(7);
CoreAHBSram_i1oL(0) <= COREAhbSraM_LII(0);
CorEAHBSram_ooLL(0) <= CoreAHBSram_lII(1);
COREAhbSrAM_LOLl(0) <= CoreAHBSRam_lii(2);
COreAhbSrAM_IOll(0) <= COREAHbSram_lII(3);
CoREAHBSram_olLL(0) <= CoreAhBSRAM_lii(4);
COREAhbSraM_LLLL(0) <= COReAhbSraM_LII(5);
CoreAhbSRAM_ILll(0) <= COreAhbSrAM_LII(6);
CoreAHBSRam_oilL(0) <= CoreAhBSRAM_lii(7);
case (CoreAhbSRAM_O0i(12 downto 9)) is
when "0000" =>
CoreAHBSRam_lloL(7 downto 0) <= COReAhbSraM_L01l&CoreAhbSRAM_l01l&COREAhbSram_L01L&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&COREAhbSram_L01L&CoreAhbSRAM_l01l&CoreAHBSRam_l01l;
when "0001" =>
CoreAHBSRam_llol(7 downto 0) <= COREAhbSram_L01L&CoreAhBSRAM_l01l&CorEAHBSram_l01L&CoreAhbSRAM_l01l&CoreAHBSRam_l01l&COReAhbSraM_L01l&COreAhbSrAM_L01l&CoreAhBSRAM_l01l;
when "0010" =>
COReAhbSraM_LLOL(7 downto 0) <= CoreAHBSRam_l01L&COReAhbSraM_L01l&CoreAHBSRam_l01L&CoreAHBSRam_l01L&CoreAHBSRam_l01l&COREAhbSram_L01L&COReAhbSraM_L01l&COREAHBSram_l01L;
when "0011" =>
COREAHbSram_LLOL(7 downto 0) <= CorEAHBSram_l01L&COREAhbSram_L01L&CoreAHBSRAm_l01l&CoREAHBSram_l01L&CoreAHBSRAM_l01l&COreAhBSRAM_l01l&CoreAhbSRAM_L01l&COreAhbSRAM_L01l;
when "0100" =>
COREAhbSram_LLOl(7 downto 0) <= CorEAHBSram_l01L&CoreAHBSRAm_l01l&CorEAHBSram_l01L&COReAhbSrAM_L01l&CorEAHBSram_l01L&COReAhbSrAM_L01l&COREAhbSram_L01L&COREAHbSram_l01L;
when "0101" =>
COREAHbSram_LLOL(7 downto 0) <= CoreAhbSRAM_l01l&CoreAhbSRAM_l01l&CoREAHBSram_l01L&CoreAhBSRAM_l01l&CoreAhbSRAM_l01l&COREAhbSram_L01L&COREAhbSram_L01L&CoREAHBSram_l01L;
when "0110" =>
CoreAhbSRAM_llol(7 downto 0) <= CorEAHBSram_l01L&COREAhbSram_L01L&COreAhbSrAM_L01l&COREAhbSram_L01L&COREAHbSram_l01L&CoreAhbSRAM_L01l&COReAhbSraM_L01l&COREAhbSraM_L01l;
when "0111" =>
COReAhbSrAM_LLOl(7 downto 0) <= CoreAhBSRAM_l01l&COreAhbSrAM_L01l&CoreAhbSRAM_L01l&CorEAHBSram_l01L&CoreAHBSRam_l01l&CoreAhBSRAM_l01l&CoreAHBSRAm_l01l&CoreAhbSRAM_L01l;
when "1000" =>
COREAhbSram_LLOL(15 downto 8) <= CoreAhbSRAM_L01l&CorEAHBSram_l01L&CoreAhbSRAM_l01l&CoreAhbSRAM_l01l&CoreAhBSRAM_l01l&CorEAHBSram_l01L&CoreAhBSRAm_l01l&COreAhbSrAM_L01l;
when "1001" =>
CoreAHBSRam_llol(15 downto 8) <= CoreAhbSRAM_l01l&CoreAHBSram_l01L&CorEAHBSram_l01L&CoreAhBSRAM_l01l&CoreAhBSRAM_l01l&COREAhbSram_L01L&CoreAHBSram_l01L&COREAHbSram_L01L;
when "1010" =>
CoreAhBSRAM_llol(15 downto 8) <= COREAHbSram_L01L&COReAhbSrAM_L01l&COreAhbSrAM_L01l&CoreAhbSRAM_L01l&CoreAhbSRAM_L01l&CorEAHBSram_l01L&CoreAHBSRAm_l01l&COREAHbSram_L01L;
when "1011" =>
CoREAHBSram_llOL(15 downto 8) <= COREAhbSraM_L01L&COReAhbSraM_L01l&COreAhbSrAM_L01l&CoreAhBSRAM_l01l&CoreAhBSRAM_l01l&CoreAhbSRAM_l01l&CoreAhBSRAM_l01l&CoreAhbSRAM_l01l;
when "1100" =>
COreAhbSRAM_Llol(15 downto 8) <= COreAhbSrAM_L01l&CoreAhbSRAM_l01l&CoreAhBSRAM_l01l&CoreAhBSRAM_l01l&CoreAHBSRAm_l01l&CoREAHBSram_l01L&COREAHbSram_L01L&COreAhbSrAM_L01l;
when "1101" =>
CoreAhBSRAM_llol(15 downto 8) <= CoreAhBSRAM_l01l&COREAHbSram_l01L&CoreAhbSRAM_L01l&CoreAHBSRAm_l01l&CoreAHBSRAm_l01l&CoreAHBSRam_l01l&CoREAHBSram_l01L&COreAhbSrAM_L01l;
when "1110" =>
COREAhbSram_LLOL(15 downto 8) <= CoreAhBSRAM_l01l&CoreAHBSRam_l01L&COREAhbSram_L01L&CoreAHBSram_l01L&CorEAHBSram_l01L&COreAhbSrAM_L01l&COreAhbSrAM_L01l&CoreAHBSRAm_l01l;
when "1111" =>
CoreAHBSRam_llol(15 downto 8) <= COREAhbSraM_L01l&COREAhbSram_L01L&COreAhbSrAM_L01l&COReAhbSraM_L01L&CoreAhbSRAM_l01l&CoREAHBSram_l01L&CoreAhbSRAM_L01l&COREAhbSram_L01L;
when others =>
null
;
end case;
case (COREAhbSram_III(12 downto 9)) is
when "0000" =>
CoreAhbSRAM_ilol(7 downto 0) <= CoreAhbSRAM_I01l&CoreAhbSRAM_i01l&COreAhbSrAM_I01l&CoREAHBSram_i01L&COREAhbSram_I01L&CoreAHBSRam_i01l&COreAhbSrAM_I01l&CoreAHBSRam_i01L;
when "0001" =>
CoreAhBSRAM_ilol(7 downto 0) <= CoreAHBSRAM_i01l&COREAHbSram_i01L&CoreAhbSRAM_I01l&CorEAHBSram_i01L&CoreAhbSRAM_i01l&CorEAHBSram_i01L&CoreAhBSRAM_i01l&CoreAhbSRAM_i01l;
when "0010" =>
CoreAhbSrAM_ILol(7 downto 0) <= CoreAhbSRAM_i01l&COreAhbSRAM_I01l&CoREAHBSram_i01L&CoreAhBSRAM_i01l&CoreAhBSRAM_i01l&CoreAHBSRam_i01l&CoreAHBSRAm_i01l&CoREAHBSram_i01L;
when "0011" =>
COREAhbSram_ILOL(7 downto 0) <= CoreAhbSRAM_I01l&COREAHbSram_I01L&COreAhbSrAM_I01l&CoreAHBSRAm_i01l&CoreAhBSRAM_i01l&COREAhbSram_I01L&COREAhbSram_I01L&COReAhbSraM_I01l;
when "0100" =>
CoreAhbSRAM_ilol(7 downto 0) <= CoreAhbSRAM_i01l&COReAhbSrAM_I01l&CoreAhBSRAM_i01l&COreAhbSrAM_I01l&CoreAhBSRAM_i01l&CoreAhbSRAM_I01l&CoreAhBSRAM_i01l&COREAhbSram_I01L;
when "0101" =>
COREAHbSram_ILOL(7 downto 0) <= CoreAhbSRAM_i01l&CoreAHBSRAm_i01l&CoreAHBSRAm_i01l&COREAHbSram_i01L&CoreAhBSRAM_i01l&COREAhbSram_I01L&COreAhbSrAM_I01l&CoreAhbSRAM_i01l;
when "0110" =>
CorEAHBSram_ilOL(7 downto 0) <= CoreAhbSRAM_I01l&CoreAhBSRAM_i01l&COREAHbSram_I01L&COReAhbSraM_I01l&CoreAhBSRAM_i01l&CoreAhbSRAM_i01l&COREAhbSram_I01L&CoreAhbSRAM_I01l;
when "0111" =>
CoreAhbSRAM_ilol(7 downto 0) <= CoreAHBSram_i01L&COREAhbSram_I01L&CoreAhBSRAM_i01l&COREAhbSram_I01L&CoreAhBSRAM_i01l&COreAhbSrAM_I01l&COReAhbSraM_I01l&CoreAhbSRAM_I01l;
when "1000" =>
COREAhbSram_ILOL(15 downto 8) <= CoreAHBSRAm_i01l&CoreAHBSRAm_i01l&COREAHbSram_I01L&CoreAhbSRAM_I01l&CoreAHBSram_i01L&CorEAHBSram_i01L&COreAhbSrAM_I01l&COREAhbSram_I01L;
when "1001" =>
CorEAHBSram_ilOL(15 downto 8) <= COREAHbSram_i01L&CoreAHBSRAm_i01l&CorEAHBSram_i01L&COreAhbSrAM_I01l&COreAhbSRAM_I01l&CoreAhbSRAM_i01l&CoreAhbSRAM_I01l&COREAhbSram_I01L;
when "1010" =>
COREAhbSram_ILOL(15 downto 8) <= CoreAhBSRAM_i01l&CoreAhbSRAM_i01l&COREAhbSram_I01L&COreAhbSrAM_I01l&CoreAhbSRAM_i01l&CoreAhbSRAM_i01l&CoreAhbSRAM_I01l&COREAhbSram_I01L;
when "1011" =>
COreAhbSrAM_ILOl(15 downto 8) <= CoreAhBSRAm_i01l&CoreAhBSRAM_i01l&CoREAHBSram_i01L&COREAHbSram_i01L&CoreAHBSRAm_i01l&CoreAHBSRAm_i01l&CoreAhbSRAM_I01l&COreAhbSrAM_I01l;
when "1100" =>
COREAhbSram_ILOL(15 downto 8) <= CoreAhbSRAM_I01l&COREAhbSram_I01L&CorEAHBSRam_i01L&CoreAhbSRAM_I01l&CoreAHBSRAM_i01l&COREAhbSram_I01L&CoreAHBSRam_i01l&COREAhbSram_I01L;
when "1101" =>
CoreAhbSRAM_ILol(15 downto 8) <= CoreAhBSRAM_i01l&COREAHbSram_i01L&CoreAhBSRAm_i01l&CorEAHBSram_i01L&CoreAhbSRAM_i01l&CoreAhBSRAM_i01l&COreAhbSrAM_I01l&CoREAHBSram_i01L;
when "1110" =>
CoreAHBSRam_ilol(15 downto 8) <= CoreAHBSRAm_i01l&COREAHbSram_i01L&CoreAhBSRAM_i01l&COREAhbSram_I01L&CoreAhbSRAM_i01l&COREAhbSram_I01L&CoreAhBSRAM_i01l&COREAhbSram_I01L;
when "1111" =>
CoreAhbSRAM_ilol(15 downto 8) <= COReAhbSraM_I01l&CoreAhbSRAM_i01l&COREAHbSram_I01L&CoREAHBSram_i01L&COreAhbSRAM_I01l&CoreAhBSRAM_i01l&COReAhbSraM_I01L&COreAhbSrAM_I01l;
when others =>
null
;
end case;
case (CoreAhbSRAM_io1(12 downto 9)) is
when "0000" =>
COREAhbSram_L0I <= COReAhbSraM_I1Ll(0)&CoreAHBSRAm_l1ll(0)&CoreAHBSRAm_o1ll(0)&CoreAhbSRAM_I0ll(0)&CoreAHBSRAM_l0ll(0)&CoreAhbSRAM_O0ll(0)&CoreAhbSRAM_iill(0)&CorEAHBSram_lilL(0);
when "0001" =>
CoreAhbSRAM_L0i <= CoREAHBSram_i1LL(0)&COreAhbSrAM_L1ll(0)&CoreAHBSRam_o1ll(0)&COReAhbSraM_I0Ll(0)&COREAhbSram_L0LL(0)&CoreAhbSRAM_O0ll(0)&COREAhbSram_IILL(0)&CoreAhBSRAm_lill(0);
when "0010" =>
CoREAhbSram_L0I <= CoreAhBSRam_i1lL(0)&CoREAHBSram_l1LL(0)&CoreAhBSRAM_o1ll(0)&COREAhbSram_I0LL(0)&CoreAhBSRam_l0ll(0)&COreAhbSrAM_O0ll(0)&CoreAhBSRam_iill(0)&CoreAHBSRam_lilL(0);
when "0011" =>
COreAhbSRAM_l0i <= COREAhbSRAM_I1ll(0)&CoreAhBSRAm_l1ll(0)&COREAhbSram_O1ll(0)&COREAhbSram_I0Ll(0)&CoreAHBSRam_l0ll(0)&CoreAhBSRAM_o0ll(0)&COreAhbSRAM_IIll(0)&CoreAHBSRAm_lill(0);
when "0100" =>
CorEAHBSram_l0I <= CoreAhbSRAM_I1ll(0)&CoreAhBSRAM_l1ll(0)&CoreAhbSRAM_o1ll(0)&COREAhbSram_I0LL(0)&CoreAhBSRAM_l0ll(0)&CoreAhbSRAM_o0ll(0)&CoreAHBSRam_iill(0)&CoreAhbSRAM_Lill(0);
when "0101" =>
COREAHbSram_l0I <= COREAhbSram_I1LL(0)&CoreAhBSRAM_l1ll(0)&COreAhbSraM_O1Ll(0)&COreAhbSRAM_I0ll(0)&COreAhbSrAM_L0ll(0)&CorEAHBSram_o0LL(0)&CoreAhbSRAM_iill(0)&CoREAHBSram_lILL(0);
when "0110" =>
CoreAHBSram_l0i <= COREAhbSram_I1LL(0)&CoreAHBSRAM_l1ll(0)&CoreAHBSRam_o1lL(0)&COreAhbSrAM_I0Ll(0)&CoreAhBSRAM_l0ll(0)&CoreAHBSRam_o0lL(0)&CoreAhbSRAM_Iill(0)&CoreAHBSRAm_lill(0);
when "0111" =>
CoreAhBSRAM_l0i <= COReAhbSraM_I1Ll(0)&CorEAHBSram_l1lL(0)&CoreAHBSRAm_o1ll(0)&COreAhbSRAM_I0ll(0)&CoreAhbSRAM_l0ll(0)&COREAhbSram_O0LL(0)&CoREAHBSram_iILL(0)&COReAhbSraM_LILL(0);
when "1000" =>
COreAhbSrAM_L0i <= COreAhbSrAM_LIIl(0)&CoreAhbSRAM_oiil(0)&CoreAhbSRAM_ilil(0)&COREAhbSram_LLIL(0)&COREAhbSram_OLIL(0)&CoreAhbSRAM_IOil(0)&COReAhbSraM_LOIL(0)&CoreAhBSRAM_ooil(0);
when "1001" =>
COReAhbSraM_L0I <= CorEAHBSram_liiL(0)&COreAhbSrAM_OIIl(0)&CoreAhbSRAM_ILil(0)&COREAhbSram_LLIL(0)&CoreAhBSRAM_olil(0)&CoreAHBSRam_ioiL(0)&CoreAhbSRAM_LOil(0)&CoreAhbSrAM_ooil(0);
when "1010" =>
CoreAhbSRAM_l0i <= CoreAhbSRAM_liil(0)&CoreAHBSRam_oiiL(0)&CoreAHBSRAm_ilil(0)&COReAhbSrAM_LLIl(0)&CorEAHBSram_olIL(0)&CoREAHBSram_iOIL(0)&COREAhbSram_LOIL(0)&CoreAHBSRAm_ooil(0);
when "1011" =>
COreAhbSrAM_L0i <= COREAhbSram_LIIL(0)&CoREAHBSram_oiIL(0)&COReAhbSraM_ILIl(0)&CoreAHBSRam_lliL(0)&COreAhbSRAM_OLil(0)&COreAhbSRAM_ioil(0)&CoreAhbSRAM_LOil(0)&CoreAhbSRAM_Ooil(0);
when "1100" =>
COREAhbSram_L0I <= CoreAhBSRAM_liil(0)&COREAhbSram_OIIL(0)&CoreAhbSRAM_ilil(0)&COreAhbSrAM_LLIl(0)&COreAhbSrAM_OLIl(0)&COREAHbSram_IOIL(0)&COREAhbSram_LOIL(0)&COREAHbSram_oOIL(0);
when "1101" =>
COReAhbSraM_L0I <= CoreAHBSram_liiL(0)&COREAHbSram_OIIL(0)&CoreAhBSRAM_ilil(0)&CoREAHBSram_llIL(0)&CoREAHBSram_olIL(0)&COREAhbSram_IOIL(0)&COreAhbSRAM_LOil(0)&COReAhbSraM_OOIl(0);
when "1110" =>
CoreAHBSRAM_l0i <= CoreAhbSRAM_liil(0)&COREAhbSram_oIIL(0)&COReAhbSraM_ILIl(0)&CoreAhbSRAM_llil(0)&COreAhbSrAM_OLIl(0)&COREAhbSram_IOIL(0)&COreAhbSrAM_LOIl(0)&CoreAhbSRAM_OOil(0);
when "1111" =>
CorEAHBSram_l0I <= COREAhbSram_LIIL(0)&CoreAhbSRAM_Oiil(0)&CoreAhBSRAM_ilil(0)&CoreAHBSRam_lliL(0)&CoreAHBSRAm_olil(0)&COREAHbSram_IOIL(0)&COreAhbSRAM_LOil(0)&COREAHbSram_oOIL(0);
when others =>
null
;
end case;
end case;
end case;
end process;
COREAHbSram_i11L: RAM4K9
port map (ADDRA11 => CoreAhbSRAM_IIil(11),
ADDRB11 => CoreAhBSRAM_o00l(11),
ADDRA10 => COReAhbSraM_IIIl(10),
ADDRB10 => CoreAhbSRAM_O00l(10),
ADDRA9 => CoreAHBSRam_iiiL(9),
ADDRB9 => CoreAhBSRAM_o00l(9),
ADDRA8 => CoREAHBSram_iiIL(8),
ADDRB8 => COREAHBSram_o00L(8),
ADDRA7 => CoreAhbSRAM_IIil(7),
ADDRB7 => COreAhbSrAM_O00l(7),
ADDRA6 => CoreAHBSRAm_iiil(6),
ADDRB6 => COREAhbSraM_O00L(6),
ADDRA5 => COREAhbSram_IIIL(5),
ADDRB5 => CorEAHBSram_o00L(5),
ADDRA4 => CoreAhbSRAM_iiil(4),
ADDRB4 => CoreAhbSRAM_O00l(4),
ADDRA3 => COREAhbSram_IIIL(3),
ADDRB3 => CoreAhbSRAM_o00l(3),
ADDRA2 => CoreAhbSRAM_iiil(2),
ADDRB2 => CoreAhbSRAM_o00l(2),
ADDRA1 => COreAhbSrAM_IIil(1),
ADDRB1 => CoreAhbSRAM_O00l(1),
ADDRA0 => CoreAhbSRAM_IIil(0),
ADDRB0 => COREAhbSram_O00L(0),
DINA8 => CorEAHBSRam_l11L,
DINB8 => CoreAhBSRAM_l11l,
DINA7 => CoreAhBSRAM_oiol(7),
DINB7 => COREAHbSram_L11L,
DINA6 => COREAhbSram_OIOL(6),
DINB6 => COreAhbSrAM_L11l,
DINA5 => COReAhbSraM_OIOl(5),
DINB5 => COREAhbSram_L11L,
DINA4 => CoreAhBSRAM_oiol(4),
DINB4 => CoreAHBSram_l11L,
DINA3 => CoreAhbSRAM_oiol(3),
DINB3 => COReAhbSraM_L11l,
DINA2 => CoreAhbSRAM_oiol(2),
DINB2 => CoreAhBSRAM_l11l,
DINA1 => CorEAHBSram_oiOL(1),
DINB1 => CorEAHBSram_l11L,
DINA0 => CoreAhbSRAM_oiol(0),
DINB0 => CoreAhBSRAM_l11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAHBSRam_lill(7),
DOUTA6 => open ,
DOUTB6 => COReAhbSraM_LILl(6),
DOUTA5 => open ,
DOUTB5 => CoreAhBSRAM_lill(5),
DOUTA4 => open ,
DOUTB4 => CoreAhbSRAM_LIll(4),
DOUTA3 => open ,
DOUTB3 => COReAhbSraM_LILl(3),
DOUTA2 => open ,
DOUTB2 => COREAhbSram_LILL(2),
DOUTA1 => open ,
DOUTB1 => CoREAHBSram_liLL(1),
DOUTA0 => open ,
DOUTB0 => COREAHbSram_lILL(0),
WIDTHA1 => CoreAhbSRAM_ol1(1),
WIDTHB1 => CoreAhBSRAM_ol1(1),
WIDTHA0 => COREAHbSram_oL1(0),
WIDTHB0 => CoreAhbSRAM_ol1(0),
PIPEA => CoreAhbSRAM_L11l,
PIPEB => CoreAhBSRAM_l11l,
WMODEA => CoREAHBSram_l11L,
WMODEB => CoreAhbSRAM_L11l,
BLKA => CoreAhBSRAM_llol(0),
BLKB => COREAhbSram_ILOL(0),
WENA => CoreAHBSRam_l11l,
WENB => COREAhbSram_O11L,
CLKA => CoreAhbSRAM_lo0,
CLKB => CoreAHBSRAm_lo0,
RESET => COREAhbSram_IO0);
CoreAhbSRAM_Oooi: RAM4K9
port map (ADDRA11 => COREAhbSram_O0IL(11),
ADDRB11 => COREAhbSram_L00L(11),
ADDRA10 => CoreAHBSRAm_o0il(10),
ADDRB10 => COreAhbSrAM_L00l(10),
ADDRA9 => CoreAHBSRAM_o0il(9),
ADDRB9 => CoreAhbSRAM_L00l(9),
ADDRA8 => COREAHbSram_o0IL(8),
ADDRB8 => CoreAhbSRAM_L00l(8),
ADDRA7 => CoreAhbSRAM_O0il(7),
ADDRB7 => CoreAHBSRam_l00L(7),
ADDRA6 => COREAhbSram_O0IL(6),
ADDRB6 => CoreAHBSRam_l00L(6),
ADDRA5 => CoreAhbSRAM_O0il(5),
ADDRB5 => CoreAhbSRAM_L00l(5),
ADDRA4 => COReAhbSraM_O0Il(4),
ADDRB4 => COREAHbSram_l00L(4),
ADDRA3 => COREAHbSram_o0IL(3),
ADDRB3 => COREAhbSram_L00L(3),
ADDRA2 => COReAhbSrAM_O0Il(2),
ADDRB2 => COREAhbSram_L00L(2),
ADDRA1 => CoreAHBSRam_o0il(1),
ADDRB1 => CoreAhbSRAM_l00l(1),
ADDRA0 => COREAHbSram_O0IL(0),
ADDRB0 => CoreAHBSRam_l00L(0),
DINA8 => COREAhbSram_L11L,
DINB8 => COreAhbSrAM_L11l,
DINA7 => CoreAhbSRAM_liol(7),
DINB7 => COREAhbSram_L11L,
DINA6 => CoreAhbSRAM_liol(6),
DINB6 => CoreAhbSRAM_L11l,
DINA5 => CoREAHBSram_lIOL(5),
DINB5 => CoreAHBSram_l11L,
DINA4 => CoREAHBSram_lIOL(4),
DINB4 => CoREAHBSram_l11L,
DINA3 => CoreAhbSRAM_Liol(3),
DINB3 => CorEAHBSram_l11L,
DINA2 => CoreAhbSRAM_Liol(2),
DINB2 => CoreAhbSRAM_l11l,
DINA1 => CoREAhbSram_LIOL(1),
DINB1 => COREAhbSraM_L11l,
DINA0 => COREAHbSram_lIOL(0),
DINB0 => CoreAhbSRAM_l11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhbSRAM_Iill(7),
DOUTA6 => open ,
DOUTB6 => CoREAHbSram_iILL(6),
DOUTA5 => open ,
DOUTB5 => CoreAhbSRAM_Iill(5),
DOUTA4 => open ,
DOUTB4 => COREAhbSram_IILL(4),
DOUTA3 => open ,
DOUTB3 => COreAhbSrAM_IIll(3),
DOUTA2 => open ,
DOUTB2 => COreAhbSRAM_IIll(2),
DOUTA1 => open ,
DOUTB1 => COreAhbSrAM_IIll(1),
DOUTA0 => open ,
DOUTB0 => COReAhbSraM_IILl(0),
WIDTHA1 => COREAhbSram_LL1(1),
WIDTHB1 => CoreAhbSRAM_ll1(1),
WIDTHA0 => COREAHbSram_lL1(0),
WIDTHB0 => CoreAhbSRAM_ll1(0),
PIPEA => CorEAHBSram_l11L,
PIPEB => COREAHbSram_l11L,
WMODEA => COReAhbSraM_L11l,
WMODEB => CoreAhBSRAM_l11l,
BLKA => CoreAhbSRAM_LLol(1),
BLKB => COREAhbSram_ILOL(1),
WENA => CoreAHBSram_l11L,
WENB => CoREAHBSram_o11L,
CLKA => CoREAHBSram_lo0,
CLKB => CoreAhbSRAM_Lo0,
RESET => COREAhbSram_IO0);
COReAhbSraM_LOOi: RAM4K9
port map (ADDRA11 => CoreAhbSRAM_l0il(11),
ADDRB11 => CoreAhbSRAM_I00l(11),
ADDRA10 => CoreAHBSRAm_l0il(10),
ADDRB10 => CoreAHBSRAm_i00l(10),
ADDRA9 => CorEAHBSram_l0IL(9),
ADDRB9 => COreAhbSRAM_I00l(9),
ADDRA8 => COREAhbSram_L0IL(8),
ADDRB8 => CoreAhbSRAM_I00l(8),
ADDRA7 => COreAhbSrAM_L0il(7),
ADDRB7 => COREAhbSraM_I00L(7),
ADDRA6 => CoreAhbSRAM_l0il(6),
ADDRB6 => CoreAhbSRAM_i00l(6),
ADDRA5 => CoreAhBSRAM_l0il(5),
ADDRB5 => COreAhbSrAM_I00l(5),
ADDRA4 => COreAhbSrAM_L0il(4),
ADDRB4 => CoreAhBSRAM_i00l(4),
ADDRA3 => CoreAhbSRAm_l0il(3),
ADDRB3 => CoreAhbSRAM_i00l(3),
ADDRA2 => COreAhbSRAM_L0il(2),
ADDRB2 => CoreAhbSRAM_I00l(2),
ADDRA1 => CorEAHBSram_l0IL(1),
ADDRB1 => CoREAHBSram_i00L(1),
ADDRA0 => CoreAhbSRAM_l0il(0),
ADDRB0 => COReAhbSraM_I00l(0),
DINA8 => COREAhbSraM_L11l,
DINB8 => CorEAHBSram_l11L,
DINA7 => CoREAHbSram_iIOL(7),
DINB7 => COreAhbSRAM_L11l,
DINA6 => CoreAhbSRAM_IIol(6),
DINB6 => COReAhbSraM_L11l,
DINA5 => COREAhbSram_IIOL(5),
DINB5 => CorEAHBSram_l11L,
DINA4 => CoreAhbSRAM_Iiol(4),
DINB4 => CoreAHBSRAm_l11l,
DINA3 => CorEAHBSram_iioL(3),
DINB3 => CoREAHBSram_l11L,
DINA2 => CoreAhbSRAM_iiol(2),
DINB2 => COReAhbSram_L11L,
DINA1 => COReAhbSraM_IIOL(1),
DINB1 => COREAhbSram_L11L,
DINA0 => COREAhbSram_IIOL(0),
DINB0 => COREAhbSram_L11L,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhbSRAM_o0ll(7),
DOUTA6 => open ,
DOUTB6 => COReAhbSraM_O0Ll(6),
DOUTA5 => open ,
DOUTB5 => CoreAhbSRAM_o0ll(5),
DOUTA4 => open ,
DOUTB4 => CoREAHBSram_o0LL(4),
DOUTA3 => open ,
DOUTB3 => CoreAhbSRAM_O0ll(3),
DOUTA2 => open ,
DOUTB2 => COReAhbSraM_O0Ll(2),
DOUTA1 => open ,
DOUTB1 => COReAhbSraM_O0Ll(1),
DOUTA0 => open ,
DOUTB0 => CoreAhBSRAm_o0ll(0),
WIDTHA1 => CoreAHBSRAm_il1(1),
WIDTHB1 => CoreAhBSRAM_il1(1),
WIDTHA0 => CorEAHBSram_il1(0),
WIDTHB0 => COreAhbSraM_IL1(0),
PIPEA => COReAhbSraM_L11L,
PIPEB => COReAhbSraM_L11L,
WMODEA => CorEAHBSram_l11L,
WMODEB => COREAhbSram_L11L,
BLKA => CoreAhbSRAM_llol(2),
BLKB => COREAhbSram_ILOL(2),
WENA => CorEAHBSram_l11L,
WENB => COreAhbSrAM_O11l,
CLKA => COREAhbSram_LO0,
CLKB => COREAhbSram_LO0,
RESET => COREAhbSram_IO0);
COREAhbSram_IOOI: RAM4K9
port map (ADDRA11 => COREAHBSram_i0IL(11),
ADDRB11 => CoreAHBSRam_o10l(11),
ADDRA10 => CoreAhbSRAM_I0il(10),
ADDRB10 => CoreAhBSRAM_o10l(10),
ADDRA9 => COReAhbSraM_I0IL(9),
ADDRB9 => CoreAhbSRAM_o10l(9),
ADDRA8 => COREAhbSram_I0IL(8),
ADDRB8 => CoreAhbSRAM_O10l(8),
ADDRA7 => CoreAhBSRAM_i0il(7),
ADDRB7 => CoreAhbSRAM_o10l(7),
ADDRA6 => CoreAhbSRAM_I0il(6),
ADDRB6 => COReAhbSraM_O10l(6),
ADDRA5 => COReAhbSraM_I0Il(5),
ADDRB5 => COREAhbSram_O10L(5),
ADDRA4 => COReAhbSrAM_I0Il(4),
ADDRB4 => CoreAHBSRAm_o10l(4),
ADDRA3 => CoREAHBSram_i0IL(3),
ADDRB3 => CoreAhbSRAM_o10l(3),
ADDRA2 => COreAhbSraM_I0Il(2),
ADDRB2 => CoreAHBSRAm_o10l(2),
ADDRA1 => CoreAhbSRAM_i0il(1),
ADDRB1 => COREAHbSram_O10L(1),
ADDRA0 => CoreAhBSRAM_i0il(0),
ADDRB0 => CoreAhBSRAM_o10l(0),
DINA8 => COREAHbSram_l11L,
DINB8 => CorEAHBSram_l11L,
DINA7 => CoreAhBSRAM_o0ol(7),
DINB7 => COREAhbSram_L11L,
DINA6 => CoreAhBSRAM_o0ol(6),
DINB6 => CoreAhbSRAM_L11l,
DINA5 => CoreAhbSRAM_O0ol(5),
DINB5 => COREAhbSram_L11L,
DINA4 => CoreAHBSram_o0OL(4),
DINB4 => COREAhbSrAM_L11l,
DINA3 => COReAhbSraM_O0Ol(3),
DINB3 => CoreAhBSRAM_l11l,
DINA2 => CoreAhbSRAM_O0ol(2),
DINB2 => COreAhbSRAM_L11l,
DINA1 => CoreAhBSRAM_o0ol(1),
DINB1 => CoreAHBSRam_l11l,
DINA0 => COreAhbSrAM_O0ol(0),
DINB0 => CoreAHBSram_l11L,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAHBSRAm_l0ll(7),
DOUTA6 => open ,
DOUTB6 => CoreAhBSRAm_l0ll(6),
DOUTA5 => open ,
DOUTB5 => CorEAHBSram_l0LL(5),
DOUTA4 => open ,
DOUTB4 => COReAhbSrAM_L0ll(4),
DOUTA3 => open ,
DOUTB3 => COREAhbSram_L0LL(3),
DOUTA2 => open ,
DOUTB2 => COREAHBSram_l0LL(2),
DOUTA1 => open ,
DOUTB1 => CoreAhbSRAM_l0ll(1),
DOUTA0 => open ,
DOUTB0 => CoreAhbSRAM_l0ll(0),
WIDTHA1 => CoreAhbSRAM_oi1(1),
WIDTHB1 => COReAhbSraM_OI1(1),
WIDTHA0 => CoreAHBSRam_oi1(0),
WIDTHB0 => COREAhbSram_OI1(0),
PIPEA => CoreAhBSRAM_l11l,
PIPEB => COREAHBSram_l11L,
WMODEA => CoreAhBSRAM_l11l,
WMODEB => CoreAHBSRAm_l11l,
BLKA => CoreAhbSRAM_llol(3),
BLKB => CoreAhBSRAM_ilol(3),
WENA => COReAhbSraM_L11l,
WENB => COREAhbSram_O11L,
CLKA => COREAhbSram_LO0,
CLKB => CoreAhbSRAM_lo0,
RESET => COreAhbSrAM_IO0);
CoreAhbSRAM_OLoi: RAM4K9
port map (ADDRA11 => CoreAhBSRAM_o1il(11),
ADDRB11 => CoreAHBSRAm_l10l(11),
ADDRA10 => COREAhbSram_O1IL(10),
ADDRB10 => CoreAhbSrAM_L10l(10),
ADDRA9 => CoREAHBSram_o1IL(9),
ADDRB9 => CoreAhbSRAM_L10l(9),
ADDRA8 => CoreAHBSRAm_o1il(8),
ADDRB8 => COReAhbSraM_L10l(8),
ADDRA7 => CoreAHBSRAm_o1il(7),
ADDRB7 => COREAhbSram_L10L(7),
ADDRA6 => CoREAHBSram_o1IL(6),
ADDRB6 => COREAhbSram_L10L(6),
ADDRA5 => CoreAHBSRam_o1iL(5),
ADDRB5 => CorEAHBSram_l10L(5),
ADDRA4 => CoreAhbSRAM_O1il(4),
ADDRB4 => COREAhbSram_L10L(4),
ADDRA3 => CoreAhBSRAM_o1il(3),
ADDRB3 => COREAhbSram_L10L(3),
ADDRA2 => CoreAhBSRAM_o1il(2),
ADDRB2 => CoreAHBSRam_l10L(2),
ADDRA1 => CoreAhbSRAM_O1il(1),
ADDRB1 => COREAhbSram_L10L(1),
ADDRA0 => COREAhbSram_O1IL(0),
ADDRB0 => COREAhbSram_L10L(0),
DINA8 => COREAhbSram_L11l,
DINB8 => CoREAHBSram_l11L,
DINA7 => COREAhbSram_L0OL(7),
DINB7 => COREAhbSram_L11L,
DINA6 => CoREAHBSram_l0OL(6),
DINB6 => CoreAHBSRAm_l11l,
DINA5 => CoreAHBSRAm_l0ol(5),
DINB5 => CoREAHBSram_l11L,
DINA4 => CoreAhbSRAM_L0ol(4),
DINB4 => COREAhbSram_L11L,
DINA3 => CoreAhBSRAM_l0ol(3),
DINB3 => CoreAHBSRAm_l11l,
DINA2 => CoreAhBSRAM_l0ol(2),
DINB2 => CoreAhbSRAM_L11l,
DINA1 => CoreAhBSRAM_l0ol(1),
DINB1 => CoREAHBSram_l11L,
DINA0 => CoreAHBSRam_l0oL(0),
DINB0 => CoreAHBSRAm_l11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhbSRAM_i0ll(7),
DOUTA6 => open ,
DOUTB6 => COREAhbSram_I0LL(6),
DOUTA5 => open ,
DOUTB5 => COREAHbSram_i0LL(5),
DOUTA4 => open ,
DOUTB4 => CoreAHBSRam_i0lL(4),
DOUTA3 => open ,
DOUTB3 => COREAhbSraM_I0Ll(3),
DOUTA2 => open ,
DOUTB2 => CoreAhbSRAM_I0ll(2),
DOUTA1 => open ,
DOUTB1 => CoreAhbSRAM_I0ll(1),
DOUTA0 => open ,
DOUTB0 => CoreAhbSRAM_i0ll(0),
WIDTHA1 => CoreAhBSRAM_li1(1),
WIDTHB1 => CoreAHBSram_lI1(1),
WIDTHA0 => CoreAHBSRAm_li1(0),
WIDTHB0 => COREAHbSraM_LI1(0),
PIPEA => COreAhbSrAM_L11l,
PIPEB => COreAhbSrAM_L11l,
WMODEA => COREAhbSram_L11L,
WMODEB => CoreAHBSRAM_l11l,
BLKA => CoREAHbSram_lLOL(4),
BLKB => COReAhbSraM_ILOL(4),
WENA => CoreAhbSRAM_l11l,
WENB => COReAhbSraM_O11l,
CLKA => CoreAhBSRAM_lo0,
CLKB => CorEAHBSram_lo0,
RESET => COREAhbSram_IO0);
COReAhbSraM_LLOI: RAM4K9
port map (ADDRA11 => COReAhbSraM_L1Il(11),
ADDRB11 => CoreAHBSRAM_i10l(11),
ADDRA10 => COreAhbSRAM_L1il(10),
ADDRB10 => COreAhbSrAM_I10l(10),
ADDRA9 => COReAhbSrAM_L1Il(9),
ADDRB9 => CoREAHBSram_i10L(9),
ADDRA8 => COreAhbSrAM_L1Il(8),
ADDRB8 => CoreAhbSRAM_i10l(8),
ADDRA7 => COREAhbSraM_L1IL(7),
ADDRB7 => COreAhbSRAM_I10l(7),
ADDRA6 => COreAhbSrAM_L1il(6),
ADDRB6 => CorEAHBSram_i10L(6),
ADDRA5 => COreAhbSrAM_L1il(5),
ADDRB5 => COreAhbSrAM_I10l(5),
ADDRA4 => COREAhbSraM_L1Il(4),
ADDRB4 => COREAHbSram_I10L(4),
ADDRA3 => CorEAHBSram_l1IL(3),
ADDRB3 => COreAhbSrAM_I10l(3),
ADDRA2 => CoreAHBSRAm_l1il(2),
ADDRB2 => CoreAHBSRam_i10l(2),
ADDRA1 => CoREAHbSram_l1IL(1),
ADDRB1 => COreAhbSRAM_I10l(1),
ADDRA0 => CoreAHBSRam_l1iL(0),
ADDRB0 => CoreAhbSRAM_i10l(0),
DINA8 => COREAHbSram_l11L,
DINB8 => COReAhbSraM_L11l,
DINA7 => CoreAhbSRAM_i0ol(7),
DINB7 => CoreAhBSRAM_l11l,
DINA6 => CoREAHBSram_i0OL(6),
DINB6 => CoREAHBSram_l11L,
DINA5 => CoreAhBSRAM_i0ol(5),
DINB5 => COREAhbSram_L11L,
DINA4 => COreAhbSrAM_I0ol(4),
DINB4 => CoreAhbSRAM_L11l,
DINA3 => COREAhbSram_I0OL(3),
DINB3 => COReAhbSraM_L11l,
DINA2 => CoreAHBSRam_i0oL(2),
DINB2 => COReAhbSraM_L11l,
DINA1 => CoreAhbSRAM_I0ol(1),
DINB1 => COREAhbSram_L11L,
DINA0 => CoreAHBSRam_i0oL(0),
DINB0 => CoreAhbSRAM_l11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhbSRAM_O1ll(7),
DOUTA6 => open ,
DOUTB6 => COReAhbSraM_O1Ll(6),
DOUTA5 => open ,
DOUTB5 => COREAhbSram_O1LL(5),
DOUTA4 => open ,
DOUTB4 => COREAHbSram_o1LL(4),
DOUTA3 => open ,
DOUTB3 => CorEAHBSram_o1lL(3),
DOUTA2 => open ,
DOUTB2 => COReAhbSrAM_O1Ll(2),
DOUTA1 => open ,
DOUTB1 => CoreAhbSRAM_O1ll(1),
DOUTA0 => open ,
DOUTB0 => COREAhbSram_O1LL(0),
WIDTHA1 => COREAHbSram_iI1(1),
WIDTHB1 => COreAhbSrAM_II1(1),
WIDTHA0 => CoreAhbSRAM_ii1(0),
WIDTHB0 => CoREAHBSram_ii1(0),
PIPEA => CoreAHBSRam_l11l,
PIPEB => CoreAhBSRAM_l11l,
WMODEA => CoREAHBSram_l11L,
WMODEB => CorEAHBSram_l11L,
BLKA => COREAHbSram_lLOL(5),
BLKB => CoreAhbSRAM_ilol(5),
WENA => COREAhbSram_L11L,
WENB => CoreAHBSRAM_o11l,
CLKA => CorEAHBSram_lo0,
CLKB => CoreAhbSRAM_Lo0,
RESET => CoreAhbSRAM_io0);
COreAhbSRAM_ILoi: RAM4K9
port map (ADDRA11 => COREAHbSram_i1IL(11),
ADDRB11 => COreAhbSrAM_OO1l(11),
ADDRA10 => CorEAHbSram_i1IL(10),
ADDRB10 => CorEAHBSram_oo1L(10),
ADDRA9 => COreAhbSrAM_I1Il(9),
ADDRB9 => COREAhbSram_OO1L(9),
ADDRA8 => COReAhbSrAM_I1il(8),
ADDRB8 => CorEAHBSram_oo1L(8),
ADDRA7 => CoreAHBSRam_i1iL(7),
ADDRB7 => COreAhbSrAM_OO1l(7),
ADDRA6 => CoreAhbSRAM_I1il(6),
ADDRB6 => CoreAHBSRAm_oo1l(6),
ADDRA5 => CoreAhbSRAM_i1il(5),
ADDRB5 => CoreAhBSRAM_oo1l(5),
ADDRA4 => COreAhbSrAM_I1il(4),
ADDRB4 => COreAhbSrAM_OO1l(4),
ADDRA3 => CoreAHBSRam_i1iL(3),
ADDRB3 => COREAhbSram_OO1L(3),
ADDRA2 => CorEAHBSram_i1IL(2),
ADDRB2 => CoreAhbSRAM_Oo1l(2),
ADDRA1 => COReAhbSraM_I1Il(1),
ADDRB1 => COREAhbSram_OO1L(1),
ADDRA0 => COREAhbSram_I1IL(0),
ADDRB0 => COREAhbSram_OO1L(0),
DINA8 => CoreAhBSRAM_l11l,
DINB8 => CoreAhbSRAM_l11l,
DINA7 => CoREAHBSram_o1OL(7),
DINB7 => CoreAhbSRAM_l11l,
DINA6 => COREAhbSram_O1OL(6),
DINB6 => CorEAHBSram_l11L,
DINA5 => COReAhbSrAM_O1ol(5),
DINB5 => COREAHbSram_l11L,
DINA4 => CoreAhbSRAM_O1ol(4),
DINB4 => CoreAhbSRAM_L11l,
DINA3 => COreAhbSraM_O1Ol(3),
DINB3 => COREAHBSram_l11L,
DINA2 => CoreAHBSram_o1OL(2),
DINB2 => COReAhbSraM_L11l,
DINA1 => CoreAhbSRAM_o1ol(1),
DINB1 => CoreAhbSrAM_L11l,
DINA0 => CorEAHBSram_o1OL(0),
DINB0 => CoreAHBSRAm_l11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhbSRAM_L1ll(7),
DOUTA6 => open ,
DOUTB6 => CoreAhBSRAM_l1ll(6),
DOUTA5 => open ,
DOUTB5 => COREAhbSram_L1LL(5),
DOUTA4 => open ,
DOUTB4 => COREAhbSram_L1LL(4),
DOUTA3 => open ,
DOUTB3 => CoreAhbSRAM_L1ll(3),
DOUTA2 => open ,
DOUTB2 => CoreAHBSRAm_l1ll(2),
DOUTA1 => open ,
DOUTB1 => COREAhbSram_L1LL(1),
DOUTA0 => open ,
DOUTB0 => CoreAhbSRAM_l1ll(0),
WIDTHA1 => COREAhbSram_O01(1),
WIDTHB1 => CoreAhBSRAM_o01(1),
WIDTHA0 => CoreAhbSRAM_O01(0),
WIDTHB0 => COREAHbSram_o01(0),
PIPEA => COReAhbSraM_L11l,
PIPEB => CoREAHBSram_l11L,
WMODEA => COREAhbSram_L11L,
WMODEB => COREAHbSram_L11L,
BLKA => CoREAHBSram_lLOL(6),
BLKB => CoreAHBSRAm_ilol(6),
WENA => CoreAHBSram_l11L,
WENB => COreAhbSrAM_O11l,
CLKA => CoreAhbSRAM_lo0,
CLKB => COREAHbSram_lO0,
RESET => COreAhbSrAM_IO0);
CoreAhBSRAM_oioi: RAM4K9
port map (ADDRA11 => CoreAhBSRAM_oo0l(11),
ADDRB11 => COreAhbSRAM_LO1l(11),
ADDRA10 => CoREAHBSram_oo0L(10),
ADDRB10 => CoreAhbSRAM_Lo1l(10),
ADDRA9 => CoreAhbSRAM_oo0l(9),
ADDRB9 => CoreAhbSRAM_lo1l(9),
ADDRA8 => CoreAHBSRAm_oo0l(8),
ADDRB8 => CoreAHBSRAM_lo1l(8),
ADDRA7 => COREAhbSraM_OO0L(7),
ADDRB7 => COReAhbSrAM_LO1l(7),
ADDRA6 => CorEAHBSram_oo0L(6),
ADDRB6 => CoreAhbSRAM_Lo1l(6),
ADDRA5 => COREAHbSram_oO0L(5),
ADDRB5 => COREAhbSram_LO1L(5),
ADDRA4 => COREAhbSram_OO0L(4),
ADDRB4 => CoreAHBSRam_lo1l(4),
ADDRA3 => COREAHbSram_oO0L(3),
ADDRB3 => COReAhbSraM_LO1l(3),
ADDRA2 => CoreAHBSRAm_oo0l(2),
ADDRB2 => CorEAHBSram_lo1L(2),
ADDRA1 => CoreAHBSram_oo0L(1),
ADDRB1 => CoREAHBSram_lO1L(1),
ADDRA0 => COReAhbSraM_OO0l(0),
ADDRB0 => CoreAhBSRAM_lo1l(0),
DINA8 => COReAhbSram_L11L,
DINB8 => CoREAHBSram_l11L,
DINA7 => COREAHbSram_L1OL(7),
DINB7 => CoreAHBSRAm_l11l,
DINA6 => COREAhbSram_L1OL(6),
DINB6 => CoreAhbSRAM_l11l,
DINA5 => COREAhbSram_L1Ol(5),
DINB5 => CorEAhBSRAm_l11l,
DINA4 => CoreAHBSRAM_l1ol(4),
DINB4 => CoreAhBSRAM_l11l,
DINA3 => CoREAHBSram_l1OL(3),
DINB3 => CorEAHBSram_l11L,
DINA2 => COreAhbSrAM_L1ol(2),
DINB2 => CorEAHBSram_l11L,
DINA1 => COreAhbSRAM_L1ol(1),
DINB1 => COREAhbSraM_L11l,
DINA0 => CorEAHBSram_l1OL(0),
DINB0 => CoreAhbSRAM_L11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => COREAhbSram_I1LL(7),
DOUTA6 => open ,
DOUTB6 => CoreAhBSRAM_i1ll(6),
DOUTA5 => open ,
DOUTB5 => CoreAhBSRAm_i1ll(5),
DOUTA4 => open ,
DOUTB4 => COreAhbSrAM_I1ll(4),
DOUTA3 => open ,
DOUTB3 => CoreAhbSRAM_I1ll(3),
DOUTA2 => open ,
DOUTB2 => CoreAhBSRAM_i1ll(2),
DOUTA1 => open ,
DOUTB1 => CoreAHBSRAM_i1ll(1),
DOUTA0 => open ,
DOUTB0 => COReAhbSraM_I1Ll(0),
WIDTHA1 => CorEAHBSram_l01(1),
WIDTHB1 => CoreAHBSRam_l01(1),
WIDTHA0 => COREAhbSraM_L01(0),
WIDTHB0 => CorEAHBSram_l01(0),
PIPEA => CoreAhbSRAM_l11l,
PIPEB => COREAhbSram_L11L,
WMODEA => CorEAHBSram_l11L,
WMODEB => CoreAhbSRAM_l11l,
BLKA => CoREAHBSram_lLOL(7),
BLKB => CoreAhbSRAM_Ilol(7),
WENA => CoreAhbSRAM_L11l,
WENB => CoreAhBSRAM_o11l,
CLKA => CoreAHBSRam_lo0,
CLKB => CoreAHBSRAm_lo0,
RESET => COReAhbSraM_IO0);
CoreAhBSRAM_lioi: RAM4K9
port map (ADDRA11 => COreAhbSrAM_LO0l(11),
ADDRB11 => COREAHbSram_iO1L(11),
ADDRA10 => COreAhbSRAM_LO0l(10),
ADDRB10 => CoreAHBSRam_io1l(10),
ADDRA9 => COREAHbSram_lO0L(9),
ADDRB9 => CoreAhBSRAM_io1l(9),
ADDRA8 => COReAhbSraM_LO0l(8),
ADDRB8 => COreAhbSrAM_IO1l(8),
ADDRA7 => CoreAhBSRAM_lo0l(7),
ADDRB7 => CoreAHBSRAm_io1l(7),
ADDRA6 => CoreAhbSRAM_lo0l(6),
ADDRB6 => COREAhbSram_IO1L(6),
ADDRA5 => COreAhbSrAM_LO0l(5),
ADDRB5 => COREAHbSram_iO1L(5),
ADDRA4 => CoreAhBSRAM_lo0l(4),
ADDRB4 => CorEAHBSram_io1L(4),
ADDRA3 => CoreAHBSRam_lo0L(3),
ADDRB3 => COREAhbSram_IO1L(3),
ADDRA2 => CoreAhbSRAM_Lo0l(2),
ADDRB2 => CoreAhbSRAM_io1l(2),
ADDRA1 => CoreAhbSRAM_lo0l(1),
ADDRB1 => CoREAHBSram_io1L(1),
ADDRA0 => CorEAHBSram_lo0L(0),
ADDRB0 => COreAhbSrAM_IO1l(0),
DINA8 => CoREAHBSram_l11L,
DINB8 => COREAhbSram_L11L,
DINA7 => CoREAHBSram_i1OL(7),
DINB7 => CoreAhbSRAM_l11l,
DINA6 => CoREAHBSram_i1OL(6),
DINB6 => COREAhbSram_L11L,
DINA5 => CoreAhBSRAM_i1ol(5),
DINB5 => CoreAhbSRAM_l11l,
DINA4 => CoreAhbSRAM_I1ol(4),
DINB4 => CorEAHBSram_l11L,
DINA3 => COREAhbSram_I1OL(3),
DINB3 => CoreAhbSRAM_L11l,
DINA2 => CoreAhbSRAM_i1ol(2),
DINB2 => CoreAHBSRam_l11l,
DINA1 => COREAhbSram_I1OL(1),
DINB1 => COREAhbSram_L11L,
DINA0 => CoreAhBSRAM_i1ol(0),
DINB0 => COreAhbSrAM_L11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhBSRAM_ooil(7),
DOUTA6 => open ,
DOUTB6 => CoreAHBSram_ooiL(6),
DOUTA5 => open ,
DOUTB5 => COReAhbSram_OOIL(5),
DOUTA4 => open ,
DOUTB4 => CoreAhbSRAM_ooil(4),
DOUTA3 => open ,
DOUTB3 => COREAhbSram_OOIL(3),
DOUTA2 => open ,
DOUTB2 => CoreAHBSram_ooiL(2),
DOUTA1 => open ,
DOUTB1 => COREAhbSram_OOIL(1),
DOUTA0 => open ,
DOUTB0 => COreAhbSrAM_ooil(0),
WIDTHA1 => COReAhbSraM_I01(1),
WIDTHB1 => COREAhbSram_I01(1),
WIDTHA0 => COREAhbSram_I01(0),
WIDTHB0 => CoreAhBSRAM_i01(0),
PIPEA => CoREAHBSram_l11L,
PIPEB => CoreAhBSRAM_l11L,
WMODEA => CoreAhbSRAM_l11l,
WMODEB => COreAhbSrAM_L11l,
BLKA => COreAhbSraM_LLOl(8),
BLKB => CoreAhbSRAM_Ilol(8),
WENA => CoreAhbSRAM_l11l,
WENB => CoreAHBSram_o11L,
CLKA => COREAHbSram_lO0,
CLKB => CoreAhbSRAM_LO0,
RESET => COreAhbSrAM_IO0);
COREAhbSram_IIOI: RAM4K9
port map (ADDRA11 => CoreAhbSRAM_io0l(11),
ADDRB11 => CoreAhBSRAM_ol1l(11),
ADDRA10 => COREAhbSram_IO0L(10),
ADDRB10 => CorEAHBSram_ol1L(10),
ADDRA9 => CoreAhbSRAM_Io0l(9),
ADDRB9 => CoreAhbSRAM_ol1l(9),
ADDRA8 => COreAhbSrAM_IO0l(8),
ADDRB8 => CorEAHBSram_ol1L(8),
ADDRA7 => CorEAHBSram_io0L(7),
ADDRB7 => CoREAHBSram_ol1L(7),
ADDRA6 => COREAhbSram_IO0L(6),
ADDRB6 => COReAhbSraM_OL1l(6),
ADDRA5 => CoreAhbSRAM_io0l(5),
ADDRB5 => COREAHbSram_oL1L(5),
ADDRA4 => CoreAhBSRAM_io0l(4),
ADDRB4 => CoreAHBSRAm_ol1l(4),
ADDRA3 => CoreAhbSRAM_io0l(3),
ADDRB3 => CoreAhbSRAM_OL1l(3),
ADDRA2 => COreAhbSrAM_IO0l(2),
ADDRB2 => CoreAhbSRAM_OL1l(2),
ADDRA1 => COreAhbSrAM_IO0l(1),
ADDRB1 => CoreAHBSRam_ol1L(1),
ADDRA0 => COREAhbSram_IO0L(0),
ADDRB0 => CoreAhBSRAM_ol1l(0),
DINA8 => CoreAhbSRAM_L11l,
DINB8 => CoreAhbSRAM_l11l,
DINA7 => CoreAhbSRAM_Ooll(7),
DINB7 => CoreAhbSRAM_L11l,
DINA6 => CoreAhBSRAM_ooll(6),
DINB6 => CoreAHBSRam_l11l,
DINA5 => CoreAhBSRAM_ooll(5),
DINB5 => COREAhbSraM_L11l,
DINA4 => CoreAhbSRAM_ooll(4),
DINB4 => COREAhbSram_L11L,
DINA3 => COReAhbSraM_OOLl(3),
DINB3 => CoreAhbSRAM_l11l,
DINA2 => COREAHbSram_OOLL(2),
DINB2 => CoreAhbSrAM_L11l,
DINA1 => COREAhbSram_OOLL(1),
DINB1 => COREAhbSram_L11L,
DINA0 => COREAhbSram_OOLL(0),
DINB0 => CoreAhbSRAM_l11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhBSRAM_loil(7),
DOUTA6 => open ,
DOUTB6 => COREAhbSram_LOIL(6),
DOUTA5 => open ,
DOUTB5 => CoreAhBSRAM_loil(5),
DOUTA4 => open ,
DOUTB4 => CoreAhbSRAM_Loil(4),
DOUTA3 => open ,
DOUTB3 => COREAhbSram_LOIL(3),
DOUTA2 => open ,
DOUTB2 => CoREAHBSram_loIL(2),
DOUTA1 => open ,
DOUTB1 => CoreAhbSRAM_Loil(1),
DOUTA0 => open ,
DOUTB0 => COreAhbSRAM_LOil(0),
WIDTHA1 => CoREAHBSram_o11(1),
WIDTHB1 => COREAhbSram_O11(1),
WIDTHA0 => CoreAhbSRAM_o11(0),
WIDTHB0 => COREAHbSram_o11(0),
PIPEA => CoreAhbSRAM_l11l,
PIPEB => CoreAhbSRAM_L11l,
WMODEA => COREAhbSram_L11L,
WMODEB => CoreAHBSRAm_l11l,
BLKA => COREAhbSram_LLOL(9),
BLKB => CoreAHBSRAm_ilol(9),
WENA => CoREAHBSram_l11L,
WENB => CoreAhbSRAM_o11l,
CLKA => CoreAhbSRAM_lo0,
CLKB => CoreAhbSRAM_Lo0,
RESET => CorEAHBSram_io0);
COreAhbSrAM_O0oi: RAM4K9
port map (ADDRA11 => COREAhbSram_OL0L(11),
ADDRB11 => COREAhbSram_LL1L(11),
ADDRA10 => COREAhbSram_OL0L(10),
ADDRB10 => CoreAhbSRAM_ll1l(10),
ADDRA9 => CoreAHBSRam_ol0l(9),
ADDRB9 => COREAhbSram_LL1l(9),
ADDRA8 => COREAhbSraM_OL0l(8),
ADDRB8 => CoreAhbSrAM_LL1l(8),
ADDRA7 => COreAhbSrAM_OL0l(7),
ADDRB7 => COREAHbSram_ll1l(7),
ADDRA6 => COreAhbSrAM_OL0l(6),
ADDRB6 => COREAhbSram_LL1L(6),
ADDRA5 => CoreAhbSRAM_ol0l(5),
ADDRB5 => CoreAHBSRam_ll1l(5),
ADDRA4 => CoreAhBSRAM_ol0l(4),
ADDRB4 => CoreAHBSRAm_ll1l(4),
ADDRA3 => COREAhbSram_OL0L(3),
ADDRB3 => CoreAhbSRAM_ll1l(3),
ADDRA2 => CorEAHBSram_ol0L(2),
ADDRB2 => COREAHbSram_LL1L(2),
ADDRA1 => CoREAHBSram_oL0L(1),
ADDRB1 => CoreAhBSRAM_ll1l(1),
ADDRA0 => CoreAhbSRAM_Ol0l(0),
ADDRB0 => CoREAhbSram_LL1L(0),
DINA8 => CoreAhbSRAM_l11l,
DINB8 => CoreAhbSRAM_l11l,
DINA7 => COReAhbSraM_LOLl(7),
DINB7 => COREAhbSram_L11L,
DINA6 => CoreAHBSRAm_loll(6),
DINB6 => COReAhbSraM_L11l,
DINA5 => CoreAhBSRAM_loll(5),
DINB5 => CorEAHBSram_l11L,
DINA4 => CoreAhBSRAM_loll(4),
DINB4 => CoreAhBSRAM_l11l,
DINA3 => CoREAHBSram_lOLL(3),
DINB3 => CoreAhbSRAM_L11l,
DINA2 => CoreAhbSRAM_loll(2),
DINB2 => COREAHbSram_l11L,
DINA1 => CoreAhbSRAM_Loll(1),
DINB1 => CoreAhbSRAM_L11l,
DINA0 => COREAhbSram_LOLL(0),
DINB0 => COREAHbSram_l11L,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhbSRAM_Ioil(7),
DOUTA6 => open ,
DOUTB6 => COReAhbSraM_IOIL(6),
DOUTA5 => open ,
DOUTB5 => CoreAHBSRAm_ioil(5),
DOUTA4 => open ,
DOUTB4 => CoreAHBSRAm_ioil(4),
DOUTA3 => open ,
DOUTB3 => CoreAhbSRAM_ioil(3),
DOUTA2 => open ,
DOUTB2 => CoreAhBSRAM_ioil(2),
DOUTA1 => open ,
DOUTB1 => COReAhbSrAM_IOIl(1),
DOUTA0 => open ,
DOUTB0 => COREAhbSram_iOIL(0),
WIDTHA1 => CoreAHBSRam_l11(1),
WIDTHB1 => COReAhbSraM_L11(1),
WIDTHA0 => COREAhbSram_L11(0),
WIDTHB0 => CoreAhBSRAm_l11(0),
PIPEA => CorEAHBSram_l11L,
PIPEB => CoreAHBSRAm_l11l,
WMODEA => CoreAhbSRAM_l11l,
WMODEB => COREAHbSram_l11L,
BLKA => COREAhbSram_LLOL(10),
BLKB => COREAhbSram_ILOL(10),
WENA => COREAhbSram_L11L,
WENB => CoreAhbSRAM_O11l,
CLKA => CoreAhBSRAM_lo0,
CLKB => COreAhbSRAM_LO0,
RESET => COREAhbSram_IO0);
COreAhbSrAM_L0oi: RAM4K9
port map (ADDRA11 => COREAhbSram_LL0L(11),
ADDRB11 => CoreAhBSRAM_il1l(11),
ADDRA10 => CoreAHBSRam_ll0l(10),
ADDRB10 => CoreAhbSRAM_Il1l(10),
ADDRA9 => COREAHbSram_LL0L(9),
ADDRB9 => COREAHbSram_iL1L(9),
ADDRA8 => CoreAhbSRAM_Ll0l(8),
ADDRB8 => CoREAHBSram_iL1L(8),
ADDRA7 => CoreAhbSRAM_ll0l(7),
ADDRB7 => CoreAhBSRAM_il1l(7),
ADDRA6 => COREAhbSram_LL0L(6),
ADDRB6 => CoreAhbSRAM_il1l(6),
ADDRA5 => CoREAHbSram_lL0L(5),
ADDRB5 => CoreAhBSRAM_il1l(5),
ADDRA4 => CoREAHbSram_lL0L(4),
ADDRB4 => COreAhbSrAM_IL1l(4),
ADDRA3 => CoreAhbSRAM_ll0l(3),
ADDRB3 => COREAHbSram_IL1L(3),
ADDRA2 => COREAHbSram_LL0L(2),
ADDRB2 => CoreAhbSRAM_il1l(2),
ADDRA1 => CoreAhBSRAm_ll0l(1),
ADDRB1 => COREAhbSram_IL1L(1),
ADDRA0 => CoREAHBSram_ll0L(0),
ADDRB0 => CoreAhbSRAM_IL1l(0),
DINA8 => CoREAHBSram_l11L,
DINB8 => CoreAhBSRAm_l11l,
DINA7 => CoreAhbSRAM_Ioll(7),
DINB7 => CoreAhbSRAM_L11l,
DINA6 => CoREAHBSram_ioLL(6),
DINB6 => COREAhbSram_L11L,
DINA5 => CoreAhbSRAM_Ioll(5),
DINB5 => COREAHbSram_l11L,
DINA4 => COREAhbSram_IOLL(4),
DINB4 => CoreAHBSRAm_l11l,
DINA3 => COREAhbSram_IOLL(3),
DINB3 => CoreAHBSRam_l11L,
DINA2 => CoREAHBSram_iOLL(2),
DINB2 => COREAhbSram_L11L,
DINA1 => CoreAhbSRAM_ioll(1),
DINB1 => COreAhbSrAM_L11l,
DINA0 => CoREAHBSram_ioLL(0),
DINB0 => CoreAhBSRam_l11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => COReAhbSraM_OLIl(7),
DOUTA6 => open ,
DOUTB6 => CoreAHBSRAm_olil(6),
DOUTA5 => open ,
DOUTB5 => CoreAHBSRam_oliL(5),
DOUTA4 => open ,
DOUTB4 => COReAhbSraM_OLIL(4),
DOUTA3 => open ,
DOUTB3 => CoreAhbSRAM_olil(3),
DOUTA2 => open ,
DOUTB2 => COREAhbSram_OLIL(2),
DOUTA1 => open ,
DOUTB1 => CoreAhbSrAM_OLil(1),
DOUTA0 => open ,
DOUTB0 => CoreAHBSRam_olil(0),
WIDTHA1 => COREAhbSram_i11(1),
WIDTHB1 => COReAhbSraM_I11(1),
WIDTHA0 => CoreAhbSRAM_i11(0),
WIDTHB0 => CoreAhbSRAM_I11(0),
PIPEA => CoreAhBSRAM_l11l,
PIPEB => CoreAhbSRAM_L11l,
WMODEA => CoREAHBSram_l11L,
WMODEB => CoreAhBSRAM_l11l,
BLKA => CoreAHBSram_lloL(11),
BLKB => COREAhbSram_ILOL(11),
WENA => CoreAhBSRAM_l11l,
WENB => COReAhbSrAM_O11l,
CLKA => CoreAHBSRam_lo0,
CLKB => COREAhbSram_LO0,
RESET => CoreAhbSRAM_Io0);
CoreAhBSRAM_i0oi: RAM4K9
port map (ADDRA11 => CoreAhbSRAM_il0l(11),
ADDRB11 => CoreAHBSRam_oi1L(11),
ADDRA10 => CoreAhBSRAM_il0l(10),
ADDRB10 => CoREAHBSram_oI1L(10),
ADDRA9 => COreAhbSrAM_IL0l(9),
ADDRB9 => CoreAHBSRAm_oi1l(9),
ADDRA8 => CoREAHBSram_il0L(8),
ADDRB8 => COREAhbSram_OI1L(8),
ADDRA7 => CoreAhbSRAM_il0l(7),
ADDRB7 => CoREAHBSram_oi1L(7),
ADDRA6 => CoreAhBSRAM_il0l(6),
ADDRB6 => CoreAhBSRAM_oi1l(6),
ADDRA5 => COREAhbSram_IL0L(5),
ADDRB5 => CoreAhBSRAM_oi1l(5),
ADDRA4 => CoreAhBSRAM_il0l(4),
ADDRB4 => CoreAHBSRam_oi1L(4),
ADDRA3 => CoreAhbSRAM_il0l(3),
ADDRB3 => CoreAhBSRAM_oi1l(3),
ADDRA2 => CoreAHBSRAm_il0l(2),
ADDRB2 => COREAHbSram_oI1L(2),
ADDRA1 => COREAhbSram_IL0L(1),
ADDRB1 => CoreAhBSRAM_oi1l(1),
ADDRA0 => COREAhbSram_iL0L(0),
ADDRB0 => CoreAhbSRAM_oi1l(0),
DINA8 => COreAhbSrAM_L11l,
DINB8 => CoreAHBSRAm_l11l,
DINA7 => COREAhbSram_OLLL(7),
DINB7 => CoreAHBSRam_l11L,
DINA6 => CoREAHbSram_oLLL(6),
DINB6 => CoreAHBSram_l11L,
DINA5 => CoreAhBSRAM_olll(5),
DINB5 => CoREAHBSram_l11L,
DINA4 => CoreAhbSRAM_olll(4),
DINB4 => CoreAHBSram_l11L,
DINA3 => CoreAhbSRAM_olll(3),
DINB3 => COREAhbSraM_L11l,
DINA2 => COREAhbSraM_OLLL(2),
DINB2 => COREAhbSram_L11L,
DINA1 => CoreAhbSRAM_Olll(1),
DINB1 => CoreAhBSRAM_l11l,
DINA0 => COreAhbSrAM_OLll(0),
DINB0 => COREAHBSram_l11L,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhBSRAM_llil(7),
DOUTA6 => open ,
DOUTB6 => CoreAhbSRAM_llil(6),
DOUTA5 => open ,
DOUTB5 => CoreAhbSRAM_Llil(5),
DOUTA4 => open ,
DOUTB4 => COreAhbSrAM_LLil(4),
DOUTA3 => open ,
DOUTB3 => CoreAHBSRam_llil(3),
DOUTA2 => open ,
DOUTB2 => COREAhbSram_LLIL(2),
DOUTA1 => open ,
DOUTB1 => COREAhbSram_LLIL(1),
DOUTA0 => open ,
DOUTB0 => COreAhbSRAM_LLil(0),
WIDTHA1 => CoreAhbSRAM_oool(1),
WIDTHB1 => COReAhbSraM_OOOl(1),
WIDTHA0 => CoREAHBSram_oOOL(0),
WIDTHB0 => COREAhbSram_OOOL(0),
PIPEA => CoreAhBSRAM_l11l,
PIPEB => COReAhbSraM_L11l,
WMODEA => COreAhbSrAM_L11l,
WMODEB => COReAhbSraM_L11l,
BLKA => CorEAHBSram_llOL(12),
BLKB => COreAhbSraM_ILOl(12),
WENA => CoreAhBSRAM_l11l,
WENB => CoreAhbSRAM_o11l,
CLKA => COReAhbSrAM_LO0,
CLKB => COREAHbSram_lO0,
RESET => COREAhbSraM_IO0);
CoreAhbSRAM_O1oi: RAM4K9
port map (ADDRA11 => CoreAhbSRAM_oi0l(11),
ADDRB11 => CoreAhbSRAM_li1l(11),
ADDRA10 => CoreAHBSRam_oi0l(10),
ADDRB10 => CoreAHBSRam_li1l(10),
ADDRA9 => COReAhbSraM_OI0l(9),
ADDRB9 => CoreAHBSram_li1L(9),
ADDRA8 => COreAhBSRAM_oi0l(8),
ADDRB8 => CoreAhbSrAM_LI1l(8),
ADDRA7 => CoreAhbSRAM_OI0l(7),
ADDRB7 => CoreAHBSRAm_li1l(7),
ADDRA6 => COREAhbSram_OI0L(6),
ADDRB6 => COreAhbSrAM_LI1l(6),
ADDRA5 => COREAHbSram_OI0L(5),
ADDRB5 => CoREAHBSram_li1L(5),
ADDRA4 => CoreAhbSRAM_Oi0l(4),
ADDRB4 => COreAhbSRAM_LI1l(4),
ADDRA3 => CoreAhBSRAM_oi0l(3),
ADDRB3 => CoreAhbSRAM_Li1l(3),
ADDRA2 => CoreAhbSRAM_Oi0l(2),
ADDRB2 => CoreAhBSRAM_li1l(2),
ADDRA1 => CoreAHBSRam_oi0l(1),
ADDRB1 => COREAHbSram_LI1L(1),
ADDRA0 => COREAhbSram_OI0L(0),
ADDRB0 => CoreAhbSrAM_LI1l(0),
DINA8 => CoreAHBSRam_l11L,
DINB8 => COREAhbSram_L11L,
DINA7 => COREAhbSram_LLLL(7),
DINB7 => CorEAHBSram_l11L,
DINA6 => CoreAhbSRAM_Llll(6),
DINB6 => CoreAhbSRAM_L11l,
DINA5 => COreAhbSRAM_LLll(5),
DINB5 => CoREAHBSram_l11L,
DINA4 => CoreAhbSRAM_llll(4),
DINB4 => CorEAHBSram_l11L,
DINA3 => CoreAhBSRAm_llll(3),
DINB3 => CoreAHBSRAm_l11l,
DINA2 => COReAhbSraM_LLLL(2),
DINB2 => CoreAHBSRAm_l11l,
DINA1 => CoreAhbSRAM_llll(1),
DINB1 => CoreAhbSRAM_l11l,
DINA0 => CorEAHBSram_llLL(0),
DINB0 => CoreAHBSRam_l11L,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAHBSram_iliL(7),
DOUTA6 => open ,
DOUTB6 => COREAhbSram_ILIL(6),
DOUTA5 => open ,
DOUTB5 => CoreAhBSRAM_ilil(5),
DOUTA4 => open ,
DOUTB4 => COREAhbSraM_ILIL(4),
DOUTA3 => open ,
DOUTB3 => COREAhbSram_ILIL(3),
DOUTA2 => open ,
DOUTB2 => CoREAHBSram_ilIL(2),
DOUTA1 => open ,
DOUTB1 => COREAHbSram_ILIL(1),
DOUTA0 => open ,
DOUTB0 => COREAhbSram_ILIL(0),
WIDTHA1 => COreAhbSrAM_LOOl(1),
WIDTHB1 => CoREAHBSram_loOL(1),
WIDTHA0 => CoreAhbSRAM_lool(0),
WIDTHB0 => CoreAhBSRAm_lool(0),
PIPEA => COreAhbSrAM_L11l,
PIPEB => CoreAhBSRAM_l11l,
WMODEA => CoreAhbSRAM_L11l,
WMODEB => CoreAhBSRAM_l11l,
BLKA => COReAhbSraM_LLOl(13),
BLKB => COREAhbSram_ILOL(13),
WENA => COreAhbSrAM_L11l,
WENB => CoREAHBSram_o11L,
CLKA => COReAhbSraM_LO0,
CLKB => CoreAhbSRAM_lo0,
RESET => COREAhbSram_IO0);
CoreAhbSRAM_l1oi: RAM4K9
port map (ADDRA11 => COreAhbSrAM_LI0l(11),
ADDRB11 => COreAhbSRAM_II1l(11),
ADDRA10 => COREAhbSram_LI0L(10),
ADDRB10 => CoREAHbSram_iI1L(10),
ADDRA9 => CorEAHBSram_li0L(9),
ADDRB9 => CoreAhbSRAM_ii1l(9),
ADDRA8 => CoreAhbSRAM_Li0l(8),
ADDRB8 => CoreAhBSRAM_ii1l(8),
ADDRA7 => CoreAhbSRAM_Li0l(7),
ADDRB7 => CoreAHBSram_ii1L(7),
ADDRA6 => CoreAHBSRAm_li0l(6),
ADDRB6 => COreAhbSrAM_II1l(6),
ADDRA5 => CoreAhBSRAM_li0l(5),
ADDRB5 => COREAhbSram_II1L(5),
ADDRA4 => CoreAhbSRAM_Li0l(4),
ADDRB4 => CoreAHBSRam_ii1l(4),
ADDRA3 => COREAhbSram_LI0L(3),
ADDRB3 => CoreAHBSRam_ii1L(3),
ADDRA2 => COREAhbSram_LI0L(2),
ADDRB2 => CoreAhbSRAM_ii1l(2),
ADDRA1 => CoREAHBSram_li0L(1),
ADDRB1 => COREAHbSram_iI1L(1),
ADDRA0 => COREAHbSram_lI0L(0),
ADDRB0 => CoreAhBSRAM_ii1l(0),
DINA8 => COREAhbSram_L11L,
DINB8 => COREAHbSram_l11L,
DINA7 => CoREAHBSram_ilLL(7),
DINB7 => COREAhbSram_L11L,
DINA6 => COREAhbSram_ILLL(6),
DINB6 => COREAhbSram_L11L,
DINA5 => COREAhbSram_ILLL(5),
DINB5 => COREAhbSram_L11L,
DINA4 => COREAHbSram_iLLL(4),
DINB4 => CoreAhBSRAM_l11l,
DINA3 => CoreAhBSRAm_illl(3),
DINB3 => CoreAHBSRAm_l11l,
DINA2 => CoreAhbSrAM_ILll(2),
DINB2 => CorEAHBSram_l11L,
DINA1 => CorEAHBSram_ilLL(1),
DINB1 => CoreAhbSRAM_l11l,
DINA0 => CoreAhbSRAM_illl(0),
DINB0 => COREAhbSram_L11L,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => COREAhbSram_OIIL(7),
DOUTA6 => open ,
DOUTB6 => COReAhbSraM_OIIl(6),
DOUTA5 => open ,
DOUTB5 => COReAhbSraM_OIIl(5),
DOUTA4 => open ,
DOUTB4 => CorEAHBSram_oiIL(4),
DOUTA3 => open ,
DOUTB3 => COREAhbSram_OIIL(3),
DOUTA2 => open ,
DOUTB2 => CoreAhBSRAM_oiil(2),
DOUTA1 => open ,
DOUTB1 => COREAhbSram_OIIL(1),
DOUTA0 => open ,
DOUTB0 => CoREAHBSram_oIIL(0),
WIDTHA1 => CoreAhBSRAM_iool(1),
WIDTHB1 => COREAhbSram_IOOL(1),
WIDTHA0 => CoreAhBSRAM_iool(0),
WIDTHB0 => CoreAHBSram_ioOL(0),
PIPEA => CoreAhbSRAM_l11l,
PIPEB => CoreAHBSRam_l11l,
WMODEA => COREAhbSram_L11L,
WMODEB => CorEAHBSram_l11L,
BLKA => CorEAHBSram_lloL(14),
BLKB => COREAHbSram_iLOL(14),
WENA => COREAhbSrAM_L11l,
WENB => COREAhbSram_O11L,
CLKA => COReAhbSraM_LO0,
CLKB => COREAhbSram_LO0,
RESET => CoreAhbSRAM_Io0);
COreAhbSrAM_I1Oi: RAM4K9
port map (ADDRA11 => COREAHbSram_iI0L(11),
ADDRB11 => CoreAhbSRAM_o01l(11),
ADDRA10 => COREAhbSram_II0L(10),
ADDRB10 => COREAhbSram_O01l(10),
ADDRA9 => CoreAHBSram_ii0L(9),
ADDRB9 => CoreAHBSRam_o01L(9),
ADDRA8 => CoREAHBSram_ii0L(8),
ADDRB8 => CoreAHBSRam_o01l(8),
ADDRA7 => COREAHbSram_iI0L(7),
ADDRB7 => COREAHbSram_o01L(7),
ADDRA6 => COReAhbSraM_II0l(6),
ADDRB6 => CoreAhBSRAM_o01l(6),
ADDRA5 => CoreAhbSRAM_II0l(5),
ADDRB5 => COreAhbSRAM_O01l(5),
ADDRA4 => COREAHbSram_iI0L(4),
ADDRB4 => COreAhbSRAM_O01l(4),
ADDRA3 => CoREAHBSram_ii0L(3),
ADDRB3 => CoREAHBSram_o01L(3),
ADDRA2 => CoreAhbSRAM_ii0l(2),
ADDRB2 => COReAhbSraM_O01L(2),
ADDRA1 => COREAhbSram_II0L(1),
ADDRB1 => CoreAHBSRam_o01l(1),
ADDRA0 => CoREAHBSram_ii0L(0),
ADDRB0 => CoreAHBSRam_o01L(0),
DINA8 => CorEAHBSram_l11L,
DINB8 => COREAhbSram_L11L,
DINA7 => CoreAhbSRAM_Oill(7),
DINB7 => CoreAhBSRAM_l11l,
DINA6 => COreAhbSrAM_OILl(6),
DINB6 => COReAhbSraM_L11l,
DINA5 => COreAhbSrAM_OIll(5),
DINB5 => CoreAhBSRAM_l11l,
DINA4 => CoreAHBSRam_oill(4),
DINB4 => COREAhbSram_L11L,
DINA3 => CorEAHBSram_oilL(3),
DINB3 => CoreAHBSRAm_l11l,
DINA2 => CoreAhbSRAM_Oill(2),
DINB2 => COREAhbSram_L11L,
DINA1 => CoreAHBSRam_oill(1),
DINB1 => COreAhbSrAM_L11l,
DINA0 => COREAhbSram_OILL(0),
DINB0 => COreAhbSrAM_L11l,
DOUTA8 => open ,
DOUTB8 => open ,
DOUTA7 => open ,
DOUTB7 => CoreAhbSRAM_Liil(7),
DOUTA6 => open ,
DOUTB6 => COREAHbSram_LIIL(6),
DOUTA5 => open ,
DOUTB5 => COREAhbSram_LIIL(5),
DOUTA4 => open ,
DOUTB4 => COREAhbSram_LIIL(4),
DOUTA3 => open ,
DOUTB3 => COreAhbSrAM_LIIl(3),
DOUTA2 => open ,
DOUTB2 => CoreAhBSRAM_liil(2),
DOUTA1 => open ,
DOUTB1 => CoreAhbSRAM_liil(1),
DOUTA0 => open ,
DOUTB0 => COREAHbSram_LIIL(0),
WIDTHA1 => CoREAHBSram_olOL(1),
WIDTHB1 => COREAhbSram_OLOL(1),
WIDTHA0 => CoreAhbSRAM_Olol(0),
WIDTHB0 => COREAHbSram_oLOL(0),
PIPEA => CoreAhBSRAM_l11l,
PIPEB => CoreAhbSRAM_l11l,
WMODEA => CoreAHBSram_l11L,
WMODEB => CoreAHBSram_l11L,
BLKA => COREAHBSram_lLOL(15),
BLKB => CoREAHBSram_ilOL(15),
WENA => COReAhbSraM_L11l,
WENB => COreAhbSrAM_O11l,
CLKA => CoreAHBSRam_lo0,
CLKB => COREAhbSraM_LO0,
RESET => CoreAHBSRam_io0);
end CoreAhbSRAM_OI;
