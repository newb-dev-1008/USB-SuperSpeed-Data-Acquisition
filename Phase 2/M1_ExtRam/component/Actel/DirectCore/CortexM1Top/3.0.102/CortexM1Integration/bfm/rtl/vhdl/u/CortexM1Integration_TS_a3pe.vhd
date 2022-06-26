library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.VITAL_Timing.all;

package bfm_components is

constant DefaultTimingChecksOn : Boolean := True;
constant DefaultXGenerationOn : Boolean := False;
constant DefaultXon : Boolean := False;
constant DefaultMsgOn : Boolean := True;

component BUFF_TS
    generic(
        TimingChecksOn  : Boolean := True;
        Xon             : Boolean := False;
        InstancePath    : STRING :="*";
        MsgOn           : Boolean := True;
        tpd_A_Y         : VitalDelayType01 := (0.100 ns, 0.100 ns);
        tipd_A          : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );
    port(
        A       : in  STD_ULOGIC;
        Y       : out STD_ULOGIC
    );
end component;

component BFMDFN1
    generic(
        TimingChecksOn  : Boolean := True;
        InstancePath    : STRING := "*";
        Xon             : Boolean := False;
        MsgOn           : Boolean := True;
        tpd_CLK_Q                       : VitalDelayType01 := (0.100 ns, 0.100 ns);
        tsetup_D_CLK_posedge_posedge    : VitalDelayType := 0.000 ns;
        thold_D_CLK_posedge_posedge     : VitalDelayType := 0.000 ns;
        tsetup_D_CLK_negedge_posedge    : VitalDelayType := 0.000 ns;
        thold_D_CLK_negedge_posedge     : VitalDelayType := 0.000 ns;
        tpw_CLK_posedge                 : VitalDelayType := 0.000 ns;
        tpw_CLK_negedge                 : VitalDelayType := 0.000 ns;
        tipd_D                          : VitalDelayType01 := (0.000 ns, 0.000 ns);
        tipd_CLK                        : VitalDelayType01 := (0.000 ns, 0.000 ns)
    );
    port(
        Q       :  out STD_ULOGIC;
        D       :  in  STD_ULOGIC;
        CLK     :  in  STD_ULOGIC
    );
end component;

end bfm_components;


library IEEE;
library STD;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.VITAL_timing.all;
use IEEE.VITAL_primitives.all;

use std.textio.all;
use ieee.std_logic_textio.all;
use work.bfm_components.all;

