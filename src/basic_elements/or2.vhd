library ieee;
use ieee.std_logic_1164.all;

entity or2 is
	port(
		A, B: in std_logic;
		Z: out std_logic
	);
end or2;

architecture behavioral of or2 is
begin
	Z <= A or B;
end behavioral;