-- Actel Corporation Proprietary and Confidential
-- Copyright 2010 Actel Corporation.  All rights reserved.
-- ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
-- ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
-- IN ADVANCE IN WRITING.
-- SVN Revision Information:
-- SVN $Revision: 13266 $
library ieee;
use ieee.std_logic_1164.all;
use Ieee.numeriC_STD.all;
package CORTEXM1Top_o is

function CortEXM1TOP_l(DEBUG_IF: INTEGER)
return INTEGER;
end CoRTEXM1TOp_o;

package body CortexM1ToP_O is
function CORTexM1Top_l(DEBUG_IF: integer)
return integer is
begin
if DEBUG_IF = 0 then
return (1);
else
return (0);
end if;
end COrtexM1Top_l;
end CorteXM1TOP_o;

use work.CoRTEXM1Top_o.all;
library ieee;
use IEEE.Std_logIC_1164.all;
use IEEE.NUMeric_std.all;
library proasiC3E;
entity CoRTEXM1Top is
generic (DEBUG_INCL: inteGER := 0;
DEBUG_RESET: INTEGEr := 0;
DEBUG_IF: integER := 0;
UJ_RST_ON_GLOBAL: intEGER := 1;
UJ_CLK_ON_GLOBAL: intEGER := 1;
CONFIG: iNTEGER := 0;
DEBUG_CONFIG: Integer := 1;
DEBUG_PROTOCOL: INTEGEr := 0;
ITCM_ALIAS: inTEGER := 2); port (HCLK: in STD_Logic;
NSYSRESET: in std_LOGIC;
PORESETN: in Std_loGIC;
HRESETN: out STD_logic;
WDOGRES: in sTD_LOgic;
WDOGRESn: out std_lOGIC;
LOCKUP: out std_logIC;
HALTED: out sTD_LOgic;
NMI: in Std_logiC;
IRQ31: in std_logIC;
IRQ30: in stD_LOGic;
IRQ29: in sTD_LOgic;
IRQ28: in std_LOGIC;
IRQ27: in STD_logic;
IRQ26: in std_LOGIC;
IRQ25: in STd_logic;
IRQ24: in std_loGIC;
IRQ23: in std_LOGIC;
IRQ22: in STD_logic;
IRQ21: in std_LOGIC;
IRQ20: in STD_logic;
IRQ19: in Std_logIC;
IRQ18: in STD_logic;
IRQ17: in std_LOGIC;
IRQ16: in Std_logiC;
IRQ15: in std_lOGIC;
IRQ14: in STD_Logic;
IRQ13: in STD_Logic;
IRQ12: in std_LOGIC;
IRQ11: in Std_logIC;
IRQ10: in Std_logiC;
IRQ9: in stD_LOGic;
IRQ8: in STD_logic;
IRQ7: in std_LOGIC;
IRQ6: in STD_logic;
IRQ5: in STD_logic;
IRQ4: in Std_logiC;
IRQ3: in std_logIC;
IRQ2: in STd_logic;
IRQ1: in std_lOGIC;
IRQ0: in STd_logic;
HADDR: out std_logIC_Vector(31 downto 0);
HBURST: out std_logIC_Vector(2 downto 0);
HPROT: out std_LOGIC_vectoR(3 downto 0);
HRDATA: in std_loGIC_Vector(31 downto 0);
HREADY: in std_logIC;
HRESP: in Std_logIC_VEctor(1 downto 0);
HSIZE: out sTD_LOgic_vecTOR(2 downto 0);
HTRANS: out STd_logiC_VECtor(1 downto 0);
HWDATA: out std_LOGIc_vectoR(31 downto 0);
HWRITE: out std_LOGic;
HMASTLOCK: out stD_LOGic;
EDBGRQ: in stD_LOgic;
JTAGTOP: out std_lOGIC;
JTAGNSW: out std_lOGIC;
SWDO: out std_loGIC;
SWDOEN: out STd_logiC;
NTDOEN: out std_lOGIC;
TCK: in std_LOGIc;
NTRST: in STD_logic;
TMS: in std_LOGIC;
TDI: in STD_logic;
TDO: out STD_logic);
end CortexM1TOP;

architecture CortexM1TOP_i of COrtexM1TOP is

