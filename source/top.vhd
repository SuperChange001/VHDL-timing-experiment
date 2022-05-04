library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
	generic (
		BITWIDTH : integer := 16
	);
	port(
		clk 	: in std_logic;
		reset 	: in std_logic;
		x 		: in std_logic_vector(BITWIDTH-1 downto 0);
		y 		: out std_logic_vector(BITWIDTH-1 downto 0)
		);
end entity top;

architecture rtl of top is
	signal x_to_sigmoid : signed(BITWIDTH-1 downto 0);
	signal y_from_sigmoid : signed(BITWIDTH-1 downto 0);
begin

	lut_process : process (clk, reset)
	begin
		if (reset = '1') then
			y <= (others=>'0');
		elsif rising_edge(clk) then
			x_to_sigmoid <= signed(x);
			y <= std_logic_vector(y_from_sigmoid); -- just an exmample, we should map it to a fifo/ram to buffer the data
		end if;
	end process lut_process;

	i_sigmoid : entity work.sigmoid(rtl)
	port map (
		x => x_to_sigmoid,
		y => y_from_sigmoid	
	);
	
	
	

end architecture rtl;
