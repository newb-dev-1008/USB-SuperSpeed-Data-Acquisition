-- Version: 9.0 SP2 9.0.3.3

library ieee;
use ieee.std_logic_1164.all;
library proasic3e;
use proasic3e.all;
library CORE1553BRM_LIB;
use CORE1553BRM_LIB.all;

entity ip_code is

    port( ABSTDIN   : in    std_logic; 
          ACTIVE    : out   std_logic; 
          ASYNCIF   : in    std_logic;

          BUSAINEN  : out   std_logic;
          BUSAINN   : in    std_logic;
          BUSAINP   : in    std_logic;
          BUSAOUTIN : out   std_logic;
          BUSAOUTN  : out   std_logic;
          BUSAOUTP  : out   std_logic;
          BUSBINEN  : out   std_logic;
          BUSBINN   : in    std_logic;
          BUSBINP   : in    std_logic;
          BUSBOUTIN : out   std_logic;
          BUSBOUTN  : out   std_logic;
          BUSBOUTP  : out   std_logic;
          BUSRESET  : out   std_logic;

          BUSY      : out   std_logic;
          CLK       : in    std_logic;  
          CMDOK     : in    std_logic;  
          CMDOKOUT  : out   std_logic;
          CMDSTB    : out   std_logic;
          CMDSYNC   : out   std_logic;
          CPUCSn    : in    std_logic; 
          CPUDEN    : out   std_logic;
          CPUMEM    : in    std_logic;  
          CPUMEMEN  : in    std_logic;  
          CPURDn    : in    std_logic;   
          CPUWAITn  : out   std_logic;
          INTACKH   : in    std_logic; 
          INTACKM   : in    std_logic; 
          INTLEVEL  : in    std_logic;  
          INTOUTH   : out   std_logic;
          INTOUTM   : out   std_logic;
          LOCKn     : in    std_logic;  
          MEMACCn   : out   std_logic;
          MEMCEN    : out   std_logic;
          MEMCSn    : out   std_logic;
          MEMDEN    : out   std_logic;
          MEMFAIL   : out   std_logic;
          MEMGNTn   : in    std_logic;  
          MEMRDn    : out   std_logic;
          MEMREQn   : out   std_logic;
          MEMWAITn  : in    std_logic; 
          MSGSTART  : out   std_logic;
          RSTINn    : in    std_logic;  
          RSTOUTn   : out   std_logic;
          RTADDRPIN : in    std_logic;  
          RTADERR   : out   std_logic;
          SSYSFn    : in    std_logic; 
          SYNCNOW   : out   std_logic;
          TCLK      : in    std_logic;  
          CMDVAL    : out   std_logic_vector(11 downto 0);
          CPUADDR   : in    std_logic_vector(15 downto 0); 
          CPUDIN    : in    std_logic_vector(15 downto 0); 
          CPUDOUT   : out   std_logic_vector(15 downto 0);
          CPUWRn    : in    std_logic_vector(1 downto 0);
          MEMADDR   : out   std_logic_vector(15 downto 0);
          MEMDIN    : in    std_logic_vector(15 downto 0); 
          MEMDOUT   : out   std_logic_vector(15 downto 0);  
          MEMWRn    : out   std_logic_vector(1 downto 0);
          MSELIN    : in    std_logic_vector(1 downto 0); 
          OPMODE    : out   std_logic_vector(1 downto 0);
          RTADDRIN  : in    std_logic_vector(4 downto 0) 
        );

end ip_code;

