-- edac_encoder.vhd
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity edac_encoder is
port (	data_in : in  std_logic_vector(15 downto 0);
		dataEnc_out  : out std_logic_vector(21 downto 0)
		);
end entity;

architecture beh of edac_encoder is
signal D :   std_logic_vector(15 downto 0);
begin
D <=data_in;
dataEnc_out(15 DOWNTO 0)	<= D;
dataEnc_out(16)				<= D(0)	XOR	D(1)	XOR D(2)	XOR D(3)	XOR D(4)	XOR D(5)	XOR D(10)	XOR D(14);
dataEnc_out(17)				<= D(0)	XOR	D(1)	XOR D(2)	XOR D(6)	XOR D(7)	XOR D(8)	XOR D(9)	XOR D(12);
dataEnc_out(18)				<= D(0)	XOR	D(4)	XOR D(6)	XOR D(7)	XOR D(8)	XOR D(13)	XOR D(14)	XOR D(15);
dataEnc_out(19)				<= D(5)	XOR	D(6)	XOR D(9)	XOR D(10)	XOR D(11)	XOR D(13)	XOR D(14)	XOR D(15);
dataEnc_out(20)				<= D(1)	XOR	D(3)	XOR D(7)	XOR D(9)	XOR D(10)	XOR D(11)	XOR D(12)	XOR D(13);
dataEnc_out(21)				<= D(2)	XOR	D(3)	XOR D(4)	XOR D(5)	XOR D(8)	XOR D(11)	XOR D(12)	XOR D(15);

 end architecture beh;