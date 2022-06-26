----------------------------------------------------------------------
-- Created by SmartDesign Sat Apr 23 01:51:32 2022
-- Version: v11.9 11.9.0.4
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Libraries
----------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

library proasic3e;
use proasic3e.all;

----------------------------------------------------------------------
-- CORE1553_BRM entity declaration
----------------------------------------------------------------------
entity CORE1553_BRM is
    -- Port list
    port(
        -- Inputs
        ABSTDIN   : in  std_logic;
        ASYNCIF   : in  std_logic;
        BUSAINN   : in  std_logic;
        BUSAINP   : in  std_logic;
        BUSBINN   : in  std_logic;
        BUSBINP   : in  std_logic;
        CLK       : in  std_logic;
        CMDOK     : in  std_logic;
        CPUADDR   : in  std_logic_vector(15 downto 0);
        CPUCSn    : in  std_logic;
        CPUDIN    : in  std_logic_vector(15 downto 0);
        CPUMEM    : in  std_logic;
        CPUMEMEN  : in  std_logic;
        CPURDn    : in  std_logic;
        CPUWRn    : in  std_logic_vector(1 downto 0);
        INTACKH   : in  std_logic;
        INTACKM   : in  std_logic;
        INTLEVEL  : in  std_logic;
        LOCKn     : in  std_logic;
        MEMDIN    : in  std_logic_vector(15 downto 0);
        MEMGNTn   : in  std_logic;
        MEMWAITn  : in  std_logic;
        MSELIN    : in  std_logic_vector(1 downto 0);
        RSTINn    : in  std_logic;
        RTADDRIN  : in  std_logic_vector(4 downto 0);
        RTADDRPIN : in  std_logic;
        SSYSFn    : in  std_logic;
        TCLK      : in  std_logic;
        -- Outputs
        ACTIVE    : out std_logic;
        BUSAINEN  : out std_logic;
        BUSAOUTIN : out std_logic;
        BUSAOUTN  : out std_logic;
        BUSAOUTP  : out std_logic;
        BUSBINEN  : out std_logic;
        BUSBOUTIN : out std_logic;
        BUSBOUTN  : out std_logic;
        BUSBOUTP  : out std_logic;
        BUSRESET  : out std_logic;
        BUSY      : out std_logic;
        CMDOKOUT  : out std_logic;
        CMDSTB    : out std_logic;
        CMDSYNC   : out std_logic;
        CMDVAL    : out std_logic_vector(11 downto 0);
        CPUDEN    : out std_logic;
        CPUDOUT   : out std_logic_vector(15 downto 0);
        CPUWAITn  : out std_logic;
        INTOUTH   : out std_logic;
        INTOUTM   : out std_logic;
        MEMACCn   : out std_logic;
        MEMADDR   : out std_logic_vector(15 downto 0);
        MEMCEN    : out std_logic;
        MEMCSn    : out std_logic;
        MEMDEN    : out std_logic;
        MEMDOUT   : out std_logic_vector(15 downto 0);
        MEMFAIL   : out std_logic;
        MEMRDn    : out std_logic;
        MEMREQn   : out std_logic;
        MEMWRn    : out std_logic_vector(1 downto 0);
        MSGSTART  : out std_logic;
        OPMODE    : out std_logic_vector(1 downto 0);
        RSTOUTn   : out std_logic;
        RTADERR   : out std_logic;
        SYNCNOW   : out std_logic
        );
