----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:19:35 07/16/2024 
-- Design Name: 
-- Module Name:    ALU4 - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU4 is
    Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
           F : in  STD_LOGIC_VECTOR (2 downto 0);
           Y : out  STD_LOGIC_VECTOR (3 downto 0);
           CB : out  STD_LOGIC);
end ALU4;

architecture Behavioral of ALU4 is
signal result : STD_LOGIC_VECTOR (4 downto 0);
begin
	process (A,B,F)
		begin
			case F is 
				when "000" => result <= "0" & (A and B);
				when "001" => result <= "0" & (A nand B);
				when "010" => result <= "0" & (A or B);
				when "011" => result <= "0" & (A nor B);
				when "100" => result <= "0" & (A xor B);
				when "101" => result <= "0" & (A xnor B);
				when "110" => result <= ("0" & A) + ("0" & B);
				when others =>
					if (A<B) then result <= "1" & (B - A);
					else result <= ("0" & A) + ("0" & B);
					end if;
			end case;
		end process;
	Y <= result(3 downto 0);
	CB <= result(4);
end Behavioral;

