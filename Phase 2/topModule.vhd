-- topModule.vhd
library ieee;
use ieee.std_logic_1164.all;

entity topModule is

    port( 

1553BUSIN0					:IN		std_logic;					-- 176	IN	Passive
1553BUSIN1					:IN		std_logic;					-- 175	IN	Passive
1553BUSIN2					:IN		std_logic;					-- 174	IN	Passive
1553BUSIN3					:IN		std_logic;					-- 173	IN	Passive
1553BUSOUT0					:OUT	std_logic;					-- 185	OUT	Passive
1553BUSOUT1					:OUT	std_logic;					-- 184	OUT	Passive
1553BUSOUT2					:OUT	std_logic;					-- 183	OUT	Passive
1553BUSOUT3					:OUT	std_logic;					-- 182	OUT	Passive
1553BUSOUT4					:OUT	std_logic;					-- 181	OUT	Passive
1553BUSOUT5					:OUT	std_logic;					-- 180	OUT	Passive
1553BUSOUT6					:OUT	std_logic;					-- 179	OUT	Passive
1553BUSOUT7					:OUT	std_logic;					-- 177	OUT	Passive
A0							:OUT	std_logic;					-- 139	OUT	Passive
A1							:OUT	std_logic;					-- 136	OUT	Passive
CLK48MHZ					:IN		std_logic;					-- 163	IN	Passive
COMMANDS0					:IN		std_logic;					-- 5	IN	Passive
COMMANDS1					:IN		std_logic;					-- 9	IN	Passive
COMMANDS2					:IN		std_logic;					-- 12	IN	Passive
COMMANDS3					:IN		std_logic;					-- 13	IN	Passive
COMMANDS4					:IN		std_logic;					-- 14	IN	Passive
COMMANDS5					:IN		std_logic;					-- 7	IN	Passive
CTL10						:IN		std_logic;					-- 132	IN	Passive
CTL9						:IN		std_logic;					-- 127	IN	Passive
DESERENBFPGA				:OUT	std_logic;					-- 193	OUT	Passive
DQ0							:IN		std_logic;					-- 144	IN	Passive
DQ1							:IN		std_logic;					-- 145	IN	Passive
DQ10						:IN		std_logic;					-- 117	IN	Passive
DQ11						:IN		std_logic;					-- 124	IN	Passive
DQ12						:IN		std_logic;					-- 128	IN	Passive
DQ13						:IN		std_logic;					-- 134	IN	Passive
DQ14						:IN		std_logic;					-- 137	IN	Passive
DQ15						:IN		std_logic;					-- 143	IN	Passive
DQ16						:IN		std_logic;					-- 34	IN	Passive
DQ17						:IN		std_logic;					-- 33	IN	Passive
DQ18						:IN		std_logic;					-- 32	IN	Passive
DQ19						:IN		std_logic;					-- 31	IN	Passive
DQ2							:IN		std_logic;					-- 146	IN	Passive
DQ20						:IN		std_logic;					-- 28	IN	Passive
DQ21						:IN		std_logic;					-- 22	IN	Passive
DQ22						:IN		std_logic;					-- 188	IN	Passive
DQ23						:IN		std_logic;					-- 48	IN	Passive
DQ24						:IN		std_logic;					-- 47	IN	Passive
DQ25						:IN		std_logic;					-- 45	IN	Passive
DQ26						:IN		std_logic;					-- 42	IN	Passive
DQ27						:IN		std_logic;					-- 37	IN	Passive
DQ28						:IN		std_logic;					-- 26	IN	Passive
DQ29						:IN		std_logic;					-- 23	IN	Passive
DQ3							:IN		std_logic;					-- 147	IN	Passive
DQ30						:IN		std_logic;					-- 11	IN	Passive
DQ31						:IN		std_logic;					-- 8	IN	Passive
DQ4							:IN		std_logic;					-- 148	IN	Passive
DQ5							:IN		std_logic;					-- 149	IN	Passive
DQ6							:IN		std_logic;					-- 150	IN	Passive
DQ7							:IN		std_logic;					-- 151	IN	Passive
DQ8							:IN		std_logic;					-- 152	IN	Passive
DQ9							:IN		std_logic;					-- 113	IN	Passive
FLAGA						:IN		std_logic;					-- 153	IN	Passive
FLAGB						:IN		std_logic;					-- 159	IN	Passive
FLAGC						:IN		std_logic;					-- 112	IN	Passive
FLAGD						:IN		std_logic;					-- 121	IN	Passive
GPIO45						:IN		std_logic;					-- 30	IN	Passive
GPIO57_I2S-MCLK_VIO3_SW		:IN		std_logic;					-- 46	IN	Passive
I2C_SCL_FX3					:IN		std_logic;					-- 118	IN	Passive
I2C_SDA_FX3					:IN		std_logic;					-- 119	IN	Passive
I2S_CLK						:OUT	std_logic;					-- 44	OUT	Passive
I2S_SD						:IN		std_logic;					-- 49	IN	Passive
I2S_WS						:IN		std_logic;					-- 38	IN	Passive
INT_N_CTL15					:IN		std_logic;					-- 4	IN	Passive
LVDSDESERENBFPGA			:OUT	std_logic;					-- 206	OUT	Passive
LVDSENBFPGA					:OUT	std_logic;					-- 190	OUT	Passive
LVDSRXENB					:IN		std_logic;					-- 20	IN	Passive
LVDSTXENB					:OUT	std_logic;					-- 199	OUT	Passive
LVPBCLK						:OUT	std_logic;					-- 19	OUT	Passive
LVPBDATA0					:IN		std_logic;					-- 56	IN	Passive
LVPBDATA1					:IN		std_logic;					-- 55	IN	Passive
LVPBDATA2					:IN		std_logic;					-- 69	IN	Passive
M_DESERENB					:OUT	std_logic;					-- 198	OUT	Passive
PBCLK						:OUT	std_logic;					-- 201	OUT	Passive
PBCLKIN						:IN		std_logic;					-- 99	IN	Passive
PBDATA0						:IN		std_logic;					-- 98	IN	Passive
PBDATA1						:IN		std_logic;					-- 74	IN	Passive
PBDATA10					:IN		std_logic;					-- 84	IN	Passive
PBDATA11					:IN		std_logic;					-- 85	IN	Passive
PBDATA12					:IN		std_logic;					-- 86	IN	Passive
PBDATA13					:IN		std_logic;					-- 87	IN	Passive
PBDATA14					:IN		std_logic;					-- 90	IN	Passive
PBDATA15					:IN		std_logic;					-- 91	IN	Passive
PBDATA16					:IN		std_logic;					-- 92	IN	Passive
PBDATA17					:IN		std_logic;					-- 93	IN	Passive
PBDATA18					:IN		std_logic;					-- 94	IN	Passive
PBDATA19					:IN		std_logic;					-- 95	IN	Passive
PBDATA2						:IN		std_logic;					-- 75	IN	Passive
PBDATA20					:IN		std_logic;					-- 96	IN	Passive
PBDATA3						:IN		std_logic;					-- 76	IN	Passive
PBDATA4						:IN		std_logic;					-- 77	IN	Passive
PBDATA5						:IN		std_logic;					-- 78	IN	Passive
PBDATA6						:IN		std_logic;					-- 79	IN	Passive
PBDATA7						:IN		std_logic;					-- 80	IN	Passive
PBDATA8						:IN		std_logic;					-- 82	IN	Passive
PBDATA9						:IN		std_logic;					-- 83	IN	Passive
PBLVDSENBFPGA				:OUT	std_logic;					-- 205	OUT	Passive
PBREQ						:IN		std_logic;					-- 15	IN	Passive
PCLK						:IN		std_logic;					-- 135	IN	Passive
PKTENDN						:IN		std_logic;					-- 116	IN	Passive
PMODE_0						:IN		std_logic;					-- 24	IN	Passive
PMODE_1						:IN		std_logic;					-- 21	IN	Passive
PMODE_2						:IN	  	std_logic;					-- 10	IN	Passive
POWERON						:IN	  	std_logic;					-- 114	IN	Passive
RECCLK						:OUT	std_logic;	  				-- 168	OUT	Passive
RECDATA0					:OUT	std_logic;	  				-- 64	OUT	Passive
RECDATA1					:OUT	std_logic;	  				-- 66	OUT	Passive
RECDATA10					:OUT	std_logic;	  				-- 204	OUT	Passive
RECDATA11					:OUT	std_logic;	  				-- 203	OUT	Passive
RECDATA12					:OUT	std_logic;	  				-- 202	OUT	Passive
RECDATA13					:OUT	std_logic;	  				-- 197	OUT	Passive
RECDATA14					:OUT	std_logic;	  				-- 196	OUT	Passive
RECDATA15					:OUT	std_logic;					-- 194	OUT	Passive
RECDATA16					:OUT	std_logic;					-- 192	OUT	Passive
RECDATA17					:OUT	std_logic;					-- 191	OUT	Passive
RECDATA18					:OUT	std_logic;					-- 189	OUT	Passive
RECDATA19					:OUT	std_logic;					-- 167	OUT	Passive
RECDATA2					:OUT	std_logic;					-- 67	OUT	Passive
RECDATA20					:OUT	std_logic;					-- 166	OUT	Passive
RECDATA3					:OUT	std_logic;					-- 68	OUT	Passive
RECDATA4					:OUT	std_logic;					-- 58	OUT	Passive
RECDATA5					:OUT	std_logic;	  				-- 57	OUT	Passive
RECDATA6					:OUT	std_logic;					-- 59	OUT	Passive
RECDATA7					:OUT	std_logic;					-- 60	OUT	Passive
RECDATA8					:OUT	std_logic;					-- 61	OUT	Passive
RECDATA9					:OUT	std_logic;					-- 63	OUT	Passive
SERENB						:OUT	std_logic;					-- 169	OUT	Passive
SLCSN						:IN		std_logic;					-- 125	IN	Passive
SLOEN						:IN		std_logic;					-- 120	IN	Passive
SLRDN						:IN		std_logic;					-- 115	IN	Passive
SLWRN						:IN		std_logic;					-- 138	IN	Passive
SPECIAL						:OUT	std_logic;					-- 6	OUT	Passive
SPI-MISO_UART-TX			:OUT	std_logic;					-- 43	OUT	Passive
SPI-MOSI_UART-RX			:IN		std_logic;					-- 39	IN	Passive
SPI-SCK_UART-RTS			:IN		std_logic;					-- 35	IN	Passive
SPI-SSN_UART-CTS			:IN		std_logic;					-- 160	IN	Passive
Unused_126					:IN		std_logic;					-- 126	IN	Passive
Unused_129					:IN		std_logic;					-- 129	IN	Passive
Unused_161					:IN		std_logic;					-- 161	IN	Passive
Unused_164					:IN		std_logic;					-- 164	IN	Passive
Unused_165					:IN		std_logic;					-- 165	IN	Passive
Unused_172					:IN		std_logic;					-- 172	IN	Passive
Unused_70					:IN		std_logic;					-- 70	IN	Passive
Unused_73					:IN		std_logic					-- 73	IN	Passive

);
end entity;

architecture beh of topModule is
----------------------------------------
--add constants here
----------------------------------------
--add components here
----------------------------------------
--add signals here
begin
----------------------------------------
--add code here
----------------------------------------
 --add code here
----------------------------------------

end beh;