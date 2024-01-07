library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PWM_da_conversion is
GENERIC(N: integer :=8);
PORT( 
CLOCK_50 : in std_logic;
A_RSTn : in std_logic;
--SW : in std_logic_vector(1 downto 0);
INPUT_VAL : in std_logic_vector(N-1 downto 0);
test_out_N_cnt,test_out_D_cnt : out unsigned(7 downto 0);
OUTPUT_VAL, test_tc1, test_tc2, test_D_en : out std_logic);--added test signal for debugging
end PWM_da_conversion;

architecture behavior of PWM_da_conversion is


component UD_counter is
GENERIC(N : integer :=8);
PORT(
RSTn, clear, en, UDn, CLK: in std_logic;
INIT_VAL : in std_logic_vector(N-1 downto 0);
OVALUE : BUFFER unsigned(N-1 downto 0));

end component;

signal tc1,tc2,D_en,cnt_clear : std_logic;
signal out_cnt_D, out_cnt_N, ONE_VAL : unsigned(N-1 downto 0);
signal MAX_VAL : std_logic_vector(N - 1 downto 0);

begin
-- clock generation is yet to be implemented, right now the counters are working using the 50Mhz clock. 
-- i can't generate the new frequencies using the plls (at least iit seems to be this way). this aspect is to be reviewed

D_CNT : UD_counter PORT MAP(A_RSTn,cnt_clear,D_en,'0',CLOCK_50,INPUT_VAL,out_cnt_D);

N_CNT : UD_counter PORT MAP(A_RSTn,cnt_clear,'1','0',CLOCK_50,MAX_VAL,out_cnt_N);

test_out_N_cnt<=out_cnt_N;
test_out_D_cnt<=out_cnt_D;
test_D_en<=D_en;
cnt_clear<=not tc2;

MAX_VAL<=(others => '1');
ONE_VAL<=to_unsigned(1,N);
D_en<= tc1;

tc1<=out_cnt_D(0) or out_cnt_D(1) or out_cnt_D(2) or out_cnt_D(3) or out_cnt_D(4) or out_cnt_D(5) or out_cnt_D(6) or out_cnt_D(7);
tc2<=out_cnt_N(0) or out_cnt_N(1) or out_cnt_N(2) or out_cnt_N(3) or out_cnt_N(4) or out_cnt_N(5) or out_cnt_N(6) or out_cnt_N(7);

test_tc1<=tc1;
test_tc2<=tc2;

clock_process : process(CLOCK_50,A_RSTn) 
 begin 
 
 if(A_RSTn='1' AND rising_edge(CLOCK_50))  then
			OUTPUT_VAL<='1';
		
			IF(tc1='0') then		
			OUTPUT_VAL<='0';
		end if;
	
		IF(tc2='0') then
		OUTPUT_VAL<='1';
		end if;
end if;

end process;

end behavior;
 
 
 