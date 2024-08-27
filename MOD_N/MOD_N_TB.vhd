--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:47:59 08/12/2024
-- Design Name:   
-- Module Name:   D:/Vedant_42209/MOD_N/MOD_N_TB.vhd
-- Project Name:  MOD_N
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MOD_N
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MOD_N_TB IS
END MOD_N_TB;
 
ARCHITECTURE behavior OF MOD_N_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MOD_N
    PORT(
         rst : IN  std_logic;
         pr : IN  std_logic;
         clk : IN  std_logic;
         dir : IN  std_logic;
         Q : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal pr : std_logic := '0';
   signal clk : std_logic := '0';
   signal dir : std_logic := '1';

 	--Outputs
   signal Q : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MOD_N PORT MAP (
          rst => rst,
          pr => pr,
          clk => clk,
          dir => dir,
          Q => Q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;
	
	stim_dir: process
	begin
		wait for 250ns;
		dir <= '0';
		wait for 250ns;
		dir <= '1';
	end process;
	
	stim_rst: process
	begin
		wait for 127.5ns;
		rst <= '1';
		wait for 50ns;
		rst <= '0';
		wait for 344.5ns;
	end process;
	
	stim_pr: process
	begin
		wait for 395.5ns;
		pr <= '1';
		wait for 50ns;
		pr <= '0';
		wait for 344.5ns;
	end process;

END;
