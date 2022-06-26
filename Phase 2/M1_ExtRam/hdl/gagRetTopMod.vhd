--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: gagRetTopMod.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::ProASIC3E> <Die::M1A3PE3000> <Package::208 PQFP>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

library proasic3e;
use proasic3e.all;

entity gagRetTopMod is
port (
	POWERON						:IN	  	std_logic;					-- 114	Passive
	CLK48MHZ						:IN		std_logic;					-- 163	
	--1553 interfaceS
	Sig1553BUSIN0					:IN		std_logic;					-- 176	IN	Passive
	Sig1553BUSIN1					:IN		std_logic;					-- 175	IN	Passive
	Sig1553BUSIN2					:IN		std_logic;					-- 174	IN	Passive
	Sig1553BUSIN3					:IN		std_logic;					-- 173	IN	Passive
	Sig1553BUSOUT0					:OUT	std_logic;					-- 185	OUT	Passive
	Sig1553BUSOUT1					:OUT	std_logic;					-- 184	OUT	Passive
	Sig1553BUSOUT2					:OUT	std_logic;					-- 183	OUT	Passive
	Sig1553BUSOUT3					:OUT	std_logic;					-- 182	OUT	Passive
	Sig1553BUSOUT4					:OUT	std_logic;					-- 181	OUT	Passive
	Sig1553BUSOUT5					:OUT	std_logic;					-- 180	OUT	Passive
	Sig1553BUSOUT6					:OUT	std_logic;					-- 179	OUT	Passive
	Sig1553BUSOUT7					:OUT	std_logic;					-- 177	OUT	Passive
	--Playback interface deserialiser
	LVDSTXENB					:OUT	std_logic;					-- 199	--internal enable to lvds tx u7
	PBLVDSENBFPGA				:OUT	std_logic;					-- 205	--4050 i/p
	PBCLK						:OUT	std_logic;					-- 201	
	PBREQ						:OUT	std_logic;					-- 15	
	
	DESERENBFPGA				:IN		std_logic;					-- 193	--4050 o/p
	M_DESERENB					:OUT	std_logic;					-- 198	--internal enable to deser
	PBCLKIN						:IN		std_logic;					-- 99	
	PBDATA						:IN		std_logic_vector(20 downto 0);	
	--Record interface serialiser
	RECCLK						:OUT	std_logic;	  				-- 168	
	RECDATA						:OUT	std_logic_vector(20 downto 0);	
	SERENB						:OUT	std_logic;					-- 169	--internal enable to ser
	--lVDS Interface
	LVDSENBFPGA					:IN		std_logic;					-- 190	--4050 o/p
	LVDSDESERENBFPGA				:OUT	std_logic;					-- 206	--4050 i/p
	
	LVDSRXENB					:IN		std_logic;					-- 20	--internal enable to lvds rx u8
	LVPBCLK						:OUT	std_logic;					-- 19	--lvds clock out
	LVPBDATA0					:OUT	std_logic;				-- 56	--lvds data out
	LVPBDATA1					:OUT	std_logic;				-- 55	--lvds data out
	LVPBDATA2					:OUT	std_logic;				-- 69   --lvds data out
	--FX3 I2C interface
	I2C_SCL_FX3					:IN		std_logic;					-- 118	
	I2C_SDA_FX3					:IN		std_logic;					-- 119	
	--FX3 I2S interface
	I2S_CLK						:IN		std_logic;						-- 44	
	I2S_SD						:IN		std_logic;					-- 49	
	I2S_W						:IN		std_logic;					-- 38	
	GPIO57_I2S_MCLK_VIO3_SW		:IN		std_logic;					-- 46	
	--FX3 Slave Interface
	PCLK						:OUT	std_logic;					-- 135	
	FLAGA						:IN		std_logic;					-- 153	
	FLAGB						:IN		std_logic;					-- 159	
	FLAGC						:IN		std_logic;					-- 112	
	FLAGD						:IN		std_logic;					-- 121	
	PKTENDN						:OUT	std_logic;					-- 116
	SLCSN						:OUT	std_logic;					-- 125	
	SLOEN						:OUT	std_logic;					-- 120	
	SLRDN						:OUT	std_logic;					-- 115	
	SLWRN						:OUT	std_logic;					-- 138	
	A1_0						:OUT	std_logic_vector(1 downto 0);	-- 136, 139	
	DQ							:INOUT	std_logic_vector(31 downto 0);	
	--FX3 spi link
	SPI_MISO_UART_TX			:OUT	std_logic;					-- 43	
	SPI_MOSI_UART_RX				:IN		std_logic;					-- 39	
	SPI_SCK_UART_RTS				:IN		std_logic;					-- 35	
	SPI_SSN_UART_CTS			:IN		std_logic;					-- 160	
	--FX3 interface
	PMODE						:IN		std_logic_vector(2 downto 0);	-- 10, 21, 24		
	SPECIAL						:IN		std_logic;					-- 6	
	CTL10						:IN		std_logic;					-- 132	
	CTL9						:IN		std_logic;					-- 127	
	GPIO45						:IN		std_logic;					-- 30	
	INT_N_CTL15					:IN		std_logic;					-- 4	
	--conenctor K2 pins
	COMMANDS0					:IN		std_logic;					-- 5	
	COMMANDS1					:IN		std_logic;					-- 9	
	COMMANDS2					:IN		std_logic;					-- 12	
	COMMANDS3					:IN		std_logic;					-- 13	
	COMMANDS4					:IN		std_logic;					-- 14	
	COMMANDS5					:IN		std_logic;					-- 7	
	--unused pins
	Unused_129					: out		std_logic;					-- 129	
	Unused_161					: out		std_logic;					-- 161	
	Unused_164					: out		std_logic;					-- 164	
	Unused_165					: out		std_logic;					-- 165	
	Unused_172					: out		std_logic;					-- 172	
	Unused_70					:INOUT	std_logic;					-- 70	
	Unused_73					:INOUT	std_logic;					-- 73	
	--jtag pins	
	TCK  						:IN		std_logic;
	TDI  						:IN		std_logic;
	TMS  						:IN		std_logic;
	nTRST						:IN		std_logic;
	TDO							:OUT	std_logic
);
end gagRetTopMod;


