----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:25:37 06/01/2017 
-- Design Name: 
-- Module Name:    ClockDivider - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ClockDivider is
Port (   s_clk_1 : in STD_LOGIC;
			clr : in STD_LOGIC;
			clk190 : out STD_LOGIC;
			clk3 : out STD_LOGIC);
end ClockDivider;

architecture Behavioral of ClockDivider is
signal q:std_logic_vector(23 downto 0);
begin
	-- clock devider
	
	process(s_clk_1, clr)
		begin
		if clr ='1' then
			q <= (others => '0'); -- format hexadesimal
			elsif (s_clk_1'event and s_clk_1 ='1')  then
			q <= q + 1;
			
			
			end if;
		clk3 <= q(23); 
		clk190 <= q(17);
		
end process;
end Behavioral;
