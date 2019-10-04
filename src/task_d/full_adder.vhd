library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
		A, B, Cin: in std_logic;
		S, C: out std_logic
	);
end full_adder;

architecture behavioral of full_adder is
	signal C1, C2, S1: std_logic;
begin
	S1 <= A xor B;
	C1 <= A and B;
	S <= S1 xor Cin;
	C2 <= S1 and Cin;
	C <= C1 or C2;
end;

architecture structural of full_adder is
	component half_adder	  
		port(
			A, B: in std_logic;
			S, C: out std_logic
		);
	end component;
	
	component or2	  
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;
	
	signal C1, C2, S1: std_logic;
begin
	U1: half_adder port map(A, B, S1, C1);
	U2: half_adder port map(S1, Cin, S, C2);
	U3: or2 port map(C1, C2, C);
end structural;