library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity full_adder2_tb is
end full_adder2_tb;

architecture tb of full_adder2_tb is
	component full_adder2
		port(
			A, B: in std_logic_vector(1 downto 0);
			S: out std_logic_vector(1 downto 0);
			C: out std_logic
		);
	end component;
	
	signal A: std_logic_vector(1 downto 0) := "00";
	signal B: std_logic_vector(1 downto 0) := "00";
	
	signal S_beh, S_struct: std_logic_vector(1 downto 0) := "00";
	signal C_beh, C_struct: std_logic;
	
	signal Error: bit;
begin
	behavioral: entity full_adder2(behavioral) port map(A, B, S_beh, C_beh);
	structural: entity full_adder2(structural) port map(A, B, S_struct, C_struct);
	
	A <= A + "1" after 100 ns;
	B <= B + "1" after 25 ns;
	
	Error <= '0' when S_beh = S_struct and C_beh = C_struct else '1';
end tb;