-- edac_decoder.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity edac_decoder is
port (	data_in    		: in std_logic_vector(21 downto 0);
		data_out_dec  	: out std_logic_vector(15 downto 0);
		edacdis      	: in std_logic;
	    DED_flg     	: out std_logic;
        SEC_flg  		: out std_logic 
		);
end entity;

architecture beh of edac_decoder is
signal sb : std_logic_vector(5 downto 0);
signal orsb : std_logic;
signal xorsb : std_logic;
signal single_error : std_logic;
signal double_error : std_logic;
signal eb : std_logic_vector(15 downto 0);

begin
sb(0)<= data_in(16)	XOR data_in(0)	XOR	data_in(1)	XOR data_in(2)	XOR data_in(3)	XOR data_in(4)	XOR data_in(5)	XOR data_in(10)	XOR data_in(14) when edacdis='0' else '0';
sb(1)<= data_in(17)	XOR	data_in(0)	XOR	data_in(1)	XOR data_in(2)	XOR data_in(6)	XOR data_in(7)	XOR data_in(8)	XOR data_in(9)	XOR data_in(12) when edacdis='0' else '0';
sb(2)<= data_in(18)	XOR	data_in(0)	XOR	data_in(4)	XOR data_in(6)	XOR data_in(7)	XOR data_in(8)	XOR data_in(13)	XOR data_in(14)	XOR data_in(15) when edacdis='0' else '0';
sb(3)<= data_in(19)	XOR	data_in(5)	XOR	data_in(6)	XOR data_in(9)	XOR data_in(10)	XOR data_in(11)	XOR data_in(13)	XOR data_in(14)	XOR data_in(15) when edacdis='0' else '0';
sb(4)<= data_in(20)	XOR	data_in(1)	XOR	data_in(3)	XOR data_in(7)	XOR data_in(9)	XOR data_in(10)	XOR data_in(11)	XOR data_in(12)	XOR data_in(13) when edacdis='0' else '0';
sb(5)<= data_in(21)	XOR	data_in(2)	XOR	data_in(3)	XOR data_in(4)	XOR data_in(5)	XOR data_in(8)	XOR data_in(11)	XOR data_in(12)	XOR data_in(15) when edacdis='0' else '0';

orsb <=  sb(0) or sb(1) or sb(2) or sb(3) or sb(4) or sb(5);
xorsb <=  sb(0) xor sb(1) xor sb(2) xor sb(3) xor sb(4) xor sb(5);

single_error <= orsb and xorsb;
SEC_flg <= single_error;

double_error <= orsb and (not xorsb);
DED_flg <=double_error ;

--error bit position calculation
eb(0)	<=  (	 sb(0) )AND (	sb(1)) 	AND (		sb(2)) AND (NOT  	sb(3)) AND (NOT  	sb(4)) AND (NOT  	sb(5));
eb(1)	<=  (	 sb(0) )AND (	sb(1)) 	AND (NOT  	sb(2)) AND (NOT  	sb(3)) AND (     	sb(4)) AND (NOT  	sb(5));
eb(2)	<=  (	 sb(0) )AND (	sb(1)) 	AND (NOT  	sb(2)) AND (NOT  	sb(3)) AND (NOT  	sb(4)) AND (     	sb(5));
eb(3)	<=  (	 sb(0) )AND (NOT sb(1)) AND (NOT  	sb(2)) AND (NOT  	sb(3)) AND (		sb(4)) AND (		sb(5));
eb(4)	<=  (	 sb(0) )AND (NOT sb(1)) AND (		sb(2)) AND (NOT  	sb(3)) AND (NOT  	sb(4)) AND (		sb(5));
eb(5)	<=  (	 sb(0) )AND (NOT sb(1)) AND (NOT 	sb(2)) AND (		sb(3)) AND (NOT 	sb(4)) AND (     	sb(5));
eb(6)	<=  (NOT sb(0) )AND (	sb(1)) 	AND (		sb(2)) AND (     	sb(3)) AND (NOT  	sb(4)) AND (NOT  	sb(5));
eb(7)	<=  (NOT sb(0) )AND (    sb(1)) AND (		sb(2)) AND (NOT  	sb(3)) AND (     	sb(4)) AND (NOT 	sb(5));
						 																											
eb(8)	<=	(NOT sb(0) )AND (    sb(1)) AND (		sb(2)) AND (NOT  	sb(3)) AND (NOT  	sb(4)) AND (		sb(5));
eb(9)	<=	(NOT sb(0) )AND (    sb(1)) AND (NOT  	sb(2)) AND (		sb(3)) AND (     	sb(4)) AND (NOT 	sb(5));
eb(10)	<=  (	 sb(0) )AND (NOT sb(1)) AND (NOT  	sb(2)) AND (     	sb(3)) AND (		sb(4)) AND (NOT  	sb(5));
eb(11)	<=  (NOT sb(0) )AND (NOT sb(1)) AND (NOT 	sb(2)) AND (		sb(3)) AND (		sb(4)) AND (		sb(5));
eb(12)	<=  (NOT sb(0) )AND (    sb(1)) AND (NOT  	sb(2)) AND (NOT  	sb(3)) AND (     	sb(4)) AND (     	sb(5));
eb(13)	<=  (NOT sb(0) )AND (NOT sb(1)) AND (		sb(2)) AND (     	sb(3)) AND (		sb(4)) AND (NOT  	sb(5));
eb(14)	<=  (	 sb(0) )AND (NOT sb(1)) AND (		sb(2)) AND (		sb(3)) AND (NOT  	sb(4)) AND (NOT  	sb(5));
eb(15)	<=  (NOT sb(0) )AND (NOT sb(1)) AND (		sb(2)) AND (     	sb(3)) AND (NOT 	sb(4)) AND (     	sb(5));

--error correction
data_out_dec(0)<= (data_in(0) xor eb(0))  when single_error='1' else data_in(0);
data_out_dec(1)<= (data_in(1) xor eb(1))  when single_error='1' else data_in(1);
data_out_dec(2)<= (data_in(2) xor eb(2))  when single_error='1' else data_in(2);
data_out_dec(3)<= (data_in(3) xor eb(3))  when single_error='1' else data_in(3);
data_out_dec(4)<= (data_in(4) xor eb(4))  when single_error='1' else data_in(4);
data_out_dec(5)<= (data_in(5) xor eb(5))  when single_error='1' else data_in(5);
data_out_dec(6)<= (data_in(6) xor eb(6))  when single_error='1' else data_in(6);
data_out_dec(7)<= (data_in(7) xor eb(7))  when single_error='1' else data_in(7);
data_out_dec(8)<= (data_in(8) xor eb(8))  when single_error='1' else data_in(8);
data_out_dec(9)<= (data_in(9) xor eb(9))  when single_error='1' else data_in(9);
data_out_dec(10)<=(data_in(10)xor eb(10)) when single_error='1' else data_in(10);
data_out_dec(11)<=(data_in(11)xor eb(11)) when single_error='1' else data_in(11);
data_out_dec(12)<=(data_in(12)xor eb(12)) when single_error='1' else data_in(12);
data_out_dec(13)<=(data_in(13)xor eb(13)) when single_error='1' else data_in(13);
data_out_dec(14)<=(data_in(14)xor eb(14)) when single_error='1' else data_in(14);
data_out_dec(15)<=(data_in(15)xor eb(15)) when single_error='1' else data_in(15);

end beh;
