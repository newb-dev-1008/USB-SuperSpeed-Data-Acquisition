library ieee;
use ieee.std_logic_1164.all;

package BLACKBOX_PACKAGE is
component CortexM1Integration is

port(
HCLK : IN std_logic;
SYSRESETn : IN std_logic;
IRQ : IN std_logic_vector(31 downto 0);
NMI : IN std_logic;
DBGRESETn : IN std_logic;
EDBGRQ : IN std_logic;
nTRST : IN std_logic;
SWCLKTCK : IN std_logic;
SWDITMS : IN std_logic;
TDI : IN std_logic;
JTAGNSW : OUT std_logic;
JTAGTOP : OUT std_logic;
TDO : OUT std_logic;
nTDOEN : OUT std_logic;
SWDO : OUT std_logic;
SWDOEN : OUT std_logic;
LOCKUP : OUT std_logic;
HALTED : OUT std_logic;
SYSRESETREQ : OUT std_logic;
HREADY : IN std_logic;
HRESP : IN std_logic;
HRDATA : IN std_logic_vector(31 downto 0);
HTRANS : OUT std_logic_vector(1 downto 0);
HBURST : OUT std_logic_vector(2 downto 0);
HPROT : OUT std_logic_vector(3 downto 0);
HSIZE : OUT std_logic_vector(2 downto 0);
HWRITE : OUT std_logic;
HMASTLOCK : OUT std_logic;
HADDR : OUT std_logic_vector(31 downto 0);
HWDATA : OUT std_logic_vector(31 downto 0);
tcmInitWriteEnable : IN std_logic;
tcmInitAddr : IN std_logic_vector(19 downto 2);
tcmInitWriteData : IN std_logic_vector(31 downto 0)
);
end component;

attribute syn_black_box : boolean;

attribute syn_tco0: string;
attribute syn_tco1: string;
attribute syn_tco2: string;
attribute syn_tco3: string;
attribute syn_tco4: string;
attribute syn_tco5: string;
attribute syn_tco6: string;
attribute syn_tco7: string;
attribute syn_tco8: string;
attribute syn_tco9: string;
attribute syn_tco10: string;
attribute syn_tco11: string;
attribute syn_tco12: string;
attribute syn_tco13: string;
attribute syn_tco14: string;
attribute syn_tco15: string;
attribute syn_tco16: string;
attribute syn_tsu0: string;
attribute syn_tsu1: string;
attribute syn_tsu2: string;
attribute syn_tsu3: string;
attribute syn_tsu4: string;
attribute syn_tsu5: string;
attribute syn_tsu6: string;
attribute syn_tsu7: string;
attribute syn_tsu8: string;
attribute syn_tsu9: string;
attribute syn_tsu10: string;
attribute syn_tsu11: string;
attribute syn_tsu12: string;
attribute syn_tsu13: string;
attribute syn_tsu14: string;

attribute syn_black_box of CortexM1Integration: component is true;

