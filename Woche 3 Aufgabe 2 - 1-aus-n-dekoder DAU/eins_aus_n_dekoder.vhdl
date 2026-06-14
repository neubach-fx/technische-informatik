library ieee;
use ieee.std_logic_1164.all;

-- In diesem Fall ein 1-aus-5-Dekoder
entity eins_aus_n_dekoder is
    port
    (
        eingang: in std_logic_vector(2 downto 0);
        ausgang: out std_logic_vector(4 downto 0)
    );
end eins_aus_n_dekoder;

architecture behave of eins_aus_n_dekoder is
begin
    process (eingang)
    begin
        case eingang is
			when "000" => ausgang <= "00001";
			when "001" => ausgang <= "00010";
			when "010" => ausgang <= "00100";
			when "011" => ausgang <= "01000";
			when "100" => ausgang <= "10000";
			when others => ausgang <= "00001";
        end case;
    end process;
end behave;