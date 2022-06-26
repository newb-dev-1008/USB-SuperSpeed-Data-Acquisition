-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
-- SVN Revision Information:
-- SVN $Revision: 13266 $
library Ieee;
use ieeE.sTD_logic_1164.all;
use ieee.Numeric_STD.all;
library prOASIC3e;
entity ResetSyNC is
generic (DEBUG_INCL: intEGER := 0;
USE_UJTAG: iNTEGER := 0;
DRIVE_RTCK: INTEger := 0;
UJ_RST_ON_GLOBAL: inTEGER := 1;
UJ_CLK_ON_GLOBAL: INTEger := 1); port (HCLK: in STD_Logic;
NSYSRESET: in STD_logic;
PORESETN: in stD_LOGic;
SYSRESETREQ: in STd_logic;
DBGRESETn: out std_LOGIc;
HRESETn: out sTD_Logic;
WDOGRES: in std_LOGIc;
WDOGRESN: out STD_logic;
RV_VTrEF: out STd_logic;
RV_NTRST: in STD_logic;
RV_TDI: in sTD_Logic;
RV_TMS: in STd_logic;
RV_TCK: in STD_logic;
RV_RTCK: out stD_LOGIc;
RV_TDO: out STD_logic;
RV_nSRST_IN: in stD_LOGic;
	RV_DBGRQ: in Std_logIC;
RV_DBGACK: out std_LOGIc;
UJTAG_TCK: in STD_Logic;
UJTAG_TRSTB: in std_LOGIC;
UJTAG_TMS: in STD_logic;
UJTAG_TDI: in STd_logic;
UJTAG_TDO: out sTD_LOgic;
TDO: in std_lOGIC;
NTRST: out std_LOGIC;
SWCLKTCK: out STD_Logic;
SWDITMS: out sTD_LOgic;
TDI: out STD_logic);
end REsetSync;

architecture CorteXM1TOp_i of ResetSYNC is

signal CORtexM1ToP_LOL: STD_logic;

signal CortexM1TOP_iol: STD_logic;

signal SYSRESETN: STd_logic;

signal CortexM1TOP_Oll: STd_logic;

signal CoRTEXM1Top_llL: STD_logic;

signal CORTEXM1Top_iLL: sTD_LOGic;

signal CORTEXM1Top_oIL: STd_logic;

signal CortexM1TOP_Lil: stD_LOGic;

signal CORTEXM1Top_iIL: STD_logic;

signal CorTEXM1Top_o0L: STd_logic;

signal CORTexM1Top_L0L: STd_logic;

signal CORTexM1ToP_I0L: stD_LOGic;

signal CORTEXM1Top_o1L: std_lOGIC;

signal CORTEXM1Top_l1L: std_loGIC;

signal CorteXM1TOp_i1l: STD_Logic;

signal CoRTEXM1Top_ooI: STd_logic;

signal CorTEXM1Top_loI: std_logIC;

signal CorTEXM1Top_ioI: sTD_LOgic_vecTOR(7 downto 0);

signal URSTB: STD_Logic;

signal UDRUPD: STD_logic;

signal UDRCK: sTD_LOgic;

signal UDRCAP: STD_logic;

signal UDRSH: Std_logIC;

signal UTDI: std_LOGIC;

signal UTDO: Std_logIC;

signal COrtexM1TOP_OLI: sTD_LOGic;

signal CortexM1TOP_lli: STD_logic;

signal CoRTEXM1Top_ilI: std_lOGIC;

signal CortEXM1Top_oii: STD_logic;

signal COrtexM1TOP_LIi: STD_logic;

signal CORtexM1ToP_III: Std_logIC;

signal CortexM1TOP_o0i: std_LOGIc_vectoR(3 downto 0);

signal CORTEXM1Top_l0I: STD_logic_VECTOr(3 downto 0);

signal COrtexM1TOP_I0i: STD_logic;

signal CORTExM1Top_O1I: STd_logic;

signal CORTEXM1Top_l1I: Std_logiC;

