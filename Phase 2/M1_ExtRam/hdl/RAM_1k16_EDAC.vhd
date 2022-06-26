-- RAM_1k16_EDAC.vhd

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity RAM_1k16_EDAC is
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
end entity;

architecture rtl of RAM_1k16_EDAC is

component ramBlock1kby24 is
    port( WD    : in    std_logic_vector(23 downto 0);
          RD    : out   std_logic_vector(23 downto 0);
          WEN   : in    std_logic;
          REN   : in    std_logic;
          WADDR : in    std_logic_vector(9 downto 0);
          RADDR : in    std_logic_vector(9 downto 0);
          RWCLK : in    std_logic;
          RESET : in    std_logic
        );
end component;

component edac_decoder is
port (	data_in    		: in std_logic_vector(21 downto 0);
		data_out_dec  	: out std_logic_vector(15 downto 0);
		edacdis      	: in std_logic;
	    DED_flg     	: out std_logic;
        SEC_flg  		: out std_logic 
		);
end component;

component edac_encoder is
port (	data_in : in  std_logic_vector(15 downto 0);
		dataEnc_out  : out std_logic_vector(21 downto 0)
		);
end component;

signal Wr_Data_Enc	: std_logic_vector(23 downto 0);
signal Rd_Data_Enc	: std_logic_vector(23 downto 0);
signal Rd_Data_Err	: std_logic_vector(21 downto 0);
signal DED_flg		: std_logic;
signal SEC_flg		: std_logic;

begin
----------------------------------------------------------------------------------
--encode 
edac_encoder_0: edac_encoder
port map(	data_in 		=> Wr_Data,
			dataEnc_out	=> Wr_Data_Enc(21 downto 0)
		);
Wr_Data_Enc(23 downto 22) <= "00";
----------------------------------------------------------------------------------
--RAM BLOCK
ramBlock1kby24_0: ramBlock1kby24
 port map( 
		WD    	=> Wr_Data_Enc,			--in    std_logic_vector(23 downto 0);
		RD    	=> Rd_Data_Enc,			--out   std_logic_vector(23 downto 0);
		WEN   	=> WEN,			--in    std_logic;
		REN   	=> REN,			--in    std_logic;
		WADDR 	=> Add,			--in    std_logic_vector(9 downto 0);
		RADDR 	=> Add,			--in    std_logic_vector(9 downto 0);
		RWCLK 	=> CLK,			--in    std_logic;
		RESET 	=> resetn			--in    std_logic
        );
 Rd_Data_Err <= Rd_Data_Enc(21 downto 0);
----------------------------------------------------------------------------------
--decoder
edac_decoder_0: edac_decoder
port map(	data_in    		=> Rd_Data_Err,
			data_out_dec  	=> Rd_Data,
			edacdis      		=> edacdis,
			DED_flg     		=> DED_flg,
			SEC_flg  		=> SEC_flg
		);
-----------------------------------------------------
--sec ded counters
process(resetn, CLK)
begin
	if resetn = '0' then
		SECOccFlg <= '0';
		DEDOccFlg <= '0';
	elsif rising_edge(CLK) then
		if ERRS_Reset = '1'  or edacdis = '1' then
			SECOccFlg <= '0';
			DEDOccFlg <= '0';
		elsif REN = '0'then
			if SEC_flg = '1' then
				SECOccFlg <= '1';
			end if;
			if DED_flg = '1' then
				DEDOccFlg <= '1';
			end if;	
		end if;
	end if;
end process;
----------------------------------------------------------------------------------
end rtl;