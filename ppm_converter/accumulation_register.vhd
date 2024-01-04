library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity accumulation_register is
GENERIC(K : integer :=10);
PORT( i_val : in signed(k-3 downto 0);
		clock,rstn : in std_logic;
		o_val : out std_logic_vector(K-1 downto 0));
end accumulation_register;

architecture behavior of accumulation_register is 

signal stored_val : signed(K-1 downto 0);
constant MAX_VAL : signed(K-1 downto 0) := to_signed((2**(K-1)-1), K);
constant MIN_VAL : signed(K-1 downto 0) := to_signed(0, K);
begin


process(clock,rstn)

begin

if(rstn='0') then --asynchronous reset
stored_val<=(others => '0');
o_val<=(others=>'0');
elsif(rising_edge(clock) and rstn='1') then
		if(stored_val=MAX_VAL and i_val>to_signed(0,K-2)) then --preventing buffer overflow, if the value stored in the register is already equal to the max value 
			o_val<=std_logic_vector(stored_val);                            -- and the input is bigger than 0, the value should stay at its current value 
		elsif(stored_val=MIN_VAL and i_val<to_signed(0,K-2)) then 
			o_val<=std_logic_vector(stored_val); -- doing the same for the overflow for stored value 0, since we need the accumulator for a dac it wouldn't make sense for the value to be negative
		else	
			stored_val<=stored_val+i_val;
			o_val<=std_logic_vector(stored_val);
		end if;
end if;
end process;

end behavior;
