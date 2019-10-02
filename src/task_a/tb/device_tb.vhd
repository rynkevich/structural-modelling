library ieee;
use ieee.std_logic_1164.all;

entity device_tb is
end device_tb;

architecture tb of device_tb is
	component device
		port(
			X, Y, Z: in std_logic;
	    	F: out std_logic
		);
	end component;
	
	signal X: std_logic := '0';
	signal Y: std_logic := '0';
	signal Z: std_logic := '0';
	
	signal F_beh, F_struct: std_logic;
	
	signal Error: bit;
begin
	behavioral: entity device(behavioral) port map(X, Y, Z, F_beh);
	structural: entity device(structural) port map(X, Y, Z, F_struct);
	
	X <= not X after 100 ns;
	Y <= not Y after 50 ns;
	Z <= not Z after 25 ns;
	
	Error <= '0' when F_beh = F_struct else '1';
end tb;