library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pwm is
end tb_pwm;

architecture behavior of tb_pwm is

component PWM_da_conversion is
GENERIC(N: integer :=8);
PORT( 
CLOCK_50 : in std_logic;
A_RSTn : in std_logic;
--SW : in std_logic_vector(1 downto 0);
INPUT_VAL : in std_logic_vector(N-1 downto 0);
test_out_N_cnt,test_out_D_cnt : out unsigned(7 downto 0);
OUTPUT_VAL, test_tc1, test_tc2, test_D_en : out std_logic);--added tc signal for debugging
end component;

signal tb_clk, tb_arst, tb_output, tb_tc1, tb_tc2, tb_D_en: std_logic;
signal tb_input : std_logic_vector(7 downto 0);
signal tb_N_cnt,tb_D_cnt : unsigned(7 downto 0);

begin

DUT : PWM_da_conversion PORT MAP(tb_clk,tb_arst, tb_input, tb_N_CNT,tb_D_cnt, tb_output, tb_tc1, tb_tc2, tb_D_en);

clk_generation : process
begin

tb_clk<='1';
wait for 1 ns;
tb_clk<='0';
wait for 1 ns;
end process;

input_generation : process
begin

tb_arst<='0';
tb_input<="01000000"; --the output signal should have 50% duty cycle
wait for 5 ns;
tb_arst<='1';
wait for 1000 ns;
tb_arst<='0';
tb_input<="11111111"; --the output signal should have 50% duty cycle
wait for 5 ns;
tb_arst<='1';
wait;
end process;

end behavior;
