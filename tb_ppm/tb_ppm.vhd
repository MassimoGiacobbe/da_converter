library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_ppm is
end tb_ppm;

architecture behavior of tb_ppm is

 
component ppm_converter is
GENERIC(N : integer:=8);
PORT(
CLOCK_50, RSTn : in std_logic;
i_data : in  std_logic_vector(N-1 downto 0);
freq : in std_logic_vector(1 downto 0);
test_accumulator_o : out std_logic_vector(9 downto 0);
test_accumulator_i : out signed(7 downto 0);
test_second_clk : out std_logic;
bit_o : buffer std_logic);
end component;

signal tb_clk, tb_rstn : std_logic;
signal tb_i_data : std_logic_vector(7 downto 0);
signal tb_freq : std_logic_vector(1 downto 0);
signal tb_bit_o : std_logic;
signal tb_test_acc_o : std_logic_vector(9 downto 0);
signal tb_test_acc_i : signed(7 downto 0);
signal tb_test_sec_clk : std_logic;
begin

DUT : ppm_converter PORT MAP(tb_clk, tb_rstn, tb_i_data, tb_freq, tb_test_acc_o, tb_test_acc_i, tb_test_sec_clk, tb_bit_o);

clock_process : process
begin 
tb_clk<='0';
wait for 1 ns;
tb_clk<='1';
wait for 1 ns;
end process;

input_gen : process
begin
tb_rstn<='0';--powerup reset
tb_freq<="00";
wait for 5 ns;
tb_rstn<='1';
tb_i_data<="00100001";
wait for 400 ns;
tb_i_data<="11000000";
tb_freq<="01";
wait for 500 ns;
tb_i_data<="01000000";
tb_freq<="00";
wait;
end process;
end behavior;