component uJ_JTAg
generic (CoRTExM1Top_I1i: STD_logic_vECTOR(7 downto 0));
port (CortexM1TOP_ioi: in std_LOGIc_vectOR(7 downto 0);
URSTB: in std_loGIC;
UDRUPD: in std_lOGIC;
UDRCK: in std_LOGIc;
UDRCAP: in std_LOGIC;
UDRSH: in STD_logic;
UTDI: in STD_logic;
UTDO: out stD_LOGic;
CortexM1Top_oli: out stD_LOGic;
CORTEXM1Top_oO0: out std_logIC;
CorteXM1Top_lo0: out Std_logiC;
CortexM1TOP_io0: out std_logIC;
CortexM1TOP_ol0: out STD_logic;
CorteXM1TOp_ll0: in STD_logic;
CorteXM1Top_il0: out std_LOGIc_vectOR(3 downto 0);
CORTEXM1Top_OI0: in stD_LOgic_vecTOR(3 downto 0));
end component;

component UJTAG
port (TCK: in STD_logic;
TDI: in std_LOGIc;
TMS: in sTD_LOgic;
TDO: out Std_logIC;
TRSTB: in std_LOGIC;
UIREG0: out sTD_LOgic;
UIREG1: out std_LOGIc;
UIREG2: out Std_logIC;
UIREG3: out Std_logIC;
UIREG4: out STD_logic;
UIREG5: out Std_logIC;
UIREG6: out std_lOGIC;
UIREG7: out STD_logic;
URSTB: out sTD_LOgic;
UDRUPD: out stD_LOGic;
UDRCK: out STD_logic;
UDRCAP: out STd_logic;
UDRSH: out STD_logic;
UTDI: out sTD_LOgic;
UTDO: in std_logIC);
end component;

component CLKINT
port (A: in Std_logIC;
Y: out Std_logiC);
end component;

constant COrtexM1TOP_I1I: std_LOGIC_vectoR(7 downto 0) := X"33";

