-- b1553BRM_AHBSlv.vhd
Library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

Entity b1553BRM_AHBSlv is 
  port (
    HRESETn   	: in  std_logic;
    HCLK   		: in  std_logic;
	--1553 signals
	busainen		: out std_logic;		--b1553o.busainen,
	busainp 		: in  std_logic;      	--b1553i.busainp,
	busainn 		: in  std_logic;      	--b1553i.busainn,		
	busbinen 	: out std_logic;     	--b1553o.busbinen,
	busbinp		: in  std_logic;      	--b1553i.busbinp,
	busbinn		: in  std_logic;      	--b1553i.busbinn,		
	busaoutinh 	: out std_logic;  	--b1553o.busaoutinh, 
	busaoutp 	: out std_logic;      --b1553o.busaoutp, 
	busaoutn 	: out std_logic;      --b1553o.busaoutn,		 
	busboutinh	: out std_logic;  	--b1553o.busboutinh, 
	busboutp		: out std_logic;      --b1553o.busboutp, 
	busboutn	 	: out std_logic;      --b1553o.busboutn, 
	--AHB signals
	HWRITE	: in std_logic;
	HSIZE	: in STD_logic_vectOR(2 downto 0);
	HTRANS	: in STd_logic_vecTOR(1 downto 0);
	HWDATA	: in STd_logic_veCTOR(31 downto 0);
	HREADYIN	: in STd_logic;
	HSEL	: in STD_logic;
	HADDR	: in Std_logic_veCTOR(31 downto 0);
	HRDATA	: out sTD_LOgic_vecTOR(31 downto 0);
	HRESP	: out STD_LOGIc_vector(1 downto 0);
	HREADY	: out STD_logic;
	--APB Signals
	PENABLE 	: in  std_logic;                        	-- APB enable
	PSEL 	: in  std_logic;                        	-- APB periph select
	PADDR	: in  std_logic_vector(5 downto 2);     	-- APB address bus
	PWRITE	: in  std_logic;                        	-- APB write
	PWDATA	: in  std_logic_vector(31 downto 0);    	-- APB write data
	PRDATA	: out std_logic_vector(31 downto 0)    	-- APB read data
        
  );
end entity;

Architecture beh of b1553BRM_AHBSlv is

component CORE1553_BRM is
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
end component;

component RAM_1k16_EDAC is
  port (		Add 		: in  std_logic_vector(9 downto 0);
			Rd_Data		: out std_logic_vector(15 downto 0);
			Wr_Data		: in  std_logic_vector(15 downto 0);
			WEN			: in  std_logic;
			REN			: in  std_logic;
			edacdis		: in  std_logic;
			CLK			: in  std_logic;
			resetn		: in  std_logic;
			ERRS_Reset	: in  std_logic; 
			DEDOccFlg	: out std_logic;
			SECOccFlg	: out std_logic
  );
end component;

type memcycletype is (idle, berr, cmd, opwait);

type b1553_ip is record
	CPUWRn    	: std_logic_vector(1 downto 0);
	CPURDn    	: std_logic;
	CPUCSn    	: std_logic;
	CPUMEM    	: std_logic;
	CPUADDR   	: std_logic_vector(15 downto 0);
	CPUDIN    	: std_logic_vector(15 downto 0);
	TCLK	  	: std_logic;
	RSTINn	  	: std_logic;
end record;

type b1553_op is record
	CPUWAITn 	: std_logic;
	INTOUTM		: std_logic;
	RSTOUTn		: std_logic;
	CPUDOUT		: std_logic_vector(15 downto 0);
end record;

type commandRegType is record
	resetin  	 	: std_logic;
	ERRS_Reset   	: std_logic;
	EDAC_Dis   		: std_logic;
end record;

type reg_type is record
  bstate      		: memcycletype;
  command      		: commandRegType;
  reset_comp   		: std_logic;
  INTOUTM      		: std_logic;
  INTOUTM_del  		: std_logic;
  INTOUTM_Flg  		: std_logic;
  Mem_DED_flg_sat  	: std_logic;
  Mem_SEC_flg_sat  	: std_logic;
  CPUWAITn  			: std_logic;
  writeoprn    		: std_logic;
  cpumem      		: std_logic;
  csn				: std_logic;
  wrn		   		: std_logic;
  rdn		   		: std_logic;
  core_addr 			: std_logic_vector(15 downto 0); 
  core_wrdata  		: std_logic_vector(15 downto 0); 
  core_rddata  		: std_logic_vector(15 downto 0);
  TCLK_Cntr  		: std_logic_vector(1 downto 0);
  haddr        		: std_logic_vector(31 downto 0);
  hwrite      		: std_logic;
  hmbsel  	   		: std_logic;
  ready       		: std_logic;
  hresp 			: std_logic_vector(1 downto 0);
