library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- 38 37 36 35 34 33 32' 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16' 15 14 13 12 11 10 9 8' 7 6 5 4' 3 2' 1'
-- 32 31 30 29 28 27     26 25 24 23 22 21 20 19 18 17 16 15 14 13 12     11 10 09 08 07 06 5    4 3 2    1 

entity hamming_encoder is 
    port(datain : IN bit_vector(0 to 7); hamout : OUT bit_vector(0 to 39));
end hamming_encoder;

architecture arch of hamming_encoder is
    signal p0, p1, p2, p3, p4, p5, p6, p7 : bit;
    begin
        -- Generate check bits
        p0 <= (datain(0) XOR datain(1)) XOR datain(3);
        p1 <= (datain(0) XOR datain(2)) XOR datain(3);
        p2 <= (datain(1) XOR datain(2)) XOR datain(3);
        p3 <= datain(4) XOR datain(5) XOR datain(6) XOR datain(11) XOR datain(12) XOR datain(13) 
        XOR datain(18) XOR datain(19) XOR datain(20) XOR datain(21) XOR datain(26) XOR datain(27) XOR datain(28);

        p4 <= datain(11) XOR datain(12) XOR datain(13) XOR datain(14) XOR datain(15) XOR datain(16) 
        XOR datain(17) XOR datain(26) XOR datain(27) XOR datain(28) XOR datain(29) XOR datain(30) XOR datain(31);

        p5 <= datain(26) XOR datain(27) XOR datain(28) XOR datain(29) XOR datain(30) XOR datain(31);

        -- Connect the outputs as a single bitstream
        -- Parity check bits
        hamout(0 to 1) <= (p0, p1);
        hamout(3) <= p2;
        hamout(7) <= p3;
        hamout(15) <= p4;
        hamout(31) <= p5;

        -- Data bits
        hamout(2) <= datain(0);
        hamout(4 to 6) <= datain(1 to 3);
        hamout(8 to 14) <= datain(4 to 10);
        hamout(16 to 30) <= datain(11 to 25);
        hamout(32 to 37) <= datain(26 to 31);

end arch;