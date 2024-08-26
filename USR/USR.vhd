----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:55 07/22/2024 
-- Design Name: 
-- Module Name:    USR - UNI_SHIFT_REGISTER_ARCH 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity USR is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           mode : in  STD_LOGIC_VECTOR (1 downto 0);
           Sin : in  STD_LOGIC;
           Pin : in  STD_LOGIC_VECTOR (3 downto 0);
           Sout : out  STD_LOGIC;
           Pout : out  STD_LOGIC_VECTOR (3 downto 0));
end USR;

architecture UNI_SHIFT_REGISTER_ARCH of USR is
SIGNAL temp:STD_LOGIC_VECTOR(3 downto 0):="0000";
begin
	PROCESS(rst,clk,mode,Sin,Pin)
	BEGIN
		IF rst = '1' THEN 
			Pout <= "0000";
			Sout <= '0';
			
		ELSIF FALLING_EDGE(clk) THEN
			CASE mode IS
				WHEN "00" =>
					temp(3 downto 1) <= temp (2 downto 0);
					temp(0) <= Sin;
					
					Sout <= temp(3);
					Pout <= "0000";
					
				WHEN "01" =>
					temp(3 downto 1) <= temp (2 downto 0);
					temp(0) <= Sin;
					
					Sout <= '0';
					Pout <= temp;
					
				WHEN "10" =>
					temp <= Pin;
					Sout <= temp(3);
					temp(3 downto 1) <= temp (2 downto 0);
					Pout <= "0000";
					
				WHEN OTHERS =>
					temp <= Pin;
					Pout <= temp;
					Sout <= '0';
			END CASE;
		END IF;
	END PROCESS;

end UNI_SHIFT_REGISTER_ARCH;

