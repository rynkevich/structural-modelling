library ieee;
use ieee.std_logic_1164.all;

entity full_adder2 is
	port(
		A, B: in std_logic_vector(1 downto 0);
		S: out std_logic_vector(1 downto 0);
		C: out std_logic
	);
end full_adder2;

architecture behavioral of full_adder2 is
	signal C1: std_logic;
begin
	S(0) <= A(0) xor B(0);
	C1 <= A(0) and B(0);
	S(1) <= A(1) xor B(1) xor C1;
	C <= (A(1) and B(1) and not C1) or (C1 and (A(1) or B(1)));
end;

architecture structural of full_adder2 is
	component full_adder	  						    
		port(
			A, B, Cin: in std_logic;
			S, C: out std_logic
		);
	end component;
	
	signal C1: std_logic;
begin
	U1: full_adder port map(A(0), B(0), '0', S(0), C1);
	U2: full_adder port map(A(1), B(1), C1, S(1), C);
end structural;