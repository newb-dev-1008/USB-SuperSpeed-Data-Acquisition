----------------------------------------------------------------------
-- Created by SmartDesign Tue May 10 17:52:00 2022
-- Version: v11.9 11.9.0.4
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library proasic3e;
use proasic3e.all;
library COREAHBLITE_LIB;
use COREAHBLITE_LIB.all;
use COREAHBLITE_LIB.components.all;
library COREAHBTOAPB3_LIB;
use COREAHBTOAPB3_LIB.all;
use COREAHBTOAPB3_LIB.components.all;
library COREAPB3_LIB;
use COREAPB3_LIB.all;
use COREAPB3_LIB.components.all;
library COREGPIO_LIB;
use COREGPIO_LIB.all;
use COREGPIO_LIB.components.all;
library CORETIMER_LIB;
use CORETIMER_LIB.all;
----------------------------------------------------------------------
-- M1Proc entity declaration
----------------------------------------------------------------------
entity M1Proc is
    -- Port list
    port(
        -- Inputs
        GPIO_N     : in  std_logic_vector(1 downto 0);
        NSYSRESET  : in  std_logic;
        SYSCLK     : in  std_logic;
        TCK        : in  std_logic;
        TDI        : in  std_logic;
        TMS        : in  std_logic;
        busainn    : in  std_logic;
        busainp    : in  std_logic;
        busbinn    : in  std_logic;
        busbinp    : in  std_logic;
        nTRST      : in  std_logic;
        -- Outputs
        GPIO_CE    : out std_logic_vector(1 downto 0);
        GPIO_OUT   : out std_logic_vector(1 downto 0);
        INT        : out std_logic_vector(1 downto 0);
        TDO        : out std_logic;
        busainen   : out std_logic;
        busaoutinh : out std_logic;
        busaoutn   : out std_logic;
        busaoutp   : out std_logic;
        busbinen   : out std_logic;
        busboutinh : out std_logic;
        busboutn   : out std_logic;
        busboutp   : out std_logic
        );
end M1Proc;
----------------------------------------------------------------------
-- M1Proc architecture body
----------------------------------------------------------------------
architecture RTL of M1Proc is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- b1553BRM_AHBSlv
-- using entity instantiation for component b1553BRM_AHBSlv
-- CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:5.2.100
-- using entity instantiation for component CoreAHBLite
-- CoreAhbSram   -   Actel:DirectCore:CoreAhbSram:1.3.103
component CoreAhbSram
    generic( 
        RAM_BLOCK_INSTANCES : integer := 56 
        );
    -- Port list
    port(
        -- Inputs
        HADDR    : in  std_logic_vector(14 downto 0);
        HCLK     : in  std_logic;
        HREADYIN : in  std_logic;
        HRESETn  : in  std_logic;
        HSEL     : in  std_logic;
        HSIZE    : in  std_logic_vector(2 downto 0);
        HTRANS   : in  std_logic_vector(1 downto 0);
        HWDATA   : in  std_logic_vector(31 downto 0);
        HWRITE   : in  std_logic;
        -- Outputs
        HRDATA   : out std_logic_vector(31 downto 0);
        HREADY   : out std_logic;
        HRESP    : out std_logic_vector(1 downto 0)
        );
end component;
-- COREAHBTOAPB3   -   Actel:DirectCore:COREAHBTOAPB3:2.0.116
-- using entity instantiation for component COREAHBTOAPB3
-- CoreAPB3   -   Actel:DirectCore:CoreAPB3:3.0.103
-- using entity instantiation for component CoreAPB3
-- CoreGPIO   -   Actel:DirectCore:CoreGPIO:3.0.120
-- using entity instantiation for component CoreGPIO
-- CoreTimer   -   Actel:DirectCore:CoreTimer:2.0.103
component CoreTimer
    generic( 
        FAMILY     : integer := 16 ;
        INTACTIVEH : integer := 1 ;
        WIDTH      : integer := 32 
        );
    -- Port list
    port(
        -- Inputs
        PADDR   : in  std_logic_vector(4 downto 2);
        PCLK    : in  std_logic;
        PENABLE : in  std_logic;
        PRESETn : in  std_logic;
        PSEL    : in  std_logic;
        PWDATA  : in  std_logic_vector(31 downto 0);
        PWRITE  : in  std_logic;
        -- Outputs
        PRDATA  : out std_logic_vector(31 downto 0);
        TIMINT  : out std_logic
        );
