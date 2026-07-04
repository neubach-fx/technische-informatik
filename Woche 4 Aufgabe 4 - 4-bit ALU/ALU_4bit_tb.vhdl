library ieee;
use ieee.std_logic_1164.all;

entity ALU_4bit_tb is
end ALU_4bit_tb;

architecture test of ALU_4bit_tb is
	
	-- Komponenten	
	component ALU_4bit
		port (
			INP_A, INP_B, SEL: in  std_logic_vector (3 downto 0);
			OUT_ALU: out std_logic_vector (3 downto 0)
		);
	end component ALU_4bit;

	-- Signale	
	signal INP_A: std_logic_vector (3 downto 0) := "0000";
	signal INP_B: std_logic_vector (3 downto 0) := "0000";
	signal SEL: std_logic_vector (3 downto 0) := "0000";
	signal OUT_ALU: std_logic_vector (3 downto 0);
	
	-- Taktkonstante
	constant CLK_PERIOD: time := 10 ns;
begin
	
	-- Instanziierung
	my_ALU_4bit: ALU_4bit
	port map (
		INP_A	=> INP_A,
		INP_B	=> INP_B,
		SEL		=> SEL,
		OUT_ALU	=> OUT_ALU
	);
	
	-- Test-Logik / Stimuli
	stimuli_process: process
	begin
		-- Reset
		INP_A <= "0000";
		INP_B <= "0000";
		SEL <= "0000";
		wait for CLK_PERIOD;
	
		INP_A <= "1001"; -- 9
		INP_B <= "0100"; -- 4
	
		-- A+B
		SEL <= "0000";
		wait for CLK_PERIOD;
	
		-- A-B
		SEL <= "0001";
		wait for CLK_PERIOD;
	
		-- A-1
		SEL <= "0010";
		wait for CLK_PERIOD;
	
		-- A+1
		SEL <= "0011";
		wait for CLK_PERIOD;
	
		-- A UND B
		SEL <= "0100";
		wait for CLK_PERIOD;
	
		-- A ODER B
		SEL <= "0101";
		wait for CLK_PERIOD;
	
		-- NICHT A
		SEL <= "0110";
		wait for CLK_PERIOD;
	
		-- A XOR B
		SEL <= "0111";
		wait for CLK_PERIOD;
	
		-- undefined
		SEL <= "1000";
		wait for CLK_PERIOD;
		
		INP_A <= "0010"; -- 2
		INP_B <= "0111"; -- 7
	
		-- A+B
		SEL <= "0000";
		wait for CLK_PERIOD;
	
		-- A-B
		SEL <= "0001";
		wait for CLK_PERIOD;
	
		-- A-1
		SEL <= "0010";
		wait for CLK_PERIOD;
	
		-- A+1
		SEL <= "0011";
		wait for CLK_PERIOD;
	
		-- A UND B
		SEL <= "0100";
		wait for CLK_PERIOD;
	
		-- A ODER B
		SEL <= "0101";
		wait for CLK_PERIOD;
	
		-- NICHT A
		SEL <= "0110";
		wait for CLK_PERIOD;
	
		-- A XOR B
		SEL <= "0111";
		wait for CLK_PERIOD;
	
		-- undefined
		SEL <= "1000";
		wait for CLK_PERIOD;
		
		-- Testende
		assert false report "Simulation beendet" severity note;
		wait;
	end process;
end test;