library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_accumulation_register is
end tb_accumulation_register;

architecture behavior of tb_accumulation_register is
 
component accumulation_register is
GENERIC(K : integer :=10);
PORT( i_val : in signed(k-3 downto 0);
		clock,rstn : in std_logic;
		o_val : out std_logic_vector(K-1 downto 0));
end component;

signal tb_ival : signed(7 downto 0);
signal tb_clk, tb_rstn : std_logic;
signal tb_oval : std_logic_vector(9 downto 0);

begin

DUT : accumulation_register PORT MAP(tb_ival, tb_clk, tb_rstn, tb_oval);

clk_gen : process
begin
tb_clk<='0';
wait for 5 ns;
tb_clk<='1';
wait for 5 ns;
end process;

input_gen : process
begin
tb_rstn<='0';
wait for 15 ns;
tb_rstn<='1';
tb_ival<="00010000";
wait for 400 ns;
tb_ival<="10000000";
wait;
end process;

end behavior;