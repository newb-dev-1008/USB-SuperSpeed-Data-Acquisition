--***************************************************************************/
--*                                                                         */
--*                    Copyright: Actel Corporation                         */
--***************************************************************************/
--*                                                                         */
--*        Project Name :                                                   */
--*                                                                         */
--*        Module Name :            CoreAhbSram                             */
--*                                                                         */
--*        Written by :             CM                                      */
--*                                                                         */
--***************************************************************************/
--*                                                                         */
--*                                                                         */
--*        Brief Description :                                              */
--*                                                                         */
--*                                                                         */
--*                                                                         */
--*        Associated files :                                               */
--*                                                                         */
--*                                                                         */
--***************************************************************************/

library ieee;
    use ieee.std_logic_1164.all;

ENTITY CoreAhbSram IS
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

        HWRITE                  : IN std_logic;
        HSIZE                   : IN std_logic_vector(2 DOWNTO 0);
        HTRANS                  : IN std_logic_vector(1 DOWNTO 0);
        HWDATA                  : IN std_logic_vector(31 DOWNTO 0);
        HREADYIN                : IN std_logic;
        HSEL                    : IN std_logic;
        HADDR                   : IN std_logic_vector(14 DOWNTO 0);
        -- Output

        HRDATA                  : OUT std_logic_vector(31 DOWNTO 0);
        HRESP                   : OUT std_logic_vector(1 DOWNTO 0);
        HREADY                  : OUT std_logic);
END CoreAhbSram;

library ieee;
    use ieee.std_logic_1164.all;

ARCHITECTURE structural OF CoreAhbSram IS

    COMPONENT AhbSramIf
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
        HWRITE                  : IN std_logic;
        HSIZE                   : IN std_logic_vector(2 DOWNTO 0);
        HTRANS                  : IN std_logic_vector(1 DOWNTO 0);
        HWDATA                  : IN std_logic_vector(31 DOWNTO 0);
        HREADYIN                : IN std_logic;
        HSEL                    : IN std_logic;
        HADDR                   : IN std_logic_vector(14 DOWNTO 0);
        -- Output
        HRDATA                  : OUT std_logic_vector(31 DOWNTO 0);
        HRESP                   : OUT std_logic_vector(1 DOWNTO 0);
        HREADY                  : OUT std_logic;

        -- Sram interface
        -- Input
        sramRD                  : IN std_logic_vector(31 DOWNTO 0);
        -- Outputs
        sramREN                 : OUT std_logic;
        sramWEN                 : OUT std_logic_vector(3 DOWNTO 0);
        sramWADDR               : OUT std_logic_vector(14 DOWNTO 0);
        ahbAddr                 : OUT std_logic_vector(14 DOWNTO 0));
    END COMPONENT;

    COMPONENT Sram
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
    END COMPONENT;


    -- ---------------------------------------------------------------------
    -- Signal declarations
    -- ---------------------------------------------------------------------
    -- AhbSramIf <-> Sram
    SIGNAL sramREN                  :  std_logic;
    SIGNAL sramWEN                  :  std_logic_vector(3 DOWNTO 0);
    SIGNAL sramWADDR                :  std_logic_vector(14 DOWNTO 0);
    SIGNAL sramRD                   :  std_logic_vector(31 DOWNTO 0);
    SIGNAL ahbAddr                  :  std_logic_vector(14 DOWNTO 0);
    SIGNAL iHRDATA                  :  std_logic_vector(31 DOWNTO 0);
    SIGNAL iHRESP                   :  std_logic_vector(1 DOWNTO 0);
    SIGNAL iHREADY                  :  std_logic;

BEGIN
    HRDATA <= iHRDATA;
    HRESP <= iHRESP;
    HREADY <= iHREADY;

    -- ---------------------------------------------------------------------
    -- Constant declarations
    -- ---------------------------------------------------------------------
    -- ---------------------------------------------------------------------
    -- Main body of code
    -- ---------------------------------------------------------------------
    u_AhbSramIf : AhbSramIf
        PORT MAP (
            HCLK => HCLK,
            HRESETn => HRESETn,
            HWRITE => HWRITE,
            HSIZE => HSIZE,
            HTRANS => HTRANS,
            HWDATA => HWDATA,
            HREADYIN => HREADYIN,
            HSEL => HSEL,
            HADDR => HADDR,
            HRDATA => iHRDATA,
            HRESP => iHRESP,
            HREADY => iHREADY,
            sramRD => sramRD,
            sramREN => sramREN,
            sramWEN => sramWEN,
            sramWADDR => sramWADDR,
            ahbAddr => ahbAddr);


    u_Sram : Sram
        GENERIC MAP (
            RAM_BLOCK_INSTANCES => RAM_BLOCK_INSTANCES)
        PORT MAP (
            HCLK => HCLK,
            HRESETn => HRESETn,
            writeData => HWDATA,
            readAddr => ahbAddr(14 DOWNTO 2),
            sramREN => sramREN,
            sramWEN => sramWEN,
            writeAddr => sramWADDR(14 DOWNTO 2),
            readData => sramRD);

END structural;
