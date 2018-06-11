library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity Tugas2_1_top is
port ( sw : in std_logic_vector(7 downto 0);
		 s_clk_3 : in std_logic;
		 a_to_g : out std_logic_vector(6 downto 0);
		 en : out std_logic_vector(3 downto 0);
		 btn : in std_logic;
		 dp  : out std_logic);
end Tugas2_1_top;

architecture Behavioral of Tugas2_1_top is
	component Tugas2_ver1 port ( 
	    x 	   : in std_logic_vector(7 downto 0);
		 ss_clk ,clr: in std_logic;
		 a_to_g  : out std_logic_vector(6 downto 0);
		 en      : out std_logic_vector(3 downto 0);
		 dp 	 	: out std_logic
		);
	end component;

begin

u1 : Tugas2_ver1 port map ( x(1 downto 0)=>sw(1 downto 0),
									 x(3 downto 2)=>sw(3 downto 2),
									 x(5 downto 4)=>sw(5 downto 4),
									 x(7 downto 6)=>sw(7 downto 6),
									 
									 ss_clk=>s_clk_3,a_to_g=>a_to_g,en=>en,dp=>dp,clr=>btn);


end Behavioral;

