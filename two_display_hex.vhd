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
i_int<=to_integer(unsigned(number_in));
out_uni<= i_int mod 16;

output_det : process(i_int,out_dec)
begin

if(i_int =256) then  out_dec<=15;
elsif(i_int<=255 AND i_int>=240) then out_dec<=15;
elsif(i_int<=239 AND i_int>=224) then out_dec<=14;
elsif(i_int<=223 AND i_int>=208) then out_dec<=13;
elsif(i_int<=207 AND i_int>=192) then out_dec<=12;
elsif(i_int<=191 AND i_int>=176) then out_dec<=11;
elsif(i_int<=175 AND i_int>=160) then out_dec<=10;
elsif(i_int<=159 AND i_int>=144) then out_dec<=9;
elsif(i_int<=143 AND i_int>=128) then out_dec<=8;
elsif(i_int<=127 AND i_int>=112) then out_dec<=7;
elsif(i_int<=111 AND i_int>=96) then out_dec<=6;
elsif(i_int<=95 AND i_int>=80) then out_dec<=5;
elsif(i_int<=79 AND i_int>=64) then out_dec<=4;
elsif(i_int<=63 AND i_int>=48) then out_dec<=3;
elsif(i_int<=47 AND i_int>=32) then out_dec<=2;
elsif(i_int<=31 AND i_int>=16) then out_dec<=1;
elsif(i_int<15) then out_dec<=0;
else out_dec<=0;
end if;


end process;



decoder_dec : decoder7SegHex PORT MAP(out_dec,dis_dec);

decoder_uni : decoder7SegHex PORT MAP(out_uni,dis_uni);

end behavior;
