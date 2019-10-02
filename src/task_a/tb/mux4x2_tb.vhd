library ieee;
use ieee.std_logic_1164.all;

entity mux4x2_tb is
end mux4x2_tb;

architecture tb of mux4x2_tb is
	component mux4x2
		port(
			S: in std_logic;
			A, B: in std_logic_vector(1 downto 0);
			Z: out std_logic_vector(1 downto 0)
		);
	end component;
	
	signal S: std_logic := '0';
	signal A: std_logic_vector(1 downto 0) := "00";
	signal B: std_logic_vector(1 downto 0) := "00";
	
	signal Z_beh, Z_struct: std_logic_vector(1 downto 0);
	
	signal Error: bit;
begin
	behavioral: entity mux4x2(behavioral) port map(S, A, B, Z_beh);
	structural: entity mux4x2(structural) port map(S, A, B, Z_struct);
	
	S <= not S after 400 ns;
	A(0) <= not A(0) after 200 ns;
	B(0) <= not B(0) after 100 ns;
	A(1) <= not A(1) after 50 ns;
	B(1) <= not B(1) after 25 ns;
	
	Error <= '0' when Z_beh = Z_struct else '1';
end tb;