architecture DEF_ARCH of ip_code is 

  component VCC
    port( Y : out   std_logic
        );
  end component;

  component CORE1553BRM
    generic (ACKVAL:integer := 0; BCENABLE:integer := 0; 
        BETIMING:integer := 0; ENHANCED:integer := 0; 
        FAMILY:integer := 0; INITFREQ:integer := 0; 
        LEGREGS:integer := 0; LOCKFREQ:integer := 0; 
        MTENABLE:integer := 0; RTENABLE:integer := 0; 
        WAITVAL:integer := 0);

    port( ABSTDIN   : in    std_logic := 'U';
          ACTIVE    : out   std_logic;
          ASYNCIF   : in    std_logic := 'U';
          BUSAINEN  : out   std_logic;
          BUSAINN   : in    std_logic := 'U';
          BUSAINP   : in    std_logic := 'U';
          BUSAOUTIN : out   std_logic;
          BUSAOUTN  : out   std_logic;
          BUSAOUTP  : out   std_logic;
          BUSBINEN  : out   std_logic;
          BUSBINN   : in    std_logic := 'U';
          BUSBINP   : in    std_logic := 'U';
          BUSBOUTIN : out   std_logic;
          BUSBOUTN  : out   std_logic;
          BUSBOUTP  : out   std_logic;
          BUSRESET  : out   std_logic;
          BUSY      : out   std_logic;
          CLK       : in    std_logic := 'U';
          CMDOK     : in    std_logic := 'U';
          CMDOKOUT  : out   std_logic;
          CMDSTB    : out   std_logic;
          CMDSYNC   : out   std_logic;
          CPUCSn    : in    std_logic := 'U';
          CPUDEN    : out   std_logic;
          CPUMEM    : in    std_logic := 'U';
          CPUMEMEN  : in    std_logic := 'U';
          CPURDn    : in    std_logic := 'U';
          CPUWAITn  : out   std_logic;
          INTACKH   : in    std_logic := 'U';
          INTACKM   : in    std_logic := 'U';
          INTLEVEL  : in    std_logic := 'U';
          INTOUTH   : out   std_logic;
          INTOUTM   : out   std_logic;
          LOCKn     : in    std_logic := 'U';
          MEMACCn   : out   std_logic;
          MEMCEN    : out   std_logic;
          MEMCSn    : out   std_logic;
          MEMDEN    : out   std_logic;
          MEMFAIL   : out   std_logic;
          MEMGNTn   : in    std_logic := 'U';
          MEMRDn    : out   std_logic;
          MEMREQn   : out   std_logic;
          MEMWAITn  : in    std_logic := 'U';
          MSGSTART  : out   std_logic;
          RSTINn    : in    std_logic := 'U';
          RSTOUTn   : out   std_logic;
          RTADDRPIN : in    std_logic := 'U';
          RTADERR   : out   std_logic;
          SSYSFn    : in    std_logic := 'U';
          SYNCNOW   : out   std_logic;
          TCLK      : in    std_logic := 'U';
          CMDVAL    : out   std_logic_vector(11 downto 0);
          CPUADDR   : in    std_logic_vector(15 downto 0) := (others => 'U');
          CPUDIN    : in    std_logic_vector(15 downto 0) := (others => 'U');
          CPUDOUT   : out   std_logic_vector(15 downto 0);
          CPUWRn    : in    std_logic_vector(1 downto 0) := (others => 'U');
          MEMADDR   : out   std_logic_vector(15 downto 0);
          MEMDIN    : in    std_logic_vector(15 downto 0) := (others => 'U');
          MEMDOUT   : out   std_logic_vector(15 downto 0);
          MEMWRn    : out   std_logic_vector(1 downto 0);
          MSELIN    : in    std_logic_vector(1 downto 0) := (others => 'U');
          OPMODE    : out   std_logic_vector(1 downto 0);
          RTADDRIN  : in    std_logic_vector(4 downto 0) := (others => 'U')
        );
  end component;

  component GND
    port( Y : out   std_logic
        );
  end component;

    signal GND_net, VCC_net : std_logic;

