library ieee;
use ieee.std_logic_1164.all;

entity and3 is
	port(
		A, B, C: in std_logic;
		Z: out std_logic
	);
end and3;

architecture behavioral of and3 is
begin
	Z <= A and B and C;
end behavioral;