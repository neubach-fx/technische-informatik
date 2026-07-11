library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity automat is
    port 
    (
        clk, reset, enable: in std_logic;
		i: in std_logic_vector(2 downto 0); -- 0, 1, 2, 3, 4
		o: out std_logic_vector(1 downto 0) -- 0, 1, 2
    );
end automat;

architecture behave of automat is
    signal state, next_state: unsigned(2 downto 0); -- 5 states
begin
	-- Realisierung als 2-Prozess-Architektur
	
    transition_and_output_logic: process (i, state)
	begin
		case state is
			when "000" =>
				case i is
					when "000" =>
						next_state  <= "000";
						o 			<=  "01";
					when "001" | "010" | "011" =>
						next_state  <= "001";
						o 			<=  "00";
					when "100" =>
						next_state  <= "010";
						o 			<=  "10";
					when others =>
						next_state  <= "000";
						o 			<=  "00";
				end case;
			when "001" =>
				case i is
					when "001" =>
						next_state  <= "001";
						o 			<=  "01";
					when "000" | "010" | "011" =>
						next_state  <= "010";
						o 			<=  "00";
					when "100" =>
						next_state  <= "011";
						o 			<=  "10";
					when others =>
						next_state  <= "000";
						o 			<=  "00";
				end case;
			when "010" =>
				case i is
					when "010" =>
						next_state  <= "010";
						o 			<=  "01";
					when "000" | "001" | "011" =>
						next_state  <= "011";
						o 			<=  "00";
					when "100" =>
						next_state  <= "100";
						o 			<=  "10";
					when others =>
						next_state  <= "000";
						o 			<=  "00";
				end case;
			when "011" =>
				case i is
					when "011" =>
						next_state  <= "011";
						o 			<=  "01";
					when "000" | "001" | "010" | "100" =>
						next_state  <= "100";
						o 			<=  "10";
					when others =>
						next_state  <= "000";
						o 			<=  "00";
				end case;
			when "100" =>
				case i is
					when "100" =>
						next_state  <= "100";
						o 			<=  "01";
					when "000" | "001" | "010" | "011" =>
						next_state  <= "000";
						o 			<=  "00";
					when others =>
						next_state  <= "000";
						o 			<=  "00";
				end case;
			when others =>
				next_state  <= "000";
				o 			<=  "00";
		end case;
	end process transition_and_output_logic;
	
	state_memory: process (clk, reset, enable, next_state)
	begin
		if reset = '1' 
			then state <= (others => '0');
		end if;
		if enable = '1' and rising_edge(clk) 
			then state <= next_state;
		end if;
	end process state_memory;
end behave;