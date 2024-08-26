--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:31:23 07/16/2024
-- Design Name:   
-- Module Name:   D:/Vedant_42209/ALU4/ALU4_TB.vhd
-- Project Name:  ALU4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU4
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALU4_TB IS
END ALU4_TB;
 
ARCHITECTURE behavior OF ALU4_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU4
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         F : IN  std_logic_vector(2 downto 0);
         Y : OUT  std_logic_vector(3 downto 0);
         CB : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := "0111";
   signal B : std_logic_vector(3 downto 0) := "1110";
   signal F : std_logic_vector(2 downto 0) := (others => '1');

 	--Outputs
   signal Y : std_logic_vector(3 downto 0);
   signal CB : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU4 PORT MAP (
          A => A,
          B => B,
          F => F,
          Y => Y,
          CB => CB
        );

  
   -- Stimulus process
   stim_proc: process
   begin
      F <= F + 1;
      wait for 100 ns;	
   end process;

END;
