library ieee;
use ieee.std_logic_1164.all;

entity and5 is
	port(
		A: in std_logic_vector(4 downto 0);
		Z: out std_logic
	);
end and5;

architecture behavioral of and5 is
	signal X: std_logic_vector(4 downto 0);
begin
	AND2_0: X(0) <= A(0) and A(1);
	AND2_LOOP: for I in 1 to 3 generate
		AND2_I: X(I) <= X(I - 1) and A(I + 1);
	end generate;
	Z <= X(3);
end behavioral;

architecture structural of and5 is
	component and2
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;
	signal X: std_logic_vector(4 downto 0);
begin
	AND2_0: and2 port map(A(0), A(1), X(0));
	AND2_LOOP: for I in 1 to 3 generate
		AND2_I: AND2 port map(X(I - 1), A(I + 1), X(I));
	end generate;
	Z <= X(3);
end structural;