attribute syn_tco0 of CortexM1Integration: component is"SWCLKTCK->JTAGNSW=1.577";
attribute syn_tco1 of CortexM1Integration: component is"SWCLKTCK->JTAGTOP=4.883969";
attribute syn_tco2 of CortexM1Integration: component is"SWCLKTCK->TDO=1.641657";
attribute syn_tco3 of CortexM1Integration: component is"SWCLKTCK->nTDOEN=1.659004";
attribute syn_tco4 of CortexM1Integration: component is"SWCLKTCK->SWDO=1.577";
attribute syn_tco5 of CortexM1Integration: component is"SWCLKTCK->SWDOEN=1.577";
attribute syn_tco6 of CortexM1Integration: component is"HCLK->LOCKUP=3.6465702";
attribute syn_tco7 of CortexM1Integration: component is"HCLK->HALTED=3.4901965";
attribute syn_tco8 of CortexM1Integration: component is"HCLK->SYSRESETREQ=2.369787";
attribute syn_tco9 of CortexM1Integration: component is"HCLK->HTRANS[1:0]=7.1351546";
attribute syn_tco10 of CortexM1Integration: component is"HCLK->HBURST[2:0]=4.4042572";
attribute syn_tco11 of CortexM1Integration: component is"HCLK->HPROT[3:0]=4.8508089";
attribute syn_tco12 of CortexM1Integration: component is"HCLK->HSIZE[2:0]=5.2651186";
attribute syn_tco13 of CortexM1Integration: component is"HCLK->HWRITE=5.4843642";
attribute syn_tco14 of CortexM1Integration: component is"HCLK->HMASTLOCK=1.6121";
attribute syn_tco15 of CortexM1Integration: component is"HCLK->HADDR[31:0]=5.7793785";
attribute syn_tco16 of CortexM1Integration: component is"HCLK->HWDATA[31:0]=4.8363";
attribute syn_tsu0 of CortexM1Integration: component is"SYSRESETn->HCLK=0.2514876";
attribute syn_tsu1 of CortexM1Integration: component is"IRQ[31:0]->HCLK=3.7739261";
attribute syn_tsu2 of CortexM1Integration: component is"NMI->HCLK=2.0941179";
attribute syn_tsu3 of CortexM1Integration: component is"DBGRESETn->HCLK=0.2788933";
attribute syn_tsu4 of CortexM1Integration: component is"DBGRESETn->SWCLKTCK=0.309092";
attribute syn_tsu5 of CortexM1Integration: component is"EDBGRQ->HCLK=-0.7238329";
attribute syn_tsu6 of CortexM1Integration: component is"nTRST->SWCLKTCK=2.851216";
attribute syn_tsu7 of CortexM1Integration: component is"SWDITMS->SWCLKTCK=5.533693";
attribute syn_tsu8 of CortexM1Integration: component is"TDI->SWCLKTCK=3.062534";
attribute syn_tsu9 of CortexM1Integration: component is"HREADY->HCLK=6.4887025";
attribute syn_tsu10 of CortexM1Integration: component is"HRESP->HCLK=5.9502611";
attribute syn_tsu11 of CortexM1Integration: component is"HRDATA[31:0]->HCLK=5.0281399";
attribute syn_tsu12 of CortexM1Integration: component is"tcmInitWriteEnable->HCLK=0";
attribute syn_tsu13 of CortexM1Integration: component is"tcmInitAddr[19:2]->HCLK=0";
attribute syn_tsu14 of CortexM1Integration: component is"tcmInitWriteData[31:0]->HCLK=0";
end BLACKBOX_PACKAGE;

library ieee;
use ieee.std_logic_1164.all;
use work.BLACKBOX_PACKAGE.all;

entity CortexM1Integration is
port (
HCLK : IN std_logic;
SYSRESETn : IN std_logic;
IRQ : IN std_logic_vector(31 downto 0);
NMI : IN std_logic;
DBGRESETn : IN std_logic;
EDBGRQ : IN std_logic;
nTRST : IN std_logic;
SWCLKTCK : IN std_logic;
SWDITMS : IN std_logic;
TDI : IN std_logic;
JTAGNSW : OUT std_logic;
JTAGTOP : OUT std_logic;
TDO : OUT std_logic;
nTDOEN : OUT std_logic;
SWDO : OUT std_logic;
SWDOEN : OUT std_logic;
LOCKUP : OUT std_logic;
HALTED : OUT std_logic;
SYSRESETREQ : OUT std_logic;
HREADY : IN std_logic;
HRESP : IN std_logic;
HRDATA : IN std_logic_vector(31 downto 0);
HTRANS : OUT std_logic_vector(1 downto 0);
HBURST : OUT std_logic_vector(2 downto 0);
HPROT : OUT std_logic_vector(3 downto 0);
HSIZE : OUT std_logic_vector(2 downto 0);
HWRITE : OUT std_logic;
HMASTLOCK : OUT std_logic;
HADDR : OUT std_logic_vector(31 downto 0);
HWDATA : OUT std_logic_vector(31 downto 0);
tcmInitWriteEnable : IN std_logic;
tcmInitAddr : IN std_logic_vector(19 downto 2);
tcmInitWriteData : IN std_logic_vector(31 downto 0)
);
end CortexM1Integration;

architecture precision_timing_shell of CortexM1Integration is
begin
end precision_timing_shell;
