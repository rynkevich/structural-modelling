library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity and5_tb is
end and5_tb;

architecture tb of and5_tb is
	component and5
		port(
			A: in std_logic_vector(4 downto 0);
			Z: out std_logic
		);
	end component;
	
	signal A: std_logic_vector(4 downto 0) := "00000";
	
	signal Z_beh, Z_struct: std_logic;
	
	signal Error: bit;
begin
	behavioral: entity and5(behavioral) port map(A, Z_beh);
	structural: entity and5(structural)	port map(A, Z_struct);
	
	A <= A + "1" after 10 ns;
	
	Error <= '0' when Z_beh = Z_struct else '1';
end tb;