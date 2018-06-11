----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:38:28 06/08/2017 
-- Design Name: 
-- Module Name:    Traffic_light_SAMSAT - Behavioral 
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

entity Traffic_light_SAMSAT is
	port ( clr,mclk : in std_logic;
			 light	: out std_logic_vector(6 downto 0);
			 dp : out std_logic;
			 an : out std_logic_vector(3 downto 0));
end Traffic_light_SAMSAT;

architecture Behavioral of Traffic_light_SAMSAT is
component ClockDivider is
	Port (s_clk_1 : in STD_LOGIC;
			clr : in STD_LOGIC;
			clk190 : out STD_LOGIC;
			clk3 : out STD_LOGIC);
end component;

component Tugas2_1_top is
	port ( sw : in std_logic_vector(7 downto 0);
			 s_clk_3 : in std_logic;
			 a_to_g : out std_logic_vector(6 downto 0);
			 en : out std_logic_vector(3 downto 0);
			 btn : in std_logic;
			 dp  : out std_logic);
end component;

component State_traffic_light_SAMSAT is
	port(  clr,clk : in std_logic;
			 light1	: out std_logic_vector(7 downto 0));
end component;
signal clk3  : std_logic;
signal clk190: std_logic;
signal l : std_logic_vector (7 downto 0);
begin
	Rang1 : ClockDivider port map(s_clk_1=>mclk,clr=>clr,clk3=>clk3,clk190=>clk190);
	Rang2 : State_traffic_light_SAMSAT port map (clr=>clr,clk=>clk3,light1=>l);
	Rang3 : Tugas2_1_top port map (sw=>l,s_clk_3=>clk190,a_to_g=>light,btn=>clr,dp=>dp,en=>an);
end Behavioral;

