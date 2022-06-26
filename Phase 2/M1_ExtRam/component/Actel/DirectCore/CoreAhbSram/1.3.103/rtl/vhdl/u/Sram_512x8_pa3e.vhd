--*************************************************************************/
--*                                                                       */
--*                    Copyright: Actel Corporation                       */
--*************************************************************************/
--*                                                                       */
--*        Project Name :                                                 */
--*                                                                       */
--*        Module Name :            Sram_512x8                            */
--*                                                                       */
--*        Written by :             CM                                    */
--*                                                                       */
--*************************************************************************/
--*                                                                       */
--*                                                                       */
--*        Brief Description :                                            */
--*                                                                       */
--*        Associated files :                                             */
--*                                                                       */
--*                                                                       */
--*************************************************************************/

library ieee;
    use ieee.std_logic_1164.all;

ENTITY Sram_512x8 IS
    PORT (
        -- ---------------------------------------------------------------------
        -- Parameters
        -- ---------------------------------------------------------------------
        -- ---------------------------------------------------------------------
        -- Port declarations
        -- ---------------------------------------------------------------------
        -- AhbFabric interface
        -- Inputs
        writeData               : IN std_logic_vector(7 DOWNTO 0);
        -- Output
        readData                : OUT std_logic_vector(7 DOWNTO 0);

        -- AhbSramIf interface
        -- Inputs
        sramWEN                 : IN std_logic;
        sramREN                 : IN std_logic;
        writeAddr               : IN std_logic_vector(8 DOWNTO 0);
        readAddr                : IN std_logic_vector(8 DOWNTO 0);
        HCLK                    : IN std_logic;
        HRESETn                 : IN std_logic);
END Sram_512x8;

library ieee;
    use ieee.std_logic_1164.all;
library proasic3e;

ARCHITECTURE structural OF Sram_512x8 IS

    COMPONENT RAM4K9
    port (
      ADDRA11       : IN STD_ULOGIC;
      ADDRA10       : IN STD_ULOGIC;
      ADDRA9        : IN STD_ULOGIC;
      ADDRA8        : IN STD_ULOGIC;
      ADDRA7        : IN STD_ULOGIC;
      ADDRA6        : IN STD_ULOGIC;
      ADDRA5        : IN STD_ULOGIC;
      ADDRA4        : IN STD_ULOGIC;
      ADDRA3        : IN STD_ULOGIC;
      ADDRA2        : IN STD_ULOGIC;
      ADDRA1        : IN STD_ULOGIC;
      ADDRA0        : IN STD_ULOGIC;
      ADDRB11       : IN STD_ULOGIC;
      ADDRB10       : IN STD_ULOGIC;
      ADDRB9        : IN STD_ULOGIC;
      ADDRB8        : IN STD_ULOGIC;
      ADDRB7        : IN STD_ULOGIC;
      ADDRB6        : IN STD_ULOGIC;
      ADDRB5        : IN STD_ULOGIC;
      ADDRB4        : IN STD_ULOGIC;
      ADDRB3        : IN STD_ULOGIC;
      ADDRB2        : IN STD_ULOGIC;
      ADDRB1        : IN STD_ULOGIC;
      ADDRB0        : IN STD_ULOGIC;
      DINA8         : IN STD_ULOGIC;
      DINA7         : IN STD_ULOGIC;
      DINA6         : IN STD_ULOGIC;
      DINA5         : IN STD_ULOGIC;
      DINA4         : IN STD_ULOGIC;
      DINA3         : IN STD_ULOGIC;
      DINA2         : IN STD_ULOGIC;
      DINA1         : IN STD_ULOGIC;
      DINA0         : IN STD_ULOGIC;
      DINB8         : IN STD_ULOGIC;
      DINB7         : IN STD_ULOGIC;
      DINB6         : IN STD_ULOGIC;
      DINB5         : IN STD_ULOGIC;
      DINB4         : IN STD_ULOGIC;
      DINB3         : IN STD_ULOGIC;
      DINB2         : IN STD_ULOGIC;
      DINB1         : IN STD_ULOGIC;
      DINB0         : IN STD_ULOGIC;
      WIDTHA1       : IN STD_ULOGIC;
      WIDTHA0       : IN STD_ULOGIC;
      WIDTHB1       : IN STD_ULOGIC;
      WIDTHB0       : IN STD_ULOGIC;
      PIPEA         : IN STD_ULOGIC;
      PIPEB         : IN STD_ULOGIC;
      WMODEA        : IN STD_ULOGIC;
      WMODEB        : IN STD_ULOGIC;
      BLKA          : IN STD_ULOGIC;
      BLKB          : IN STD_ULOGIC;
      WENA          : IN STD_ULOGIC;
      WENB          : IN STD_ULOGIC;
      CLKA          : IN STD_ULOGIC;
      CLKB          : IN STD_ULOGIC;
      RESET         : IN STD_ULOGIC;
      DOUTA8        : OUT STD_ULOGIC;
      DOUTA7        : OUT STD_ULOGIC;
      DOUTA6        : OUT STD_ULOGIC;
      DOUTA5        : OUT STD_ULOGIC;
      DOUTA4        : OUT STD_ULOGIC;
      DOUTA3        : OUT STD_ULOGIC;
      DOUTA2        : OUT STD_ULOGIC;
      DOUTA1        : OUT STD_ULOGIC;
      DOUTA0        : OUT STD_ULOGIC;
      DOUTB8        : OUT STD_ULOGIC;
      DOUTB7        : OUT STD_ULOGIC;
      DOUTB6        : OUT STD_ULOGIC;
      DOUTB5        : OUT STD_ULOGIC;
      DOUTB4        : OUT STD_ULOGIC;
      DOUTB3        : OUT STD_ULOGIC;
      DOUTB2        : OUT STD_ULOGIC;
      DOUTB1        : OUT STD_ULOGIC;
      DOUTB0        : OUT STD_ULOGIC
     );

    END COMPONENT;

    -- ---------------------------------------------------------------------
    -- Signal declarations
    -- ---------------------------------------------------------------------
    signal BLKA         :  std_logic;
    signal BLKB         :  std_logic;