end record;


constant b1553_ip_RES: b1553_ip :=(
	CPUWRn    	=> (others=>'0'),				--std_logic_vector(1 downto 0);
	CPURDn    	=> '0',				--std_logic;
	CPUCSn    	=> '0',				--std_logic;
	CPUMEM    	=> '0',				--std_logic;
	CPUADDR   	=> (others=>'0'),				--std_logic_vector(15 downto 0);
	CPUDIN    	=> (others=>'0'),				--std_logic_vector(15 downto 0);
	TCLK	  	=> '0',				--std_logic;
	RSTINn	  	=> '0'			--std_logic;
);

constant commandRegType_RES: commandRegType :=(
	resetin  	=> '1',
	ERRS_Reset 	=> '0',
	EDAC_Dis  	=> '0'
	
);

constant b1553_op_RES: b1553_op :=(
	CPUDOUT     	=> (others=>'0'), 
	CPUWAITn		=> '0',			
	INTOUTM     	=> '0',			
	RSTOUTn		=> '0'
);

constant RES : reg_type := (
  bstate      		=> 	idle		,			--memcycletype;
  command      		=> 	commandRegType_RES,		--commandRegType;
  reset_comp   		=> 	'0'	,					--std_logic;
  INTOUTM      		=> 	'0'	,					--std_logic;
  INTOUTM_del  		=> 	'0'	,					--std_logic;
  Mem_DED_flg_sat  	=> 	'0'	,					--std_logic;
  Mem_SEC_flg_sat  	=> 	'0'	,					--std_logic;
  INTOUTM_Flg  		=> 	'0'	,					--std_logic;
  writeoprn  		=> 	'0'	,					--std_logic;
  CPUWAITn  			=> 	'1'	,					--std_logic;
  cpumem      		=> 	'1'	,					--std_logic;
  csn				=> 	'1'	,					--std_logic;
  wrn		   		=> 	'1'	,					--std_logic;
  rdn		   		=> 	'1'	,					--std_logic;
  core_addr 			=> 	(others=>'0')	,		--std_logic_vector(15 downto 0); 
  core_wrdata  		=> 	(others=>'0')	,		--std_logic_vector(15 downto 0); 
  core_rddata  		=> 	(others=>'0')	,		--std_logic_vector(15 downto 0);
  TCLK_Cntr  		=> 	(others=>'0')	,		--std_logic_vector(1 downto 0);
  haddr        		=> 	(others=>'0')	,		
  hwrite      		=> 	'0'	,					--std_logic;
  hmbsel  	   		=> 	'0'	,					--std_logic;
  ready       		=> 	'1'	,					--std_logic;
  hresp 	   			=> 	(others=>'0')			--std_logic_vector(1 downto 0);  
  );

signal r, ri 			: reg_type;
signal brmcpuo     		: b1553_op;
signal brmcpui     		: b1553_ip;
signal uACTIVE     		: std_logic;
	
signal MEMWRn     		: std_logic_vector(1 downto 0);
signal MEM_WEN     		: std_logic;
signal MEMRDn     		: std_logic;
signal MemAddr     		: std_logic_vector(15 downto 0);
signal MEMDOUT     		: std_logic_vector(15 downto 0);
signal MEMDIN     		: std_logic_vector(15 downto 0);

signal Mem_DED_flg_sat	: std_logic;
signal Mem_SEC_flg_sat	: std_logic;
signal MEM_EDAC_Dis    	: std_logic;
signal ERRS_Reset    	: std_logic;

begin
------------------------------------------------------------------------------
--combinational process
------------------------------------------------------------------------------
ctrl : process(HRESETn, r, brmcpuo, Mem_SEC_flg_sat, Mem_DED_flg_sat)
variable v 			: reg_type;
variable dataout 	: std_logic_vector(31 downto 0);
variable regsd 		: std_logic_vector(31 downto 0); 
variable CPUMEM		: std_logic;
variable haddrsel	: std_logic_vector(15 downto 0);
begin 
------------------------------------------------------------------------------
-- Variable default settings to avoid latches
	v := r;