begin 


    \VCC\ : VCC
      port map(Y => VCC_net);
    
    ip_code_0 : CORE1553BRM
      generic map(ACKVAL => 0, BCENABLE => 0, BETIMING => 0,
         ENHANCED => 1, FAMILY => 16, INITFREQ => 24,
         LEGREGS => 1, LOCKFREQ => 1, MTENABLE => 0,
         RTENABLE => 1, WAITVAL => 0)

      port map(ABSTDIN => ABSTDIN, ACTIVE => ACTIVE, ASYNCIF => 
        ASYNCIF, BUSAINEN => BUSAINEN, BUSAINN => BUSAINN, 
        BUSAINP => BUSAINP, BUSAOUTIN => BUSAOUTIN, BUSAOUTN => 
        BUSAOUTN, BUSAOUTP => BUSAOUTP, BUSBINEN => BUSBINEN, 
        BUSBINN => BUSBINN, BUSBINP => BUSBINP, BUSBOUTIN => 
        BUSBOUTIN, BUSBOUTN => BUSBOUTN, BUSBOUTP => BUSBOUTP, 
        BUSRESET => BUSRESET, BUSY => BUSY, CLK => CLK, CMDOK => 
        CMDOK, CMDOKOUT => CMDOKOUT, CMDSTB => CMDSTB, CMDSYNC
         => CMDSYNC, CPUCSn => CPUCSn, CPUDEN => CPUDEN, CPUMEM
         => CPUMEM, CPUMEMEN => CPUMEMEN, CPURDn => CPURDn, 
        CPUWAITn => CPUWAITn, INTACKH => INTACKH, INTACKM => 
        INTACKM, INTLEVEL => INTLEVEL, INTOUTH => INTOUTH, 
        INTOUTM => INTOUTM, LOCKn => LOCKn, MEMACCn => MEMACCn, 
        MEMCEN => MEMCEN, MEMCSn => MEMCSn, MEMDEN => MEMDEN, 
        MEMFAIL => MEMFAIL, MEMGNTn => MEMGNTn, MEMRDn => MEMRDn, 
        MEMREQn => MEMREQn, MEMWAITn => MEMWAITn, MSGSTART => 
        MSGSTART, RSTINn => RSTINn, RSTOUTn => RSTOUTn, RTADDRPIN
         => RTADDRPIN, RTADERR => RTADERR, SSYSFn => SSYSFn, 
        SYNCNOW => SYNCNOW, TCLK => TCLK, CMDVAL(11) => 
        CMDVAL(11), CMDVAL(10) => CMDVAL(10), CMDVAL(9) => 
        CMDVAL(9), CMDVAL(8) => CMDVAL(8), CMDVAL(7) => CMDVAL(7), 
        CMDVAL(6) => CMDVAL(6), CMDVAL(5) => CMDVAL(5), CMDVAL(4)
         => CMDVAL(4), CMDVAL(3) => CMDVAL(3), CMDVAL(2) => 
        CMDVAL(2), CMDVAL(1) => CMDVAL(1), CMDVAL(0) => CMDVAL(0), 
        CPUADDR(15) => CPUADDR(15), CPUADDR(14) => CPUADDR(14), 
        CPUADDR(13) => CPUADDR(13), CPUADDR(12) => CPUADDR(12), 
        CPUADDR(11) => CPUADDR(11), CPUADDR(10) => CPUADDR(10), 
        CPUADDR(9) => CPUADDR(9), CPUADDR(8) => CPUADDR(8), 
        CPUADDR(7) => CPUADDR(7), CPUADDR(6) => CPUADDR(6), 
        CPUADDR(5) => CPUADDR(5), CPUADDR(4) => CPUADDR(4), 
        CPUADDR(3) => CPUADDR(3), CPUADDR(2) => CPUADDR(2), 
        CPUADDR(1) => CPUADDR(1), CPUADDR(0) => CPUADDR(0), 
        CPUDIN(15) => CPUDIN(15), CPUDIN(14) => CPUDIN(14), 
        CPUDIN(13) => CPUDIN(13), CPUDIN(12) => CPUDIN(12), 
        CPUDIN(11) => CPUDIN(11), CPUDIN(10) => CPUDIN(10), 
        CPUDIN(9) => CPUDIN(9), CPUDIN(8) => CPUDIN(8), CPUDIN(7)
         => CPUDIN(7), CPUDIN(6) => CPUDIN(6), CPUDIN(5) => 
        CPUDIN(5), CPUDIN(4) => CPUDIN(4), CPUDIN(3) => CPUDIN(3), 
        CPUDIN(2) => CPUDIN(2), CPUDIN(1) => CPUDIN(1), CPUDIN(0)
         => CPUDIN(0), CPUDOUT(15) => CPUDOUT(15), CPUDOUT(14)
         => CPUDOUT(14), CPUDOUT(13) => CPUDOUT(13), CPUDOUT(12)
         => CPUDOUT(12), CPUDOUT(11) => CPUDOUT(11), CPUDOUT(10)
         => CPUDOUT(10), CPUDOUT(9) => CPUDOUT(9), CPUDOUT(8) => 
        CPUDOUT(8), CPUDOUT(7) => CPUDOUT(7), CPUDOUT(6) => 
        CPUDOUT(6), CPUDOUT(5) => CPUDOUT(5), CPUDOUT(4) => 
        CPUDOUT(4), CPUDOUT(3) => CPUDOUT(3), CPUDOUT(2) => 
        CPUDOUT(2), CPUDOUT(1) => CPUDOUT(1), CPUDOUT(0) => 
        CPUDOUT(0), CPUWRn(1) => CPUWRn(1), CPUWRn(0) => 
        CPUWRn(0), MEMADDR(15) => MEMADDR(15), MEMADDR(14) => 
        MEMADDR(14), MEMADDR(13) => MEMADDR(13), MEMADDR(12) => 
        MEMADDR(12), MEMADDR(11) => MEMADDR(11), MEMADDR(10) => 
        MEMADDR(10), MEMADDR(9) => MEMADDR(9), MEMADDR(8) => 
        MEMADDR(8), MEMADDR(7) => MEMADDR(7), MEMADDR(6) => 
        MEMADDR(6), MEMADDR(5) => MEMADDR(5), MEMADDR(4) => 
        MEMADDR(4), MEMADDR(3) => MEMADDR(3), MEMADDR(2) => 
        MEMADDR(2), MEMADDR(1) => MEMADDR(1), MEMADDR(0) => 
        MEMADDR(0), MEMDIN(15) => MEMDIN(15), MEMDIN(14) => 
        MEMDIN(14), MEMDIN(13) => MEMDIN(13), MEMDIN(12) => 
        MEMDIN(12), MEMDIN(11) => MEMDIN(11), MEMDIN(10) => 
        MEMDIN(10), MEMDIN(9) => MEMDIN(9), MEMDIN(8) => 
        MEMDIN(8), MEMDIN(7) => MEMDIN(7), MEMDIN(6) => MEMDIN(6), 
        MEMDIN(5) => MEMDIN(5), MEMDIN(4) => MEMDIN(4), MEMDIN(3)
         => MEMDIN(3), MEMDIN(2) => MEMDIN(2), MEMDIN(1) => 
        MEMDIN(1), MEMDIN(0) => MEMDIN(0), MEMDOUT(15) => 
        MEMDOUT(15), MEMDOUT(14) => MEMDOUT(14), MEMDOUT(13) => 
        MEMDOUT(13), MEMDOUT(12) => MEMDOUT(12), MEMDOUT(11) => 
        MEMDOUT(11), MEMDOUT(10) => MEMDOUT(10), MEMDOUT(9) => 
        MEMDOUT(9), MEMDOUT(8) => MEMDOUT(8), MEMDOUT(7) => 
        MEMDOUT(7), MEMDOUT(6) => MEMDOUT(6), MEMDOUT(5) => 
        MEMDOUT(5), MEMDOUT(4) => MEMDOUT(4), MEMDOUT(3) => 
        MEMDOUT(3), MEMDOUT(2) => MEMDOUT(2), MEMDOUT(1) => 
        MEMDOUT(1), MEMDOUT(0) => MEMDOUT(0), MEMWRn(1) => 
        MEMWRn(1), MEMWRn(0) => MEMWRn(0), MSELIN(1) => MSELIN(1), 
        MSELIN(0) => MSELIN(0), OPMODE(1) => OPMODE(1), OPMODE(0)
         => OPMODE(0), RTADDRIN(4) => RTADDRIN(4), RTADDRIN(3)
         => RTADDRIN(3), RTADDRIN(2) => RTADDRIN(2), RTADDRIN(1)
         => RTADDRIN(1), RTADDRIN(0) => RTADDRIN(0));
    
    \GND\ : GND
      port map(Y => GND_net);
    

end DEF_ARCH; 
