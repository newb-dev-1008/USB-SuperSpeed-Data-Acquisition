----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Tue Apr 26 12:17:19 2022
-- Parameters for CoreAhbSram
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant FAMILY : integer := 16;
    constant HDL_license : string( 1 to 1 ) := "O";
    constant RAM_BLOCK_INSTANCES : integer := 64;
end coreparameters;
