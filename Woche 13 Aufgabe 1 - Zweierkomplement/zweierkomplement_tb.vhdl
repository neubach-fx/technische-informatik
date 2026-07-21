library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity zweierkomplement_tb is
	constant N: natural := 8;
end zweierkomplement_tb;

architecture structural of zweierkomplement_tb is
	component zweierkomplement is
		generic(N : integer := N);
		port(
			input : in std_logic_vector(N-1 downto 0);
			output : out std_logic_vector(N-1 downto 0)
		);
	end component zweierkomplement;
	
	signal input, output : std_logic_vector(N-1 downto 0);
begin
	uut : zweierkomplement generic map (N =>N)
                               port map(input=>input, output=>output);
							   
	process
	begin
		wait for 10 ns;
		input <= std_logic_vector(to_unsigned(0, N)); -- auf 0 setzen
		wait for 10 ns;
		assert output = std_logic_vector(to_signed(-0, N)) report "0 failed"; 
		
		input <= std_logic_vector(to_unsigned(5, N)); -- 5 / 00000101
		wait for 10 ns;
		assert output = std_logic_vector(to_signed(-5, N)) report "5 failed"; -- "11111011"
		
		input <= std_logic_vector(to_unsigned(25, N)); -- 25 / 00011001
		wait for 10 ns;
		assert output = std_logic_vector(to_signed(-25, N)) report "25 failed";
		
		input <= std_logic_vector(to_unsigned(50, N)); -- 50 / 00110010
		wait for 10 ns;
		assert output = std_logic_vector(to_signed(-50, N)) report "50 failed";
		
		assert false report "Reached end of test";
		wait;
		
	end process;
end;
