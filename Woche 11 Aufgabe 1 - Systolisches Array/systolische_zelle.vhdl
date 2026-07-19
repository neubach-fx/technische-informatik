library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity systolische_zelle is
    port 
    (
        clk, reset: in std_logic;
		x_in: in std_logic_vector(7 downto 0);
		w_in: in std_logic_vector(7 downto 0);
		left_in: in std_logic_vector(15 downto 0);
		right_out: out std_logic_vector(15 downto 0)
    );
end systolische_zelle;

architecture behave of systolische_zelle is
    signal memory: std_logic_vector(15 downto 0);
begin
	calc: process (clk, reset)
	begin
		if reset = '1' then 
			memory <= (others => '0');
		elsif rising_edge(clk) then 
			memory <= std_logic_vector((signed(x_in) * signed(w_in)) + signed(left_in));
		end if;
	end process calc;
	right_out <= memory;
end behave;