entity CortexM1Integration is
generic(
    TimingChecksOn  : Boolean := True;
    InstancePath    : STRING  := "*";
    Xon             : Boolean := False;
    MsgOn           : Boolean := True;

    tpd_SWCLKTCK_JTAGNSW    : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_SWCLKTCK_JTAGTOP    : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_SWCLKTCK_TDO        : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_SWCLKTCK_nTDOEN     : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_SWCLKTCK_SWDO       : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_SWCLKTCK_SWDOEN     : VitalDelayType01  := (0.100 ns, 0.100 ns);

    tpd_HCLK_SYSRESETREQ    : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_HCLK_LOCKUP         : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_HCLK_HALTED         : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_HCLK_HTRANS         : VitalDelayArrayType01(0 to 1)  := (others => (0.100 ns, 0.100 ns));
    tpd_HCLK_HBURST         : VitalDelayArrayType01(0 to 2)  := (others => (0.100 ns, 0.100 ns));
    tpd_HCLK_HPROT          : VitalDelayArrayType01(0 to 3)  := (others => (0.100 ns, 0.100 ns));
    tpd_HCLK_HSIZE          : VitalDelayArrayType01(0 to 2)  := (others => (0.100 ns, 0.100 ns));
    tpd_HCLK_HWRITE         : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_HCLK_HMASTLOCK      : VitalDelayType01  := (0.100 ns, 0.100 ns);
    tpd_HCLK_HADDR          : VitalDelayArrayType01(0 to 31) := (others => (0.100 ns, 0.100 ns));
    tpd_HCLK_HWDATA         : VitalDelayArrayType01(0 to 31) := (others => (0.100 ns, 0.100 ns));

    tsetup_DBGRESETn_SWCLKTCK_posedge_posedge       : VitalDelayType := 0.000 ns;
    thold_DBGRESETn_SWCLKTCK_posedge_posedge        : VitalDelayType := 0.000 ns;
    tsetup_DBGRESETn_SWCLKTCK_negedge_posedge       : VitalDelayType := 0.000 ns;
    thold_DBGRESETn_SWCLKTCK_negedge_posedge        : VitalDelayType := 0.000 ns;
    tipd_DBGRESETn                                  : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_nTRST_SWCLKTCK_posedge_posedge           : VitalDelayType := 0.000 ns;
    thold_nTRST_SWCLKTCK_posedge_posedge            : VitalDelayType := 0.000 ns;
    tsetup_nTRST_SWCLKTCK_negedge_posedge           : VitalDelayType := 0.000 ns;
    thold_nTRST_SWCLKTCK_negedge_posedge            : VitalDelayType := 0.000 ns;
    tipd_nTRST                                      : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_SWDITMS_SWCLKTCK_posedge_posedge         : VitalDelayType := 0.000 ns;
    thold_SWDITMS_SWCLKTCK_posedge_posedge          : VitalDelayType := 0.000 ns;
    tsetup_SWDITMS_SWCLKTCK_negedge_posedge         : VitalDelayType := 0.000 ns;
    thold_SWDITMS_SWCLKTCK_negedge_posedge          : VitalDelayType := 0.000 ns;
    tipd_SWDITMS                                    : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_TDI_SWCLKTCK_posedge_posedge             : VitalDelayType := 0.000 ns;
    thold_TDI_SWCLKTCK_posedge_posedge              : VitalDelayType := 0.000 ns;
    tsetup_TDI_SWCLKTCK_negedge_posedge             : VitalDelayType := 0.000 ns;
    thold_TDI_SWCLKTCK_negedge_posedge              : VitalDelayType := 0.000 ns;
    tipd_TDI                                        : VitalDelayType01 := (0.000 ns, 0.000 ns);

----------------------------------------------------------------------------------------------------

    tsetup_DBGRESETn_HCLK_posedge_posedge           : VitalDelayType := 0.000 ns;
    thold_DBGRESETn_HCLK_posedge_posedge            : VitalDelayType := 0.000 ns;
    tsetup_DBGRESETn_HCLK_negedge_posedge           : VitalDelayType := 0.000 ns;
    thold_DBGRESETn_HCLK_negedge_posedge            : VitalDelayType := 0.000 ns;

    tsetup_EDBGRQ_HCLK_posedge_posedge              : VitalDelayType := 0.000 ns;
    thold_EDBGRQ_HCLK_posedge_posedge               : VitalDelayType := 0.000 ns;
    tsetup_EDBGRQ_HCLK_negedge_posedge              : VitalDelayType := 0.000 ns;
    thold_EDBGRQ_HCLK_negedge_posedge               : VitalDelayType := 0.000 ns;
    tipd_EDBGRQ                                     : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_nTRST_HCLK_posedge_posedge               : VitalDelayType := 0.000 ns;
    thold_nTRST_HCLK_posedge_posedge                : VitalDelayType := 0.000 ns;
    tsetup_nTRST_HCLK_negedge_posedge               : VitalDelayType := 0.000 ns;
    thold_nTRST_HCLK_negedge_posedge                : VitalDelayType := 0.000 ns;

    tsetup_SWCLKTCK_HCLK_posedge_posedge            : VitalDelayType := 0.000 ns;
    thold_SWCLKTCK_HCLK_posedge_posedge             : VitalDelayType := 0.000 ns;
    tsetup_SWCLKTCK_HCLK_negedge_posedge            : VitalDelayType := 0.000 ns;
    thold_SWCLKTCK_HCLK_negedge_posedge             : VitalDelayType := 0.000 ns;

    tsetup_SWDITMS_HCLK_posedge_posedge             : VitalDelayType := 0.000 ns;
    thold_SWDITMS_HCLK_posedge_posedge              : VitalDelayType := 0.000 ns;
    tsetup_SWDITMS_HCLK_negedge_posedge             : VitalDelayType := 0.000 ns;
    thold_SWDITMS_HCLK_negedge_posedge              : VitalDelayType := 0.000 ns;

    tsetup_TDI_HCLK_posedge_posedge                 : VitalDelayType := 0.000 ns;
    thold_TDI_HCLK_posedge_posedge                  : VitalDelayType := 0.000 ns;
    tsetup_TDI_HCLK_negedge_posedge                 : VitalDelayType := 0.000 ns;
    thold_TDI_HCLK_negedge_posedge                  : VitalDelayType := 0.000 ns;

    tsetup_SYSRESETn_HCLK_posedge_posedge           : VitalDelayType := 0.000 ns;
    thold_SYSRESETn_HCLK_posedge_posedge            : VitalDelayType := 0.000 ns;
    tsetup_SYSRESETn_HCLK_negedge_posedge           : VitalDelayType := 0.000 ns;
    thold_SYSRESETn_HCLK_negedge_posedge            : VitalDelayType := 0.000 ns;
    tipd_SYSRESETn                                  : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_NMI_HCLK_posedge_posedge                 : VitalDelayType := 0.000 ns;
    thold_NMI_HCLK_posedge_posedge                  : VitalDelayType := 0.000 ns;
    tsetup_NMI_HCLK_negedge_posedge                 : VitalDelayType := 0.000 ns;
    thold_NMI_HCLK_negedge_posedge                  : VitalDelayType := 0.000 ns;
    tipd_NMI                                        : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_IRQ_HCLK_posedge_posedge                 : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    thold_IRQ_HCLK_posedge_posedge                  : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    tsetup_IRQ_HCLK_negedge_posedge                 : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    thold_IRQ_HCLK_negedge_posedge                  : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    tipd_IRQ                                        : VitalDelayArrayType01(31 downto 0)  := (others => (0.000 ns, 0.000 ns) );

    tsetup_HRDATA_HCLK_posedge_posedge              : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    thold_HRDATA_HCLK_posedge_posedge               : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    tsetup_HRDATA_HCLK_negedge_posedge              : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    thold_HRDATA_HCLK_negedge_posedge               : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    tipd_HRDATA                                     : VitalDelayArrayType01(31 downto 0) := (others => (0.000 ns, 0.000 ns) );

    tsetup_HRESP_HCLK_posedge_posedge               : VitalDelayType := 0.000 ns;
    thold_HRESP_HCLK_posedge_posedge                : VitalDelayType := 0.000 ns;
    tsetup_HRESP_HCLK_negedge_posedge               : VitalDelayType := 0.000 ns;
    thold_HRESP_HCLK_negedge_posedge                : VitalDelayType := 0.000 ns;
    tipd_HRESP                                      : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_HREADY_HCLK_posedge_posedge              : VitalDelayType := 0.000 ns;
    thold_HREADY_HCLK_posedge_posedge               : VitalDelayType := 0.000 ns;
    tsetup_HREADY_HCLK_negedge_posedge              : VitalDelayType := 0.000 ns;
    thold_HREADY_HCLK_negedge_posedge               : VitalDelayType := 0.000 ns;
    tipd_HREADY                                     : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tsetup_tcmInitAddr_HCLK_posedge_posedge         : VitalDelayArrayType(2 to 19) := (others => 0.000 ns);
    thold_tcmInitAddr_HCLK_posedge_posedge          : VitalDelayArrayType(2 to 19) := (others => 0.000 ns);
    tsetup_tcmInitAddr_HCLK_negedge_posedge         : VitalDelayArrayType(2 to 19) := (others => 0.000 ns);
    thold_tcmInitAddr_HCLK_negedge_posedge          : VitalDelayArrayType(2 to 19) := (others => 0.000 ns);
    tipd_tcmInitAddr                                : VitalDelayArrayType01(19 downto 2) := (others => (0.000 ns, 0.000 ns) );

    tsetup_tcmInitWriteData_HCLK_posedge_posedge    : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    thold_tcmInitWriteData_HCLK_posedge_posedge     : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    tsetup_tcmInitWriteData_HCLK_negedge_posedge    : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    thold_tcmInitWriteData_HCLK_negedge_posedge     : VitalDelayArrayType(0 to 31) := (others => 0.000 ns);
    tipd_tcmInitWriteData                           : VitalDelayArrayType01(31 downto 0) := (others => (0.000 ns, 0.000 ns) );

    tsetup_tcmInitWriteEnable_HCLK_posedge_posedge  : VitalDelayType := 0.000 ns;
    thold_tcmInitWriteEnable_HCLK_posedge_posedge   : VitalDelayType := 0.000 ns;
    tsetup_tcmInitWriteEnable_HCLK_negedge_posedge  : VitalDelayType := 0.000 ns;
    thold_tcmInitWriteEnable_HCLK_negedge_posedge   : VitalDelayType := 0.000 ns;
    tipd_tcmInitWriteEnable                         : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpw_HCLK_posedge                                : VitalDelayType := 0.000 ns;
    tpw_HCLK_negedge                                : VitalDelayType := 0.000 ns;
    tipd_HCLK                                       : VitalDelayType01 := (0.000 ns, 0.000 ns);

    tpw_SWCLKTCK_posedge                            : VitalDelayType := 0.000 ns;
    tpw_SWCLKTCK_negedge                            : VitalDelayType := 0.000 ns;
    tipd_SWCLKTCK                                   : VitalDelayType01 := (0.000 ns, 0.000 ns)
);
port(
    -- Inputs
    HCLK        : in std_logic;
    SYSRESETn   : in std_logic;
    IRQ         : in std_logic_vector(31 downto 0);
    NMI         : in std_logic;
    HREADY      : in std_logic;
    HRESP       : in std_logic;
    HRDATA      : in std_logic_vector(31 downto 0);
    -- Inputs Debug
    DBGRESETn   : in std_logic;
    EDBGRQ      : in std_logic;
    nTRST       : in std_logic;
    SWCLKTCK    : in std_logic;
    SWDITMS     : in std_logic;
    TDI         : in std_logic;
    -- TCM init
    tcmInitAddr         : in std_logic_vector(19 downto 2);
    tcmInitWriteData    : in std_logic_vector(31 downto 0);
    tcmInitWriteEnable  : in std_logic;
    -- Outputs
    SYSRESETREQ : out std_logic;
    LOCKUP      : out std_logic;
    HTRANS      : out std_logic_vector(1 downto 0);
    HBURST      : out std_logic_vector(2 downto 0);
    HPROT       : out std_logic_vector(3 downto 0);
    HSIZE       : out std_logic_vector(2 downto 0);
    HWRITE      : out std_logic;
    HMASTLOCK   : out std_logic;
    HADDR       : out std_logic_vector(31 downto 0);
    HWDATA      : out std_logic_vector(31 downto 0);
    -- Outputs Debug
    JTAGNSW     : out std_logic;
    JTAGTOP     : out std_logic;
    TDO         : out std_logic;
    nTDOEN      : out std_logic;
    SWDO        : out std_logic;
    SWDOEN      : out std_logic;
    HALTED      : out std_logic
);
attribute VITAL_LEVEL0 of CortexM1Integration : entity is TRUE;
end CortexM1Integration;

library IEEE;
use IEEE.VITAL_Primitives.all;
library proasic3e;
use proasic3e.VTABLES.all;

architecture VITAL_ACT of CortexM1Integration is

