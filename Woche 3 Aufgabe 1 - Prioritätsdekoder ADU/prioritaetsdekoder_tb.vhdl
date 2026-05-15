library ieee;
use ieee.std_logic_1164.all;

entity prioritaetsdekoder_tb is
end prioritaetsdekoder_tb;

architecture tb of prioritaetsdekoder_tb is
    component prioritaetsdekoder
        port
		(
			eingang: in std_logic_vector(6 downto 0);
	        ausgang: out std_logic_vector(2 downto 0)
		);
    end component;

	signal eingang: std_logic_vector(6 downto 0);
	signal ausgang: std_logic_vector(2 downto 0);

begin
    my_prioritaetsdekoder: prioritaetsdekoder port map
           (eingang => eingang, ausgang => ausgang);

    process begin
		
		eingang <= (others => '0'); -- Initialisierung: Setzt alle auf 0
		wait for 1 ns;

		eingang <= "XXXXXXX";
		wait for 1 ns;

		eingang <= "0000000";
		wait for 1 ns;

		eingang <= "0000001";
		wait for 1 ns;

		eingang <= "0000011";
		wait for 1 ns;

		eingang <= "0000111";
		wait for 1 ns;

		eingang <= "0001111";
		wait for 1 ns;

		eingang <= "0011111";
		wait for 1 ns;

		eingang <= "0111111";
		wait for 1 ns;

		eingang <= "1111111";
		wait for 1 ns;

		assert false report "Reached end of test";
		wait;
    end process;
end tb;
