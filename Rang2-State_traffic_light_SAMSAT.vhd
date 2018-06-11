
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

entity State_traffic_light_SAMSAT is
	port(  clr,clk : in std_logic;
			 light1	: out std_logic_vector(7 downto 0));
end State_traffic_light_SAMSAT;

architecture Behavioral of State_traffic_light_SAMSAT is
type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8);
signal state : state_type;
signal count :std_logic_vector(3 downto 0);
constant SEC5:std_logic_vector(3 downto 0):= "1111";
constant SEC1:std_logic_vector(3 downto 0):= "0011";

begin
   process(clr,clk)
		begin
			if clr='1' then 
				state <=s0;
				count <= x"0";
			elsif clk'event and clk='1' then
				case state is
					when s0 =>  if count < SEC5 then
									state <= s0;count<=count+1;
									else 
									state <= s1;
									count<=x"0";
									end if;
					when s1 => if count < SEC1 then
									state<= s1;count<=count+1;
									else 
									state<= s2;
									count<=x"0";
									end if;
					when s2 => if count < SEC1 then
									state<= s2;count<=count+1;
									else 
									state<= s3;
									count<=x"0";
									end if;
					when s3 => if count < SEC5 then
									state<= s3;count<=count+1;
									else 
									state<= s4;
									count<=x"0";
									end if;
					when s4 => if count < SEC1 then
									state<= s4;count<=count+1;
									else 
									state<= s5;
									count<=x"0";
									end if;
					when s5 => if count < SEC1 then
									state<= s5;count<=count+1;
									else 
									state<= s6;
									count<=x"0";
									end if;
					when s6 => if count < SEC5 then
									state<= s6;count<=count+1;
									else 
									state<= s7;
									count<=x"0";
									end if;
					when s7 => if count < SEC1 then
									state<= s7;count<=count+1;
									else 
									state<= s8;
									count<=x"0";
									end if;
					when s8 => if count < SEC1 then
									state<= s8;count<=count+1;
									else 
									state<= s0;
									count<=x"0";
									end if;
					when others => state <= s0;
				end case;
			end if;
		end process;
		
	 process(state)
			begin 
				case state is
					when s0 => light1 <= "10100000";
					when s1 => light1 <= "01010000";
					when s2 => light1 <= "00000000";
					when s3 => light1 <= "00001000";
					when s4 => light1 <= "00000100";
					when s5 => light1 <= "00000000";
					when s6 => light1 <= "00000010";
					when s7 => light1 <= "00000001";
					when others => light1 <= "00000000";
				end case;
			end process;
					
end Behavioral;

