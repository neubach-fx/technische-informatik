library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_4bit is 
    port (
        INP_A, INP_B, SEL: in  std_logic_vector (3 downto 0);
        OUT_ALU: out std_logic_vector (3 downto 0)
    );
end entity;

architecture behave of ALU_4bit is
begin
	calc: process (INP_A, INP_B, SEL)
	begin
		case SEL is
			when "0000" =>
				OUT_ALU <= std_logic_vector(unsigned(INP_A) + unsigned(INP_B));
			when "0001" =>
				OUT_ALU <= std_logic_vector(unsigned(INP_A) - unsigned(INP_B));
			when "0010" =>
				OUT_ALU <= std_logic_vector(unsigned(INP_A) - 1);
			when "0011" =>
				OUT_ALU <= std_logic_vector(unsigned(INP_A) + 1);
			when "0100" =>
				OUT_ALU <= std_logic_vector(unsigned(INP_A) and unsigned(INP_B));
			when "0101" =>
				OUT_ALU <= std_logic_vector(unsigned(INP_A) or unsigned(INP_B));
			when "0110" =>
				OUT_ALU <= std_logic_vector(not unsigned(INP_A));
			when "0111" =>
				OUT_ALU <= std_logic_vector(unsigned(INP_A) xor unsigned(INP_B));
			when others =>
				OUT_ALU <= "0000";
		end case;
	end process;
end architecture;