component CortexM1BFM
    port(
    -- Inputs
    HCLK        : in std_logic;
    SYSRESETn   : in std_logic;
    IRQ         : in std_logic_vector(31 downto 0);
    NMI         : in std_logic;
    HREADY      : in std_logic;
    HRESP       : in std_logic;
    HRDATA      : in std_logic_vector(31 downto 0);
    -- Inputs Debug
    DBGRESETn   : in std_logic;
    EDBGRQ      : in std_logic;
    nTRST       : in std_logic;
    SWCLKTCK    : in std_logic;
    SWDITMS     : in std_logic;
    TDI         : in std_logic;
    -- Outputs
    SYSRESETREQ : out std_logic;
    LOCKUP      : out std_logic;
    HTRANS      : out std_logic_vector(1 downto 0);
    HBURST      : out std_logic_vector(2 downto 0);
    HPROT       : out std_logic_vector(3 downto 0);
    HSIZE       : out std_logic_vector(2 downto 0);
    HWRITE      : out std_logic;
    HMASTLOCK   : out std_logic;
    HADDR       : out std_logic_vector(31 downto 0);
    HWDATA      : out std_logic_vector(31 downto 0);
    -- Outputs Debug
    JTAGNSW     : out std_logic;
    JTAGTOP     : out std_logic;
    TDO         : out std_logic;
    nTDOEN      : out std_logic;
    SWDO        : out std_logic;
    SWDOEN      : out std_logic;
    HALTED      : out std_logic
    );
end component;

signal iSYSRESETREQ : std_logic;
signal iLOCKUP      : std_logic;
signal iHTRANS      : std_logic_vector(1 downto 0);
signal iHBURST      : std_logic_vector(2 downto 0);
signal iHPROT       : std_logic_vector(3 downto 0);
signal iHSIZE       : std_logic_vector(2 downto 0);
signal iHWRITE      : std_logic;
signal iHMASTLOCK   : std_logic;
signal iHADDR       : std_logic_vector(31 downto 0);
signal iHWDATA      : std_logic_vector(31 downto 0);
signal iJTAGNSW     : std_logic;
signal iJTAGTOP     : std_logic;
signal iTDO         : std_logic;
signal inTDOEN      : std_logic;
signal iSWDO        : std_logic;
signal iSWDOEN      : std_logic;
signal iHALTED      : std_logic;

attribute VITAL_LEVEL1 of VITAL_ACT : architecture is FALSE;
begin
--variable DOUTA0_GlitchData : VitalGlitchDataType;

BFM_core :CortexM1BFM
    port map(
    -- Inputs
    HCLK        => HCLK,
    SYSRESETn   => SYSRESETn,
    IRQ         => IRQ,
    NMI         => NMI,
    HREADY      => HREADY,
    HRESP       => HRESP,
    HRDATA      => HRDATA,
    -- Inputs Debug
    DBGRESETn   => DBGRESETn,
    EDBGRQ      => EDBGRQ,
    nTRST       => nTRST,
    SWCLKTCK    => SWCLKTCK,
    SWDITMS     => SWDITMS,
    TDI         => TDI,
    -- Outputs
    SYSRESETREQ => iSYSRESETREQ,
    LOCKUP      => iLOCKUP,
    HTRANS      => iHTRANS,
    HBURST      => iHBURST,
    HPROT       => iHPROT,
    HSIZE       => iHSIZE,
    HWRITE      => iHWRITE,
    HMASTLOCK   => iHMASTLOCK,
    HADDR       => iHADDR,
    HWDATA      => iHWDATA,
    -- Outputs Debug
    JTAGNSW     => iJTAGNSW,
    JTAGTOP     => iJTAGTOP,
    TDO         => iTDO,
    nTDOEN      => inTDOEN,
    SWDO        => iSWDO,
    SWDOEN      => iSWDOEN,
    HALTED      => iHALTED
    );

clkout_swclktck_jtagnsw : BUFF_TS generic map (tipd_A =>tipd_SWCLKTCK, tpd_A_Y => tpd_SWCLKTCK_JTAGNSW) port map ( A => iJTAGNSW, Y => JTAGNSW );
clkout_swclktck_jtagtop : BUFF_TS generic map (tipd_A =>tipd_SWCLKTCK, tpd_A_Y => tpd_SWCLKTCK_JTAGTOP) port map ( A => iJTAGTOP, Y => JTAGTOP );
clkout_swclktck_tdo : BUFF_TS generic map (tipd_A =>tipd_SWCLKTCK, tpd_A_Y => tpd_SWCLKTCK_TDO) port map ( A => iTDO, Y => TDO );
clkout_swclktck_ntdoen : BUFF_TS generic map (tipd_A =>tipd_SWCLKTCK, tpd_A_Y => tpd_SWCLKTCK_nTDOEN) port map ( A => inTDOEN, Y => nTDOEN );
clkout_swclktck_swdo : BUFF_TS generic map (tipd_A =>tipd_SWCLKTCK, tpd_A_Y => tpd_SWCLKTCK_SWDO) port map ( A => iSWDO, Y => SWDO );
clkout_swclktck_swdoen : BUFF_TS generic map (tipd_A =>tipd_SWCLKTCK, tpd_A_Y => tpd_SWCLKTCK_SWDOEN) port map ( A => iSWDOEN, Y => SWDOEN );