constant USE_UJTAG: INTEGEr := COrtexM1TOP_L(DEBUG_IF);

signal SYSRESETREQ: sTD_Logic;

signal CORTEXM1Top_OL: Std_logIC;

signal CortexM1TOP_ll: STD_logic;

signal CORTEXM1Top_iL: std_logIC;

signal CortEXM1Top_oi: Std_logiC;

signal DBGRESETN: std_LOGIC;

signal CoRTEXM1Top_LI: STD_logic;

signal RV_TDO: STD_Logic;

signal UJTAG_TDO: STD_logic;

signal CortexM1TOP_ii: STd_logiC;

signal URSTB: stD_LOGic;

signal CortexM1TOP_O0: STD_logic;

signal SWCLKTCK: sTD_LOgic;

signal SWDITMS: stD_LOGic;

signal CorteXM1TOp_l0: sTD_Logic;

signal IRQ: STd_logiC_VECTor(31 downto 0);

component CLKINT
port (A: in sTD_Logic;
Y: out Std_logiC);
end component;

component CortexM1INtegratION
port (HCLK: in Std_logIC;
DBGRESETn: in sTD_LOgic;
SYSRESETN: in STD_logic;
LOCKUP: out std_loGIC;
HALTED: out Std_logIC;
SYSRESETREQ: out std_LOGIC;
EDBGRQ: in STD_logic;
IRQ: in std_logIC_Vector(31 downto 0);
NMI: in std_loGIC;
HADDR: out stD_LOGic_vectOR(31 downto 0);
HBURST: out Std_logiC_VECtor(2 downto 0);
HPROT: out std_LOGIC_vector(3 downto 0);
HRDATA: in STD_logic_VECTOR(31 downto 0);
HREADY: in stD_LOGic;
HRESP: in Std_logIC;
HSIZE: out STd_logic_VECTor(2 downto 0);
HTRANS: out STd_logic_VECTor(1 downto 0);
HWDATA: out std_LOGIC_vectoR(31 downto 0);
HWRITE: out STD_logic;
HMASTLOCK: out stD_LOGic;
SWDO: out stD_LOgic;
SWDOEN: out STD_logiC;
TDO: out std_LOGic;
NTDOEN: out std_LOGIc;
JTAGNSW: out sTD_LOgic;
JTAGTOP: out std_LOGIc;
NTRST: in Std_logiC;
SWCLKTCK: in std_logIC;
SWDITMS: in STD_logic;
TDI: in STD_logic;
tCMINItWriteENABLE: in std_loGIC;
tcmINITADdr: in STd_logic_VECTor(19 downto 2);
tCMINitWriteDATA: in std_lOGIC_vector(31 downto 0));
end component;

component ResetSyNC
generic (DEBUG_INCL: Integer;
USE_UJTAG: INTEGer;
DRIVE_RTCK: Integer;
UJ_RST_ON_GLOBAL: INteger;
UJ_CLK_ON_GLOBAL: integeR);
port (HCLK: in stD_LOGic;
NSYSRESET: in std_loGIC;
PORESETN: in std_LOGic;
SYSRESETREQ: in STD_logic;
DBGRESETn: out STD_logic;
HRESETN: out stD_LOGic;
WDOGRES: in sTD_LOgic;
WDOGRESn: out STD_Logic;
RV_VTref: out sTD_Logic;
RV_NTRST: in std_lOGIC;
RV_TDI: in std_LOGIc;
RV_TMS: in std_lOGIC;
RV_TCK: in STD_logic;
RV_RTCK: out stD_LOgic;
RV_TDO: out std_lOGIC;
RV_NSRST_IN: in std_lOGIC;
	RV_DBGRQ: in STD_logic;
RV_DBGACK: out std_loGIC;
UJTAG_TCK: in STD_logic;
UJTAG_TRSTB: in STD_Logic;
UJTAG_TMS: in sTD_LOgic;
UJTAG_TDI: in STD_logic;
UJTAG_TDO: out std_logIC;
TDO: in STD_logic;
nTRST: out Std_logIC;
SWCLKTCK: out Std_logiC;
SWDITMS: out STD_Logic;
TDI: out STD_Logic);
end component;