------------------------------------------------------------------------------
	-- v.core_rddata := brmcpuo.CPUDOUT; 
	v.CPUWAITn := brmcpuo.CPUWAITn; 
	v.TCLK_Cntr := std_logic_vector(UNSIGNED(r.TCLK_Cntr) +1);
------------------------------------------------------------------------------
-- constant HRESP_OKAY:    std_logic_vector(1 downto 0) := "00";
    v.hresp := "00";		
------------------------------------------------------------------------------
	if (HREADYIN='1' and HSEL= '1') then
		v.haddr := HADDR;	
	end if;
	
	v.hwrite := HWRITE and HSEL;
	
	if r.hwrite = '1' then	
		v.core_wrdata	:= HWDATA(15 downto 0);
	elsif r.CPUWAITn = '0' then	
		v.core_wrdata	:= r.core_wrdata;
	end if;
------------------------------------------------------------------------------
--assiging haddrsel variable from haddr
	haddrsel := v.haddr(17 downto 2);
	v.core_addr := haddrsel;
------------------------------------------------------------------------------
--generation CPUMEM
	if v.haddr(19 downto 18) = "00" then
		CPUMEM := '0';
	else
		CPUMEM := '1';
	end if;
	-- CPUMEM := '0' when haddr(19 downto 18) = "00" else '1';
------------------------------------------------------------------------------	
-- control sig gen FSM
--activity to be done depenging upon input r.bstate 
    case r.bstate is
		when idle =>		v.writeoprn := '0';
						v.csn := '1'; 
						v.wrn := '1';
						v.rdn := '1'; 
						v.cpumem := '1';
						v.ready := '1';
						if (((HREADYIN and HSEL and HTRANS(1)) = '1')) and (HSIZE= "010") then
							if HWRITE = '1' then
								v.writeoprn := '1';
							else
								v.writeoprn := '0';
							end if;
							v.bstate := cmd;
							v.ready := '0';
						end if;
						
						
		when berr =>		v.bstate := idle; 
						v.ready := '1';
						v.hresp := "01";--"01":ERROR, "00":OKay, "10":retry, "11":split
						v.csn := '1'; 
						v.wrn := '1';
						v.rdn := '1'; 
						v.cpumem := '1'; 
						v.writeoprn := '0';
						
		when cmd =>		v.bstate := opwait;
						v.ready := '0';
						if r.writeoprn = '1' then
							v.wrn := '0';
							v.rdn := '1';
						else
							v.wrn := '1';
							v.rdn := '0';
						end if;
						v.csn := '0'; 
						v.cpumem := CPUMEM;
						
		when opwait =>	if (brmcpuo.CPUWAITn = '0') then
							v.bstate := opwait;
							v.ready := '0';
						else
							v.bstate := idle; 
							v.ready := '1';
						end if;
						
		when others =>	NULL;
    end case;
------------------------------------------------------------------------------
-- if BUSY cycle seen, or if de-selected, return to idle state
	if (HREADYIN = '1') then
		if ((HSEL) = '0') or (HTRANS = "01")      then --htrans"01":busy
			v.bstate := idle;
			v.ready := '1';
			v.csn := '1'; 
			v.wrn := '1';
			v.rdn := '1'; 
			v.cpumem := '1';
		end if;
    end if;
------------------------------------------------------------------------------
	v.INTOUTM := brmcpuo.INTOUTM;
	v.INTOUTM_del := r.INTOUTM;
	
	if r.INTOUTM_del ='0' and r.INTOUTM = '1' then
		v.INTOUTM_Flg := '1';
	end if;
------------------------------------------------------------------------------
--set reset complete
	if brmcpuo.RSTOUTn = '1' then
		v.reset_comp := '1';
	end if;
	
	if Mem_DED_flg_sat = '1' then
		v.Mem_DED_flg_sat := '1';
	end if;
	
	if Mem_SEC_flg_sat = '1' then
		v.Mem_SEC_flg_sat := '1';
	end if;
------------------------------------------------------------------------------
-- APB register access
------------------------------------------------------------------------------
	regsd := (others => '0'); 	--intialize apb register read
    case PADDR(3 downto 2) is
		when "00" => 	regsd := x"0000000"&'0'& r.command.ERRS_Reset & r.command.EDAC_Dis&r.command.resetin;		--command register
		when "01" => 	regsd := x"0000000"&r.Mem_SEC_flg_sat& r.Mem_DED_flg_sat & r.INTOUTM_Flg&r.reset_comp;		--status register
		when others => 	regsd := (others => '0');
    end case;
    PRDATA <= regsd;
