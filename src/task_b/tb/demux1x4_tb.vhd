library ieee;
use ieee.std_logic_1164.all;

entity demux1x4_tb is
end demux1x4_tb;

architecture tb of demux1x4_tb is
	component demux1x4
		port(
			X, A, B: in std_logic;
			Z: out std_logic_vector(3 downto 0)
		);
	end component;
	
	signal X: std_logic := '0';
	signal A: std_logic := '0';
	signal B: std_logic := '0';
	
	signal Z_beh, Z_struct: std_logic_vector(3 downto 0);
	
	signal Error: bit;
begin
	behavioral: entity demux1x4(behavioral) port map(X, A, B, Z_beh);
	structural: entity demux1x4(structural)	port map(X, A, B, Z_struct);
	
	X <= not X after 100 ns;
	A <= not A after 50 ns;
	B <= not B after 25 ns;
	
	Error <= '0' when Z_beh = Z_struct else '1';
end tb;