end CORE1553_BRM;
----------------------------------------------------------------------
-- CORE1553_BRM architecture body
----------------------------------------------------------------------
architecture RTL of CORE1553_BRM is
----------------------------------------------------------------------
-- Component declarations
----------------------------------------------------------------------
-- CORE1553_BRM_CORE1553_BRM_0_CORE1553BRM   -   Actel:DirectCore:CORE1553BRM:4.3.104
component CORE1553BRM is
  generic ( FAMILY   : INTEGER range 0  to 21 := 16;
            BCENABLE : INTEGER range 0  to 1 := 0;
            RTENABLE : INTEGER range 0  to 1 :=1;
            MTENABLE : INTEGER range 0  to 1 :=0;
            LEGREGS  : INTEGER range 0  to 2 :=1;
            ENHANCED : INTEGER range 0  to 1 :=1;
            INITFREQ : INTEGER range 12 to 24:=12;
            LOCKFREQ : INTEGER range 0  to 1 :=1;
            BETIMING : INTEGER range 0  to 2 :=0;
			ACKVAL   : INTEGER range 0  to 255:=0;  
			WAITVAL  : INTEGER range 0  to 255 :=0
           );

  port ( CLK        : in  std_logic;
         TCLK       : in  std_logic;
         RSTINn     : in  std_logic;
         RSTOUTn    : out std_logic;
         
         -- 1553B Interface
         BUSAINEN   : out std_logic;
         BUSAINP    : in  std_logic;
         BUSAINN    : in  std_logic;
         BUSBINEN   : out std_logic;
         BUSBINP    : in  std_logic;
         BUSBINN    : in  std_logic;
         BUSAOUTIN  : out std_logic;
         BUSAOUTP   : out std_logic;
         BUSAOUTN   : out std_logic;
         BUSBOUTIN  : out std_logic;
         BUSBOUTP   : out std_logic;
         BUSBOUTN   : out std_logic;
         
         -- BRM Control Signals - should be tied high or low
         CPUMEMEN   : in  std_logic;
         ASYNCIF    : in  std_logic;
         INTLEVEL   : in  std_logic;
                  
         -- Combined Status Signals
         ACTIVE     : out std_logic;
         BUSY       : out std_logic;
         INTOUTH    : out std_logic;
         INTOUTM    : out std_logic;
         INTACKH    : in  std_logic;
         INTACKM    : in  std_logic;
         MEMFAIL    : out std_logic;
         OPMODE     : out std_logic_vector(1 downto 0);
         
         -- RT ADDRESS Setting
         LOCKn      : in  std_logic;      
         RTADDRIN   : in  std_logic_vector(4 downto 0); 
         RTADDRPIN  : in  std_logic;
         RTADERR    : out std_logic;
         MSELIN     : in  std_logic_vector(1 downto 0);
         SSYSFn     : in  std_logic;
         ABSTDIN    : in  std_logic;
               
         -- RT Status Signals
         MSGSTART   : out std_logic;
         CMDSYNC    : out std_logic;
         SYNCNOW    : out std_logic;
         BUSRESET   : out std_logic;
         
         -- RT Command Legalization Interface
         CMDSTB     : out std_logic;
         CMDVAL     : out std_logic_vector(11 downto 0);
         CMDOK      : in  std_logic;
         CMDOKOUT   : out std_logic;
 
         -- CPU Interface
         CPUWRn     : in  std_logic_vector(1 downto 0);
         CPURDn     : in  std_logic;
         CPUCSn     : in  std_logic;
         CPUMEM     : in  std_logic;
         CPUWAITn   : out std_logic;
         CPUDEN     : out std_logic;
         CPUADDR    : in  std_logic_vector(15 downto 0);
         CPUDOUT    : out std_logic_vector(15 downto 0);
         CPUDIN     : in  std_logic_vector(15 downto 0);
                  
         -- Backend Memory interface
         MEMREQn    : out std_logic;
         MEMGNTn    : in  std_logic;
         MEMACCn    : out std_logic;
         MEMWRn     : out std_logic_vector(1 downto 0);
         MEMRDn     : out std_logic;
         MEMCSn     : out std_logic;
         MEMWAITn   : in  std_logic;
         MEMCEN     : out std_logic;
         MEMDEN     : out std_logic;
         MEMADDR    : out std_logic_vector(15 downto 0);
         MEMDOUT    : out std_logic_vector(15 downto 0);
         MEMDIN     : in  std_logic_vector(15 downto 0)
        );
