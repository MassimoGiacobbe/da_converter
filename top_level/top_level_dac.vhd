library ieee;
use ieee.std_logic_1164.all;

entity top_level_dac is
PORT(
KEY : in std_logic_vector(1 downto 0);
CLOCK_50 : in std_logic;
GPIO_0 : out std_logic_vector(1 downto 0);
HEX1 : out std_logic_vector(6 downto 0);
HEX0 : out std_logic_vector(6 downto 0));
end top_level_dac;

architecture behavior of top_level_dac is


component two_display_hex is
PORT(
number_in : in std_logic_vector (7 downto 0);
dis_dec, dis_uni : out std_logic_vector(6 downto 0));
end component;


component PWM_da_conversion is
GENERIC(N: integer :=8);
PORT( 
CLOCK_50 : in std_logic;
A_RSTn : in std_logic;
freq : in std_logic_vector(1 downto 0);
INPUT_VAL : in std_logic_vector(N-1 downto 0);
OUTPUT_VAL : out std_logic);
end component;

component ppm_converter is
GENERIC(N : integer:=8);
PORT(
CLOCK_50, RSTn : in std_logic;
i_data : in  std_logic_vector(N-1 downto 0);
freq : in std_logic_vector(1 downto 0);
bit_o : buffer std_logic);
end component;


component da_converter_hd is
	port (
		clk_clk                           : in    std_logic                     := '0';             --                         clk.clk
		hex0_export                       : out   std_logic_vector(7 downto 0);                     --                        hex0.export
		leds_export                       : out   std_logic_vector(1 downto 0);                     --                        leds.export
		new_sdram_controller_0_wire_addr  : out   std_logic_vector(11 downto 0);                    -- new_sdram_controller_0_wire.addr
		new_sdram_controller_0_wire_ba    : out   std_logic_vector(1 downto 0);                     --                            .ba
		new_sdram_controller_0_wire_cas_n : out   std_logic;                                        --                            .cas_n
		new_sdram_controller_0_wire_cke   : out   std_logic;                                        --                            .cke
		new_sdram_controller_0_wire_cs_n  : out   std_logic;                                        --                            .cs_n
		new_sdram_controller_0_wire_dq    : inout std_logic_vector(31 downto 0) := (others => '0'); --                            .dq
		new_sdram_controller_0_wire_dqm   : out   std_logic_vector(3 downto 0);                     --                            .dqm
		new_sdram_controller_0_wire_ras_n : out   std_logic;                                        --                            .ras_n
		new_sdram_controller_0_wire_we_n  : out   std_logic                                         --                            .we_n
	);
end component;

signal i_conversion : std_logic_vector(7 downto 0);
signal i_freq : std_logic_vector(1 downto 0);


begin

processore : da_converter_hd PORT MAP(CLOCK_50,i_conversion,i_freq);

PWM : PWM_da_conversion PORT MAP(CLOCK_50, KEY(0),i_freq,i_conversion, GPIO_0(0));

PPM : ppm_converter PORT MAP(CLOCK_50, KEY(0),i_conversion, i_freq, GPIO_0(1));

display : two_display_hex PORT MAP(i_conversion, HEX0, HEX1);

end behavior;
