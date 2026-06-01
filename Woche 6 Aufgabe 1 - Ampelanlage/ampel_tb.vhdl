library ieee;
use ieee.std_logic_1164.all;

entity ampel_tb is
end ampel_tb;

architecture test of ampel_tb is
	
	-- Komponenten
	component ampel
		port 
		(
			clk, reset, enable: in std_logic;
			rot_h, gelb_h, gruen_h, rot_n, gelb_n, gruen_n: out std_logic
		);
	end component;

	-- Signale
	signal clk:    std_logic := '0';
	signal reset:  std_logic := '0';
	signal enable: std_logic := '0';
	signal rot_h, gelb_h, gruen_h, rot_n, gelb_n, gruen_n: std_logic;
	
	-- Taktkonstante
	constant CLK_PERIOD: time := 2000 ms;
begin
	
	-- Instanziierung
	ampel_steuer: ampel
	port map (
		clk 	=> clk, 
		reset 	=> reset, 
		enable 	=> enable,
		rot_h 	=> rot_h, 
		gelb_h 	=> gelb_h, 
		gruen_h => gruen_h, 
		rot_n 	=> rot_n, 
		gelb_n 	=> gelb_n, 
		gruen_n => gruen_n
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
		
		-- Warten, da hier keine Inputs
		wait for 20 * CLK_PERIOD;
		
		-- Testende
		assert false report "Simulation beendet" severity note;
		wait;
	end process;
end test;