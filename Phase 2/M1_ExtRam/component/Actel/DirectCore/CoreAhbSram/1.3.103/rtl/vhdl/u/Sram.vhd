--*************************************************************************/
--*                                                                       */
--*                    Copyright: Actel Corporation                       */
--*************************************************************************/
--*                                                                       */
--*        Project Name :                                                 */
--*                                                                       */
--*        Module Name :            Sram                                  */
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

ENTITY Sram IS
    GENERIC (
        -- ---------------------------------------------------------------------
        -- Parameters
        -- ---------------------------------------------------------------------
        -- The following parameter may only have values of 4, 20, 28 or 56.
        RAM_BLOCK_INSTANCES            :  integer := 4);    --  (default to 2kB)
    PORT (
        -- ---------------------------------------------------------------------
        -- Port declarations
        -- ---------------------------------------------------------------------
        -- MP7Bridge interface
        -- Inputs
        HCLK                    : IN std_logic;
        HRESETn                 : IN std_logic;

        -- AhbFabric interface
        -- Inputs
        writeData               : IN std_logic_vector(31 DOWNTO 0);
        readAddr                : IN std_logic_vector(12 DOWNTO 0);

        -- AhbSramIf interface
        -- Inputs
        sramREN                 : IN std_logic;
        sramWEN                 : IN std_logic_vector(3 DOWNTO 0);
        writeAddr               : IN std_logic_vector(12 DOWNTO 0);
        -- Outputs
        readData                : OUT std_logic_vector(31 DOWNTO 0));
END Sram;

library ieee;
    use ieee.std_logic_1164.all;

