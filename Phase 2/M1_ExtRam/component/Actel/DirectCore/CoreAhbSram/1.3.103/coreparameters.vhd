----------------------------------------------------------------------
-- Created by Microsemi SmartDesign Tue May 10 17:52:00 2022
-- Parameters for CoreAhbSram
----------------------------------------------------------------------


LIBRARY ieee;
   USE ieee.std_logic_1164.all;
   USE ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

package coreparameters is
    constant FAMILY : string( 1 to 2 ) := "16";
    constant HDL_license : string( 1 to 1 ) := "U";
    constant RAM_BLOCK_INSTANCES : integer := 56;
end coreparameters;
