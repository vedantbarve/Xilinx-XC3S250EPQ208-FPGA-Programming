--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:08:31 08/19/2024
-- Design Name:   
-- Module Name:   D:/Vedant_42209/FIFO/FIFO_TB.vhd
-- Project Name:  FIFO
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FIFO
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
use IEEE.NUMERIC_STD.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FIFO_TB IS
END FIFO_TB;
 
ARCHITECTURE behavior OF FIFO_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FIFO
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         rd_en : IN  std_logic;
         wr_en : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0);
         fifo_empty : OUT  std_logic;
         fifo_full : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal rd_en : std_logic := '0';
   signal wr_en : std_logic := '1';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   signal fifo_empty : std_logic;
   signal fifo_full : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FIFO PORT MAP (
          clk => clk,
          rst => rst,
          rd_en => rd_en,
          wr_en => wr_en,
          data_in => data_in,
          data_out => data_out,
          fifo_empty => fifo_empty,
          fifo_full => fifo_full
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
	
	
	-- process for rd_en
	stim_wr_en:process
	begin
		wait for 80ns;
		wr_en <= '0';
		wait for 80ns;
		wr_en <= '1';
	end process;
	
	-- process for wr_en
	stim_rd_en:process
	begin
		wait for 80ns;
		rd_en <= '1';
		wait for 80ns;
		rd_en <= '0';
	end process;
	
	-- process for data_in
	stim_data_in:process
	begin
		data_in(0) <= '1';
		wait for 10ns;
		data_in(1) <= '1';
		wait for 10ns;
		data_in(2) <= '1';
		wait for 10ns;
		data_in(3) <= '1';
		wait for 10ns;
		data_in(4) <= '1';
		wait for 10ns;
		data_in(5) <= '1';
		wait for 10ns;
		data_in(6) <= '1';
		wait for 10ns;
		data_in(7) <= '1';
		wait for 10ns;
	end process;

END;
