library ieee;
use ieee.std_logic_1164.all;

entity inv is
	port(
		A: in std_logic;
		Z: out std_logic
	);
end inv;

architecture behavioral of inv is
begin
	Z <= not A;
end behavioral;