end component;
-- CortexM1Top   -   Actel:DirectCore:CortexM1Top:3.0.102
component CortexM1Top
    generic( 
        CONFIG           : integer := 289 ;
        DEBUG_CONFIG     : integer := 1 ;
        DEBUG_IF         : integer := 0 ;
        DEBUG_INCL       : integer := 1 ;
        DEBUG_RESET      : integer := 0 ;
        ITCM_ALIAS       : integer := 1 ;
        UJ_CLK_ON_GLOBAL : integer := 1 ;
        UJ_RST_ON_GLOBAL : integer := 0 
        );
    -- Port list
    port(
        -- Inputs
        EDBGRQ    : in  std_logic;
        HCLK      : in  std_logic;
        HRDATA    : in  std_logic_vector(31 downto 0);
        HREADY    : in  std_logic;
        HRESP     : in  std_logic_vector(1 downto 0);
        IRQ0      : in  std_logic;
        IRQ1      : in  std_logic;
        IRQ10     : in  std_logic;
        IRQ11     : in  std_logic;
        IRQ12     : in  std_logic;
        IRQ13     : in  std_logic;
        IRQ14     : in  std_logic;
        IRQ15     : in  std_logic;
        IRQ16     : in  std_logic;
        IRQ17     : in  std_logic;
        IRQ18     : in  std_logic;
        IRQ19     : in  std_logic;
        IRQ2      : in  std_logic;
        IRQ20     : in  std_logic;
        IRQ21     : in  std_logic;
        IRQ22     : in  std_logic;
        IRQ23     : in  std_logic;
        IRQ24     : in  std_logic;
        IRQ25     : in  std_logic;
        IRQ26     : in  std_logic;
        IRQ27     : in  std_logic;
        IRQ28     : in  std_logic;
        IRQ29     : in  std_logic;
        IRQ3      : in  std_logic;
        IRQ30     : in  std_logic;
        IRQ31     : in  std_logic;
        IRQ4      : in  std_logic;
        IRQ5      : in  std_logic;
        IRQ6      : in  std_logic;
        IRQ7      : in  std_logic;
        IRQ8      : in  std_logic;
        IRQ9      : in  std_logic;
        NMI       : in  std_logic;
        NSYSRESET : in  std_logic;
        PORESETN  : in  std_logic;
        TCK       : in  std_logic;
        TDI       : in  std_logic;
        TMS       : in  std_logic;
        WDOGRES   : in  std_logic;
        nTRST     : in  std_logic;
        -- Outputs
        HADDR     : out std_logic_vector(31 downto 0);
        HALTED    : out std_logic;
        HBURST    : out std_logic_vector(2 downto 0);
        HMASTLOCK : out std_logic;
        HPROT     : out std_logic_vector(3 downto 0);
        HRESETn   : out std_logic;
        HSIZE     : out std_logic_vector(2 downto 0);
        HTRANS    : out std_logic_vector(1 downto 0);
        HWDATA    : out std_logic_vector(31 downto 0);
        HWRITE    : out std_logic;
        JTAGNSW   : out std_logic;
        JTAGTOP   : out std_logic;
        LOCKUP    : out std_logic;
        SWDO      : out std_logic;
        SWDOEN    : out std_logic;
        TDO       : out std_logic;
        WDOGRESn  : out std_logic;
        nTDOEN    : out std_logic
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal busainen_net_0                      : std_logic;
signal busaoutinh_net_0                    : std_logic;
signal busaoutn_net_0                      : std_logic;
signal busaoutp_net_0                      : std_logic;
signal busbinen_net_0                      : std_logic;
signal busboutinh_net_0                    : std_logic;
signal busboutn_net_0                      : std_logic;
signal busboutp_net_0                      : std_logic;
signal CoreAHBLite_0_AHBmslave0_HBURST     : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave0_HMASTLOCK  : std_logic;
signal CoreAHBLite_0_AHBmslave0_HPROT      : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave0_HRDATA     : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HREADY     : std_logic;
signal CoreAHBLite_0_AHBmslave0_HREADYOUT  : std_logic;
signal CoreAHBLite_0_AHBmslave0_HRESP      : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave0_HSELx      : std_logic;
signal CoreAHBLite_0_AHBmslave0_HSIZE      : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave0_HTRANS     : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave0_HWDATA     : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave0_HWRITE     : std_logic;
signal CoreAHBLite_0_AHBmslave10_HBURST    : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave10_HMASTLOCK : std_logic;
signal CoreAHBLite_0_AHBmslave10_HPROT     : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave10_HRDATA    : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave10_HREADY    : std_logic;
signal CoreAHBLite_0_AHBmslave10_HREADYOUT : std_logic;
signal CoreAHBLite_0_AHBmslave10_HRESP     : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave10_HSELx     : std_logic;
signal CoreAHBLite_0_AHBmslave10_HSIZE     : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave10_HTRANS    : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave10_HWDATA    : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave10_HWRITE    : std_logic;
signal CoreAHBLite_0_AHBmslave12_HADDR     : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave12_HBURST    : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave12_HMASTLOCK : std_logic;
signal CoreAHBLite_0_AHBmslave12_HPROT     : std_logic_vector(3 downto 0);
signal CoreAHBLite_0_AHBmslave12_HRDATA    : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave12_HREADY    : std_logic;
signal CoreAHBLite_0_AHBmslave12_HREADYOUT : std_logic;
signal CoreAHBLite_0_AHBmslave12_HRESP     : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave12_HSELx     : std_logic;
signal CoreAHBLite_0_AHBmslave12_HSIZE     : std_logic_vector(2 downto 0);
signal CoreAHBLite_0_AHBmslave12_HTRANS    : std_logic_vector(1 downto 0);
signal CoreAHBLite_0_AHBmslave12_HWDATA    : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave12_HWRITE    : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PADDR     : std_logic_vector(23 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PENABLE   : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PRDATA    : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PREADY    : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PSELx     : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PSLVERR   : std_logic;
signal COREAHBTOAPB3_0_APBmaster_PWDATA    : std_logic_vector(31 downto 0);
signal COREAHBTOAPB3_0_APBmaster_PWRITE    : std_logic;
signal CoreAPB3_0_APBmslave0_PENABLE       : std_logic;
signal CoreAPB3_0_APBmslave0_PRDATA        : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PREADY        : std_logic;
signal CoreAPB3_0_APBmslave0_PSELx         : std_logic;
signal CoreAPB3_0_APBmslave0_PSLVERR       : std_logic;
signal CoreAPB3_0_APBmslave0_PWDATA        : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave0_PWRITE        : std_logic;
signal CoreAPB3_0_APBmslave3_PRDATA        : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave3_PSELx         : std_logic;
signal CoreAPB3_0_APBmslave12_PRDATA       : std_logic_vector(31 downto 0);
signal CoreAPB3_0_APBmslave12_PSELx        : std_logic;
signal CoreTimer_0_TIMINT                  : std_logic;
signal CortexM1Top_0_AHBmaster_HADDR       : std_logic_vector(31 downto 0);
signal CortexM1Top_0_AHBmaster_HBURST      : std_logic_vector(2 downto 0);
signal CortexM1Top_0_AHBmaster_HLOCK       : std_logic;
signal CortexM1Top_0_AHBmaster_HPROT       : std_logic_vector(3 downto 0);
signal CortexM1Top_0_AHBmaster_HRDATA      : std_logic_vector(31 downto 0);
signal CortexM1Top_0_AHBmaster_HREADY      : std_logic;
signal CortexM1Top_0_AHBmaster_HRESP       : std_logic_vector(1 downto 0);
signal CortexM1Top_0_AHBmaster_HSIZE       : std_logic_vector(2 downto 0);
signal CortexM1Top_0_AHBmaster_HTRANS      : std_logic_vector(1 downto 0);
signal CortexM1Top_0_AHBmaster_HWDATA      : std_logic_vector(31 downto 0);
signal CortexM1Top_0_AHBmaster_HWRITE      : std_logic;
signal CortexM1Top_0_HRESETn               : std_logic;
signal GPIO_CE_net_0                       : std_logic_vector(1 downto 0);
signal GPIO_OUT_net_0                      : std_logic_vector(1 downto 0);
signal INT_net_0                           : std_logic_vector(1 downto 0);
signal TDO_net_0                           : std_logic;
signal TDO_net_1                           : std_logic;
signal busainen_net_1                      : std_logic;
signal busbinen_net_1                      : std_logic;
signal busaoutinh_net_1                    : std_logic;
signal busaoutp_net_1                      : std_logic;
signal busaoutn_net_1                      : std_logic;
signal busboutinh_net_1                    : std_logic;
signal busboutp_net_1                      : std_logic;
signal busboutn_net_1                      : std_logic;
signal INT_net_1                           : std_logic_vector(1 downto 0);
signal GPIO_CE_net_1                       : std_logic_vector(1 downto 0);
signal GPIO_OUT_net_1                      : std_logic_vector(1 downto 0);
----------------------------------------------------------------------
-- TiedOff Signals
----------------------------------------------------------------------
signal GND_net                             : std_logic;
signal VCC_net                             : std_logic;
signal HADDR_M1_const_net_0                : std_logic_vector(31 downto 0);
signal HTRANS_M1_const_net_0               : std_logic_vector(1 downto 0);
signal HSIZE_M1_const_net_0                : std_logic_vector(2 downto 0);
signal HBURST_M1_const_net_0               : std_logic_vector(2 downto 0);
signal HPROT_M1_const_net_0                : std_logic_vector(3 downto 0);
signal HWDATA_M1_const_net_0               : std_logic_vector(31 downto 0);
signal HADDR_M2_const_net_0                : std_logic_vector(31 downto 0);
signal HTRANS_M2_const_net_0               : std_logic_vector(1 downto 0);
signal HSIZE_M2_const_net_0                : std_logic_vector(2 downto 0);
signal HBURST_M2_const_net_0               : std_logic_vector(2 downto 0);
signal HPROT_M2_const_net_0                : std_logic_vector(3 downto 0);
signal HWDATA_M2_const_net_0               : std_logic_vector(31 downto 0);
signal HADDR_M3_const_net_0                : std_logic_vector(31 downto 0);
signal HTRANS_M3_const_net_0               : std_logic_vector(1 downto 0);
signal HSIZE_M3_const_net_0                : std_logic_vector(2 downto 0);
signal HBURST_M3_const_net_0               : std_logic_vector(2 downto 0);
signal HPROT_M3_const_net_0                : std_logic_vector(3 downto 0);
signal HWDATA_M3_const_net_0               : std_logic_vector(31 downto 0);
signal HRDATA_S1_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S1_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S2_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S2_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S3_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S3_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S4_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S4_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S5_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S5_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S6_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S6_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S7_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S7_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S8_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S8_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S9_const_net_0               : std_logic_vector(31 downto 0);
signal HRESP_S9_const_net_0                : std_logic_vector(1 downto 0);
signal HRDATA_S11_const_net_0              : std_logic_vector(31 downto 0);
signal HRESP_S11_const_net_0               : std_logic_vector(1 downto 0);
signal HRDATA_S13_const_net_0              : std_logic_vector(31 downto 0);
signal HRESP_S13_const_net_0               : std_logic_vector(1 downto 0);
signal HRDATA_S14_const_net_0              : std_logic_vector(31 downto 0);
signal HRESP_S14_const_net_0               : std_logic_vector(1 downto 0);
signal HRDATA_S15_const_net_0              : std_logic_vector(31 downto 0);
signal HRESP_S15_const_net_0               : std_logic_vector(1 downto 0);
signal HRDATA_S16_const_net_0              : std_logic_vector(31 downto 0);
signal HRESP_S16_const_net_0               : std_logic_vector(1 downto 0);
signal PRDATAS1_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS2_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS4_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS5_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS6_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS7_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS8_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS9_const_net_0                : std_logic_vector(31 downto 0);
signal PRDATAS10_const_net_0               : std_logic_vector(31 downto 0);
signal PRDATAS11_const_net_0               : std_logic_vector(31 downto 0);
signal PRDATAS13_const_net_0               : std_logic_vector(31 downto 0);
signal PRDATAS14_const_net_0               : std_logic_vector(31 downto 0);
signal PRDATAS15_const_net_0               : std_logic_vector(31 downto 0);
----------------------------------------------------------------------
-- Bus Interface Nets Declarations - Unequal Pin Widths
----------------------------------------------------------------------
signal CoreAHBLite_0_AHBmslave0_HADDR_0_14to0: std_logic_vector(14 downto 0);
signal CoreAHBLite_0_AHBmslave0_HADDR_0    : std_logic_vector(14 downto 0);
signal CoreAHBLite_0_AHBmslave0_HADDR      : std_logic_vector(31 downto 0);

signal CoreAHBLite_0_AHBmslave10_HADDR     : std_logic_vector(31 downto 0);
signal CoreAHBLite_0_AHBmslave10_HADDR_0_23to0: std_logic_vector(23 downto 0);
signal CoreAHBLite_0_AHBmslave10_HADDR_0   : std_logic_vector(23 downto 0);

signal CoreAPB3_0_APBmslave0_PADDR_0_7to0  : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR_0       : std_logic_vector(7 downto 0);
signal CoreAPB3_0_APBmslave0_PADDR         : std_logic_vector(23 downto 0);

signal CoreAPB3_0_APBmslave3_PADDR_0_4to2  : std_logic_vector(4 downto 2);
signal CoreAPB3_0_APBmslave3_PADDR_0       : std_logic_vector(4 downto 2);
signal CoreAPB3_0_APBmslave3_PADDR         : std_logic_vector(23 downto 0);
signal CoreAPB3_0_APBmslave3_PADDR_1_5to2  : std_logic_vector(5 downto 2);
signal CoreAPB3_0_APBmslave3_PADDR_1       : std_logic_vector(5 downto 2);


begin
----------------------------------------------------------------------
-- Constant assignments
----------------------------------------------------------------------
 GND_net                <= '0';
 VCC_net                <= '1';
 HADDR_M1_const_net_0   <= B"00000000000000000000000000000000";
 HTRANS_M1_const_net_0  <= B"00";
 HSIZE_M1_const_net_0   <= B"000";
 HBURST_M1_const_net_0  <= B"000";
 HPROT_M1_const_net_0   <= B"0000";
 HWDATA_M1_const_net_0  <= B"00000000000000000000000000000000";
 HADDR_M2_const_net_0   <= B"00000000000000000000000000000000";
 HTRANS_M2_const_net_0  <= B"00";
 HSIZE_M2_const_net_0   <= B"000";
 HBURST_M2_const_net_0  <= B"000";
 HPROT_M2_const_net_0   <= B"0000";
 HWDATA_M2_const_net_0  <= B"00000000000000000000000000000000";
 HADDR_M3_const_net_0   <= B"00000000000000000000000000000000";
 HTRANS_M3_const_net_0  <= B"00";
 HSIZE_M3_const_net_0   <= B"000";
 HBURST_M3_const_net_0  <= B"000";
 HPROT_M3_const_net_0   <= B"0000";
 HWDATA_M3_const_net_0  <= B"00000000000000000000000000000000";
 HRDATA_S1_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S1_const_net_0   <= B"00";
 HRDATA_S2_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S2_const_net_0   <= B"00";
 HRDATA_S3_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S3_const_net_0   <= B"00";
 HRDATA_S4_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S4_const_net_0   <= B"00";
 HRDATA_S5_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S5_const_net_0   <= B"00";
 HRDATA_S6_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S6_const_net_0   <= B"00";
 HRDATA_S7_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S7_const_net_0   <= B"00";
 HRDATA_S8_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S8_const_net_0   <= B"00";
 HRDATA_S9_const_net_0  <= B"00000000000000000000000000000000";
 HRESP_S9_const_net_0   <= B"00";
 HRDATA_S11_const_net_0 <= B"00000000000000000000000000000000";
 HRESP_S11_const_net_0  <= B"00";
 HRDATA_S13_const_net_0 <= B"00000000000000000000000000000000";
 HRESP_S13_const_net_0  <= B"00";
 HRDATA_S14_const_net_0 <= B"00000000000000000000000000000000";
 HRESP_S14_const_net_0  <= B"00";
 HRDATA_S15_const_net_0 <= B"00000000000000000000000000000000";
 HRESP_S15_const_net_0  <= B"00";
 HRDATA_S16_const_net_0 <= B"00000000000000000000000000000000";
 HRESP_S16_const_net_0  <= B"00";
 PRDATAS1_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS2_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS4_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS5_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS6_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS7_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS8_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS9_const_net_0   <= B"00000000000000000000000000000000";
 PRDATAS10_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS11_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS13_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS14_const_net_0  <= B"00000000000000000000000000000000";
 PRDATAS15_const_net_0  <= B"00000000000000000000000000000000";
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 TDO_net_1            <= TDO_net_0;
 TDO                  <= TDO_net_1;
 busainen_net_1       <= busainen_net_0;
 busainen             <= busainen_net_1;
 busbinen_net_1       <= busbinen_net_0;
 busbinen             <= busbinen_net_1;
 busaoutinh_net_1     <= busaoutinh_net_0;
 busaoutinh           <= busaoutinh_net_1;
 busaoutp_net_1       <= busaoutp_net_0;
 busaoutp             <= busaoutp_net_1;
 busaoutn_net_1       <= busaoutn_net_0;
 busaoutn             <= busaoutn_net_1;
 busboutinh_net_1     <= busboutinh_net_0;
 busboutinh           <= busboutinh_net_1;
 busboutp_net_1       <= busboutp_net_0;
 busboutp             <= busboutp_net_1;
 busboutn_net_1       <= busboutn_net_0;
 busboutn             <= busboutn_net_1;
 INT_net_1            <= INT_net_0;
 INT(1 downto 0)      <= INT_net_1;
 GPIO_CE_net_1        <= GPIO_CE_net_0;
 GPIO_CE(1 downto 0)  <= GPIO_CE_net_1;
 GPIO_OUT_net_1       <= GPIO_OUT_net_0;
 GPIO_OUT(1 downto 0) <= GPIO_OUT_net_1;
----------------------------------------------------------------------
-- Bus Interface Nets Assignments - Unequal Pin Widths
----------------------------------------------------------------------
 CoreAHBLite_0_AHBmslave0_HADDR_0_14to0(14 downto 0) <= CoreAHBLite_0_AHBmslave0_HADDR(14 downto 0);
 CoreAHBLite_0_AHBmslave0_HADDR_0 <= ( CoreAHBLite_0_AHBmslave0_HADDR_0_14to0(14 downto 0) );

 CoreAHBLite_0_AHBmslave10_HADDR_0_23to0(23 downto 0) <= CoreAHBLite_0_AHBmslave10_HADDR(23 downto 0);
 CoreAHBLite_0_AHBmslave10_HADDR_0 <= ( CoreAHBLite_0_AHBmslave10_HADDR_0_23to0(23 downto 0) );

 CoreAPB3_0_APBmslave0_PADDR_0_7to0(7 downto 0) <= CoreAPB3_0_APBmslave0_PADDR(7 downto 0);
 CoreAPB3_0_APBmslave0_PADDR_0 <= ( CoreAPB3_0_APBmslave0_PADDR_0_7to0(7 downto 0) );

 CoreAPB3_0_APBmslave3_PADDR_0_4to2(4 downto 2) <= CoreAPB3_0_APBmslave3_PADDR(4 downto 2);
 CoreAPB3_0_APBmslave3_PADDR_0 <= ( CoreAPB3_0_APBmslave3_PADDR_0_4to2(4 downto 2) );
 CoreAPB3_0_APBmslave3_PADDR_1_5to2(5 downto 2) <= CoreAPB3_0_APBmslave3_PADDR(5 downto 2);
 CoreAPB3_0_APBmslave3_PADDR_1 <= ( CoreAPB3_0_APBmslave3_PADDR_1_5to2(5 downto 2) );

----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- b1553BRM_AHBSlv_0
b1553BRM_AHBSlv_0 : entity work.b1553BRM_AHBSlv
    port map( 
        -- Inputs
        HRESETn    => CortexM1Top_0_HRESETn,
        HCLK       => SYSCLK,
        busainp    => busainp,
        busainn    => busainn,
        busbinp    => busbinp,
        busbinn    => busbinn,
        HWRITE     => CoreAHBLite_0_AHBmslave12_HWRITE,
        HREADYIN   => CoreAHBLite_0_AHBmslave12_HREADY,
        HSEL       => CoreAHBLite_0_AHBmslave12_HSELx,
        PENABLE    => CoreAPB3_0_APBmslave0_PENABLE,
        PSEL       => CoreAPB3_0_APBmslave12_PSELx,
        PWRITE     => CoreAPB3_0_APBmslave0_PWRITE,
        HSIZE      => CoreAHBLite_0_AHBmslave12_HSIZE,
        HTRANS     => CoreAHBLite_0_AHBmslave12_HTRANS,
        HWDATA     => CoreAHBLite_0_AHBmslave12_HWDATA,
        HADDR      => CoreAHBLite_0_AHBmslave12_HADDR,
        PADDR      => CoreAPB3_0_APBmslave3_PADDR_1,
        PWDATA     => CoreAPB3_0_APBmslave0_PWDATA,
        -- Outputs
        busainen   => busainen_net_0,
        busbinen   => busbinen_net_0,
        busaoutinh => busaoutinh_net_0,
        busaoutp   => busaoutp_net_0,
        busaoutn   => busaoutn_net_0,
        busboutinh => busboutinh_net_0,
        busboutp   => busboutp_net_0,
        busboutn   => busboutn_net_0,
        HREADY     => CoreAHBLite_0_AHBmslave12_HREADYOUT,
        HRDATA     => CoreAHBLite_0_AHBmslave12_HRDATA,
        HRESP      => CoreAHBLite_0_AHBmslave12_HRESP,
        PRDATA     => CoreAPB3_0_APBmslave12_PRDATA 
        );
-- CoreAHBLite_0   -   Actel:DirectCore:CoreAHBLite:5.2.100
CoreAHBLite_0 : entity COREAHBLITE_LIB.CoreAHBLite
    generic map( 
        FAMILY             => ( 16 ),
        HADDR_SHG_CFG      => ( 1 ),
        M0_AHBSLOT0ENABLE  => ( 1 ),
        M0_AHBSLOT1ENABLE  => ( 0 ),
        M0_AHBSLOT2ENABLE  => ( 0 ),
        M0_AHBSLOT3ENABLE  => ( 0 ),
        M0_AHBSLOT4ENABLE  => ( 0 ),
        M0_AHBSLOT5ENABLE  => ( 0 ),
        M0_AHBSLOT6ENABLE  => ( 0 ),
        M0_AHBSLOT7ENABLE  => ( 0 ),
        M0_AHBSLOT8ENABLE  => ( 0 ),
        M0_AHBSLOT9ENABLE  => ( 0 ),
        M0_AHBSLOT10ENABLE => ( 1 ),
        M0_AHBSLOT11ENABLE => ( 0 ),
        M0_AHBSLOT12ENABLE => ( 1 ),
        M0_AHBSLOT13ENABLE => ( 0 ),
        M0_AHBSLOT14ENABLE => ( 0 ),
        M0_AHBSLOT15ENABLE => ( 0 ),
        M0_AHBSLOT16ENABLE => ( 0 ),
        M1_AHBSLOT0ENABLE  => ( 0 ),
        M1_AHBSLOT1ENABLE  => ( 0 ),
        M1_AHBSLOT2ENABLE  => ( 0 ),
        M1_AHBSLOT3ENABLE  => ( 0 ),
        M1_AHBSLOT4ENABLE  => ( 0 ),
        M1_AHBSLOT5ENABLE  => ( 0 ),
        M1_AHBSLOT6ENABLE  => ( 0 ),
        M1_AHBSLOT7ENABLE  => ( 0 ),
        M1_AHBSLOT8ENABLE  => ( 0 ),
        M1_AHBSLOT9ENABLE  => ( 0 ),
        M1_AHBSLOT10ENABLE => ( 0 ),
        M1_AHBSLOT11ENABLE => ( 0 ),
        M1_AHBSLOT12ENABLE => ( 0 ),
        M1_AHBSLOT13ENABLE => ( 0 ),
        M1_AHBSLOT14ENABLE => ( 0 ),
        M1_AHBSLOT15ENABLE => ( 0 ),
        M1_AHBSLOT16ENABLE => ( 0 ),
        M2_AHBSLOT0ENABLE  => ( 0 ),
        M2_AHBSLOT1ENABLE  => ( 0 ),
        M2_AHBSLOT2ENABLE  => ( 0 ),
        M2_AHBSLOT3ENABLE  => ( 0 ),
        M2_AHBSLOT4ENABLE  => ( 0 ),
        M2_AHBSLOT5ENABLE  => ( 0 ),
        M2_AHBSLOT6ENABLE  => ( 0 ),
        M2_AHBSLOT7ENABLE  => ( 0 ),
        M2_AHBSLOT8ENABLE  => ( 0 ),
        M2_AHBSLOT9ENABLE  => ( 0 ),
        M2_AHBSLOT10ENABLE => ( 0 ),
        M2_AHBSLOT11ENABLE => ( 0 ),
        M2_AHBSLOT12ENABLE => ( 0 ),
        M2_AHBSLOT13ENABLE => ( 0 ),
        M2_AHBSLOT14ENABLE => ( 0 ),
        M2_AHBSLOT15ENABLE => ( 0 ),
        M2_AHBSLOT16ENABLE => ( 0 ),
        M3_AHBSLOT0ENABLE  => ( 0 ),
        M3_AHBSLOT1ENABLE  => ( 0 ),
        M3_AHBSLOT2ENABLE  => ( 0 ),
        M3_AHBSLOT3ENABLE  => ( 0 ),
        M3_AHBSLOT4ENABLE  => ( 0 ),
        M3_AHBSLOT5ENABLE  => ( 0 ),
        M3_AHBSLOT6ENABLE  => ( 0 ),
        M3_AHBSLOT7ENABLE  => ( 0 ),
        M3_AHBSLOT8ENABLE  => ( 0 ),
        M3_AHBSLOT9ENABLE  => ( 0 ),
        M3_AHBSLOT10ENABLE => ( 0 ),
        M3_AHBSLOT11ENABLE => ( 0 ),
        M3_AHBSLOT12ENABLE => ( 0 ),
        M3_AHBSLOT13ENABLE => ( 0 ),
        M3_AHBSLOT14ENABLE => ( 0 ),
        M3_AHBSLOT15ENABLE => ( 0 ),
        M3_AHBSLOT16ENABLE => ( 0 ),
        MEMSPACE           => ( 1 ),
        SC_0               => ( 0 ),
        SC_1               => ( 0 ),
        SC_2               => ( 0 ),
        SC_3               => ( 0 ),
        SC_4               => ( 0 ),
        SC_5               => ( 0 ),
        SC_6               => ( 0 ),
        SC_7               => ( 0 ),
        SC_8               => ( 0 ),
        SC_9               => ( 0 ),
        SC_10              => ( 0 ),
        SC_11              => ( 0 ),
        SC_12              => ( 0 ),
        SC_13              => ( 0 ),
        SC_14              => ( 0 ),
        SC_15              => ( 0 )
        )
    port map( 
        -- Inputs
        HCLK          => SYSCLK,
        HRESETN       => CortexM1Top_0_HRESETn,
        REMAP_M0      => GND_net, -- tied to '0' from definition
        HMASTLOCK_M0  => CortexM1Top_0_AHBmaster_HLOCK,
        HWRITE_M0     => CortexM1Top_0_AHBmaster_HWRITE,
        HMASTLOCK_M1  => GND_net, -- tied to '0' from definition
        HWRITE_M1     => GND_net, -- tied to '0' from definition
        HMASTLOCK_M2  => GND_net, -- tied to '0' from definition
        HWRITE_M2     => GND_net, -- tied to '0' from definition
        HMASTLOCK_M3  => GND_net, -- tied to '0' from definition
        HWRITE_M3     => GND_net, -- tied to '0' from definition
        HREADYOUT_S0  => CoreAHBLite_0_AHBmslave0_HREADYOUT,
        HREADYOUT_S1  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S2  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S3  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S4  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S5  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S6  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S7  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S8  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S9  => VCC_net, -- tied to '1' from definition
        HREADYOUT_S10 => CoreAHBLite_0_AHBmslave10_HREADYOUT,
        HREADYOUT_S11 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S12 => CoreAHBLite_0_AHBmslave12_HREADYOUT,
        HREADYOUT_S13 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S14 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S15 => VCC_net, -- tied to '1' from definition
        HREADYOUT_S16 => VCC_net, -- tied to '1' from definition
        HADDR_M0      => CortexM1Top_0_AHBmaster_HADDR,
        HSIZE_M0      => CortexM1Top_0_AHBmaster_HSIZE,
        HTRANS_M0     => CortexM1Top_0_AHBmaster_HTRANS,
        HWDATA_M0     => CortexM1Top_0_AHBmaster_HWDATA,
        HBURST_M0     => CortexM1Top_0_AHBmaster_HBURST,
        HPROT_M0      => CortexM1Top_0_AHBmaster_HPROT,
        HADDR_M1      => HADDR_M1_const_net_0, -- tied to X"0" from definition
        HSIZE_M1      => HSIZE_M1_const_net_0, -- tied to X"0" from definition
        HTRANS_M1     => HTRANS_M1_const_net_0, -- tied to X"0" from definition
        HWDATA_M1     => HWDATA_M1_const_net_0, -- tied to X"0" from definition
        HBURST_M1     => HBURST_M1_const_net_0, -- tied to X"0" from definition
        HPROT_M1      => HPROT_M1_const_net_0, -- tied to X"0" from definition
        HADDR_M2      => HADDR_M2_const_net_0, -- tied to X"0" from definition
        HSIZE_M2      => HSIZE_M2_const_net_0, -- tied to X"0" from definition
        HTRANS_M2     => HTRANS_M2_const_net_0, -- tied to X"0" from definition
        HWDATA_M2     => HWDATA_M2_const_net_0, -- tied to X"0" from definition
        HBURST_M2     => HBURST_M2_const_net_0, -- tied to X"0" from definition
        HPROT_M2      => HPROT_M2_const_net_0, -- tied to X"0" from definition
        HADDR_M3      => HADDR_M3_const_net_0, -- tied to X"0" from definition
        HSIZE_M3      => HSIZE_M3_const_net_0, -- tied to X"0" from definition
        HTRANS_M3     => HTRANS_M3_const_net_0, -- tied to X"0" from definition
        HWDATA_M3     => HWDATA_M3_const_net_0, -- tied to X"0" from definition
        HBURST_M3     => HBURST_M3_const_net_0, -- tied to X"0" from definition
        HPROT_M3      => HPROT_M3_const_net_0, -- tied to X"0" from definition
        HRDATA_S0     => CoreAHBLite_0_AHBmslave0_HRDATA,
        HRESP_S0      => CoreAHBLite_0_AHBmslave0_HRESP,
        HRDATA_S1     => HRDATA_S1_const_net_0, -- tied to X"0" from definition
        HRESP_S1      => HRESP_S1_const_net_0, -- tied to X"0" from definition
        HRDATA_S2     => HRDATA_S2_const_net_0, -- tied to X"0" from definition
        HRESP_S2      => HRESP_S2_const_net_0, -- tied to X"0" from definition
        HRDATA_S3     => HRDATA_S3_const_net_0, -- tied to X"0" from definition
        HRESP_S3      => HRESP_S3_const_net_0, -- tied to X"0" from definition
        HRDATA_S4     => HRDATA_S4_const_net_0, -- tied to X"0" from definition
        HRESP_S4      => HRESP_S4_const_net_0, -- tied to X"0" from definition
        HRDATA_S5     => HRDATA_S5_const_net_0, -- tied to X"0" from definition
        HRESP_S5      => HRESP_S5_const_net_0, -- tied to X"0" from definition
        HRDATA_S6     => HRDATA_S6_const_net_0, -- tied to X"0" from definition
        HRESP_S6      => HRESP_S6_const_net_0, -- tied to X"0" from definition
        HRDATA_S7     => HRDATA_S7_const_net_0, -- tied to X"0" from definition
        HRESP_S7      => HRESP_S7_const_net_0, -- tied to X"0" from definition
        HRDATA_S8     => HRDATA_S8_const_net_0, -- tied to X"0" from definition
        HRESP_S8      => HRESP_S8_const_net_0, -- tied to X"0" from definition
        HRDATA_S9     => HRDATA_S9_const_net_0, -- tied to X"0" from definition
        HRESP_S9      => HRESP_S9_const_net_0, -- tied to X"0" from definition
        HRDATA_S10    => CoreAHBLite_0_AHBmslave10_HRDATA,
        HRESP_S10     => CoreAHBLite_0_AHBmslave10_HRESP,
        HRDATA_S11    => HRDATA_S11_const_net_0, -- tied to X"0" from definition
        HRESP_S11     => HRESP_S11_const_net_0, -- tied to X"0" from definition
        HRDATA_S12    => CoreAHBLite_0_AHBmslave12_HRDATA,
        HRESP_S12     => CoreAHBLite_0_AHBmslave12_HRESP,
        HRDATA_S13    => HRDATA_S13_const_net_0, -- tied to X"0" from definition
        HRESP_S13     => HRESP_S13_const_net_0, -- tied to X"0" from definition
        HRDATA_S14    => HRDATA_S14_const_net_0, -- tied to X"0" from definition
        HRESP_S14     => HRESP_S14_const_net_0, -- tied to X"0" from definition
        HRDATA_S15    => HRDATA_S15_const_net_0, -- tied to X"0" from definition
        HRESP_S15     => HRESP_S15_const_net_0, -- tied to X"0" from definition
        HRDATA_S16    => HRDATA_S16_const_net_0, -- tied to X"0" from definition
        HRESP_S16     => HRESP_S16_const_net_0, -- tied to X"0" from definition
        -- Outputs
        HREADY_M0     => CortexM1Top_0_AHBmaster_HREADY,
        HREADY_M1     => OPEN,
        HREADY_M2     => OPEN,
        HREADY_M3     => OPEN,
        HSEL_S0       => CoreAHBLite_0_AHBmslave0_HSELx,
        HWRITE_S0     => CoreAHBLite_0_AHBmslave0_HWRITE,
        HREADY_S0     => CoreAHBLite_0_AHBmslave0_HREADY,
        HMASTLOCK_S0  => CoreAHBLite_0_AHBmslave0_HMASTLOCK,
        HSEL_S1       => OPEN,
        HWRITE_S1     => OPEN,
        HREADY_S1     => OPEN,
        HMASTLOCK_S1  => OPEN,
        HSEL_S2       => OPEN,
        HWRITE_S2     => OPEN,
        HREADY_S2     => OPEN,
        HMASTLOCK_S2  => OPEN,
        HSEL_S3       => OPEN,
        HWRITE_S3     => OPEN,
        HREADY_S3     => OPEN,
        HMASTLOCK_S3  => OPEN,
        HSEL_S4       => OPEN,
        HWRITE_S4     => OPEN,
        HREADY_S4     => OPEN,
        HMASTLOCK_S4  => OPEN,
        HSEL_S5       => OPEN,
        HWRITE_S5     => OPEN,
        HREADY_S5     => OPEN,
        HMASTLOCK_S5  => OPEN,
        HSEL_S6       => OPEN,
        HWRITE_S6     => OPEN,
        HREADY_S6     => OPEN,
        HMASTLOCK_S6  => OPEN,
        HSEL_S7       => OPEN,
        HWRITE_S7     => OPEN,
        HREADY_S7     => OPEN,
        HMASTLOCK_S7  => OPEN,
        HSEL_S8       => OPEN,
        HWRITE_S8     => OPEN,
        HREADY_S8     => OPEN,
        HMASTLOCK_S8  => OPEN,
        HSEL_S9       => OPEN,
        HWRITE_S9     => OPEN,
        HREADY_S9     => OPEN,
        HMASTLOCK_S9  => OPEN,
        HSEL_S10      => CoreAHBLite_0_AHBmslave10_HSELx,
        HWRITE_S10    => CoreAHBLite_0_AHBmslave10_HWRITE,
        HREADY_S10    => CoreAHBLite_0_AHBmslave10_HREADY,
        HMASTLOCK_S10 => CoreAHBLite_0_AHBmslave10_HMASTLOCK,
        HSEL_S11      => OPEN,
        HWRITE_S11    => OPEN,
        HREADY_S11    => OPEN,
        HMASTLOCK_S11 => OPEN,
        HSEL_S12      => CoreAHBLite_0_AHBmslave12_HSELx,
        HWRITE_S12    => CoreAHBLite_0_AHBmslave12_HWRITE,
        HREADY_S12    => CoreAHBLite_0_AHBmslave12_HREADY,
        HMASTLOCK_S12 => CoreAHBLite_0_AHBmslave12_HMASTLOCK,
        HSEL_S13      => OPEN,
        HWRITE_S13    => OPEN,
        HREADY_S13    => OPEN,
        HMASTLOCK_S13 => OPEN,
        HSEL_S14      => OPEN,
        HWRITE_S14    => OPEN,
        HREADY_S14    => OPEN,
        HMASTLOCK_S14 => OPEN,
        HSEL_S15      => OPEN,
        HWRITE_S15    => OPEN,
        HREADY_S15    => OPEN,
        HMASTLOCK_S15 => OPEN,
        HSEL_S16      => OPEN,
        HWRITE_S16    => OPEN,
        HREADY_S16    => OPEN,
        HMASTLOCK_S16 => OPEN,
        HRESP_M0      => CortexM1Top_0_AHBmaster_HRESP,
        HRDATA_M0     => CortexM1Top_0_AHBmaster_HRDATA,
        HRESP_M1      => OPEN,
        HRDATA_M1     => OPEN,
        HRESP_M2      => OPEN,
        HRDATA_M2     => OPEN,
        HRESP_M3      => OPEN,
        HRDATA_M3     => OPEN,
        HADDR_S0      => CoreAHBLite_0_AHBmslave0_HADDR,
        HSIZE_S0      => CoreAHBLite_0_AHBmslave0_HSIZE,
        HTRANS_S0     => CoreAHBLite_0_AHBmslave0_HTRANS,
        HWDATA_S0     => CoreAHBLite_0_AHBmslave0_HWDATA,
        HBURST_S0     => CoreAHBLite_0_AHBmslave0_HBURST,
        HPROT_S0      => CoreAHBLite_0_AHBmslave0_HPROT,
        HADDR_S1      => OPEN,
        HSIZE_S1      => OPEN,
        HTRANS_S1     => OPEN,
        HWDATA_S1     => OPEN,
        HBURST_S1     => OPEN,
        HPROT_S1      => OPEN,
        HADDR_S2      => OPEN,
        HSIZE_S2      => OPEN,
        HTRANS_S2     => OPEN,
        HWDATA_S2     => OPEN,
        HBURST_S2     => OPEN,
        HPROT_S2      => OPEN,
        HADDR_S3      => OPEN,
        HSIZE_S3      => OPEN,
        HTRANS_S3     => OPEN,
        HWDATA_S3     => OPEN,
        HBURST_S3     => OPEN,
        HPROT_S3      => OPEN,
        HADDR_S4      => OPEN,
        HSIZE_S4      => OPEN,
        HTRANS_S4     => OPEN,
        HWDATA_S4     => OPEN,
        HBURST_S4     => OPEN,
        HPROT_S4      => OPEN,
        HADDR_S5      => OPEN,
        HSIZE_S5      => OPEN,
        HTRANS_S5     => OPEN,
        HWDATA_S5     => OPEN,
        HBURST_S5     => OPEN,
        HPROT_S5      => OPEN,
        HADDR_S6      => OPEN,
        HSIZE_S6      => OPEN,
        HTRANS_S6     => OPEN,
        HWDATA_S6     => OPEN,
        HBURST_S6     => OPEN,
        HPROT_S6      => OPEN,
        HADDR_S7      => OPEN,
        HSIZE_S7      => OPEN,
        HTRANS_S7     => OPEN,
        HWDATA_S7     => OPEN,
        HBURST_S7     => OPEN,
        HPROT_S7      => OPEN,
        HADDR_S8      => OPEN,
        HSIZE_S8      => OPEN,
        HTRANS_S8     => OPEN,
        HWDATA_S8     => OPEN,
        HBURST_S8     => OPEN,
        HPROT_S8      => OPEN,
        HADDR_S9      => OPEN,
        HSIZE_S9      => OPEN,
        HTRANS_S9     => OPEN,
        HWDATA_S9     => OPEN,
        HBURST_S9     => OPEN,
        HPROT_S9      => OPEN,
        HADDR_S10     => CoreAHBLite_0_AHBmslave10_HADDR,
        HSIZE_S10     => CoreAHBLite_0_AHBmslave10_HSIZE,
        HTRANS_S10    => CoreAHBLite_0_AHBmslave10_HTRANS,
        HWDATA_S10    => CoreAHBLite_0_AHBmslave10_HWDATA,
        HBURST_S10    => CoreAHBLite_0_AHBmslave10_HBURST,
        HPROT_S10     => CoreAHBLite_0_AHBmslave10_HPROT,
        HADDR_S11     => OPEN,
        HSIZE_S11     => OPEN,
        HTRANS_S11    => OPEN,
        HWDATA_S11    => OPEN,
        HBURST_S11    => OPEN,
        HPROT_S11     => OPEN,
        HADDR_S12     => CoreAHBLite_0_AHBmslave12_HADDR,
        HSIZE_S12     => CoreAHBLite_0_AHBmslave12_HSIZE,
        HTRANS_S12    => CoreAHBLite_0_AHBmslave12_HTRANS,
        HWDATA_S12    => CoreAHBLite_0_AHBmslave12_HWDATA,
        HBURST_S12    => CoreAHBLite_0_AHBmslave12_HBURST,
        HPROT_S12     => CoreAHBLite_0_AHBmslave12_HPROT,
        HADDR_S13     => OPEN,
        HSIZE_S13     => OPEN,
        HTRANS_S13    => OPEN,
        HWDATA_S13    => OPEN,
        HBURST_S13    => OPEN,
        HPROT_S13     => OPEN,
        HADDR_S14     => OPEN,
        HSIZE_S14     => OPEN,
        HTRANS_S14    => OPEN,
        HWDATA_S14    => OPEN,
        HBURST_S14    => OPEN,
        HPROT_S14     => OPEN,
        HADDR_S15     => OPEN,
        HSIZE_S15     => OPEN,
        HTRANS_S15    => OPEN,
        HWDATA_S15    => OPEN,
        HBURST_S15    => OPEN,
        HPROT_S15     => OPEN,
        HADDR_S16     => OPEN,
        HSIZE_S16     => OPEN,
        HTRANS_S16    => OPEN,
        HWDATA_S16    => OPEN,
        HBURST_S16    => OPEN,
        HPROT_S16     => OPEN 
        );
-- CoreAhbSram_0   -   Actel:DirectCore:CoreAhbSram:1.3.103
CoreAhbSram_0 : CoreAhbSram
    generic map( 
        RAM_BLOCK_INSTANCES => ( 56 )
        )
    port map( 
        -- Inputs
        HCLK     => SYSCLK,
        HRESETn  => CortexM1Top_0_HRESETn,
        HSEL     => CoreAHBLite_0_AHBmslave0_HSELx,
        HWRITE   => CoreAHBLite_0_AHBmslave0_HWRITE,
        HREADYIN => CoreAHBLite_0_AHBmslave0_HREADY,
        HTRANS   => CoreAHBLite_0_AHBmslave0_HTRANS,
        HSIZE    => CoreAHBLite_0_AHBmslave0_HSIZE,
        HWDATA   => CoreAHBLite_0_AHBmslave0_HWDATA,
        HADDR    => CoreAHBLite_0_AHBmslave0_HADDR_0,
        -- Outputs
        HREADY   => CoreAHBLite_0_AHBmslave0_HREADYOUT,
        HRESP    => CoreAHBLite_0_AHBmslave0_HRESP,
        HRDATA   => CoreAHBLite_0_AHBmslave0_HRDATA 
        );
-- COREAHBTOAPB3_0   -   Actel:DirectCore:COREAHBTOAPB3:2.0.116
COREAHBTOAPB3_0 : entity COREAHBTOAPB3_LIB.COREAHBTOAPB3
    generic map( 
        FAMILY => ( 16 )
        )
    port map( 
        -- Inputs
        HCLK      => SYSCLK,
        HRESETN   => CortexM1Top_0_HRESETn,
        HWRITE    => CoreAHBLite_0_AHBmslave10_HWRITE,
        HSEL      => CoreAHBLite_0_AHBmslave10_HSELx,
        HREADY    => CoreAHBLite_0_AHBmslave10_HREADY,
        PREADY    => COREAHBTOAPB3_0_APBmaster_PREADY,
        PSLVERR   => COREAHBTOAPB3_0_APBmaster_PSLVERR,
        HADDR     => CoreAHBLite_0_AHBmslave10_HADDR_0,
        HTRANS    => CoreAHBLite_0_AHBmslave10_HTRANS,
        HWDATA    => CoreAHBLite_0_AHBmslave10_HWDATA,
        PRDATA    => COREAHBTOAPB3_0_APBmaster_PRDATA,
        -- Outputs
        HREADYOUT => CoreAHBLite_0_AHBmslave10_HREADYOUT,
        PENABLE   => COREAHBTOAPB3_0_APBmaster_PENABLE,
        PWRITE    => COREAHBTOAPB3_0_APBmaster_PWRITE,
        PSEL      => COREAHBTOAPB3_0_APBmaster_PSELx,
        HRDATA    => CoreAHBLite_0_AHBmslave10_HRDATA,
        HRESP     => CoreAHBLite_0_AHBmslave10_HRESP,
        PWDATA    => COREAHBTOAPB3_0_APBmaster_PWDATA,
        PADDR     => COREAHBTOAPB3_0_APBmaster_PADDR 
        );
-- CoreAPB3_0   -   Actel:DirectCore:CoreAPB3:3.0.103
CoreAPB3_0 : entity COREAPB3_LIB.CoreAPB3
    generic map( 
        APB_DWIDTH      => ( 32 ),
        APBSLOT0ENABLE  => ( 1 ),
        APBSLOT1ENABLE  => ( 0 ),
        APBSLOT2ENABLE  => ( 0 ),
        APBSLOT3ENABLE  => ( 1 ),
        APBSLOT4ENABLE  => ( 0 ),
        APBSLOT5ENABLE  => ( 0 ),
        APBSLOT6ENABLE  => ( 0 ),
        APBSLOT7ENABLE  => ( 0 ),
        APBSLOT8ENABLE  => ( 0 ),
        APBSLOT9ENABLE  => ( 0 ),
        APBSLOT10ENABLE => ( 0 ),
        APBSLOT11ENABLE => ( 0 ),
        APBSLOT12ENABLE => ( 1 ),
        APBSLOT13ENABLE => ( 0 ),
        APBSLOT14ENABLE => ( 0 ),
        APBSLOT15ENABLE => ( 0 ),
        IADDR_ENABLE    => ( 0 ),
        RANGESIZE       => ( 256 )
        )
    port map( 
        -- Inputs
        PRESETN    => GND_net, -- tied to '0' from definition
        PCLK       => GND_net, -- tied to '0' from definition
        PWRITE     => COREAHBTOAPB3_0_APBmaster_PWRITE,
        PENABLE    => COREAHBTOAPB3_0_APBmaster_PENABLE,
        PSEL       => COREAHBTOAPB3_0_APBmaster_PSELx,
        PREADYS0   => CoreAPB3_0_APBmslave0_PREADY,
        PSLVERRS0  => CoreAPB3_0_APBmslave0_PSLVERR,
        PREADYS1   => VCC_net, -- tied to '1' from definition
        PSLVERRS1  => GND_net, -- tied to '0' from definition
        PREADYS2   => VCC_net, -- tied to '1' from definition
        PSLVERRS2  => GND_net, -- tied to '0' from definition
        PREADYS3   => VCC_net, -- tied to '1' from definition
        PSLVERRS3  => GND_net, -- tied to '0' from definition
        PREADYS4   => VCC_net, -- tied to '1' from definition
        PSLVERRS4  => GND_net, -- tied to '0' from definition
        PREADYS5   => VCC_net, -- tied to '1' from definition
        PSLVERRS5  => GND_net, -- tied to '0' from definition
        PREADYS6   => VCC_net, -- tied to '1' from definition
        PSLVERRS6  => GND_net, -- tied to '0' from definition
        PREADYS7   => VCC_net, -- tied to '1' from definition
        PSLVERRS7  => GND_net, -- tied to '0' from definition
        PREADYS8   => VCC_net, -- tied to '1' from definition
        PSLVERRS8  => GND_net, -- tied to '0' from definition
        PREADYS9   => VCC_net, -- tied to '1' from definition
        PSLVERRS9  => GND_net, -- tied to '0' from definition
        PREADYS10  => VCC_net, -- tied to '1' from definition
        PSLVERRS10 => GND_net, -- tied to '0' from definition
        PREADYS11  => VCC_net, -- tied to '1' from definition
        PSLVERRS11 => GND_net, -- tied to '0' from definition
        PREADYS12  => VCC_net, -- tied to '1' from definition
        PSLVERRS12 => GND_net, -- tied to '0' from definition
        PREADYS13  => VCC_net, -- tied to '1' from definition
        PSLVERRS13 => GND_net, -- tied to '0' from definition
        PREADYS14  => VCC_net, -- tied to '1' from definition
        PSLVERRS14 => GND_net, -- tied to '0' from definition
        PREADYS15  => VCC_net, -- tied to '1' from definition
        PSLVERRS15 => GND_net, -- tied to '0' from definition
        PADDR      => COREAHBTOAPB3_0_APBmaster_PADDR,
        PWDATA     => COREAHBTOAPB3_0_APBmaster_PWDATA,
        PRDATAS0   => CoreAPB3_0_APBmslave0_PRDATA,
        PRDATAS1   => PRDATAS1_const_net_0, -- tied to X"0" from definition
        PRDATAS2   => PRDATAS2_const_net_0, -- tied to X"0" from definition
        PRDATAS3   => CoreAPB3_0_APBmslave3_PRDATA,
        PRDATAS4   => PRDATAS4_const_net_0, -- tied to X"0" from definition
        PRDATAS5   => PRDATAS5_const_net_0, -- tied to X"0" from definition
        PRDATAS6   => PRDATAS6_const_net_0, -- tied to X"0" from definition
        PRDATAS7   => PRDATAS7_const_net_0, -- tied to X"0" from definition
        PRDATAS8   => PRDATAS8_const_net_0, -- tied to X"0" from definition
        PRDATAS9   => PRDATAS9_const_net_0, -- tied to X"0" from definition
        PRDATAS10  => PRDATAS10_const_net_0, -- tied to X"0" from definition
        PRDATAS11  => PRDATAS11_const_net_0, -- tied to X"0" from definition
        PRDATAS12  => CoreAPB3_0_APBmslave12_PRDATA,
        PRDATAS13  => PRDATAS13_const_net_0, -- tied to X"0" from definition
        PRDATAS14  => PRDATAS14_const_net_0, -- tied to X"0" from definition
        PRDATAS15  => PRDATAS15_const_net_0, -- tied to X"0" from definition
        -- Outputs
        PREADY     => COREAHBTOAPB3_0_APBmaster_PREADY,
        PSLVERR    => COREAHBTOAPB3_0_APBmaster_PSLVERR,
        PWRITES    => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLES   => CoreAPB3_0_APBmslave0_PENABLE,
        PSELS0     => CoreAPB3_0_APBmslave0_PSELx,
        PSELS1     => OPEN,
        PSELS2     => OPEN,
        PSELS3     => CoreAPB3_0_APBmslave3_PSELx,
        PSELS4     => OPEN,
        PSELS5     => OPEN,
        PSELS6     => OPEN,
        PSELS7     => OPEN,
        PSELS8     => OPEN,
        PSELS9     => OPEN,
        PSELS10    => OPEN,
        PSELS11    => OPEN,
        PSELS12    => CoreAPB3_0_APBmslave12_PSELx,
        PSELS13    => OPEN,
        PSELS14    => OPEN,
        PSELS15    => OPEN,
        PRDATA     => COREAHBTOAPB3_0_APBmaster_PRDATA,
        PADDRS     => CoreAPB3_0_APBmslave3_PADDR,
        PADDRS0    => CoreAPB3_0_APBmslave0_PADDR,
        PWDATAS    => CoreAPB3_0_APBmslave0_PWDATA 
        );
-- CoreGPIO_0   -   Actel:DirectCore:CoreGPIO:3.0.120
CoreGPIO_0 : entity COREGPIO_LIB.CoreGPIO
    generic map( 
        APB_WIDTH       => ( 32 ),
        FAMILY          => ( 16 ),
        FIXED_CONFIG_0  => ( 1 ),
        FIXED_CONFIG_1  => ( 1 ),
        FIXED_CONFIG_2  => ( 0 ),
        FIXED_CONFIG_3  => ( 0 ),
        FIXED_CONFIG_4  => ( 0 ),
        FIXED_CONFIG_5  => ( 0 ),
        FIXED_CONFIG_6  => ( 0 ),
        FIXED_CONFIG_7  => ( 0 ),
        FIXED_CONFIG_8  => ( 0 ),
        FIXED_CONFIG_9  => ( 0 ),
        FIXED_CONFIG_10 => ( 0 ),
        FIXED_CONFIG_11 => ( 0 ),
        FIXED_CONFIG_12 => ( 0 ),
        FIXED_CONFIG_13 => ( 0 ),
        FIXED_CONFIG_14 => ( 0 ),
        FIXED_CONFIG_15 => ( 0 ),
        FIXED_CONFIG_16 => ( 0 ),
        FIXED_CONFIG_17 => ( 0 ),
        FIXED_CONFIG_18 => ( 0 ),
        FIXED_CONFIG_19 => ( 0 ),
        FIXED_CONFIG_20 => ( 0 ),
        FIXED_CONFIG_21 => ( 0 ),
        FIXED_CONFIG_22 => ( 0 ),
        FIXED_CONFIG_23 => ( 0 ),
        FIXED_CONFIG_24 => ( 0 ),
        FIXED_CONFIG_25 => ( 0 ),
        FIXED_CONFIG_26 => ( 0 ),
        FIXED_CONFIG_27 => ( 0 ),
        FIXED_CONFIG_28 => ( 0 ),
        FIXED_CONFIG_29 => ( 0 ),
        FIXED_CONFIG_30 => ( 0 ),
        FIXED_CONFIG_31 => ( 0 ),
        INT_BUS         => ( 0 ),
        IO_INT_TYPE_0   => ( 7 ),
        IO_INT_TYPE_1   => ( 7 ),
        IO_INT_TYPE_2   => ( 7 ),
        IO_INT_TYPE_3   => ( 7 ),
        IO_INT_TYPE_4   => ( 7 ),
        IO_INT_TYPE_5   => ( 7 ),
        IO_INT_TYPE_6   => ( 7 ),
        IO_INT_TYPE_7   => ( 7 ),
        IO_INT_TYPE_8   => ( 7 ),
        IO_INT_TYPE_9   => ( 7 ),
        IO_INT_TYPE_10  => ( 7 ),
        IO_INT_TYPE_11  => ( 7 ),
        IO_INT_TYPE_12  => ( 7 ),
        IO_INT_TYPE_13  => ( 7 ),
        IO_INT_TYPE_14  => ( 7 ),
        IO_INT_TYPE_15  => ( 7 ),
        IO_INT_TYPE_16  => ( 7 ),
        IO_INT_TYPE_17  => ( 7 ),
        IO_INT_TYPE_18  => ( 7 ),
        IO_INT_TYPE_19  => ( 7 ),
        IO_INT_TYPE_20  => ( 7 ),
        IO_INT_TYPE_21  => ( 7 ),
        IO_INT_TYPE_22  => ( 7 ),
        IO_INT_TYPE_23  => ( 7 ),
        IO_INT_TYPE_24  => ( 7 ),
        IO_INT_TYPE_25  => ( 7 ),
        IO_INT_TYPE_26  => ( 7 ),
        IO_INT_TYPE_27  => ( 7 ),
        IO_INT_TYPE_28  => ( 7 ),
        IO_INT_TYPE_29  => ( 7 ),
        IO_INT_TYPE_30  => ( 7 ),
        IO_INT_TYPE_31  => ( 7 ),
        IO_NUM          => ( 2 ),
        IO_TYPE_0       => ( 2 ),
        IO_TYPE_1       => ( 2 ),
        IO_TYPE_2       => ( 0 ),
        IO_TYPE_3       => ( 0 ),
        IO_TYPE_4       => ( 0 ),
        IO_TYPE_5       => ( 0 ),
        IO_TYPE_6       => ( 0 ),
        IO_TYPE_7       => ( 0 ),
        IO_TYPE_8       => ( 0 ),
        IO_TYPE_9       => ( 0 ),
        IO_TYPE_10      => ( 0 ),
        IO_TYPE_11      => ( 0 ),
        IO_TYPE_12      => ( 0 ),
        IO_TYPE_13      => ( 0 ),
        IO_TYPE_14      => ( 0 ),
        IO_TYPE_15      => ( 0 ),
        IO_TYPE_16      => ( 0 ),
        IO_TYPE_17      => ( 0 ),
        IO_TYPE_18      => ( 0 ),
        IO_TYPE_19      => ( 0 ),
        IO_TYPE_20      => ( 0 ),
        IO_TYPE_21      => ( 0 ),
        IO_TYPE_22      => ( 0 ),
        IO_TYPE_23      => ( 0 ),
        IO_TYPE_24      => ( 0 ),
        IO_TYPE_25      => ( 0 ),
        IO_TYPE_26      => ( 0 ),
        IO_TYPE_27      => ( 0 ),
        IO_TYPE_28      => ( 0 ),
        IO_TYPE_29      => ( 0 ),
        IO_TYPE_30      => ( 0 ),
        IO_TYPE_31      => ( 0 ),
        IO_VAL_0        => ( 0 ),
        IO_VAL_1        => ( 0 ),
        IO_VAL_2        => ( 0 ),
        IO_VAL_3        => ( 0 ),
        IO_VAL_4        => ( 0 ),
        IO_VAL_5        => ( 0 ),
        IO_VAL_6        => ( 0 ),
        IO_VAL_7        => ( 0 ),
        IO_VAL_8        => ( 0 ),
        IO_VAL_9        => ( 0 ),
        IO_VAL_10       => ( 0 ),
        IO_VAL_11       => ( 0 ),
        IO_VAL_12       => ( 0 ),
        IO_VAL_13       => ( 0 ),
        IO_VAL_14       => ( 0 ),
        IO_VAL_15       => ( 0 ),
        IO_VAL_16       => ( 0 ),
        IO_VAL_17       => ( 0 ),
        IO_VAL_18       => ( 0 ),
        IO_VAL_19       => ( 0 ),
        IO_VAL_20       => ( 0 ),
        IO_VAL_21       => ( 0 ),
        IO_VAL_22       => ( 0 ),
        IO_VAL_23       => ( 0 ),
        IO_VAL_24       => ( 0 ),
        IO_VAL_25       => ( 0 ),
        IO_VAL_26       => ( 0 ),
        IO_VAL_27       => ( 0 ),
        IO_VAL_28       => ( 0 ),
        IO_VAL_29       => ( 0 ),
        IO_VAL_30       => ( 0 ),
        IO_VAL_31       => ( 0 ),
        OE_TYPE         => ( 0 )
        )
    port map( 
        -- Inputs
        PRESETN  => CortexM1Top_0_HRESETn,
        PCLK     => SYSCLK,
        PSEL     => CoreAPB3_0_APBmslave0_PSELx,
        PENABLE  => CoreAPB3_0_APBmslave0_PENABLE,
        PWRITE   => CoreAPB3_0_APBmslave0_PWRITE,
        PADDR    => CoreAPB3_0_APBmslave0_PADDR_0,
        PWDATA   => CoreAPB3_0_APBmslave0_PWDATA,
        GPIO_IN  => GPIO_N,
        -- Outputs
        PSLVERR  => CoreAPB3_0_APBmslave0_PSLVERR,
        PREADY   => CoreAPB3_0_APBmslave0_PREADY,
        INT_OR   => OPEN,
        PRDATA   => CoreAPB3_0_APBmslave0_PRDATA,
        INT      => INT_net_0,
        GPIO_OUT => GPIO_OUT_net_0,
        GPIO_OE  => GPIO_CE_net_0 
        );
-- CoreTimer_0   -   Actel:DirectCore:CoreTimer:2.0.103
CoreTimer_0 : CoreTimer
    generic map( 
        FAMILY     => ( 16 ),
        INTACTIVEH => ( 1 ),
        WIDTH      => ( 32 )
        )
    port map( 
        -- Inputs
        PCLK    => SYSCLK,
        PRESETn => CortexM1Top_0_HRESETn,
        PSEL    => CoreAPB3_0_APBmslave3_PSELx,
        PWRITE  => CoreAPB3_0_APBmslave0_PWRITE,
        PENABLE => CoreAPB3_0_APBmslave0_PENABLE,
        PADDR   => CoreAPB3_0_APBmslave3_PADDR_0,
        PWDATA  => CoreAPB3_0_APBmslave0_PWDATA,
        -- Outputs
        TIMINT  => CoreTimer_0_TIMINT,
        PRDATA  => CoreAPB3_0_APBmslave3_PRDATA 
        );
-- CortexM1Top_0   -   Actel:DirectCore:CortexM1Top:3.0.102
CortexM1Top_0 : CortexM1Top
    generic map( 
        CONFIG           => ( 289 ),
        DEBUG_CONFIG     => ( 1 ),
        DEBUG_IF         => ( 0 ),
        DEBUG_INCL       => ( 1 ),
        DEBUG_RESET      => ( 0 ),
        ITCM_ALIAS       => ( 1 ),
        UJ_CLK_ON_GLOBAL => ( 1 ),
        UJ_RST_ON_GLOBAL => ( 0 )
        )
    port map( 
        -- Inputs
        HCLK      => SYSCLK,
        NSYSRESET => NSYSRESET,
        PORESETN  => VCC_net, -- tied to '1' from definition
        WDOGRES   => GND_net,
        NMI       => GND_net,
        IRQ0      => CoreTimer_0_TIMINT,
        IRQ1      => GND_net, -- tied to '0' from definition
        IRQ2      => GND_net, -- tied to '0' from definition
        IRQ3      => GND_net, -- tied to '0' from definition
        IRQ4      => GND_net, -- tied to '0' from definition
        IRQ5      => GND_net, -- tied to '0' from definition
        IRQ6      => GND_net, -- tied to '0' from definition
        IRQ7      => GND_net, -- tied to '0' from definition
        IRQ8      => GND_net, -- tied to '0' from definition
        IRQ9      => GND_net, -- tied to '0' from definition
        IRQ10     => GND_net, -- tied to '0' from definition
        IRQ11     => GND_net, -- tied to '0' from definition
        IRQ12     => GND_net, -- tied to '0' from definition
        IRQ13     => GND_net, -- tied to '0' from definition
        IRQ14     => GND_net, -- tied to '0' from definition
        IRQ15     => GND_net, -- tied to '0' from definition
        IRQ16     => GND_net, -- tied to '0' from definition
        IRQ17     => GND_net, -- tied to '0' from definition
        IRQ18     => GND_net, -- tied to '0' from definition
        IRQ19     => GND_net, -- tied to '0' from definition
        IRQ20     => GND_net, -- tied to '0' from definition
        IRQ21     => GND_net, -- tied to '0' from definition
        IRQ22     => GND_net, -- tied to '0' from definition
        IRQ23     => GND_net, -- tied to '0' from definition
        IRQ24     => GND_net, -- tied to '0' from definition
        IRQ25     => GND_net, -- tied to '0' from definition
        IRQ26     => GND_net, -- tied to '0' from definition
        IRQ27     => GND_net, -- tied to '0' from definition
        IRQ28     => GND_net, -- tied to '0' from definition
        IRQ29     => GND_net, -- tied to '0' from definition
        IRQ30     => GND_net, -- tied to '0' from definition
        IRQ31     => GND_net, -- tied to '0' from definition
        HREADY    => CortexM1Top_0_AHBmaster_HREADY,
        EDBGRQ    => GND_net,
        nTRST     => nTRST,
        TDI       => TDI,
        TMS       => TMS,
        TCK       => TCK,
        HRDATA    => CortexM1Top_0_AHBmaster_HRDATA,
        HRESP     => CortexM1Top_0_AHBmaster_HRESP,
        -- Outputs
        HRESETn   => CortexM1Top_0_HRESETn,
        WDOGRESn  => OPEN,
        LOCKUP    => OPEN,
        HALTED    => OPEN,
        JTAGTOP   => OPEN,
        JTAGNSW   => OPEN,
        SWDO      => OPEN,
        SWDOEN    => OPEN,
        HMASTLOCK => CortexM1Top_0_AHBmaster_HLOCK,
        HWRITE    => CortexM1Top_0_AHBmaster_HWRITE,
        TDO       => TDO_net_0,
        nTDOEN    => OPEN,
        HADDR     => CortexM1Top_0_AHBmaster_HADDR,
        HBURST    => CortexM1Top_0_AHBmaster_HBURST,
        HPROT     => CortexM1Top_0_AHBmaster_HPROT,
        HSIZE     => CortexM1Top_0_AHBmaster_HSIZE,
        HTRANS    => CortexM1Top_0_AHBmaster_HTRANS,
        HWDATA    => CortexM1Top_0_AHBmaster_HWDATA 
        );

end RTL;
