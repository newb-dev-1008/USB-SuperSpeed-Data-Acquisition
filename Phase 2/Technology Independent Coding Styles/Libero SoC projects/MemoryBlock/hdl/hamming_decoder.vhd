--------------------------------------------------------------------------------
-- Company: <Name>
--
-- File: hamming_decoder.vhd
-- File history:
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--      <Revision number>: <Date>: <Comments>
--
-- Description: 
--
-- <Description here>
--
-- Targeted device: <Family::ProASIC3> <Die::M1A3P1000> <Package::208 PQFP>
-- Author: <Name>
--
--------------------------------------------------------------------------------

library IEEE;

use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity hamming_decoder is 
    port(hamin : IN bit_vector(0 to 37); dataout : OUT bit_vector(0 to 31));
end hamming_decoder;

architecture arch of hamming_decoder is
    begin
        
        -- Data bits
        dataout(0) <= hamin(2);
        dataout(1 to 3) <= hamin(4 to 6);
        dataout(4 to 10) <= hamin(8 to 14);
        dataout(11 to 25) <= hamin(16 to 30);
        dataout(26 to 31) <= hamin(32 to 37);

end arch;
