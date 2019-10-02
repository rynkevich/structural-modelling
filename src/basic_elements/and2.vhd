library ieee;
use ieee.std_logic_1164.all;

entity and2 is
	port(
		A, B: in std_logic;
		Z: out std_logic
	);
end and2;

architecture behavioral of and2 is
begin
	Z <= A and B;
end behavioral;