library ieee;
use ieee.std_logic_1164.all;

entity prioritaetsdekoder is
    port
    (
        eingang: in std_logic_vector(6 downto 0);
        ausgang: out std_logic_vector(2 downto 0)
    );
end prioritaetsdekoder;

architecture behave of prioritaetsdekoder is
begin
    process (eingang)
    begin
        case eingang is
            when "0000000" => ausgang <= "000";
            when "0000001" => ausgang <= "001";
            when "0000011" => ausgang <= "010";
            when "0000111" => ausgang <= "011";
            when "0001111" => ausgang <= "100";
            when "0011111" => ausgang <= "101";
            when "0111111" => ausgang <= "110";
            when "1111111" => ausgang <= "111";
            when others => ausgang <= "000";
        end case;
    end process;
end behave;