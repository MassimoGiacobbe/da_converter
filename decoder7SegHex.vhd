library ieee;
use ieee.std_logic_1164.all;

entity decoder7SegHex is
PORT( 
input : in integer range 0 to 15;
display : out std_logic_vector(6 downto 0));
end decoder7SegHex;

architecture behavior of decoder7SegHex is

begin
process(input)
begin 
case input is
when 0 => 
display<="1000000";
when 1 => 
display<="1111001";
when 2 => 
display<="0100100";
when 3 =>
 display<="0110000";
when 4 => 
display<="0011001";
when 5 => 
display<="0010010";
when 6 => 
display<="0000010";
when 7 => 
display<="1111000";
when 8 => 
display<="0000000";
when 9 => 
display<="0010000";
when 10=>
display<="0001000";
when 11=>
display<="1100000";
when 12=>
display<="0110001";
when 13=>
display<="1000010";
when 14=>
display<="0110000";
when 15=>
display<="0111000";
when others=>
display<="1111111";
end case;
end process;

end behavior;
