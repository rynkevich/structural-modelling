library ieee;
use ieee.std_logic_1164.all;

entity full_adder_tb is
end full_adder_tb;

architecture tb of full_adder_tb is
	component full_adder
		port(
			A, B, Cin: in std_logic;
			S, C: out std_logic
		);
	end component;
	
	signal A: std_logic := '0';
	signal B: std_logic := '0';
	signal Cin: std_logic := '0';
	
	signal S_beh, S_struct, C_beh, C_struct: std_logic;
	
	signal Error: bit;
begin
	behavioral: entity full_adder(behavioral) port map(A, B, Cin, S_beh, C_beh);
	structural: entity full_adder(structural) port map(A, B, Cin, S_struct, C_struct);
	
	A <= not A after 100 ns;
	B <= not B after 50 ns;
	Cin <= not Cin after 25 ns;
	
	Error <= '0' when S_beh = S_struct and C_beh = C_struct else '1';
end tb;