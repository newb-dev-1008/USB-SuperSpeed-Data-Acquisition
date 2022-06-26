--***************************************************************************/
--*                                                                         */
--*                    Copyright: Actel Corporation                         */
--***************************************************************************/
--*                                                                         */
--*        Project Name :                                                   */
--*                                                                         */
--*        Module Name :            AhbSramIf                               */
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

ENTITY AhbSramIf IS
    PORT (
        -- ---------------------------------------------------------------------
        -- Parameters
        -- ---------------------------------------------------------------------
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
END AhbSramIf;

library ieee;
    use ieee.std_logic_1164.all;

ARCHITECTURE structural OF AhbSramIf IS

    COMPONENT AhbWrapper_SRAM
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
        HREADYIN                : IN std_logic;
        HSEL                    : IN std_logic;
        HADDR                   : IN std_logic_vector(14 DOWNTO 0);
        -- Output

        HRESP                   : OUT std_logic_vector(1 DOWNTO 0);
        HREADY                  : OUT std_logic;
        -- AhbWrapper interface
        -- Input

        ahbAck                  : IN std_logic;
        -- Outputs

        ahbReq                  : OUT std_logic;
        nextAhbReq              : OUT std_logic;
        ahbWrite                : OUT std_logic;
        ahbSize                 : OUT std_logic_vector(2 DOWNTO 0);
        ahbAddr                 : OUT std_logic_vector(14 DOWNTO 0));
    END COMPONENT;

    COMPONENT SramCtrl
        PORT (
        -- ---------------------------------------------------------------------
        -- Parameters
        -- ---------------------------------------------------------------------
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
        HWDATA                  : IN std_logic_vector(31 DOWNTO 0);
        HSIZE                   : IN std_logic_vector(2 DOWNTO 0);
        -- Output

        HRDATA                  : OUT std_logic_vector(31 DOWNTO 0);
        -- AhbWrapper interface
        -- Inputs

        ahbReq                  : IN std_logic;
        nextAhbReq              : IN std_logic;
        ahbWrite                : IN std_logic;
        ahbSize                 : IN std_logic_vector(2 DOWNTO 0);
        ahbAddr                 : IN std_logic_vector(14 DOWNTO 0);
        -- Output

        ahbAck                  : OUT std_logic;
        -- Sram interface
        -- Input

        sramRD                  : IN std_logic_vector(31 DOWNTO 0);
        -- Outputs

        sramREN                 : OUT std_logic;
        sramWEN                 : OUT std_logic_vector(3 DOWNTO 0);
        sramWADDR               : OUT std_logic_vector(14 DOWNTO 0));
    END COMPONENT;

    -- ---------------------------------------------------------------------
    -- Signal declarations
    -- ---------------------------------------------------------------------
    -- AhbWrapper <-> SramCtrl
    SIGNAL ahbReq                   :  std_logic;
    SIGNAL nextAhbReq               :  std_logic;
    SIGNAL ahbWrite                 :  std_logic;
    SIGNAL ahbSize                  :  std_logic_vector(2 DOWNTO 0);
    SIGNAL ahbAck                   :  std_logic;
    SIGNAL iahbAddr                 :  std_logic_vector(14 DOWNTO 0);

BEGIN
    ahbAddr <= iahbAddr;

    -- ---------------------------------------------------------------------
    -- Constant declarations
    -- ---------------------------------------------------------------------
    -- ---------------------------------------------------------------------
    -- Main body of code
    -- ---------------------------------------------------------------------
    u_AhbWrapper : AhbWrapper_SRAM
        PORT MAP (
            HCLK => HCLK,
            HRESETn => HRESETn,
            HWRITE => HWRITE,
            HSIZE => HSIZE,
            HTRANS => HTRANS,
            HREADYIN => HREADYIN,
            HSEL => HSEL,
            HADDR => HADDR,
            HRESP => HRESP,
            HREADY => HREADY,
            ahbAck => ahbAck,
            ahbReq => ahbReq,
            nextAhbReq => nextAhbReq,
            ahbWrite => ahbWrite,
            ahbSize => ahbSize,
            ahbAddr => iahbAddr);

    u_SramCtrl : SramCtrl
        PORT MAP (
            HCLK => HCLK,
            HRESETn => HRESETn,
            HWRITE => HWRITE,
            HWDATA => HWDATA,
            HSIZE => HSIZE,
            HRDATA => HRDATA,
            ahbReq => ahbReq,
            nextAhbReq => nextAhbReq,
            ahbWrite => ahbWrite,
            ahbSize => ahbSize,
            ahbAddr => iahbAddr,
            ahbAck => ahbAck,
            sramRD => sramRD,
            sramREN => sramREN,
            sramWEN => sramWEN,
            sramWADDR => sramWADDR);

END structural;