architecture architecture_gagRetTopMod of gagRetTopMod is
----------------------------------------
--add constants here
----------------------------------------
--add components here
component M1Proc is
port (
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
end component;


component CLKINT
 port
  (	Y : OUT STD_LOGIC;
	A : in STD_LOGIC
   );
end component;

----------------------------------------
--add signals here
signal GPIO_in 			: std_logic_vector(1 downto 0) ;
signal GPIO_OUT 			: std_logic_vector(1 downto 0) ;
signal GPIO_CE 			: std_logic_vector(1 downto 0) ;
signal clock24_s	 		: std_logic; 
signal clock24_int	 	: std_logic; 
signal rstn		 		: std_logic ;

begin
----------------------------------------
--reset generate
rstn <= POWERON;
----------------------------------------
Unused_129	<=  '1' when DQ=x"FFFFFFFF"  else '0';
Unused_161	<=  (not POWERON);
Unused_164	<=  I2C_SCL_FX3 or I2C_SDA_FX3 or I2S_CLK  or I2S_SD or I2S_W or GPIO57_I2S_MCLK_VIO3_SW;
Unused_165	<=  PMODE(0) or PMODE(1) or PMODE(2)  or SPECIAL  or CTL10  or CTL9  or GPIO45 or INT_N_CTL15;
Unused_172	<=  COMMANDS0 or COMMANDS1 or COMMANDS2 or COMMANDS3 or COMMANDS4 or COMMANDS5;
----------------------------------------
--playback interface
LVDSTXENB		<='0';
PBLVDSENBFPGA	<='0';
PBCLK			<='0';
PBREQ			<='0';
M_DESERENB <= DESERENBFPGA and PBCLKIN when PBDATA="000000000000000000000" else '0';
----------------------------------------
--record data interface
RECCLK <= clock24_int;
RECDATA <= (others=>'0');
SERENB<=DESERENBFPGA;
----------------------------------------
--lvds interface
LVDSDESERENBFPGA <= LVDSENBFPGA;
LVPBCLK	 <= clock24_int and LVDSRXENB;
LVPBDATA0 <= '0';		
LVPBDATA1 <= '0';		
LVPBDATA2 <= '0';		
----------------------------------------
--slave interface
PCLK	<= clock24_int;	
PKTENDN	<= FLAGA or FLAGB or FLAGC or FLAGD;	
SLCSN	<= FLAGA or FLAGB or FLAGC or FLAGD;		
SLOEN	<= FLAGA or FLAGB or FLAGC or FLAGD;		
SLRDN	<= FLAGA or FLAGB or FLAGC or FLAGD;		
SLWRN	<= FLAGA or FLAGB or FLAGC or FLAGD;		
A1_0	<= (others=>'0');
-- DQ	
----------------------------------------
--spi link
SPI_MISO_UART_TX <=   SPI_MOSI_UART_RX or SPI_SCK_UART_RTS or SPI_SSN_UART_CTS;
----------------------------------------
--clock generation
process(rstn, CLK48MHZ)
begin
	if rstn='0' then
		clock24_s<='0';
	elsif rising_edge(CLK48MHZ) then
		clock24_s <= not clock24_s;
	end if;
end process;
CLKLINT_2 : CLKINT 
	port map (
		Y => clock24_int,
		A => clock24_s 
	);
----------------------------------------
--processor core
M1Proc_0: M1Proc
port map(
        GPIO_N    		=> GPIO_in,			-- in    std_logic_vector(1 downto 0);
        NSYSRESET  		=> rstn,			-- in    std_logic;
        SYSCLK    		=> clock24_int,		-- in    std_logic;
        TCK        		=> TCK  ,			-- in    std_logic;
        TDI        		=> TDI  ,			-- in    std_logic;
        TMS        		=> TMS  ,			-- in    std_logic;
        busainn   		=> Sig1553BUSIN1,	-- in  std_logic;
        busainp   		=> Sig1553BUSIN0,	-- in  std_logic;
        busbinn   		=> Sig1553BUSIN3,	-- in  std_logic;
        busbinp   		=> Sig1553BUSIN2,	-- in  std_logic;
        nTRST 			=> nTRST,			-- in    std_logic;
        GPIO_CE    		=> GPIO_CE,			-- out   std_logic_vector(1 downto 0);
        GPIO_OUT   		=> GPIO_OUT,		-- out   std_logic_vector(1 downto 0);
        INT        		=> open,			-- out   std_logic_vector(1 downto 0);
        TDO				=> TDO,			-- out   std_logic
		busainen   		=> Sig1553BUSOUT0,		-- out std_logic;
        busaoutinh 		=> Sig1553BUSOUT1,		-- out std_logic;
        busaoutn   		=> Sig1553BUSOUT3,		-- out std_logic;
        busaoutp   		=> Sig1553BUSOUT2,		-- out std_logic;
        busbinen   		=> Sig1553BUSOUT4,		-- out std_logic;
        busboutinh 		=> Sig1553BUSOUT5,		-- out std_logic;
        busboutn   		=> Sig1553BUSOUT7,		-- out std_logic;
        busboutp   		=> Sig1553BUSOUT6		-- out std_logic;
        );
Unused_70 <= GPIO_OUT(0) when GPIO_CE(0)='0' else 'Z';
Unused_73 <= GPIO_OUT(1) when GPIO_CE(1)='0' else 'Z';
GPIO_in(0) <= Unused_70;
GPIO_in(1) <= Unused_73;
----------------------------------------
end architecture_gagRetTopMod;