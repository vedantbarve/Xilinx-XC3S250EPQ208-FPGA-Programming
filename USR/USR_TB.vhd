--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:06:17 07/22/2024
-- Design Name:   
-- Module Name:   D:/Vedant_42209/USR/USR_TB.vhd
-- Project Name:  USR
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: USR
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY USR_TB IS
END USR_TB;
 
ARCHITECTURE behavior OF USR_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT USR
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         mode : IN  std_logic_vector(1 downto 0);
         Sin : IN  std_logic;
         Pin : IN  std_logic_vector(3 downto 0);
         Sout : OUT  std_logic;
         Pout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '1';
   signal mode : std_logic_vector(1 downto 0) := (others => '0');
   signal Sin : std_logic := '1';
   signal Pin : std_logic_vector(3 downto 0) := "1101";

 	--Outputs
   signal Sout : std_logic;
   signal Pout : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: USR PORT MAP (
          rst => rst,
          clk => clk,
          mode => mode,
          Sin => Sin,
          Pin => Pin,
          Sout => Sout,
          Pout => Pout
        );
	
	-- process for rst
	stim_proc_rst:process
		begin
			wait for 122.5 ns;
			rst <= '1';
			wait for 7.5ns;
			rst <= '0';
			wait;
	end process;
	
   -- proces for clock
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	-- process for mode
	stim_proc_mode:process
		begin
			mode <= "00";
			wait for 80ns;
			mode <= "01";
			wait for 50ns;
			mode <= "10";
			wait for 50ns;
			mode <= "11";
			wait for 20ns;
	end process;
	
	-- process for Sin
	stim_proc_sin:process
		begin
			wait for 10 ns;
			Sin <= '0';
			wait for 10 ns;
			Sin <= '0';
			wait for 10 ns;
			Sin <= '1';
			wait for 10 ns;
			
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

END;
