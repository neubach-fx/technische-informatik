library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fakultaet is
    port
    (
        eingang: in unsigned(3 downto 0);
        ausgang: out unsigned(3 downto 0)
    );
end fakultaet;

architecture behave of fakultaet is
begin
    process (eingang)
    	variable verbleibend: unsigned(3 downto 0) := (others => '0');
		variable zwischenergebnis: unsigned(3 downto 0) := to_unsigned(1, 4); -- erzeugt eine 1 mit 4 bit, also "0001"
	begin
		verbleibend := eingang; -- müssen hier gesetzt werden, damit für jeden Testfall der TB resettet
		zwischenergebnis := to_unsigned(1, 4);
		while verbleibend > 1 loop
			zwischenergebnis := 
				resize( -- Das Produkt hat mehr bit und muss gekürzt werden, um in zwischenergebnis rein zu passen
					zwischenergebnis * verbleibend, 
					zwischenergebnis'length
				);
			verbleibend := verbleibend - 1;
		end loop;
		ausgang <= resize(zwischenergebnis, ausgang'length);
    end process;
end behave;