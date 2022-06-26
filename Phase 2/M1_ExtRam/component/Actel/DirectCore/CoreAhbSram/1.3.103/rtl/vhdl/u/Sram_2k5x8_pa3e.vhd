--*************************************************************************/
--*                                                                       */
--*                    Copyright: Actel Corporation                       */
--*************************************************************************/
--*                                                                       */
--*        Project Name :                                                 */
--*                                                                       */
--*        Module Name :            Sram_2k5x8                            */
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

ENTITY Sram_2k5x8 IS
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
        writeAddr               : IN std_logic_vector(11 DOWNTO 0);
        readAddr                : IN std_logic_vector(11 DOWNTO 0);
        HCLK                    : IN std_logic;
        HRESETn                 : IN std_logic);
END Sram_2k5x8;

library ieee;
    use ieee.std_logic_1164.all;
library proasic3e;

ARCHITECTURE structural OF Sram_2k5x8 IS

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
    -- Constant declarations
    -- ---------------------------------------------------------------------
    -- ---------------------------------------------------------------------
    -- Signal declarations
    -- ---------------------------------------------------------------------
    SIGNAL sramWEN0                 :  std_logic;
    SIGNAL sramWEN1                 :  std_logic;
    SIGNAL sramWEN2                 :  std_logic;
    SIGNAL sramWEN3                 :  std_logic;
    SIGNAL sramWEN4                 :  std_logic;
    SIGNAL sramREN0                 :  std_logic;
    SIGNAL sramREN1                 :  std_logic;
    SIGNAL sramREN2                 :  std_logic;
    SIGNAL sramREN3                 :  std_logic;
    SIGNAL sramREN4                 :  std_logic;
    SIGNAL readData0                :  std_logic_vector(7 DOWNTO 0);
    SIGNAL readData1                :  std_logic_vector(7 DOWNTO 0);
    SIGNAL readData2                :  std_logic_vector(7 DOWNTO 0);
    SIGNAL readData3                :  std_logic_vector(7 DOWNTO 0);
    SIGNAL readData4                :  std_logic_vector(7 DOWNTO 0);
    SIGNAL ckRdAddr                 :  std_logic_vector(11 DOWNTO 9);
    SIGNAL BLKA0                    :  std_logic;
    SIGNAL BLKB0                    :  std_logic;
    SIGNAL BLKA1                    :  std_logic;
    SIGNAL BLKB1                    :  std_logic;
    SIGNAL BLKA2                    :  std_logic;
    SIGNAL BLKB2                    :  std_logic;
    SIGNAL BLKA3                    :  std_logic;
    SIGNAL BLKB3                    :  std_logic;
    SIGNAL BLKA4                    :  std_logic;
    SIGNAL BLKB4                    :  std_logic;

