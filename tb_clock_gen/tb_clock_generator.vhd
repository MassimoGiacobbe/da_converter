library ieee;
use ieee.std_logic_1164.all;

entity tb_clock_generator is
end tb_clock_generator;

architecture behavior of tb_clock_generator is

component clk_generator is
 PORT(
 i_freq : in std_logic_vector(1 downto 0);
 clk, rstn : in std_logic;
 test_clear : out std_logic;
 gen_clk : out std_logic);
 end component;

signal tb_i_freq : std_logic_vector(1 downto 0);
signal tb_clk, tb_rstn, tb_gen_clk, tb_clear : std_logic;

begin

DUT : clk_generator PORT MAP(tb_i_freq,tb_clk, tb_rstn, tb_clear, tb_gen_clk);

clk_gen : process
begin
tb_clk<='0';
wait for 1 ns;
tb_clk<='1';
wait for 1 ns;
end process;

input_gen : process 
begin
tb_rstn<='0';
tb_i_freq<="00";
wait for 5 ns;
tb_rstn<='1';
wait for 150 ns;
tb_i_freq<="01";
wait;
end process;
end behavior;