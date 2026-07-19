library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity systolisches_array is
    port 
    (
        clk, reset: in std_logic;
		x_in: in std_logic_vector(7 downto 0); --Broadcast-Eingang
		w_in_0: in std_logic_vector(7 downto 0);
		w_in_1: in std_logic_vector(7 downto 0);
		w_in_2: in std_logic_vector(7 downto 0);
		right_out: out std_logic_vector(15 downto 0) --Broadcast-Ausgang
    );
end systolisches_array;

architecture behave of systolisches_array is
	component systolische_zelle is
    port 
		(
			clk, reset: in std_logic;
			x_in: in std_logic_vector(7 downto 0);
			w_in: in std_logic_vector(7 downto 0);
			left_in: in std_logic_vector(15 downto 0);
			right_out: out std_logic_vector(15 downto 0)
		);
	end component systolische_zelle;
	
	-- Die Verbindungen von links nach rechts zwischen den PEs.
    -- y_left(0) ist der linke Eingang des ersten PEs (= 0).
    -- y_left(3) ist der rechte Ausgang des letzten PEs (= right_out).
	-- 4 Verbindungen für 3 PEs.
    type y_link_type is array (0 to 3) of std_logic_vector(15 downto 0);
    signal y_left : y_link_type;
	
	-- Die Verbindungen der Ws zu den PEs.
	-- 3 Arrayelemente für 3 PEs.
	type w_array_type is array (0 to 2) of std_logic_vector(7 downto 0);
	signal w_array : w_array_type;
	
begin
	
	-- Der linke Eingang des ersten PEs wird auf 0 gesetzt.
	y_left(0) <= (others => '0');
	
	-- Der rechte Ausgang des letzten PEs wird auf den Gesamtausgang gesetzt.
	right_out <= y_left(3);
	
	-- Zuweisung der Ws in das Array
	w_array(0) <= w_in_0;
	w_array(1) <= w_in_1;
	w_array(2) <= w_in_2;
	
	-- 3 PEs werden instanziiert mit for generate
	PE_GEN: for i in 0 to 2 generate
		PE_INST : systolische_zelle
			port map 
			(
				clk			=> clk,
				reset		=> reset,
				x_in		=> x_in,
				w_in		=> w_array(i),	  -- nimmt das entsprechende w aus dem Array
				left_in 	=> y_left(i),	  -- an den Ausgang des linken Nachbarn
				right_out 	=> y_left(i + 1)  -- an den Eingang des rechten Nachbarn
			);
	end generate;
end behave;