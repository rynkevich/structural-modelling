library ieee;
use ieee.std_logic_1164.all;

entity mux2x1_tb is
end mux2x1_tb;

architecture tb of mux2x1_tb is
	component mux2x1
		port(
			A, B, S: in std_logic;
			Z: out std_logic
		);
	end component;
	
	signal S: std_logic := '0';
	signal A: std_logic := '0';
	signal B: std_logic := '0';
	
	signal Z_beh, Z_struct: std_logic;
	
	signal Error: bit;
begin
	behavioral: entity mux2x1(behavioral) port map(A, B, S, Z_beh);
	structural: entity mux2x1(structural) port map(A, B, S, Z_struct);
	
	S <= not S after 100 ns;
	A <= not A after 50 ns;
	B <= not B after 25 ns;
	
	Error <= '0' when Z_beh = Z_struct else '1';
end tb;