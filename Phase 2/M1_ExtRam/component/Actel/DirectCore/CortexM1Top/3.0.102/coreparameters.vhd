----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Tue May 10 17:52:00 2022
-- Parameters for CortexM1Top
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant CONFIG : integer := 289;
    constant DEBUG_CONFIG : integer := 1;
    constant DEBUG_IF : integer := 0;
    constant DEBUG_INCL : integer := 1;
    constant DEBUG_RESET : integer := 0;
    constant DIE : string( 1 to 10 ) := "M1A3PE3000";
    constant ITCM_ALIAS : integer := 1;
    constant UJ_CLK_ON_GLOBAL : integer := 1;
    constant UJ_RST_ON_GLOBAL : integer := 0;
end coreparameters;