ARCHITECTURE structural OF Sram IS

    COMPONENT Sram_512x8
        PORT (
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
    END COMPONENT;

    COMPONENT Sram_2kx8
        PORT (
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
        writeAddr               : IN std_logic_vector(10 DOWNTO 0);
        readAddr                : IN std_logic_vector(10 DOWNTO 0);
        HCLK                    : IN std_logic;
        HRESETn                 : IN std_logic);
    END COMPONENT;

    COMPONENT Sram_2k5x8
        PORT (
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
    END COMPONENT;

    COMPONENT Sram_3k5x8
        PORT (
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
    END COMPONENT;

    COMPONENT Sram_7kx8
        PORT (
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
        writeAddr               : IN std_logic_vector(12 DOWNTO 0);
        readAddr                : IN std_logic_vector(12 DOWNTO 0);
        HCLK                    : IN std_logic;
        HRESETn                 : IN std_logic);
    END COMPONENT;

BEGIN
    g_sram0: IF (RAM_BLOCK_INSTANCES = 56) GENERATE
        Sram_byte3 : Sram_7kx8
            PORT MAP (
                writeData => writeData(31 DOWNTO 24),
                readData => readData(31 DOWNTO 24),
                sramWEN => sramWEN(3),
                sramREN => sramREN,
                writeAddr => writeAddr(12 DOWNTO 0),
                readAddr => readAddr(12 DOWNTO 0),
                HCLK => HCLK,
                HRESETn => HRESETn);
        Sram_byte2 : Sram_7kx8
            PORT MAP (
                writeData => writeData(23 DOWNTO 16),
                readData => readData(23 DOWNTO 16),
                sramWEN => sramWEN(2),
                sramREN => sramREN,
                writeAddr => writeAddr(12 DOWNTO 0),
                readAddr => readAddr(12 DOWNTO 0),
                HCLK => HCLK,
                HRESETn => HRESETn);
        Sram_byte1 : Sram_7kx8
            PORT MAP (
                writeData => writeData(15 DOWNTO 8),
                readData => readData(15 DOWNTO 8),
                sramWEN => sramWEN(1),
                sramREN => sramREN,
                writeAddr => writeAddr(12 DOWNTO 0),
                readAddr => readAddr(12 DOWNTO 0),
                HCLK => HCLK,
                HRESETn => HRESETn);
        Sram_byte0 : Sram_7kx8
            PORT MAP (
                writeData => writeData(7 DOWNTO 0),
                readData => readData(7 DOWNTO 0),
                sramWEN => sramWEN(0),
                sramREN => sramREN,
                writeAddr => writeAddr(12 DOWNTO 0),
                readAddr => readAddr(12 DOWNTO 0),
                HCLK => HCLK,
                HRESETn => HRESETn);
    END GENERATE;

    g_sram1: IF (NOT(RAM_BLOCK_INSTANCES = 56)) GENERATE

        g_sram1a: IF (RAM_BLOCK_INSTANCES = 28) GENERATE
            Sram_byte3 : Sram_3k5x8
                PORT MAP (
                    writeData => writeData(31 DOWNTO 24),
                    readData => readData(31 DOWNTO 24),
                    sramWEN => sramWEN(3),
                    sramREN => sramREN,
                    writeAddr => writeAddr(11 DOWNTO 0),
                    readAddr => readAddr(11 DOWNTO 0),
                    HCLK => HCLK,
                    HRESETn => HRESETn);
            Sram_byte2 : Sram_3k5x8
                PORT MAP (
                    writeData => writeData(23 DOWNTO 16),
                    readData => readData(23 DOWNTO 16),
                    sramWEN => sramWEN(2),
                    sramREN => sramREN,
                    writeAddr => writeAddr(11 DOWNTO 0),
                    readAddr => readAddr(11 DOWNTO 0),
                    HCLK => HCLK,
                    HRESETn => HRESETn);
            Sram_byte1 : Sram_3k5x8
                PORT MAP (
                    writeData => writeData(15 DOWNTO 8),
                    readData => readData(15 DOWNTO 8),
                    sramWEN => sramWEN(1),
                    sramREN => sramREN,
                    writeAddr => writeAddr(11 DOWNTO 0),
                    readAddr => readAddr(11 DOWNTO 0),
                    HCLK => HCLK,
                    HRESETn => HRESETn);
            Sram_byte0 : Sram_3k5x8
                PORT MAP (
                    writeData => writeData(7 DOWNTO 0),
                    readData => readData(7 DOWNTO 0),
                    sramWEN => sramWEN(0),
                    sramREN => sramREN,
                    writeAddr => writeAddr(11 DOWNTO 0),
                    readAddr => readAddr(11 DOWNTO 0),
                    HCLK => HCLK,
                    HRESETn => HRESETn);
        END GENERATE;

        g_sram2: IF (NOT(RAM_BLOCK_INSTANCES = 28)) GENERATE

            g_sram2a: IF (RAM_BLOCK_INSTANCES = 20) GENERATE
                Sram_byte3 : Sram_2k5x8
                    PORT MAP (
                        writeData => writeData(31 DOWNTO 24),
                        readData => readData(31 DOWNTO 24),
                        sramWEN => sramWEN(3),
                        sramREN => sramREN,
                        writeAddr => writeAddr(11 DOWNTO 0),
                        readAddr => readAddr(11 DOWNTO 0),
                        HCLK => HCLK,
                        HRESETn => HRESETn);
                Sram_byte2 : Sram_2k5x8
                    PORT MAP (
                        writeData => writeData(23 DOWNTO 16),
                        readData => readData(23 DOWNTO 16),
                        sramWEN => sramWEN(2),
                        sramREN => sramREN,
                        writeAddr => writeAddr(11 DOWNTO 0),
                        readAddr => readAddr(11 DOWNTO 0),
                        HCLK => HCLK,
                        HRESETn => HRESETn);
                Sram_byte1 : Sram_2k5x8
                    PORT MAP (
                        writeData => writeData(15 DOWNTO 8),
                        readData => readData(15 DOWNTO 8),
                        sramWEN => sramWEN(1),
                        sramREN => sramREN,
                        writeAddr => writeAddr(11 DOWNTO 0),
                        readAddr => readAddr(11 DOWNTO 0),
                        HCLK => HCLK,
                        HRESETn => HRESETn);
                Sram_byte0 : Sram_2k5x8
                    PORT MAP (
                        writeData => writeData(7 DOWNTO 0),
                        readData => readData(7 DOWNTO 0),
                        sramWEN => sramWEN(0),
                        sramREN => sramREN,
                        writeAddr => writeAddr(11 DOWNTO 0),
                        readAddr => readAddr(11 DOWNTO 0),
                        HCLK => HCLK,
                        HRESETn => HRESETn);
            END GENERATE;

            g_sram2: IF (NOT(RAM_BLOCK_INSTANCES = 20)) GENERATE

                g_sram2a: IF (RAM_BLOCK_INSTANCES = 16) GENERATE
                    Sram_byte3 : Sram_2kx8
                        PORT MAP (
                            writeData => writeData(31 DOWNTO 24),
                            readData => readData(31 DOWNTO 24),
                            sramWEN => sramWEN(3),
                            sramREN => sramREN,
                            writeAddr => writeAddr(10 DOWNTO 0),
                            readAddr => readAddr(10 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                    Sram_byte2 : Sram_2kx8
                        PORT MAP (
                            writeData => writeData(23 DOWNTO 16),
                            readData => readData(23 DOWNTO 16),
                            sramWEN => sramWEN(2),
                            sramREN => sramREN,
                            writeAddr => writeAddr(10 DOWNTO 0),
                            readAddr => readAddr(10 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                    Sram_byte1 : Sram_2kx8
                        PORT MAP (
                            writeData => writeData(15 DOWNTO 8),
                            readData => readData(15 DOWNTO 8),
                            sramWEN => sramWEN(1),
                            sramREN => sramREN,
                            writeAddr => writeAddr(10 DOWNTO 0),
                            readAddr => readAddr(10 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                    Sram_byte0 : Sram_2kx8
                        PORT MAP (
                            writeData => writeData(7 DOWNTO 0),
                            readData => readData(7 DOWNTO 0),
                            sramWEN => sramWEN(0),
                            sramREN => sramREN,
                            writeAddr => writeAddr(10 DOWNTO 0),
                            readAddr => readAddr(10 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                END GENERATE;

                g_sram3: IF (NOT(RAM_BLOCK_INSTANCES = 16)) GENERATE
                    Sram_byte3 : Sram_512x8
                        PORT MAP (
                            writeData => writeData(31 DOWNTO 24),
                            readData => readData(31 DOWNTO 24),
                            sramWEN => sramWEN(3),
                            sramREN => sramREN,
                            writeAddr => writeAddr(8 DOWNTO 0),
                            readAddr => readAddr(8 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                    Sram_byte2 : Sram_512x8
                        PORT MAP (
                            writeData => writeData(23 DOWNTO 16),
                            readData => readData(23 DOWNTO 16),
                            sramWEN => sramWEN(2),
                            sramREN => sramREN,
                            writeAddr => writeAddr(8 DOWNTO 0),
                            readAddr => readAddr(8 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                    Sram_byte1 : Sram_512x8
                        PORT MAP (
                            writeData => writeData(15 DOWNTO 8),
                            readData => readData(15 DOWNTO 8),
                            sramWEN => sramWEN(1),
                            sramREN => sramREN,
                            writeAddr => writeAddr(8 DOWNTO 0),
                            readAddr => readAddr(8 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                    Sram_byte0 : Sram_512x8
                        PORT MAP (
                            writeData => writeData(7 DOWNTO 0),
                            readData => readData(7 DOWNTO 0),
                            sramWEN => sramWEN(0),
                            sramREN => sramREN,
                            writeAddr => writeAddr(8 DOWNTO 0),
                            readAddr => readAddr(8 DOWNTO 0),
                            HCLK => HCLK,
                            HRESETn => HRESETn);
                END GENERATE;
            END GENERATE;
        END GENERATE;
    END GENERATE;

END structural;