end component;
----------------------------------------------------------------------
-- Signal declarations
----------------------------------------------------------------------
signal ACTIVE_net_0    : std_logic;
signal BUSAINEN_net_0  : std_logic;
signal BUSAOUTIN_net_0 : std_logic;
signal BUSAOUTN_net_0  : std_logic;
signal BUSAOUTP_net_0  : std_logic;
signal BUSBINEN_net_0  : std_logic;
signal BUSBOUTIN_net_0 : std_logic;
signal BUSBOUTN_net_0  : std_logic;
signal BUSBOUTP_net_0  : std_logic;
signal BUSRESET_net_0  : std_logic;
signal BUSY_net_0      : std_logic;
signal CMDOKOUT_net_0  : std_logic;
signal CMDSTB_net_0    : std_logic;
signal CMDSYNC_net_0   : std_logic;
signal CMDVAL_net_0    : std_logic_vector(11 downto 0);
signal CPUDEN_net_0    : std_logic;
signal CPUDOUT_net_0   : std_logic_vector(15 downto 0);
signal CPUWAITn_net_0  : std_logic;
signal INTOUTH_net_0   : std_logic;
signal INTOUTM_net_0   : std_logic;
signal MEMACCn_net_0   : std_logic;
signal MEMADDR_net_0   : std_logic_vector(15 downto 0);
signal MEMCEN_net_0    : std_logic;
signal MEMCSn_net_0    : std_logic;
signal MEMDEN_net_0    : std_logic;
signal MEMDOUT_net_0   : std_logic_vector(15 downto 0);
signal MEMFAIL_net_0   : std_logic;
signal MEMRDn_net_0    : std_logic;
signal MEMREQn_net_0   : std_logic;
signal MEMWRn_net_0    : std_logic_vector(1 downto 0);
signal MSGSTART_net_0  : std_logic;
signal OPMODE_net_0    : std_logic_vector(1 downto 0);
signal RSTOUTn_net_0   : std_logic;
signal RTADERR_net_0   : std_logic;
signal SYNCNOW_net_0   : std_logic;
signal ACTIVE_net_1    : std_logic;
signal BUSAINEN_net_1  : std_logic;
signal BUSAOUTIN_net_1 : std_logic;
signal BUSAOUTN_net_1  : std_logic;
signal BUSAOUTP_net_1  : std_logic;
signal BUSBINEN_net_1  : std_logic;
signal BUSBOUTIN_net_1 : std_logic;
signal BUSBOUTN_net_1  : std_logic;
signal BUSBOUTP_net_1  : std_logic;
signal BUSRESET_net_1  : std_logic;
signal BUSY_net_1      : std_logic;
signal CMDOKOUT_net_1  : std_logic;
signal CMDSTB_net_1    : std_logic;
signal CMDSYNC_net_1   : std_logic;
signal CMDVAL_net_1    : std_logic_vector(11 downto 0);
signal CPUDEN_net_1    : std_logic;
signal CPUDOUT_net_1   : std_logic_vector(15 downto 0);
signal CPUWAITn_net_1  : std_logic;
signal INTOUTH_net_1   : std_logic;
signal INTOUTM_net_1   : std_logic;
signal MEMACCn_net_1   : std_logic;
signal MEMADDR_net_1   : std_logic_vector(15 downto 0);
signal MEMCEN_net_1    : std_logic;
signal MEMCSn_net_1    : std_logic;
signal MEMDEN_net_1    : std_logic;
signal MEMDOUT_net_1   : std_logic_vector(15 downto 0);
signal MEMFAIL_net_1   : std_logic;
signal MEMRDn_net_1    : std_logic;
signal MEMREQn_net_1   : std_logic;
signal MEMWRn_net_1    : std_logic_vector(1 downto 0);
signal MSGSTART_net_1  : std_logic;
signal OPMODE_net_1    : std_logic_vector(1 downto 0);
signal RSTOUTn_net_1   : std_logic;
signal RTADERR_net_1   : std_logic;
signal SYNCNOW_net_1   : std_logic;

