library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ampel is
    port 
    (
        clk, reset, enable: in std_logic;
		rot_h, gelb_h, gruen_h, rot_n, gelb_n, gruen_n: out std_logic
    );
end ampel;

architecture behave of ampel is
    signal state, next_state: unsigned(3 downto 0);
begin
    transition_logic: process (state)
	begin
		next_state <= state + 1;
	end process transition_logic;
	
	state_memory: process (clk, reset, enable, next_state)
	begin
		if reset = '1' 
			then state <= "0000";
		end if;
		if enable = '1' and rising_edge(clk) 
			then state <= next_state;
		end if;
	end process state_memory;
	
	output_logic: process (state)
	begin
		-- Default-Werte
		rot_h   <= '0';
		gelb_h  <= '0'; 
		gruen_h <= '0';
		
		rot_n   <= '0';
		gelb_n  <= '0'; 
		gruen_n <= '0';
		
		case state is
			when "0000" =>
				rot_h   <= '1';
				
				rot_n   <= '1';
				
			when "0001" =>
				rot_h   <= '1';
				gelb_h  <= '1';
				
				rot_n   <= '1';
				
			when "0010" | "0011" | "0100" | "0101" | "0110" | "0111" | "1000" =>
				gruen_h <= '1';
				
				rot_n   <= '1';
				
			when "1001" =>
				gelb_h  <= '1';
				
				rot_n   <= '1';
				
			when "1010" =>
				rot_h   <= '1';
				
				rot_n   <= '1';
				
			when "1011" =>
				rot_h   <= '1';
				
				rot_n   <= '1';
				gelb_n  <= '1';
				
			when "1100" | "1101" | "1110" =>
				rot_h   <= '1';
				
				gruen_n <= '1';
				
			when "1111" =>
				rot_h   <= '1';
				
				gelb_n  <= '1';
				
			when others =>
				rot_h   <= '1';
				
				rot_n   <= '1';
				
		end case;
	end process output_logic;
end behave;