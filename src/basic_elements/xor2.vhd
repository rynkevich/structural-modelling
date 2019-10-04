library ieee;
use ieee.std_logic_1164.all;

entity xor2 is
	port(
		A, B: in std_logic;
		Z: out std_logic
	);
end xor2;

architecture behavioral of xor2 is
begin
	Z <= A xor B;
end behavioral;