begin
IRQ <= (IRQ31&IRQ30&IRQ29&IRQ28&IRQ27&IRQ26&IRQ25&IRQ24&IRQ23&IRQ22&IRQ21&IRQ20&IRQ19&IRQ18&IRQ17&IRQ16&IRQ15&IRQ14&IRQ13&IRQ12&IRQ11&IRQ10&IRQ9&IRQ8&IRQ7&IRQ6&IRQ5&IRQ4&IRQ3&IRQ2&IRQ1&IRQ0);
CortexM1TOP_i0: CLKINT
port map (A => CorteXM1TOp_ol,
Y => CortexM1TOP_LL);
HRESETN <= COrtexM1TOP_LL;
CorteXM1TOp_o1:
if (DEBUG_INCL = 1)
generate
begin
CorTEXM1Top_l1: CLKINT
port map (A => CortexM1TOP_o0,
Y => SWCLKTCK);
CorteXM1Top_i1: CLKINT
port map (A => CortexM1TOP_oi,
Y => DBGRESETn);
CORTExM1Top_LI <= EDBGRQ;
end generate CortexM1TOP_o1;
CorteXM1Top_ool:
if (DEBUG_INCL = 0)
generate
begin
SWCLKTCK <= '0';
DBGRESETN <= '1';
CortexM1Top_li <= '0';
end generate COrtexM1TOP_OOl;
M1: CORTEXM1IntegRATIOn
port map (HCLK => HCLK,
DBGRESETn => DBGRESETn,
SYSRESETn => CORTexM1Top_LL,
LOCKUP => LOCKUP,
HALTED => HALTED,
SYSRESETREQ => SYSRESETREQ,
EDBGRQ => CorTEXM1Top_li,
IRQ => IRQ,
NMI => NMI,
HADDR => HADDR,
HBURST => HBURST,
HPROT => HPROT,
HRDATA => HRDATA,
HREADY => HREADY,
HRESP => HRESP(0),
HSIZE => HSIZE,
HTRANS => HTRANS,
HWDATA => HWDATA,
HWRITE => HWRITE,
HMASTLOCK => HMASTLOCK,
SWDO => SWDO,
SWDOEN => SWDOEN,
TDO => CORtexM1TOP_II,
NTDOEN => NTDOEN,
JTAGNSW => JTAGNSW,
JTAGTOP => JTAGTOP,
nTRST => URSTB,
SWCLKTCK => SWCLKTCK,
SWDITMS => SWDITMS,
TDI => CortexM1TOP_L0,
TCMInitWriTEENAble => '0',
tCMINitAddr => ( otheRS => '0'),
tcmINITWriteDaTA => ( otheRS => '0'));
CORTEXM1Top_iL <= PORESETN when DEBUG_RESET = 1 else
NSYSRESET;
RS: ReseTSYNc
generic map (DEBUG_INCL => DEBUG_INCL,
USE_UJTAG => USE_UJTAG,
DRIVE_RTCK => 0,
UJ_RST_ON_GLOBAL => UJ_RST_ON_GLOBAL,
UJ_CLK_ON_GLOBAL => UJ_CLK_ON_GLOBAL)
port map (HCLK => HCLK,
NSYSRESET => NSYSRESET,
PORESETN => CorTEXM1Top_iL,
SYSRESETREQ => SYSRESETREQ,
DBGRESETN => CORTexM1Top_OI,
HRESETN => CORTExM1Top_OL,
WDOGRES => WDOGRES,
WDOGRESn => WDOGRESn,
RV_VTrEF => open ,
RV_NTRST => nTRST,
RV_TDI => TDI,
RV_TMS => TMS,
RV_TCK => TCK,
RV_RTCK => open ,
RV_TDO => RV_TDO,
RV_nSRST_IN => '1',
	RV_DBGRQ => '0',
RV_DBGACK => open ,
UJTAG_TCK => TCK,
UJTAG_TRSTB => nTRST,
UJTAG_TMS => TMS,
UJTAG_TDI => TDI,
UJTAG_TDO => UJTAG_TDO,
TDO => CortexM1TOp_ii,
NTRST => URSTB,
SWCLKTCK => CortexM1TOp_o0,
SWDITMS => SWDITMS,
TDI => CORtexM1Top_L0);
TDO <= UJTAG_TDO when USE_UJTAG = 1 else
RV_TDO;
end CorTEXM1Top_i;
