library ieee;
use ieee.std_logic_1164.all;

entity mux4x2 is
	port(
		S: in std_logic;
		A, B: in std_logic_vector(1 downto 0);
		Z: out std_logic_vector(1 downto 0)
	);
end mux4x2;

architecture behavioral of mux4x2 is
begin
	Z <= A when S = '0' else B;
end behavioral;

architecture structural of mux4x2 is
	component mux2x1
		port(
			A, B, S: in std_logic;
			Z: out std_logic
		);
	end component;
begin
	U1: mux2x1 port map(A(0), B(0), S, Z(0));
	U2: mux2x1 port map(A(1), B(1), S, Z(1)); 
end structural;