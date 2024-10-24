library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 entity clk_generator is
 PORT(
 i_freq : in std_logic_vector(1 downto 0);
 clk, rstn : in std_logic;
 --test_clear : out std_logic;
 gen_clk : out std_logic);
 end clk_generator;
 
 architecture behavior of clk_generator is
 
component UD_counter is
GENERIC(N : integer :=8);
PORT(
RSTn, clear, en, UDn, CLK: in std_logic;
INIT_VAL : in std_logic_vector(N-1 downto 0);
OVALUE : BUFFER unsigned(N-1 downto 0));

end component;

signal cnt_o : unsigned(9 downto 0);
signal f_period: std_logic_vector(9 downto 0);
signal clear_cnt,tmp_clk : std_logic;
begin

--test_clear<=clear_cnt;

counter : UD_counter
GENERIC MAP(10)
PORT MAP(rstn,clear_cnt,'1','0',clk,f_period,cnt_o);

period_process : process(i_freq)
begin
case i_freq is 
when "00" =>f_period<="0000000011"; --400kHz modified for simulation
when "01" =>f_period<="0000000110";--200kHz
when "10" =>f_period<="0011111010";--100kHz
when "11" =>f_period<="0111110100";--50kHz
when others => f_period<="0000111111";
end case;
end process;

clk_process : process(clk,rstn,cnt_o)
begin 
if(rstn='0') then
tmp_clk<='0'; --setting a value at power up
gen_clk<='0';
elsif(rstn='1' AND rising_edge(clk)) then
	if(cnt_o=to_unsigned(0,10)) then
	tmp_clk<=NOT tmp_clk;
	clear_cnt<='1';
	else
	tmp_clk<=tmp_clk;
	clear_cnt<='0';
	end if;
gen_clk<=tmp_clk;
end if;
end process;
end behavior;	
	
