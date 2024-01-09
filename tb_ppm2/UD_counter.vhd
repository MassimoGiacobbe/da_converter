library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UD_counter is
GENERIC(N : integer :=8);
PORT(
RSTn, clear, en, UDn, CLK: in std_logic;
INIT_VAL : in std_logic_vector(N-1 downto 0);
OVALUE : BUFFER unsigned(N-1 downto 0));

end UD_counter;

architecture behavior of UD_counter is
begin

clock_process : process(CLK,RSTn)
 begin 
	IF(RSTn='0') then --asynchronous reset
				OVALUE<=unsigned(INIT_VAL);
				
	elsif(rising_edge(CLK) and RSTn='1') then
			if(clear='1') then
					OVALUE<=unsigned(INIT_VAL); --synchronous reset
			end if;
			if(EN='1' and clear='0') then					
					if(UDn='1') then --UDn at 1 means the counter will be counting up
					OVALUE<=OVALUE+1;
					elsif(UDn='0') then
					OVALUE<=OVALUE-1;
					end if;
			end if;
	end if;
end process;
end behavior;