clkout_sysresetreq : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_SYSRESETREQ) port map ( A => iSYSRESETREQ, Y => SYSRESETREQ );
clkout_lockup : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_LOCKUP) port map ( A => iLOCKUP, Y => LOCKUP );
clkout_halted : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HALTED) port map ( A => iHALTED, Y => HALTED );
clkout_htrans0 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HTRANS(0)) port map ( A => iHTRANS(0), Y => HTRANS(0) );
clkout_htrans1 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HTRANS(1)) port map ( A => iHTRANS(1), Y => HTRANS(1) );
clkout_hburst0 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HBURST(0)) port map ( A => iHBURST(0), Y => HBURST(0) );
clkout_hburst1 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HBURST(1)) port map ( A => iHBURST(1), Y => HBURST(1) );
clkout_hburst2 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HBURST(2)) port map ( A => iHBURST(2), Y => HBURST(2) );
clkout_hprot0 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HPROT(0)) port map ( A => iHPROT(0), Y => HPROT(0) );
clkout_hprot1 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HPROT(1)) port map ( A => iHPROT(1), Y => HPROT(1) );
clkout_hprot2 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HPROT(2)) port map ( A => iHPROT(2), Y => HPROT(2) );
clkout_hprot3 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HPROT(3)) port map ( A => iHPROT(3), Y => HPROT(3) );
clkout_hsize0 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HSIZE(0)) port map ( A => iHSIZE(0), Y => HSIZE(0) );
clkout_hsize1 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HSIZE(1)) port map ( A => iHSIZE(1), Y => HSIZE(1) );
clkout_hsize2 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HSIZE(2)) port map ( A => iHSIZE(2), Y => HSIZE(2) );
clkout_hwrite : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWRITE) port map ( A => iHWRITE, Y => HWRITE );
clkout_hmastlock : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HMASTLOCK) port map ( A => iHMASTLOCK, Y => HMASTLOCK );
clkout_haddr0 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(0)) port map ( A => iHADDR(0), Y => HADDR(0) );
clkout_haddr1 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(1)) port map ( A => iHADDR(1), Y => HADDR(1) );
clkout_haddr2 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(2)) port map ( A => iHADDR(2), Y => HADDR(2) );
clkout_haddr3 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(3)) port map ( A => iHADDR(3), Y => HADDR(3) );
clkout_haddr4 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(4)) port map ( A => iHADDR(4), Y => HADDR(4) );
clkout_haddr5 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(5)) port map ( A => iHADDR(5), Y => HADDR(5) );
clkout_haddr6 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(6)) port map ( A => iHADDR(6), Y => HADDR(6) );
clkout_haddr7 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(7)) port map ( A => iHADDR(7), Y => HADDR(7) );
clkout_haddr8 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(8)) port map ( A => iHADDR(8), Y => HADDR(8) );
clkout_haddr9 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(9)) port map ( A => iHADDR(9), Y => HADDR(9) );
clkout_haddr10 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(10)) port map ( A => iHADDR(10), Y => HADDR(10) );
clkout_haddr11 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(11)) port map ( A => iHADDR(11), Y => HADDR(11) );
clkout_haddr12 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(12)) port map ( A => iHADDR(12), Y => HADDR(12) );
clkout_haddr13 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(13)) port map ( A => iHADDR(13), Y => HADDR(13) );
clkout_haddr14 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(14)) port map ( A => iHADDR(14), Y => HADDR(14) );
clkout_haddr15 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(15)) port map ( A => iHADDR(15), Y => HADDR(15) );
clkout_haddr16 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(16)) port map ( A => iHADDR(16), Y => HADDR(16) );
clkout_haddr17 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(17)) port map ( A => iHADDR(17), Y => HADDR(17) );
clkout_haddr18 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(18)) port map ( A => iHADDR(18), Y => HADDR(18) );
clkout_haddr19 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(19)) port map ( A => iHADDR(19), Y => HADDR(19) );
clkout_haddr20 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(20)) port map ( A => iHADDR(20), Y => HADDR(20) );
clkout_haddr21 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(21)) port map ( A => iHADDR(21), Y => HADDR(21) );
clkout_haddr22 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(22)) port map ( A => iHADDR(22), Y => HADDR(22) );
clkout_haddr23 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(23)) port map ( A => iHADDR(23), Y => HADDR(23) );
clkout_haddr24 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(24)) port map ( A => iHADDR(24), Y => HADDR(24) );
clkout_haddr25 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(25)) port map ( A => iHADDR(25), Y => HADDR(25) );
clkout_haddr26 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(26)) port map ( A => iHADDR(26), Y => HADDR(26) );
clkout_haddr27 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(27)) port map ( A => iHADDR(27), Y => HADDR(27) );
clkout_haddr28 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(28)) port map ( A => iHADDR(28), Y => HADDR(28) );
clkout_haddr29 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(29)) port map ( A => iHADDR(29), Y => HADDR(29) );
clkout_haddr30 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(30)) port map ( A => iHADDR(30), Y => HADDR(30) );
clkout_haddr31 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HADDR(31)) port map ( A => iHADDR(31), Y => HADDR(31) );
clkout_hwdata0 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(0)) port map ( A => iHWDATA(0), Y => HWDATA(0) );
clkout_hwdata1 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(1)) port map ( A => iHWDATA(1), Y => HWDATA(1) );
clkout_hwdata2 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(2)) port map ( A => iHWDATA(2), Y => HWDATA(2) );
clkout_hwdata3 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(3)) port map ( A => iHWDATA(3), Y => HWDATA(3) );
clkout_hwdata4 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(4)) port map ( A => iHWDATA(4), Y => HWDATA(4) );
clkout_hwdata5 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(5)) port map ( A => iHWDATA(5), Y => HWDATA(5) );
clkout_hwdata6 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(6)) port map ( A => iHWDATA(6), Y => HWDATA(6) );
clkout_hwdata7 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(7)) port map ( A => iHWDATA(7), Y => HWDATA(7) );
clkout_hwdata8 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(8)) port map ( A => iHWDATA(8), Y => HWDATA(8) );
clkout_hwdata9 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(9)) port map ( A => iHWDATA(9), Y => HWDATA(9) );
clkout_hwdata10 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(10)) port map ( A => iHWDATA(10), Y => HWDATA(10) );
clkout_hwdata11 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(11)) port map ( A => iHWDATA(11), Y => HWDATA(11) );
clkout_hwdata12 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(12)) port map ( A => iHWDATA(12), Y => HWDATA(12) );
clkout_hwdata13 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(13)) port map ( A => iHWDATA(13), Y => HWDATA(13) );
clkout_hwdata14 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(14)) port map ( A => iHWDATA(14), Y => HWDATA(14) );
clkout_hwdata15 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(15)) port map ( A => iHWDATA(15), Y => HWDATA(15) );
clkout_hwdata16 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(16)) port map ( A => iHWDATA(16), Y => HWDATA(16) );
clkout_hwdata17 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(17)) port map ( A => iHWDATA(17), Y => HWDATA(17) );
clkout_hwdata18 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(18)) port map ( A => iHWDATA(18), Y => HWDATA(18) );
clkout_hwdata19 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(19)) port map ( A => iHWDATA(19), Y => HWDATA(19) );
clkout_hwdata20 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(20)) port map ( A => iHWDATA(20), Y => HWDATA(20) );
clkout_hwdata21 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(21)) port map ( A => iHWDATA(21), Y => HWDATA(21) );
clkout_hwdata22 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(22)) port map ( A => iHWDATA(22), Y => HWDATA(22) );
clkout_hwdata23 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(23)) port map ( A => iHWDATA(23), Y => HWDATA(23) );
clkout_hwdata24 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(24)) port map ( A => iHWDATA(24), Y => HWDATA(24) );
clkout_hwdata25 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(25)) port map ( A => iHWDATA(25), Y => HWDATA(25) );
clkout_hwdata26 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(26)) port map ( A => iHWDATA(26), Y => HWDATA(26) );
clkout_hwdata27 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(27)) port map ( A => iHWDATA(27), Y => HWDATA(27) );
clkout_hwdata28 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(28)) port map ( A => iHWDATA(28), Y => HWDATA(28) );
clkout_hwdata29 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(29)) port map ( A => iHWDATA(29), Y => HWDATA(29) );
clkout_hwdata30 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(30)) port map ( A => iHWDATA(30), Y => HWDATA(30) );
clkout_hwdata31 : BUFF_TS generic map (tipd_A =>tipd_HCLK, tpd_A_Y => tpd_HCLK_HWDATA(31)) port map ( A => iHWDATA(31), Y => HWDATA(31) );

DBGRESETn_SWCLKTCK_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_DBGRESETn_SWCLKTCK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_DBGRESETn_SWCLKTCK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_DBGRESETn_SWCLKTCK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_DBGRESETn_SWCLKTCK_negedge_posedge,
        tipd_D                          => tipd_DBGRESETn,
        tipd_CLK                        => tipd_SWCLKTCK
    )
    port map(
        Q       => open,
        D       => DBGRESETn,
        CLK     => SWCLKTCK
    );

nTRST_SWCLKTCK_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_nTRST_SWCLKTCK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_nTRST_SWCLKTCK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_nTRST_SWCLKTCK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_nTRST_SWCLKTCK_negedge_posedge,
        tipd_D                          => tipd_nTRST,
        tipd_CLK                        => tipd_SWCLKTCK
    )
    port map(
        Q       => open,
        D       => nTRST,
        CLK     => SWCLKTCK
    );

SWDITMS_SWCLKTCK_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_SWDITMS_SWCLKTCK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_SWDITMS_SWCLKTCK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_SWDITMS_SWCLKTCK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_SWDITMS_SWCLKTCK_negedge_posedge,
        tipd_D                          => tipd_SWDITMS,
        tipd_CLK                        => tipd_SWCLKTCK
    )
    port map(
        Q       => open,
        D       => SWDITMS,
        CLK     => SWCLKTCK
    );

TDI_SWCLKTCK_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_TDI_SWCLKTCK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_TDI_SWCLKTCK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_TDI_SWCLKTCK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_TDI_SWCLKTCK_negedge_posedge,
        tipd_D                          => tipd_TDI,
        tipd_CLK                        => tipd_SWCLKTCK
    )
    port map(
        Q       => open,
        D       => TDI,
        CLK     => SWCLKTCK
    );

--------------------------------------------------------------------------------

HRESP_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRESP_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge    => thold_HRESP_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_HRESP_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge    => thold_HRESP_HCLK_negedge_posedge,
            tipd_D        => tipd_HRESP,
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRESP, CLK        => HCLK );


NMI_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_NMI_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge    => thold_NMI_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_NMI_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge    => thold_NMI_HCLK_negedge_posedge,
            tipd_D        => tipd_NMI,
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => NMI, CLK        => HCLK );


