library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity ppm_converter is
GENERIC(N : integer:=8);
PORT(
CLOCK_50, RSTn : in std_logic;
i_data : in  std_logic_vector(N-1 downto 0);
bit_o : buffer std_logic);
end ppm_converter;

architecture behavior of ppm_converter is 

component accumulation_register is
GENERIC(K : integer :=10);
PORT( i_val : in signed(k-3 downto 0);
		clock,rstn : in std_logic;
		o_val : out std_logic_vector(K-1 downto 0));
end component;

signal accumulator_i : signed(N-1 downto 0);
signal accumulator_o : std_logic_vector(N+1 downto 0);
signal feedback_bit : std_logic_vector(N-1 downto 0);

begin

integ : accumulation_register PORT MAP(accumulator_i,CLOCK_50, RSTn, accumulator_o);
feedback_bit(0)<=accumulator_o(N);
feedback_bit(N-1 downto 1)<=(others=>'0'); --performing extension of the vector to be subtracted  
accumulator_i<=signed(i_data)-signed(feedback_bit);--using the non-sign msb since i designed the accumulation register to operate only with non negative values 
bit_o<=accumulator_o(N);


end behavior;