begin
----------------------------------------------------------------------
-- Top level output port assignments
----------------------------------------------------------------------
 ACTIVE_net_1         <= ACTIVE_net_0;
 ACTIVE               <= ACTIVE_net_1;
 BUSAINEN_net_1       <= BUSAINEN_net_0;
 BUSAINEN             <= BUSAINEN_net_1;
 BUSAOUTIN_net_1      <= BUSAOUTIN_net_0;
 BUSAOUTIN            <= BUSAOUTIN_net_1;
 BUSAOUTN_net_1       <= BUSAOUTN_net_0;
 BUSAOUTN             <= BUSAOUTN_net_1;
 BUSAOUTP_net_1       <= BUSAOUTP_net_0;
 BUSAOUTP             <= BUSAOUTP_net_1;
 BUSBINEN_net_1       <= BUSBINEN_net_0;
 BUSBINEN             <= BUSBINEN_net_1;
 BUSBOUTIN_net_1      <= BUSBOUTIN_net_0;
 BUSBOUTIN            <= BUSBOUTIN_net_1;
 BUSBOUTN_net_1       <= BUSBOUTN_net_0;
 BUSBOUTN             <= BUSBOUTN_net_1;
 BUSBOUTP_net_1       <= BUSBOUTP_net_0;
 BUSBOUTP             <= BUSBOUTP_net_1;
 BUSRESET_net_1       <= BUSRESET_net_0;
 BUSRESET             <= BUSRESET_net_1;
 BUSY_net_1           <= BUSY_net_0;
 BUSY                 <= BUSY_net_1;
 CMDOKOUT_net_1       <= CMDOKOUT_net_0;
 CMDOKOUT             <= CMDOKOUT_net_1;
 CMDSTB_net_1         <= CMDSTB_net_0;
 CMDSTB               <= CMDSTB_net_1;
 CMDSYNC_net_1        <= CMDSYNC_net_0;
 CMDSYNC              <= CMDSYNC_net_1;
 CMDVAL_net_1         <= CMDVAL_net_0;
 CMDVAL(11 downto 0)  <= CMDVAL_net_1;
 CPUDEN_net_1         <= CPUDEN_net_0;
 CPUDEN               <= CPUDEN_net_1;
 CPUDOUT_net_1        <= CPUDOUT_net_0;
 CPUDOUT(15 downto 0) <= CPUDOUT_net_1;
 CPUWAITn_net_1       <= CPUWAITn_net_0;
 CPUWAITn             <= CPUWAITn_net_1;
 INTOUTH_net_1        <= INTOUTH_net_0;
 INTOUTH              <= INTOUTH_net_1;
 INTOUTM_net_1        <= INTOUTM_net_0;
 INTOUTM              <= INTOUTM_net_1;
 MEMACCn_net_1        <= MEMACCn_net_0;
 MEMACCn              <= MEMACCn_net_1;
 MEMADDR_net_1        <= MEMADDR_net_0;
 MEMADDR(15 downto 0) <= MEMADDR_net_1;
 MEMCEN_net_1         <= MEMCEN_net_0;
 MEMCEN               <= MEMCEN_net_1;
 MEMCSn_net_1         <= MEMCSn_net_0;
 MEMCSn               <= MEMCSn_net_1;
 MEMDEN_net_1         <= MEMDEN_net_0;
 MEMDEN               <= MEMDEN_net_1;
 MEMDOUT_net_1        <= MEMDOUT_net_0;
 MEMDOUT(15 downto 0) <= MEMDOUT_net_1;
 MEMFAIL_net_1        <= MEMFAIL_net_0;
 MEMFAIL              <= MEMFAIL_net_1;
 MEMRDn_net_1         <= MEMRDn_net_0;
 MEMRDn               <= MEMRDn_net_1;
 MEMREQn_net_1        <= MEMREQn_net_0;
 MEMREQn              <= MEMREQn_net_1;
 MEMWRn_net_1         <= MEMWRn_net_0;
 MEMWRn(1 downto 0)   <= MEMWRn_net_1;
 MSGSTART_net_1       <= MSGSTART_net_0;
 MSGSTART             <= MSGSTART_net_1;
 OPMODE_net_1         <= OPMODE_net_0;
 OPMODE(1 downto 0)   <= OPMODE_net_1;
 RSTOUTn_net_1        <= RSTOUTn_net_0;
 RSTOUTn              <= RSTOUTn_net_1;
 RTADERR_net_1        <= RTADERR_net_0;
 RTADERR              <= RTADERR_net_1;
 SYNCNOW_net_1        <= SYNCNOW_net_0;
 SYNCNOW              <= SYNCNOW_net_1;