HREADY_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HREADY_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge    => thold_HREADY_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_HREADY_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge    => thold_HREADY_HCLK_negedge_posedge,
            tipd_D        => tipd_HREADY,
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HREADY, CLK        => HCLK );

DBGRESETn_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_DBGRESETn_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_DBGRESETn_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_DBGRESETn_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_DBGRESETn_HCLK_negedge_posedge,
        tipd_D                          => tipd_DBGRESETn,
        tipd_CLK                        => tipd_HCLK
    )
    port map(
        Q       => open,
        D       => DBGRESETn,
        CLK     => HCLK
    );

EDBGRQ_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_EDBGRQ_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_EDBGRQ_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_EDBGRQ_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_EDBGRQ_HCLK_negedge_posedge,
        tipd_D                          => tipd_EDBGRQ,
        tipd_CLK                        => tipd_HCLK
    )
    port map(
        Q       => open,
        D       => EDBGRQ,
        CLK     => HCLK
    );

nTRST_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_nTRST_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_nTRST_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_nTRST_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_nTRST_HCLK_negedge_posedge,
        tipd_D                          => tipd_nTRST,
        tipd_CLK                        => tipd_HCLK
    )
    port map(
        Q       => open,
        D       => nTRST,
        CLK     => HCLK
    );

SWCLKTCK_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_SWCLKTCK_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_SWCLKTCK_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_SWCLKTCK_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_SWCLKTCK_HCLK_negedge_posedge,
        tipd_D                          => tipd_SWCLKTCK,
        tipd_CLK                        => tipd_HCLK
    )
    port map(
        Q       => open,
        D       => SWCLKTCK,
        CLK     => HCLK
    );

SWDITMS_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_SWDITMS_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_SWDITMS_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_SWDITMS_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_SWDITMS_HCLK_negedge_posedge,
        tipd_D                          => tipd_SWDITMS,
        tipd_CLK                        => tipd_HCLK
    )
    port map(
        Q       => open,
        D       => SWDITMS,
        CLK     => HCLK
    );

TDI_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_TDI_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge     => thold_TDI_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_TDI_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge     => thold_TDI_HCLK_negedge_posedge,
        tipd_D                          => tipd_TDI,
        tipd_CLK                        => tipd_HCLK
    )
    port map(
        Q       => open,
        D       => TDI,
        CLK     => HCLK
    );

SYSRESETn_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_SYSRESETn_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge    => thold_SYSRESETn_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_SYSRESETn_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge    => thold_SYSRESETn_HCLK_negedge_posedge,
            tipd_D        => tipd_SYSRESETn,
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => SYSRESETn, CLK        => HCLK );

HRDATA_ff0: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(0),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(0),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(0),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(0),
            tipd_D        => tipd_HRDATA(0),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(0), CLK        => HCLK );
HRDATA_ff1: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(1),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(1),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(1),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(1),
            tipd_D        => tipd_HRDATA(1),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(1), CLK        => HCLK );

HRDATA_ff2: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(2),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(2),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(2),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(2),
            tipd_D        => tipd_HRDATA(2),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(2), CLK        => HCLK );

HRDATA_ff3: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(3),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(3),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(3),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(3),
            tipd_D        => tipd_HRDATA(3),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(3), CLK        => HCLK );

HRDATA_ff4: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(4),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(4),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(4),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(4),
            tipd_D        => tipd_HRDATA(4),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(4), CLK        => HCLK );

HRDATA_ff5: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(5),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(5),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(5),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(5),
            tipd_D        => tipd_HRDATA(5),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(5), CLK        => HCLK );

HRDATA_ff6: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(6),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(6),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(6),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(6),
            tipd_D        => tipd_HRDATA(6),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(6), CLK        => HCLK );

HRDATA_ff7: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(7),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(7),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(7),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(7),
            tipd_D        => tipd_HRDATA(7),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(7), CLK        => HCLK );

HRDATA_ff8: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(8),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(8),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(8),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(8),
            tipd_D        => tipd_HRDATA(8),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(8), CLK        => HCLK );

HRDATA_ff9: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(9),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(9),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(9),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(9),
            tipd_D        => tipd_HRDATA(9),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(9), CLK        => HCLK );
HRDATA_ff10: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(10),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(10),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(10),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(10),
            tipd_D        => tipd_HRDATA(10),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(10), CLK        => HCLK );
HRDATA_ff11: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(11),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(11),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(11),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(11),
            tipd_D        => tipd_HRDATA(11),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(11), CLK        => HCLK );

HRDATA_ff12: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(12),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(12),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(12),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(12),
            tipd_D        => tipd_HRDATA(12),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(12), CLK        => HCLK );

HRDATA_ff13: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(13),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(13),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(13),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(13),
            tipd_D        => tipd_HRDATA(13),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(13), CLK        => HCLK );
HRDATA_ff14: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(14),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(14),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(14),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(14),
            tipd_D        => tipd_HRDATA(14),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(14), CLK        => HCLK );

HRDATA_ff15: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(15),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(15),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(15),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(15),
            tipd_D        => tipd_HRDATA(15),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(15), CLK        => HCLK );

HRDATA_ff16: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(16),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(16),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(16),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(16),
            tipd_D        => tipd_HRDATA(16),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(16), CLK        => HCLK );

HRDATA_ff17: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(17),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(17),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(17),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(17),
            tipd_D        => tipd_HRDATA(17),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(17), CLK        => HCLK );

HRDATA_ff18: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(18),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(18),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(18),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(18),
            tipd_D        => tipd_HRDATA(18),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(18), CLK        => HCLK );

HRDATA_ff19: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(19),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(19),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(19),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(19),
            tipd_D        => tipd_HRDATA(19),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(19), CLK        => HCLK );


HRDATA_ff20: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(20),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(20),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(20),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(20),
            tipd_D        => tipd_HRDATA(20),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(20), CLK        => HCLK );
HRDATA_ff21: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(21),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(21),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(21),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(21),
            tipd_D        => tipd_HRDATA(21),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(21), CLK        => HCLK );

HRDATA_ff22: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(22),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(22),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(22),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(22),
            tipd_D        => tipd_HRDATA(22),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(22), CLK        => HCLK );

HRDATA_ff23: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(23),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(23),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(23),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(23),
            tipd_D        => tipd_HRDATA(23),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(23), CLK        => HCLK );
HRDATA_ff24: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(24),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(24),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(24),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(24),
            tipd_D        => tipd_HRDATA(24),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(24), CLK        => HCLK );

HRDATA_ff25: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(25),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(25),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(25),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(25),
            tipd_D        => tipd_HRDATA(25),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(25), CLK        => HCLK );

HRDATA_ff26: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(26),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(26),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(26),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(26),
            tipd_D        => tipd_HRDATA(26),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(26), CLK        => HCLK );

HRDATA_ff27: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(27),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(27),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(27),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(27),
            tipd_D        => tipd_HRDATA(27),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(27), CLK        => HCLK );

HRDATA_ff28: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(28),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(28),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(28),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(28),
            tipd_D        => tipd_HRDATA(28),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(28), CLK        => HCLK );

HRDATA_ff29: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(29),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(29),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(29),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(29),
            tipd_D        => tipd_HRDATA(29),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(29), CLK        => HCLK );

HRDATA_ff30: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(30),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(30),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(30),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(30),
            tipd_D        => tipd_HRDATA(30),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(30), CLK        => HCLK );

HRDATA_ff31: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_HRDATA_HCLK_posedge_posedge(31),
        thold_D_CLK_posedge_posedge    => thold_HRDATA_HCLK_posedge_posedge(31),
        tsetup_D_CLK_negedge_posedge    => tsetup_HRDATA_HCLK_negedge_posedge(31),
        thold_D_CLK_negedge_posedge    => thold_HRDATA_HCLK_negedge_posedge(31),
            tipd_D        => tipd_HRDATA(31),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => HRDATA(31), CLK        => HCLK );