------------------------------------------------------------------------------
    if (PSEL and PENABLE and PWRITE) = '1' then
      case PADDR(5 downto 2) is
		when "0000" =>	v.command.resetin 	:=  PWDATA(0);
						v.command.EDAC_Dis 	:=  PWDATA(1);
						v.command.ERRS_Reset 	:=  PWDATA(2);
		when "0001" =>	v.reset_comp :=  (not PWDATA(0)) and r.reset_comp;	--when 1 is written to this reg intoutflag is cleared
						v.INTOUTM_Flg :=  (not PWDATA(1)) and r.INTOUTM_Flg;	--when 1 is written to this reg intoutflag is cleared
						v.Mem_DED_flg_sat :=  (not PWDATA(2)) and r.Mem_DED_flg_sat;	--when 1 is written to this reg intoutflag is cleared
						v.Mem_SEC_flg_sat :=  (not PWDATA(3)) and r.Mem_SEC_flg_sat;	--when 1 is written to this reg intoutflag is cleared
		when others => null;
      end case;
    end if;
------------------------------------------------------------------------------
-- select appropriate data during reads
	dataout := (others => '0'); 
	if (brmcpuo.CPUWAITn ='1')and (r.rdn = '0') then 
		dataout(15 downto 0) := brmcpuo.CPUDOUT;
    end if;
------------------------------------------------------------------------------       
-- reset
    if (HRESETn = '0') then
		v.cpumem      			:= RES.cpumem       ;
		v.csn				:= RES.csn			 ;
		v.wrn		  		:= RES.wrn		   ;
		v.rdn		  		:= RES.rdn		   ;
		v.core_addr 			:= RES.core_addr 	 ;
		v.core_wrdata 		:= RES.core_wrdata  ;
		v.core_rddata 		:= RES.core_rddata  ;
		v.haddr       			:= RES.haddr        ;
		v.hwrite      			:= RES.hwrite       ;
		v.hmbsel  	  		:= RES.hmbsel  	   ;
		v.ready       			:= RES.ready        ;
		v.hresp 	  			:= RES.hresp 	   ;
		v.TCLK_Cntr 			:= RES.TCLK_Cntr 	   ;
		v.bstate 			:= RES.bstate 	   ;
		v.command.resetin 	:= RES.command.resetin 	   ;
		v.command.EDAC_Dis 	:= RES.command.EDAC_Dis 	   ;
		v.command.ERRS_Reset := RES.command.ERRS_Reset 	   ;
		v.INTOUTM 			:= RES.INTOUTM 	   ;
		v.INTOUTM_del		:= RES.INTOUTM_del 	   ;
		v.INTOUTM_Flg		:= RES.INTOUTM_Flg 	   ;
		v.reset_comp		:= RES.reset_comp 	   ;
		v.Mem_DED_flg_sat	:= RES.Mem_DED_flg_sat 	   ;
		v.Mem_SEC_flg_sat	:= RES.Mem_SEC_flg_sat 	   ;
		v.writeoprn			:= RES.writeoprn 	   ;
		v.CPUWAITn			:= RES.CPUWAITn 	   ;
    end if;
------------------------------------------------------------------------------
--make all undefined dataout(i) to '1'
-- pragma translate_off
    for i in dataout'range loop 
      if is_x(dataout(i)) then 
		dataout(i) := '1'; 
	  end if;
    end loop;
-- pragma translate_on
------------------------------------------------------------------------------
-- drive various register inputs and external outputs
------------------------------------------------------------------------------
    ri <= v;
------------------------------------------------------------------------------    
--1553core input signals mapped
	brmcpui.TCLK    	<= r.TCLK_Cntr(1);
	brmcpui.CPUCSn	<= r.csn ;
	brmcpui.CPUWRn	<= r.wrn& V.wrn;
	brmcpui.CPURDn	<= r.rdn ;
	brmcpui.CPUMEM	<= r.cpumem ;
	brmcpui.CPUADDR	<= r.core_addr ;
	brmcpui.CPUDIN	<= r.core_wrdata ;	
	brmcpui.RSTINn  <= r.command.resetin and HRESETn;
	MEM_EDAC_Dis 	<= r.command.EDAC_Dis;
	ERRS_Reset 		<= r.command.ERRS_Reset;