----------------------------------------------------------------------
-- Component instances
----------------------------------------------------------------------
-- CORE1553_BRM_0
CORE1553_BRM_0 : CORE1553BRM
    generic map( 
        ACKVAL   => ( 0 ),
        BCENABLE => ( 0 ),
        BETIMING => ( 2 ),
        ENHANCED => ( 1 ),
        FAMILY   => ( 16 ),
        INITFREQ => ( 24 ),
        LEGREGS  => ( 1 ),
        LOCKFREQ => ( 1 ),
        MTENABLE => ( 0 ),
        RTENABLE => ( 1 ),
        WAITVAL  => ( 0 )
        )
    port map( 
        -- Inputs
        ABSTDIN    => ABSTDIN,
        ASYNCIF    => ASYNCIF,
        BUSAINN    => BUSAINN,
        BUSAINP    => BUSAINP,
        BUSBINN    => BUSBINN,
        BUSBINP    => BUSBINP,
        CLK        => CLK,
        CMDOK      => CMDOK,
        CPUADDR    => CPUADDR,
        CPUCSn     => CPUCSn,
        CPUDIN     => CPUDIN,
        CPUMEM     => CPUMEM,
        CPUMEMEN   => CPUMEMEN,
        CPURDn     => CPURDn,
        CPUWRn     => CPUWRn,
        INTACKH    => INTACKH,
        INTACKM    => INTACKM,
        INTLEVEL   => INTLEVEL,
        LOCKn      => LOCKn,
        MEMDIN     => MEMDIN,
        MEMGNTn    => MEMGNTn,
        MEMWAITn   => MEMWAITn,
        MSELIN     => MSELIN,
        RSTINn     => RSTINn,
        RTADDRIN   => RTADDRIN,
        RTADDRPIN  => RTADDRPIN,
        SSYSFn     => SSYSFn,
        TCLK       => TCLK,
        -- Outputs
        ACTIVE     => ACTIVE_net_0,
        BUSAINEN   => BUSAINEN_net_0,
        BUSAOUTIN  => BUSAOUTIN_net_0,
        BUSAOUTN   => BUSAOUTN_net_0,
        BUSAOUTP   => BUSAOUTP_net_0,
        BUSBINEN   => BUSBINEN_net_0,
        BUSBOUTIN  => BUSBOUTIN_net_0,
        BUSBOUTN   => BUSBOUTN_net_0,
        BUSBOUTP   => BUSBOUTP_net_0,
        BUSRESET   => BUSRESET_net_0,
        BUSY       => BUSY_net_0,
        CMDOKOUT   => CMDOKOUT_net_0,
        CMDSTB     => CMDSTB_net_0,
        CMDSYNC    => CMDSYNC_net_0,
        CMDVAL     => CMDVAL_net_0,
        CPUDEN     => CPUDEN_net_0,
        CPUDOUT    => CPUDOUT_net_0,
        CPUWAITn   => CPUWAITn_net_0,
        INTOUTH    => INTOUTH_net_0,
        INTOUTM    => INTOUTM_net_0,
        MEMACCn    => MEMACCn_net_0,
        MEMADDR    => MEMADDR_net_0,
        MEMCEN     => MEMCEN_net_0,
        MEMCSn     => MEMCSn_net_0,
        MEMDEN     => MEMDEN_net_0,
        MEMDOUT    => MEMDOUT_net_0,
        MEMFAIL    => MEMFAIL_net_0,
        MEMRDn     => MEMRDn_net_0,
        MEMREQn    => MEMREQn_net_0,
        MEMWRn     => MEMWRn_net_0,
        MSGSTART   => MSGSTART_net_0,
        OPMODE     => OPMODE_net_0,
        RSTOUTn    => RSTOUTn_net_0,
        RTADERR    => RTADERR_net_0,
        SYNCNOW    => SYNCNOW_net_0
        );

end RTL;