IRQ_ff0: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(0),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(0),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(0),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(0),
        tipd_D        => tipd_IRQ(0),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(0), CLK        => HCLK );
IRQ_ff1: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(1),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(1),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(1),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(1),
        tipd_D        => tipd_IRQ(1),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(1), CLK        => HCLK );

IRQ_ff2: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(2),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(2),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(2),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(2),
        tipd_D        => tipd_IRQ(2),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(2), CLK        => HCLK );

IRQ_ff3: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(3),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(3),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(3),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(3),
        tipd_D        => tipd_IRQ(3),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(3), CLK        => HCLK );
IRQ_ff4: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(4),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(4),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(4),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(4),
        tipd_D        => tipd_IRQ(4),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(4), CLK        => HCLK );

IRQ_ff5: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(5),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(5),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(5),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(5),
        tipd_D        => tipd_IRQ(5),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(5), CLK        => HCLK );

IRQ_ff6: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(6),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(6),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(6),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(6),
        tipd_D        => tipd_IRQ(6),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(6), CLK        => HCLK );

IRQ_ff7: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(7),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(7),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(7),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(7),
        tipd_D        => tipd_IRQ(7),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(7), CLK        => HCLK );

IRQ_ff8: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(8),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(8),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(8),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(8),
        tipd_D        => tipd_IRQ(8),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(8), CLK        => HCLK );

IRQ_ff9: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(9),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(9),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(9),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(9),
        tipd_D        => tipd_IRQ(9),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(9), CLK        => HCLK );
IRQ_ff10: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(10),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(10),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(10),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(10),
        tipd_D        => tipd_IRQ(10),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(10), CLK        => HCLK );
IRQ_ff11: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(11),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(11),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(11),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(11),
        tipd_D        => tipd_IRQ(11),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(11), CLK        => HCLK );

IRQ_ff12: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(12),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(12),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(12),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(12),
        tipd_D        => tipd_IRQ(12),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(12), CLK        => HCLK );

IRQ_ff13: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(13),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(13),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(13),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(13),
        tipd_D        => tipd_IRQ(13),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(13), CLK        => HCLK );
IRQ_ff14: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(14),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(14),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(14),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(14),
        tipd_D        => tipd_IRQ(14),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(14), CLK        => HCLK );

IRQ_ff15: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(15),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(15),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(15),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(15),
        tipd_D        => tipd_IRQ(15),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(15), CLK        => HCLK );

IRQ_ff16: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(16),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(16),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(16),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(16),
        tipd_D        => tipd_IRQ(16),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(16), CLK        => HCLK );

IRQ_ff17: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(17),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(17),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(17),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(17),
        tipd_D        => tipd_IRQ(17),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(17), CLK        => HCLK );

IRQ_ff18: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(18),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(18),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(18),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(18),
        tipd_D        => tipd_IRQ(18),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(18), CLK        => HCLK );

IRQ_ff19: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(19),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(19),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(19),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(19),
        tipd_D        => tipd_IRQ(19),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(19), CLK        => HCLK );


IRQ_ff20: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(20),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(20),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(20),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(20),
        tipd_D        => tipd_IRQ(20),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(20), CLK        => HCLK );
IRQ_ff21: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(21),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(21),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(21),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(21),
        tipd_D        => tipd_IRQ(21),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(21), CLK        => HCLK );

IRQ_ff22: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(22),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(22),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(22),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(22),
        tipd_D        => tipd_IRQ(22),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(22), CLK        => HCLK );

IRQ_ff23: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(23),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(23),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(23),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(23),
        tipd_D        => tipd_IRQ(23),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(23), CLK        => HCLK );
IRQ_ff24: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(24),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(24),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(24),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(24),
        tipd_D        => tipd_IRQ(24),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(24), CLK        => HCLK );

IRQ_ff25: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(25),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(25),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(25),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(25),
        tipd_D        => tipd_IRQ(25),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(25), CLK        => HCLK );

IRQ_ff26: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(26),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(26),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(26),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(26),
        tipd_D        => tipd_IRQ(26),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(26), CLK        => HCLK );

IRQ_ff27: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(27),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(27),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(27),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(27),
        tipd_D        => tipd_IRQ(27),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(27), CLK        => HCLK );

IRQ_ff28: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(28),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(28),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(28),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(28),
        tipd_D        => tipd_IRQ(28),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(28), CLK        => HCLK );

IRQ_ff29: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(29),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(29),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(29),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(29),
        tipd_D        => tipd_IRQ(29),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(29), CLK        => HCLK );

IRQ_ff30: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(30),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(30),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(30),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(30),
        tipd_D        => tipd_IRQ(30),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(30), CLK        => HCLK );

IRQ_ff31: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_IRQ_HCLK_posedge_posedge(31),
        thold_D_CLK_posedge_posedge    => thold_IRQ_HCLK_posedge_posedge(31),
        tsetup_D_CLK_negedge_posedge    => tsetup_IRQ_HCLK_negedge_posedge(31),
        thold_D_CLK_negedge_posedge    => thold_IRQ_HCLK_negedge_posedge(31),
        tipd_D        => tipd_IRQ(31),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => IRQ(31), CLK        => HCLK );

tcmInitWriteData_ff0: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(0),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(0),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(0),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(0),
        tipd_D        => tipd_tcmInitWriteData(0),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(0), CLK        => HCLK );
tcmInitWriteData_ff1: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(1),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(1),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(1),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(1),
        tipd_D        => tipd_tcmInitWriteData(1),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(1), CLK        => HCLK );

tcmInitWriteData_ff2: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(2),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(2),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(2),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(2),
        tipd_D        => tipd_tcmInitWriteData(2),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(2), CLK        => HCLK );

tcmInitWriteData_ff3: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(3),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(3),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(3),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(3),
        tipd_D        => tipd_tcmInitWriteData(3),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(3), CLK        => HCLK );
tcmInitWriteData_ff4: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(4),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(4),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(4),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(4),
        tipd_D        => tipd_tcmInitWriteData(4),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(4), CLK        => HCLK );

tcmInitWriteData_ff5: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(5),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(5),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(5),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(5),
        tipd_D        => tipd_tcmInitWriteData(5),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(5), CLK        => HCLK );

tcmInitWriteData_ff6: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(6),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(6),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(6),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(6),
        tipd_D        => tipd_tcmInitWriteData(6),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(6), CLK        => HCLK );

tcmInitWriteData_ff7: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(7),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(7),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(7),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(7),
        tipd_D        => tipd_tcmInitWriteData(7),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(7), CLK        => HCLK );

tcmInitWriteData_ff8: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(8),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(8),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(8),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(8),
        tipd_D        => tipd_tcmInitWriteData(8),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(8), CLK        => HCLK );

tcmInitWriteData_ff9: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(9),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(9),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(9),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(9),
        tipd_D        => tipd_tcmInitWriteData(9),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(9), CLK        => HCLK );
tcmInitWriteData_ff10: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(10),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(10),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(10),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(10),
        tipd_D        => tipd_tcmInitWriteData(10),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(10), CLK        => HCLK );
tcmInitWriteData_ff11: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(11),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(11),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(11),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(11),
        tipd_D        => tipd_tcmInitWriteData(11),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(11), CLK        => HCLK );

tcmInitWriteData_ff12: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(12),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(12),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(12),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(12),
        tipd_D        => tipd_tcmInitWriteData(12),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(12), CLK        => HCLK );

tcmInitWriteData_ff13: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(13),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(13),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(13),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(13),
        tipd_D        => tipd_tcmInitWriteData(13),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(13), CLK        => HCLK );
tcmInitWriteData_ff14: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(14),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(14),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(14),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(14),
        tipd_D        => tipd_tcmInitWriteData(14),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(14), CLK        => HCLK );