------------------------------------------------------------------------------    
--ahb slave output signals
	HRDATA 	<= dataout;
	HREADY 	<= r.ready;
	HRESP  	<= r.hresp;
------------------------------------------------------------------------------
end process;
------------------------------------------------------------------------------
--Seqential process
------------------------------------------------------------------------------
stdregs : process(HCLK)
begin
	if rising_edge(HCLK) then
		r <= ri; 
	end if;
end process;
------------------------------------------------------------------------------				
--Core1553BRM;
CORE1553_BRM_0: CORE1553_BRM
port map(
		--bus interface signals
		BUSAINEN   => 	busainen,
		BUSAINP    => 	busainp,
		BUSAINN    => 	busainn,		
		BUSBINEN   => 	busbinen,
		BUSBINP    => 	busbinp,
		BUSBINN    => 	busbinn,		
		BUSAOUTIN  => 	busaoutinh,
		BUSAOUTP   => 	busaoutp,
		BUSAOUTN   => 	busaoutn,		
		BUSBOUTIN  => 	busboutinh,
		BUSBOUTP   => 	busboutp,
		BUSBOUTN   => 	busboutn,
		
		--core setup signals
		LOCKn      => '1',
		RTADDRIN   => "01001",
		RTADDRPIN  => '1',
		RTADERR    => open,
		MSELIN     => "01",
		ABSTDIN    => '0',
		SSYSFn     => '0',
		
		--remote terminal command legalizatoin interface
		CMDVAL     => open,
		CMDSTB     => open,
		CMDOK      => '1',
		CMDOKOUT   => open,
		
		--control and status signals
		CLK        => HCLK,
		TCLK       => brmcpui.TCLK,
		RSTINn     => brmcpui.RSTINn,
		OPMODE     => open,
		INTOUTH    => open,
		INTACKH    => '0',
		INTOUTM    => brmcpuo.INTOUTM,
		INTACKM    => '0',
		
		INTLEVEL   => '0',
		MEMFAIL    => open,
		ACTIVE     => uACTIVE,
		BUSY       => open,
		MSGSTART   => open,
		CMDSYNC    => open,
		SYNCNOW    => open,
		BUSRESET   => open,				
		RSTOUTn    => brmcpuo.RSTOUTn,
		
		--cpu interface
		CPUCSn     => brmcpui.CPUCSn,
		CPUWRn     => brmcpui.CPUWRn,
		CPURDn     => brmcpui.CPURDn,
		CPUWAITn   => brmcpuo.CPUWAITn,
		CPUMEM     => brmcpui.CPUMEM,
		CPUADDR    => brmcpui.CPUADDR,
		CPUDOUT    => brmcpuo.CPUDOUT,
		CPUDIN     => brmcpui.CPUDIN,
		CPUDEN     => open,
		
		--memory interface
		MEMREQn    => open,
		MEMGNTn    => '0',
		MEMACCn    => open,
		MEMWRn     => MEMWRn,
		MEMRDn     => MEMRDn,
		MEMCSn     => open,
		MEMWAITn   => '1',
		MEMADDR    => MemAddr,
		MEMDOUT    => MEMDOUT,
		MEMDIN     => MEMDIN,
		MEMCEN     => open,
		MEMDEN     => open,
		
		--miscellaneous I/O
		CPUMEMEN   => '1',
		ASYNCIF    => '0'
        );
------------------------------------------------------------------------------------------
MEM_WEN <= MEMWRn(0) and MEMWRn(1);
RAM_1k16_EDAC_0: RAM_1k16_EDAC
port map(	Add 			=> MemAddr(9 downto 0),		-- in  std_logic_vector(9 downto 0);
			Rd_Data		=> MEMDIN,					-- out std_logic_vector(15 downto 0);
			Wr_Data		=> MEMDOUT,					-- in  std_logic_vector(15 downto 0);
			WEN			=> MEMWRn(0),				-- in  std_logic;
			REN			=> MEMRDn,					-- in  std_logic;
			edacdis		=> MEM_EDAC_Dis,				-- in  std_logic;
			CLK			=> HCLK,						-- in  std_logic;
			resetn		=> HRESETn,					-- in  std_logic;
			ERRS_Reset	=> ERRS_Reset,				-- in  std_logic; 
			DEDOccFlg	=> Mem_DED_flg_sat,			-- out std_logic;
			SECOccFlg	=> Mem_SEC_flg_sat			-- out std_logic
  );
------------------------------------------------------------------------------------------
end beh;