library ieee;
use ieee.std_logic_1164.all;

entity or3 is
	port(
		A, B, C: in std_logic;
		Z: out std_logic
	);
end or3;

architecture behavioral of or3 is
begin
	Z <= A or B or C;
end behavioral;