tcmInitWriteData_ff15: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(15),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(15),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(15),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(15),
        tipd_D        => tipd_tcmInitWriteData(15),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(15), CLK        => HCLK );

tcmInitWriteData_ff16: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(16),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(16),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(16),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(16),
        tipd_D        => tipd_tcmInitWriteData(16),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(16), CLK        => HCLK );

tcmInitWriteData_ff17: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(17),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(17),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(17),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(17),
        tipd_D        => tipd_tcmInitWriteData(17),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(17), CLK        => HCLK );

tcmInitWriteData_ff18: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(18),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(18),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(18),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(18),
        tipd_D        => tipd_tcmInitWriteData(18),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(18), CLK        => HCLK );

tcmInitWriteData_ff19: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(19),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(19),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(19),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(19),
        tipd_D        => tipd_tcmInitWriteData(19),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(19), CLK        => HCLK );


tcmInitWriteData_ff20: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(20),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(20),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(20),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(20),
        tipd_D        => tipd_tcmInitWriteData(20),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(20), CLK        => HCLK );
tcmInitWriteData_ff21: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(21),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(21),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(21),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(21),
        tipd_D        => tipd_tcmInitWriteData(21),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(21), CLK        => HCLK );

tcmInitWriteData_ff22: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(22),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(22),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(22),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(22),
        tipd_D        => tipd_tcmInitWriteData(22),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(22), CLK        => HCLK );

tcmInitWriteData_ff23: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(23),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(23),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(23),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(23),
        tipd_D        => tipd_tcmInitWriteData(23),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(23), CLK        => HCLK );
tcmInitWriteData_ff24: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(24),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(24),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(24),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(24),
        tipd_D        => tipd_tcmInitWriteData(24),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(24), CLK        => HCLK );

tcmInitWriteData_ff25: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(25),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(25),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(25),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(25),
        tipd_D        => tipd_tcmInitWriteData(25),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(25), CLK        => HCLK );

tcmInitWriteData_ff26: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(26),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(26),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(26),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(26),
        tipd_D        => tipd_tcmInitWriteData(26),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(26), CLK        => HCLK );

tcmInitWriteData_ff27: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(27),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(27),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(27),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(27),
        tipd_D        => tipd_tcmInitWriteData(27),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(27), CLK        => HCLK );

tcmInitWriteData_ff28: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(28),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(28),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(28),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(28),
        tipd_D        => tipd_tcmInitWriteData(28),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(28), CLK        => HCLK );

tcmInitWriteData_ff29: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(29),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(29),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(29),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(29),
        tipd_D        => tipd_tcmInitWriteData(29),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(29), CLK        => HCLK );

tcmInitWriteData_ff30: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(30),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(30),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(30),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(30),
        tipd_D        => tipd_tcmInitWriteData(30),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(30), CLK        => HCLK );

tcmInitWriteData_ff31: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteData_HCLK_posedge_posedge(31),
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteData_HCLK_posedge_posedge(31),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteData_HCLK_negedge_posedge(31),
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteData_HCLK_negedge_posedge(31),
        tipd_D        => tipd_tcmInitWriteData(31),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteData(31), CLK        => HCLK );
tcmInitAddr_ff2: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(2),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(2),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(2),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(2),
        tipd_D        => tipd_tcmInitAddr(2),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(2), CLK        => HCLK );

tcmInitAddr_ff3: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(3),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(3),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(3),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(3),
        tipd_D        => tipd_tcmInitAddr(3),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(3), CLK        => HCLK );
tcmInitAddr_ff4: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(4),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(4),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(4),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(4),
        tipd_D        => tipd_tcmInitAddr(4),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(4), CLK        => HCLK );

tcmInitAddr_ff5: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(5),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(5),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(5),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(5),
        tipd_D        => tipd_tcmInitAddr(5),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(5), CLK        => HCLK );

tcmInitAddr_ff6: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(6),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(6),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(6),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(6),
        tipd_D        => tipd_tcmInitAddr(6),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(6), CLK        => HCLK );

tcmInitAddr_ff7: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(7),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(7),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(7),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(7),
        tipd_D        => tipd_tcmInitAddr(7),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(7), CLK        => HCLK );

tcmInitAddr_ff8: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(8),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(8),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(8),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(8),
        tipd_D        => tipd_tcmInitAddr(8),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(8), CLK        => HCLK );

tcmInitAddr_ff9: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(9),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(9),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(9),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(9),
        tipd_D        => tipd_tcmInitAddr(9),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(9), CLK        => HCLK );
tcmInitAddr_ff10: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(10),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(10),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(10),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(10),
        tipd_D        => tipd_tcmInitAddr(10),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(10), CLK        => HCLK );
tcmInitAddr_ff11: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(11),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(11),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(11),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(11),
        tipd_D        => tipd_tcmInitAddr(11),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(11), CLK        => HCLK );

tcmInitAddr_ff12: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(12),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(12),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(12),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(12),
        tipd_D        => tipd_tcmInitAddr(12),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(12), CLK        => HCLK );

tcmInitAddr_ff13: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(13),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(13),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(13),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(13),
        tipd_D        => tipd_tcmInitAddr(13),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(13), CLK        => HCLK );
tcmInitAddr_ff14: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(14),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(14),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(14),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(14),
        tipd_D        => tipd_tcmInitAddr(14),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(14), CLK        => HCLK );

tcmInitAddr_ff15: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(15),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(15),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(15),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(15),
        tipd_D        => tipd_tcmInitAddr(15),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(15), CLK        => HCLK );

tcmInitAddr_ff16: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(16),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(16),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(16),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(16),
        tipd_D        => tipd_tcmInitAddr(16),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(16), CLK        => HCLK );

tcmInitAddr_ff17: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(17),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(17),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(17),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(17),
        tipd_D        => tipd_tcmInitAddr(17),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(17), CLK        => HCLK );

tcmInitAddr_ff18: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(18),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(18),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(18),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(18),
        tipd_D        => tipd_tcmInitAddr(18),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(18), CLK        => HCLK );

tcmInitAddr_ff19: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitAddr_HCLK_posedge_posedge(19),
        thold_D_CLK_posedge_posedge    => thold_tcmInitAddr_HCLK_posedge_posedge(19),
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitAddr_HCLK_negedge_posedge(19),
        thold_D_CLK_negedge_posedge    => thold_tcmInitAddr_HCLK_negedge_posedge(19),
        tipd_D        => tipd_tcmInitAddr(19),
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitAddr(19), CLK        => HCLK );

tcmInitWriteEnable_ff: BFMDFN1
    generic map(
        tsetup_D_CLK_posedge_posedge    => tsetup_tcmInitWriteEnable_HCLK_posedge_posedge,
        thold_D_CLK_posedge_posedge    => thold_tcmInitWriteEnable_HCLK_posedge_posedge,
        tsetup_D_CLK_negedge_posedge    => tsetup_tcmInitWriteEnable_HCLK_negedge_posedge,
        thold_D_CLK_negedge_posedge    => thold_tcmInitWriteEnable_HCLK_negedge_posedge,
        tipd_D        => tipd_tcmInitWriteEnable,
        tipd_CLK          => tipd_HCLK
             )

    port map(
        Q        => open, D        => tcmInitWriteEnable, CLK        => HCLK );

end VITAL_ACT;

library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.VITAL_Timing.all;



 ---- CELL BUFF ----
 library IEEE;
 use IEEE.STD_LOGIC_1164.all;
 library IEEE;
 use IEEE.VITAL_Timing.all;

 ---- entity declaration ----
 entity BUFF_TS is
    generic(
        TimingChecksOn:Boolean := True;
        Xon: Boolean := False;
        InstancePath: STRING :="*";
        MsgOn: Boolean := True;
        tpd_A_Y        : VitalDelayType01 := (0.100 ns, 0.100 ns);
        tipd_A        : VitalDelayType01 := (0.000 ns, 0.000 ns));


    port(
        A        : in    STD_ULOGIC;
        Y        : out    STD_ULOGIC);
 attribute VITAL_LEVEL0 of BUFF_TS :  entity is TRUE;
 end BUFF_TS;

