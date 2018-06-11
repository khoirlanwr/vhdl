library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;


entity Tugas2_ver1 is
port ( x		   : in std_logic_vector(7 downto 0);
		 ss_clk ,clr: in std_logic;
		 a_to_g  :out std_logic_vector(6 downto 0);
		 en      : out std_logic_vector(3 downto 0);
		 dp 		: out std_logic
		);
end Tugas2_ver1;

architecture Behavioral of Tugas2_ver1 is

signal digit: std_logic_vector(1 downto 0);
signal aen : std_logic_vector(3 downto 0);
signal s : std_logic_vector(1 downto 0);
signal clkdivider :std_logic_vector(1 downto 0);

begin
  s<=clkdivider(1 downto 0);
  dp<='1';
  
  aen<="1111";
  -- set aen(3 downto 0) for leading blenks
		
  
	 process(s,x)
		begin 
			case s is
				when "00" =>digit<=x(1 downto 0);
				when "01" =>digit<=x(3 downto 2);
				when "10" =>digit<=x(5 downto 4);
				when others =>digit<=x(7 downto 6);
			end case;
		end process;
		
		process(s,aen)
			begin 
			en <= "1111";
			if(aen(conv_integer (s))='1') then 
					en(conv_integer (s))<='0';
			end if;
		end process;
		
		process(ss_clk,clr)
			begin 
				if clr='1' then clkdivider <= (others=>'0');
				elsif (ss_clk'event and ss_clk='1') then 
				 clkdivider <=clkdivider+1;
				 
			   end if;
			end process;
			

		process (digit)
				begin 
					case digit is
					when "00" => a_to_g <= "0111111"; --MERAH  
					when "01" => a_to_g <= "1111110"; --KUNING
					when "10" => a_to_g <= "1110111"; --HIJAU
					when others => a_to_g <= "1111111"; --LAMPU MATI
				end case;
		 end process;
end Behavioral;
