library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
	port(
		A, B: in std_logic;
		S, C: out std_logic
	);
end half_adder;

architecture behavioral of half_adder is
begin
	S <= A xor B;
	C <= A and B;
end;

architecture structural of half_adder is
	component xor2	  
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component and2	  
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;
begin
	U1: xor2 port map(A, B, S);
	U2: and2 port map(A, B, C);
end structural;