-- architecture body --
library IEEE;
use IEEE.VITAL_Primitives.all;
library proasic3e;
use proasic3e.VTABLES.all;

architecture VITAL_ACT of BUFF_TS is
    attribute VITAL_LEVEL1 of VITAL_ACT : architecture is TRUE;

    SIGNAL A_ipd  : STD_ULOGIC := 'X';

begin

    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
    VitalWireDelay (A_ipd, A, tipd_A);
    end block;

    --------------------
    --  BEHAVIOR SECTION
    --------------------
    VITALBehavior : process (A_ipd)


    -- functionality results
    VARIABLE Results : STD_LOGIC_VECTOR(1 to 1)  := (others => 'X');
    ALIAS Y_zd : STD_LOGIC is Results(1);

    -- output glitch detection variables
    VARIABLE Y_GlitchData  : VitalGlitchDataType;

    begin

    -------------------------
    --  Functionality Section
    -------------------------
    Y_zd :=TO_X01(A_ipd);


    ----------------------
    --  Path Delay Section
    ----------------------

    VitalPathDelay01 (
        OutSignal       => Y,
        GlitchData      => Y_GlitchData,
        OutSignalName   => "Y",
        OutTemp         => Y_zd,
        Paths           => (0 => (A_ipd'last_event,tpd_A_Y, true)),
        Mode            => OnDetect,
        Xon             => Xon,
        MsgOn           => MsgOn,
        MsgSeverity     => WARNING);

    end process;

end VITAL_ACT;

configuration CFG_BUFF_VITAL of BUFF_TS is
    for VITAL_ACT
    end for;
 end CFG_BUFF_VITAL;

---- CELL BFMDFN1 ----
library IEEE;
    use IEEE.STD_LOGIC_1164.all;
library IEEE;
    use IEEE.VITAL_Timing.all;

---- entity declaration ----
entity BFMDFN1 is
    generic(
        TimingChecksOn              : Boolean := True;
        InstancePath                : STRING := "*";
        Xon                         : Boolean := False;
        MsgOn                       : Boolean := True;
        tpd_CLK_Q                   : VitalDelayType01 := (0.100 ns, 0.100 ns);
        tsetup_D_CLK_posedge_posedge: VitalDelayType := 0.000 ns;
        thold_D_CLK_posedge_posedge : VitalDelayType := 0.000 ns;
        tsetup_D_CLK_negedge_posedge: VitalDelayType := 0.000 ns;
        thold_D_CLK_negedge_posedge : VitalDelayType := 0.000 ns;
        tpw_CLK_posedge             : VitalDelayType := 0.000 ns;
        tpw_CLK_negedge             : VitalDelayType := 0.000 ns;
        tipd_D                      : VitalDelayType01 := (0.000 ns, 0.000 ns);
        tipd_CLK                    : VitalDelayType01 := (0.000 ns, 0.000 ns));
    port(
        CLK     : in  STD_ULOGIC;
        D       : in  STD_ULOGIC;
        Q       : out STD_ULOGIC);

    attribute VITAL_LEVEL0 of BFMDFN1 :  entity is TRUE;
end BFMDFN1;

-- architecture body --
library IEEE;
    use IEEE.VITAL_Primitives.all;
library proasic3e;
    use proasic3e.VTABLES.all;

architecture VITAL_ACT of BFMDFN1 is
    attribute VITAL_LEVEL1 of VITAL_ACT : architecture is TRUE;

    SIGNAL D_ipd    : STD_ULOGIC := 'X';
    SIGNAL CLK_ipd  : STD_ULOGIC := 'X';

begin
    ---------------------
    --  INPUT PATH DELAYs
    ---------------------
    WireDelay : block
    begin
      VitalWireDelay (D_ipd, D, tipd_D);
      VitalWireDelay (CLK_ipd,CLK, tipd_CLK);
    end block;

    --------------------
    --  BEHAVIOR SECTION
    --------------------
    VITALBehavior : process (D_ipd, CLK_ipd)

    -- timing check results
    VARIABLE Tviol_D_CLK_posedge    : STD_ULOGIC := '0';
    VARIABLE Tmkr_D_CLK_posedge     : VitalTimingDataType := VitalTimingDataInit;
    VARIABLE Pviol_CLK              : STD_ULOGIC := '0';
    VARIABLE PInfo_CLK              : VitalPeriodDataType := VitalPeriodDataInit;

    -- functionality results
    VARIABLE Violation              : STD_ULOGIC := '0';
    VARIABLE PrevData_Q             : STD_LOGIC_VECTOR(0 to 6);
    VARIABLE CLK_delayed            : STD_ULOGIC := 'X';
    VARIABLE D_delayed              : STD_ULOGIC := 'X';
    VARIABLE Results                : STD_LOGIC_VECTOR(1 to 1)  := (others => 'X');
    ALIAS Q_zd                      : STD_LOGIC is Results(1);

    -- output glitch detection variables
    VARIABLE Q_GlitchData           : VitalGlitchDataType;

    begin

        ------------------------
        --  Timing Check Section
        ------------------------
        if(TimingChecksOn) then
            VitalSetupHoldCheck (
                Violation       => Tviol_D_CLK_posedge,
                TimingData      => Tmkr_D_CLK_posedge,
                TestSignal      => D_ipd,
                TestSignalName  => "D",
                TestDelay       => 0 ns,
                RefSignal       => CLK_ipd,
                RefSignalName   => "CLK",
                RefDelay        => 0 ns,
                SetupHigh       => tsetup_D_CLK_posedge_posedge,
                SetupLow        => tsetup_D_CLK_negedge_posedge,
                HoldHigh        => thold_D_CLK_posedge_posedge,
                HoldLow         => thold_D_CLK_negedge_posedge,
                CheckEnabled    =>  TRUE,
                RefTransition   => 'R',
                HeaderMsg       => InstancePath & "/BFMDFN1",
                Xon             => Xon,
                MsgOn           => MsgOn,
                MsgSeverity     => WARNING);

            VitalPeriodPulseCheck (
                Violation       => Pviol_CLK,
                PeriodData      => PInfo_CLK,
                TestSignal      => CLK_ipd,
                TestSignalName  => "CLK",
                TestDelay       => 0 ns,
                Period          => 0 ns,
                PulseWidthHigh  => tpw_CLK_posedge,
                CheckEnabled    => TRUE,
                HeaderMsg       => InstancePath & "BFMDFN1",
                Xon             => Xon,
                MsgOn           => MsgOn,
                MsgSeverity     => WARNING);
        end if;

        -------------------------
        --  Functionality Section
        -------------------------

        Violation := Tviol_D_CLK_posedge or Pviol_CLK;

        VitalStateTable(
            Result          => Q_zd,
            PreviousDataIn  => PrevData_Q,
            StateTable      => DFEG_Q_tab,
            DataIn          => ('1', CLK_delayed, Q_zd, D_delayed, '0', '1', CLK_ipd));

            Q_zd            := Violation XOR Q_zd;
            D_delayed       := D_ipd;
            CLK_delayed     := CLK_ipd;

        ----------------------
        --  Path Delay Section
        ----------------------
        VitalPathDelay01 (
            OutSignal       => Q,
            GlitchData      => Q_GlitchData,
            OutSignalName   => "Q",
            OutTemp         => Q_zd,
            Paths           => (0 => (CLK_ipd'last_event, tpd_CLK_Q, true)),
            Mode            => OnDetect,
            Xon             => Xon,
            MsgOn           => MsgOn,
            MsgSeverity     => WARNING);
    end process;

end VITAL_ACT;

configuration CFG_BFMDFN1_VITAL of BFMDFN1 is
   for VITAL_ACT
   end for;
end CFG_BFMDFN1_VITAL;
