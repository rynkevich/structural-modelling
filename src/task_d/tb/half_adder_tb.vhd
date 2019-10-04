library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end half_adder_tb;

architecture tb of half_adder_tb is
	component half_adder
		port(
			A, B: in std_logic;
			S, C: out std_logic
		);
	end component;
	
	signal A: std_logic := '0';
	signal B: std_logic := '0';
	
	signal S_beh, S_struct, C_beh, C_struct: std_logic;
	
	signal Error: bit;
begin
	behavioral: entity half_adder(behavioral) port map(A, B, S_beh, C_beh);
	structural: entity half_adder(structural) port map(A, B, S_struct, C_struct);
	
	A <= not A after 100 ns;
	B <= not B after 50 ns;
	
	Error <= '0' when S_beh = S_struct and C_beh = C_struct else '1';
end tb;