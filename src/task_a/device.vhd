library ieee;
use ieee.std_logic_1164.all;

entity device is
	port(
		X, Y, Z: in std_logic;
	    F: out std_logic
	);
end device;	

architecture behavioral of device is
begin
	F <= (X or not Y or not Z) and (not X or Z) and (Y or Z);
end behavioral;

architecture structural of device is	
	component inv
		port(
			A: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component or3
		port(
			A, B, C: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component or2
		port(
			A, B: in std_logic;
			Z: out std_logic
		);
	end component;
	
	component and3
		port(
			A, B, C: in std_logic;
			Z: out std_logic
		);
	end component;
	
	signal nX, nY, nZ: std_logic;
	signal X_nY_nZ, nX_Z, Y_Z: std_logic; 
begin
	U1: inv port map(X, nX);
	U2: inv port map(Y, nY);
	U3: inv port map(Z, nZ);
	U4: or3 port map(X, nY, nZ, X_nY_nZ);
	U5: or2 port map(nX, Z, nX_Z);
	U6: or2 port map(Y, Z, Y_Z);
	U7: and3 port map(X_nY_nZ, nX_Z, Y_Z, F);
end structural;