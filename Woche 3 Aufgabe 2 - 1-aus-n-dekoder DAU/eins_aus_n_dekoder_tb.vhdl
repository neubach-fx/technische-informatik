library ieee;
use ieee.std_logic_1164.all;

entity eins_aus_n_dekoder_tb is
end eins_aus_n_dekoder_tb;

architecture tb of eins_aus_n_dekoder_tb is
    component eins_aus_n_dekoder
        port
		(
			eingang: in std_logic_vector(2 downto 0);
			ausgang: out std_logic_vector(4 downto 0)
		);
    end component;

	signal eingang: std_logic_vector(2 downto 0);
	signal ausgang: std_logic_vector(4 downto 0);

begin
    my_eins_aus_n_dekoder: eins_aus_n_dekoder port map
           (eingang => eingang, ausgang => ausgang);

    process begin
		
		eingang <= (others => '0'); -- Initialisierung: Setzt alle auf 0
		wait for 1 ns;

		eingang <= "XXX";
		wait for 1 ns;

		eingang <= "000";
		wait for 1 ns;

		eingang <= "001";
		wait for 1 ns;

		eingang <= "010";
		wait for 1 ns;

		eingang <= "011";
		wait for 1 ns;

		eingang <= "100";
		wait for 1 ns;

		eingang <= "101";
		wait for 1 ns;

		eingang <= "110";
		wait for 1 ns;

		eingang <= "111";
		wait for 1 ns;

		assert false report "Reached end of test";
		wait;
    end process;
end tb;
