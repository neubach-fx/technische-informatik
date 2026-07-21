library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zweierkomplement is
    generic(n : integer := 8);
    port(
		input : in std_logic_vector(n-1 downto 0);
        output : out std_logic_vector(n-1 downto 0)
	);
end zweierkomplement;

architecture behave of zweierkomplement is
begin
	output <= std_logic_vector(unsigned(not input) + 1);
end;