BEGIN
    ------------------------------------------------------------------------
    -- Main body of code
    ------------------------------------------------------------------------
    BLKA0 <= NOT sramWEN0;
    BLKB0 <= NOT sramREN0;
    BLKA1 <= NOT sramWEN1;
    BLKB1 <= NOT sramREN1;
    BLKA2 <= NOT sramWEN2;
    BLKB2 <= NOT sramREN2;
    BLKA3 <= NOT sramWEN3;
    BLKB3 <= NOT sramREN3;
    BLKA4 <= NOT sramWEN4;
    BLKB4 <= NOT sramREN4;

    process (sramWEN, writeAddr)
    begin
        sramWEN0 <= '0';
        sramWEN1 <= '0';
        sramWEN2 <= '0';
        sramWEN3 <= '0';
        sramWEN4 <= '0';

        if (sramWEN = '1') then
            case writeAddr(11 downto 9) is
                when "000" =>
                        sramWEN0 <= '1';
                when "001" =>
                        sramWEN1 <= '1';
                when "010" =>
                        sramWEN2 <= '1';
                when "011" =>
                        sramWEN3 <= '1';
                when "100" =>
                        sramWEN4 <= '1';
                when others =>
                        null;
            end case;
        end if;
    end process;

    process (sramREN, readAddr)
    begin
        sramREN0 <= '0';
        sramREN1 <= '0';
        sramREN2 <= '0';
        sramREN3 <= '0';
        sramREN4 <= '0';

        if (sramREN = '1') then
            case readAddr(11 downto 9) is
                when "000" =>
                        sramREN0 <= '1';
                when "001" =>
                        sramREN1 <= '1';
                when "010" =>
                        sramREN2 <= '1';
                when "011" =>
                        sramREN3 <= '1';
                when "100" =>
                        sramREN4 <= '1';
                when others =>
                        null;
            end case;
        end if;
    end process;

    PROCESS (HCLK, HRESETn)
    BEGIN
        IF (NOT HRESETn = '1') THEN
            ckRdAddr(11 DOWNTO 9) <= "000";
        ELSIF (HCLK'EVENT AND HCLK = '1') THEN
            ckRdAddr(11 DOWNTO 9) <= readAddr(11 DOWNTO 9);
        END IF;
    END PROCESS;

    -- Implement muxing of read data

    PROCESS (ckRdAddr, readData0, readData1, readData2, readData3, readData4)
    BEGIN
        CASE ckRdAddr(11 DOWNTO 9) IS
            WHEN "000" =>
                        readData <= readData0;
            WHEN "001" =>
                        readData <= readData1;
            WHEN "010" =>
                        readData <= readData2;
            WHEN "011" =>
                        readData <= readData3;
            WHEN "100" =>
                        readData <= readData4;
            WHEN OTHERS  =>
                        readData <= readData0;

        END CASE;
    END PROCESS;

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
            BLKA => BLKA0,
            BLKB => BLKB0,
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
            DOUTB7 => readData0(7),
            DOUTB6 => readData0(6),
            DOUTB5 => readData0(5),
            DOUTB4 => readData0(4),
            DOUTB3 => readData0(3),
            DOUTB2 => readData0(2),
            DOUTB1 => readData0(1),
            DOUTB0 => readData0(0));


    block_row1 : RAM4K9
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
            BLKA => BLKA1,
            BLKB => BLKB1,
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
            DOUTB7 => readData1(7),
            DOUTB6 => readData1(6),
            DOUTB5 => readData1(5),
            DOUTB4 => readData1(4),
            DOUTB3 => readData1(3),
            DOUTB2 => readData1(2),
            DOUTB1 => readData1(1),
            DOUTB0 => readData1(0));


    block_row2 : RAM4K9
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
            BLKA => BLKA2,
            BLKB => BLKB2,
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
            DOUTB7 => readData2(7),
            DOUTB6 => readData2(6),
            DOUTB5 => readData2(5),
            DOUTB4 => readData2(4),
            DOUTB3 => readData2(3),
            DOUTB2 => readData2(2),
            DOUTB1 => readData2(1),
            DOUTB0 => readData2(0));


    block_row3 : RAM4K9
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
            BLKA => BLKA3,
            BLKB => BLKB3,
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
            DOUTB7 => readData3(7),
            DOUTB6 => readData3(6),
            DOUTB5 => readData3(5),
            DOUTB4 => readData3(4),
            DOUTB3 => readData3(3),
            DOUTB2 => readData3(2),
            DOUTB1 => readData3(1),
            DOUTB0 => readData3(0));


    block_row4 : RAM4K9
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
            BLKA => BLKA4,
            BLKB => BLKB4,
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
            DOUTB7 => readData4(7),
            DOUTB6 => readData4(6),
            DOUTB5 => readData4(5),
            DOUTB4 => readData4(4),
            DOUTB3 => readData4(3),
            DOUTB2 => readData4(2),
            DOUTB1 => readData4(1),
            DOUTB0 => readData4(0));

END structural;
