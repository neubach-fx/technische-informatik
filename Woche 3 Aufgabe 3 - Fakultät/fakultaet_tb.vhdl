library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fakultaet_tb is
end fakultaet_tb;

architecture tb of fakultaet_tb is
    
	-- Komponenten
	component fakultaet
        port
		(
			eingang: in unsigned(3 downto 0);
			ausgang: out unsigned(3 downto 0)
		);
    end component;

	-- Signale
	signal eingang: unsigned(3 downto 0);
	signal ausgang: unsigned(3 downto 0);
	
	-- Taktkonstante
	constant CLK_PERIOD: time := 1 ns;
begin
    my_fakultaet: fakultaet port map
           (eingang => eingang, ausgang => ausgang);

    process begin
		
		eingang <= (others => '0'); -- Initialisierung: Setzt alle auf 0
		wait for CLK_PERIOD;

		eingang <= "XXXX";
		wait for CLK_PERIOD;

		eingang <= "0000";
		wait for CLK_PERIOD;

		eingang <= "0001";
		wait for CLK_PERIOD;

		eingang <= "0010";
		wait for CLK_PERIOD;

		eingang <= "0011";
		wait for CLK_PERIOD;

		assert false report "Reached end of test";
		wait;
    end process;
end tb;
