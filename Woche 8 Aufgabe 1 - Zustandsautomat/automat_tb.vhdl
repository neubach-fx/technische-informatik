library ieee;
use ieee.std_logic_1164.all;

entity automat_tb is
end automat_tb;

architecture test of automat_tb is
	
	-- Komponenten
	component automat is
		port 
		(
			clk, reset, enable: in std_logic;
			i: in std_logic_vector(2 downto 0); -- 0, 1, 2, 3, 4
			o: out std_logic_vector(1 downto 0) -- 0, 1, 2
		);
	end component automat;

	-- Signale
	signal clk:    std_logic := '0';
	signal reset:  std_logic := '0';
	signal enable: std_logic := '0';
	signal i: 	   std_logic_vector(2 downto 0) := "000";
	signal o: 	   std_logic_vector(1 downto 0);
	
	-- Taktkonstante
	constant CLK_PERIOD: time := 20 ns;
begin
	
	-- Instanziierung
	automat_steuer: automat
	port map (
		clk 	=> clk, 
		reset 	=> reset, 
		enable 	=> enable,
		i		=> i,
		o 		=> o
	);
	
	-- Taktgenerator (läuft ewig)
	clk_process: process
	begin
		clk <= '0';
		wait for CLK_PERIOD / 2;
		clk <= '1';
		wait for CLK_PERIOD / 2;
	end process;
	
	-- Test-Logik / Stimuli
	stimuli_process: process
	begin
		-- Asynchroner reset
		reset <= '1';
		wait for CLK_PERIOD;
		reset <= '0';
		
		-- Enable
		wait for CLK_PERIOD;
		enable <= '1';
		
		-- Testweg
		i <= "100";
		wait for CLK_PERIOD;
		i <= "100";
		wait for CLK_PERIOD;
		i <= "000";
		wait for CLK_PERIOD;
		
		-- Testende
		assert false report "Simulation beendet" severity note;
		wait;
	end process;
end test;