BEGIN
    BLKA <= NOT sramWEN;
    BLKB <= NOT sramREN;

    block_row0 : RAM4K9
        PORT MAP (
            ADDRA11 => '0',
            ADDRA10 => '0',
            ADDRA9 => '0',
            ADDRA8 => writeAddr(8),
            ADDRA7 => writeAddr(7),
            ADDRA6 => writeAddr(6),
            ADDRA5 => writeAddr(5),
            ADDRA4 => writeAddr(4),
            ADDRA3 => writeAddr(3),
            ADDRA2 => writeAddr(2),
            ADDRA1 => writeAddr(1),
            ADDRA0 => writeAddr(0),
            ADDRB11 => '0',
            ADDRB10 => '0',
            ADDRB9 => '0',
            ADDRB8 => readAddr(8),
            ADDRB7 => readAddr(7),
            ADDRB6 => readAddr(6),
            ADDRB5 => readAddr(5),
            ADDRB4 => readAddr(4),
            ADDRB3 => readAddr(3),
            ADDRB2 => readAddr(2),
            ADDRB1 => readAddr(1),
            ADDRB0 => readAddr(0),
            DINA8 => '0',
            DINA7 => writeData(7),
            DINA6 => writeData(6),
            DINA5 => writeData(5),
            DINA4 => writeData(4),
            DINA3 => writeData(3),
            DINA2 => writeData(2),
            DINA1 => writeData(1),
            DINA0 => writeData(0),
            DINB8 => '0',
            DINB7 => '0',
            DINB6 => '0',
            DINB5 => '0',
            DINB4 => '0',
            DINB3 => '0',
            DINB2 => '0',
            DINB1 => '0',
            DINB0 => '0',
            WIDTHA0 => '1',
            WIDTHA1 => '1',
            WIDTHB0 => '1',
            WIDTHB1 => '1',
            PIPEA => '0',
            PIPEB => '0',
            WMODEA => '0',
            WMODEB => '0',
            BLKA => BLKA,
            BLKB => BLKB,
            WENA => '0',
            WENB => '1',
            CLKA => HCLK,
            CLKB => HCLK,
            RESET => HRESETn,
            DOUTA8 => open,
            DOUTA7 => open,
            DOUTA6 => open,
            DOUTA5 => open,
            DOUTA4 => open,
            DOUTA3 => open,
            DOUTA2 => open,
            DOUTA1 => open,
            DOUTA0 => open,
            DOUTB8 => open,
            DOUTB7 => readData(7),
            DOUTB6 => readData(6),
            DOUTB5 => readData(5),
            DOUTB4 => readData(4),
            DOUTB3 => readData(3),
            DOUTB2 => readData(2),
            DOUTB1 => readData(1),
            DOUTB0 => readData(0));

END structural;
