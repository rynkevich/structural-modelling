library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
	port(
		A, B, S: in std_logic;
		Z: out std_logic
	);
end mux2x1;

architecture behavioral of mux2x1 is
begin
	Z <= A when S = '0' else B;
end behavioral;

architecture structural of mux2x1 is
	component and2
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component or2
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component inv
		port(
			A: in std_logic;
			Z: out std_logic
		);
	end component;
	
	signal nS, AnS, BS: std_logic;
begin
	U1: inv port map(S, nS);
	U2: and2 port map(A, nS, AnS);
	U3: and2 port map(B, S, BS);
	U4: or2 port map(AnS, BS, Z);
end structural;