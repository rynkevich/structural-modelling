library ieee;
use ieee.std_logic_1164.all;

entity demux1x4 is
	port(
		X, A, B: in std_logic;
		Z: out std_logic_vector(3 downto 0)
	);
end demux1x4;

architecture behavioral of demux1x4 is
begin
	process (X, A, B)
		variable nA, nB: std_logic;
	begin
		nA := not A;
		nB := not B;
		Z(0) <= X and nA and nB;
		Z(1) <= X and nA and B;
		Z(2) <= X and A and nB;
		Z(3) <= X and A and B;
	end process;
end behavioral;

architecture structural of demux1x4 is
	component inv
		port(
			A: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component and3
		port(
			A, B, C: in std_logic;
			Z: out std_logic
		);
	end component;
	
	signal nA, nB: std_logic;
begin
	U1: inv port map(A, nA);
	U2: inv port map(B, nB);
	U3: and3 port map(X, nA, nB, Z(0));
	U4: and3 port map(X, nA, B, Z(1));
	U5: and3 port map(X, A, nB, Z(2));
	U6: and3 port map(X, A, B, Z(3));
end structural;