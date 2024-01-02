library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_cnt is
end tb_cnt;

architecture behavior of tb_cnt is

component UD_counter is
GENERIC(N : integer :=8);
PORT(
RSTn, clear, en, UDn, CLK: in std_logic;
INIT_VAL : in std_logic_vector(N-1 downto 0);
OVALUE : BUFFER unsigned(N-1 downto 0));

end component;

signal tb_rst, tb_clear, tb_en, tb_UD, tb_clk : std_logic;
signal tb_init : std_logic_vector(7 downto 0);
signal tb_out : unsigned (7 downto 0);

begin

DUT : UD_counter GENERIC MAP(8)
 PORT MAP(tb_rst, tb_clear, tb_en, tb_UD, tb_clk, tb_init ,tb_out);

clock_process : process
begin 
tb_clk<='0';
wait for 1 ns;
tb_clk<='1';
wait for 1 ns;
end process;

input_gen : process
begin
tb_rst<='0';
tb_clear<='0';
tb_en<='1';
tb_UD<='0';
tb_init<="00001000";
wait for 5 ns;
tb_rst<='1';
wait;
end process;
end behavior;