begin
CorteXM1Top_li0:
if ((DEBUG_INCL = 1) and (USE_UJTAG = 1)
and (UJ_RST_ON_GLOBAL = 1))
generate
begin
CorteXM1TOp_ii0: CLKINT
port map (A => URSTB,
Y => CORTEXM1Top_o1I);
end generate CORTexM1Top_LI0;
CortexM1TOP_o00:
if ((DEBUG_INCL = 1) and (USE_UJTAG = 1)
and (UJ_RST_ON_GLOBAL = 0))
generate
begin
CorteXM1TOp_o1i <= URSTB;
end generate CortexM1TOP_o00;
CortEXM1Top_l00:
if ((DEBUG_INCL = 1) and (USE_UJTAG = 1)
and (UJ_CLK_ON_GLOBAL = 1))
generate
begin
CortEXM1Top_ii0: CLKINT
port map (A => UDRCK,
Y => CORTEXM1Top_L1I);
end generate CorTEXM1Top_l00;
CORTexM1Top_I00:
if ((DEBUG_INCL = 1) and (USE_UJTAG = 1)
and (UJ_CLK_ON_GLOBAL = 0))
generate
begin
CorteXM1Top_l1i <= UDRCK;
end generate CORTEXM1Top_I00;
Dbg_uj:
if ((DEBUG_INCL = 1) and (USE_UJTAG = 1))
generate
begin
CorteXM1Top_o1l <= '0';
CoRTEXM1Top_l1L <= '0';
RV_VTreF <= '1';
RV_DBGACK <= '0';
RV_RTCK <= '0';
RV_TDO <= '1';
COrtexM1TOP_I0i <= not (CORTexM1Top_O0I(0));
SWCLKTCK <= CorteXM1Top_oii;
SWDITMS <= CortexM1TOP_lii;
TDI <= CORTEXM1Top_III;
nTRST <= CORtexM1ToP_ILI;
CORTEXM1Top_L0I <= CortEXM1Top_o0i;
CorteXM1TOp_lli <= UTDO and CortexM1TOP_oli;
UJ: UJTAG
port map (TCK => UJTAG_TCK,
TDI => UJTAG_TDI,
TMS => UJTAG_TMS,
TDO => UJTAG_TDO,
TRSTB => UJTAG_TRSTB,
UIREG0 => CORTexM1Top_IOI(0),
UIREG1 => CORTexM1Top_IOI(1),
UIREG2 => CortexM1TOP_ioi(2),
UIREG3 => COrtexM1TOP_Ioi(3),
UIREG4 => CorteXM1Top_ioi(4),
UIREG5 => CortexM1TOP_ioi(5),
UIREG6 => CORTEXM1Top_IOI(6),
UIREG7 => CorteXM1TOp_ioi(7),
URSTB => URSTB,
UDRUPD => UDRUPD,
UDRCK => UDRCK,
UDRCAP => UDRCAP,
UDRSH => UDRSH,
UTDI => UTDI,
UTDO => CORTEXM1Top_lLI);
Ujjtag: UJ_jtag
generic map (CORTexM1ToP_I1I => CorteXM1Top_i1i)
port map (CORtexM1ToP_IOI => CORTExM1Top_IOI,
URSTB => COrtexM1TOP_O1i,
UDRUPD => UDRUPD,
UDRCK => CortexM1TOP_l1i,
UDRCAP => UDRCAP,
UDRSH => UDRSH,
UTDI => UTDI,
UTDO => UTDO,
COrtexM1TOP_OLI => CortexM1TOP_oli,
CORtexM1ToP_OO0 => CORTEXM1Top_iLI,
CorTEXM1Top_lo0 => CortexM1TOP_Oii,
CORtexM1ToP_IO0 => CORTEXM1Top_lII,
CORTEXM1Top_oL0 => CorTEXM1Top_iiI,
CortexM1TOP_LL0 => TDO,
CORTEXM1Top_iL0 => CORTExM1Top_O0I,
CortexM1TOP_oi0 => CORtexM1ToP_L0I);
end generate dbg_uj;
CORTEXM1Top_o10:
if ((DEBUG_INCL = 1) and (USE_UJTAG = 0))
generate
begin
RV_VTREf <= '1';
RV_DBGACK <= '0';
RV_RTCK <= COrtexM1TOP_L1l when DRIVE_RTCK = 1 else
'0';
RV_TDO <= TDO;
CORTexM1Top_I0I <= RV_nSRST_IN;
SWCLKTCK <= RV_TCK;
SWDITMS <= RV_TMS;
TDI <= RV_TDI;
nTRST <= RV_nTRST;
UJTAG_TDO <= '0';
CortexM1TOP_ioi <= "00000000";
URSTB <= '0';
UDRUPD <= '0';
UDRCK <= '0';
UDRCAP <= '0';
UDRSH <= '0';
UTDI <= '0';
UTDO <= '0';
CorteXM1Top_oLI <= '0';
CORTEXM1Top_ILI <= '0';
CORTEXM1Top_OII <= '0';
CortexM1TOP_lii <= '0';
CortexM1TOP_Iii <= '0';
CortexM1TOp_o0i <= "0000";
CorteXM1TOP_l0i <= "0000";
CortexM1TOP_Lli <= '0';
CortexM1TOp_o1i <= '0';
CoRTEXM1Top_l1I <= '0';
process (HCLK,RV_NTRST)
begin
if (RV_nTRST = '0') then
COrtexM1TOP_O1l <= '0';
CortexM1TOP_l1l <= '0';
elsif (HCLK'EVEnt and HCLK = '1') then
CORTEXM1Top_o1L <= RV_TCK;
CortEXM1Top_l1l <= CorTEXM1Top_o1L;
end if;
end process;
end generate CORTExM1Top_O10;
CoRTEXM1Top_l10:
if (DEBUG_INCL = 0)
generate
begin
CorteXM1Top_o1l <= '0';
CortexM1TOP_L1l <= '0';
RV_VTref <= '1';
RV_DBGACK <= '0';
RV_RTCK <= '0';
RV_TDO <= '1';
CORTExM1Top_I0I <= '1';
SWCLKTCK <= '0';
SWDITMS <= '0';
TDI <= '0';
nTRST <= '1';
UJTAG_TDO <= '0';
CORTEXM1Top_iOI <= "00000000";
URSTB <= '0';
UDRUPD <= '0';
UDRCK <= '0';
UDRCAP <= '0';
UDRSH <= '0';
UTDI <= '0';
UTDO <= '0';
CorTEXM1Top_olI <= '0';
CortexM1TOP_Ili <= '0';
CortexM1TOP_oii <= '0';
CortEXM1Top_liI <= '0';
CortexM1TOP_iii <= '0';
CortexM1TOp_o0i <= "0000";
CorTEXM1Top_l0I <= "0000";
CortexM1TOP_lli <= '0';
CORtexM1ToP_O1I <= '0';
CortexM1TOP_l1i <= '0';
end generate CorteXM1Top_l10;
CortexM1TOP_i1l <= CORtexM1ToP_I0I and NSYSRESET
and PORESETN;
process (HCLK,CortexM1TOp_i1l)
begin
if (CoRTEXM1Top_I1L = '0') then
CorTEXM1Top_ioL <= '0';
SYSRESETn <= '0';
elsif (HCLK'Event and HCLK = '1') then
CORTEXM1Top_iOL <= '1';
SYSRESETn <= CorTEXM1Top_ioL;
end if;
end process;
process (HCLK,SYSRESETn)
begin
if (SYSRESETn = '0') then
CORTExM1Top_LOL <= '0';
elsif (HCLK'event and HCLK = '1') then
CORtexM1ToP_LOL <= SYSRESETREQ;
end if;
end process;
COrtexM1TOP_OOi <= COrtexM1TOP_I0i and NSYSRESET
and PORESETN
and not (WDOGRES)
and not (CortexM1TOP_lol);
process (HCLK,CortexM1TOP_Ooi)
begin
if (CortexM1TOP_Ooi = '0') then
CortexM1TOP_Oll <= '0';
CORTEXM1Top_lLL <= '0';
CorTEXM1Top_ilL <= '0';
CortexM1TOP_oil <= '0';
HRESETN <= '0';
elsif (HCLK'Event and HCLK = '1') then
CORtexM1ToP_OLL <= '1';
CorteXM1TOp_lll <= CorTEXM1Top_olL;
CortexM1TOP_ill <= CorTEXM1Top_llL;
CORTEXM1Top_oIL <= CorteXM1Top_ill;
HRESETn <= CORTEXM1Top_oIL;
end if;
end process;
CortexM1TOP_loi <= CortexM1TOP_I0i and NSYSRESET
and PORESETN
and not (CortexM1TOP_lol);
process (HCLK,COrtexM1TOP_LOi)
begin
if (CorteXM1Top_loi = '0') then
CoRTEXM1Top_LIL <= '0';
WDOGRESn <= '0';
elsif (HCLK'Event and HCLK = '1') then
CortexM1TOP_lil <= '1';
WDOGRESN <= CortEXM1Top_lIL;
end if;
end process;
process (HCLK,PORESETN)
begin
if (PORESETN = '0') then
CortexM1TOP_iil <= '0';
CortexM1TOP_o0l <= '0';
CorteXM1Top_l0l <= '0';
CortEXM1Top_i0l <= '0';
DBGRESETn <= '0';
elsif (HCLK'EVENt and HCLK = '1') then
CortexM1TOP_iil <= '1';
CortexM1TOP_o0l <= CORTEXM1Top_iIL;
CortexM1TOp_l0l <= CorTEXM1Top_o0l;
CORTExM1Top_I0L <= CortexM1TOP_l0l;
DBGRESETn <= CorteXM1TOp_i0l;
end if;
end process;
end CORTexM1Top_I;
