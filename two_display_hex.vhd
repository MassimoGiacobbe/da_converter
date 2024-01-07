library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity two_display_hex is
PORT(
number_in : in std_logic_vector (7 downto 0);
dis_dec, dis_uni : out std_logic_vector(6 downto 0));
end two_display_hex;

architecture behavior of two_display_hex is

component decoder7SegHex is
PORT( 
input : in integer range 0 to 15;
display : out std_logic_vector(6 downto 0));
end component;

signal i_int : integer range 0 to 255;
signal out_dec,out_uni :  integer range 0 to 15;

begin
i_int<=to_integer(number_in)
out_uni<= i_int mod 16;

output_det : process(number_in,out_dec,unit)
begin

if(number_in =60) then  out_dec<=0;
elsif(number_in<=255 AND number_in>=240) then out_dec<=15;
elsif(number_in<=239 AND number_in>=224) then out_dec<=14;
elsif(number_in<=223 AND number_in>=208) then out_dec<=13;
elsif(number_in<=207 AND number_in>=192) then out_dec<=12;
elsif(number_in<=191 AND number_in>=176) then out_dec<=11;
elsif(number_in<=175 AND number_in>=160) then out_dec<=10;
elsif(number_in<=159 AND number_in>=144) then out_dec<=9;
elsif(number_in<=143 AND number_in>=128) then out_dec<=8;
elsif(number_in<=127 AND number_in>=112) then out_dec<=7;
elsif(number_in<=111 AND number_in>=96) then out_dec<=6;
elsif(number_in<=95 AND number_in>=80) then out_dec<=5;
elsif(number_in<=79 AND number_in>=64) then out_dec<=4;
elsif(number_in<=63 AND number_in>=48) then out_dec<=3;
elsif(number_in<=47 AND number_in>=32) then out_dec<=2;
elsif(number_in<=31 AND number_in>=16) then out_dec<=1;
elsif(number_in<15) then out_dec<=0;
else out_dec<=0;
end if;


end process;



decoder_dec : decoder7SegHex PORT MAP(out_dec,dis_dec);

decoder_uni : decoder7SegHex PORT MAP(out_uni,dis_uni);

end behavior;
