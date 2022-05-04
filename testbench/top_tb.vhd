library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity  top_tb is
end entity;

-----------------------------------------------------------

architecture testbench of top_tb is

	-- Testbench DUT generics


	-- Testbench DUT ports
	signal clk : std_logic;
	signal reset : std_logic;
	signal test_x : std_logic_vector(15 downto 0);
	signal test_y : std_logic_vector(15 downto 0);

	-- Other constants
	constant C_CLK_PERIOD : time := 10 ns; 

begin
	-----------------------------------------------------------
	-- Clocks and Reset
	-----------------------------------------------------------
	CLK_GEN : process
	begin
		clk <= '1';
		wait for C_CLK_PERIOD/2;
		clk <= '0';
		wait for C_CLK_PERIOD/2;
	end process CLK_GEN;

	RESET_GEN : process
	begin
		reset <= '1',
		         '0' after 20.0*C_CLK_PERIOD;
		wait;
	end process RESET_GEN;

	-----------------------------------------------------------
	-- Testbench Stimulus
	-----------------------------------------------------------
	TEST_PROCESS: process
	begin
		wait until reset='0';

		test_x <= x"0000";
		wait for C_CLK_PERIOD*2;

		report "x is " & integer'image(to_integer(signed(test_x))) & ", y is " & integer'image(to_integer(signed(test_y)));

		test_x <= x"00f0";
		wait for C_CLK_PERIOD*1;

		report "x is " & integer'image(to_integer(signed(test_x))) & ", y is " & integer'image(to_integer(signed(test_y)));
		wait for C_CLK_PERIOD*0.1;
		report "x is " & integer'image(to_integer(signed(test_x))) & ", y is " & integer'image(to_integer(signed(test_y)));

	end process TEST_PROCESS;

	-----------------------------------------------------------
	-- Entity Under Test
	-----------------------------------------------------------
	i_top : entity work.top(rtl)
	port map (
		clk => clk,
		reset => reset,
		x => test_x,
		y => test_y
	);
	



end architecture testbench;