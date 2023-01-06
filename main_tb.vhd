----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2022 08:57:36 PM
-- Design Name: 
-- Module Name: main_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main_tb is
end main_tb;

architecture tb of main_tb is
component Main_fsm is
  Port (clk : in STD_LOGIC);
   addri : in STD_LOGIC_VECTOR (13 downto 0);
   display : out STD_LOGIC_VECTOR(15 downto 0));
end component;
signal clk : std_logic := '0';
signal addri : in STD_LOGIC_VECTOR (13 downto 0);
signal display : out STD_LOGIC_VECTOR(15 downto 0);
begin
UUT: Main_fsm PORT MAP (clk,addri,display);
clk<= not clk after 10 ns;
   addri <= "00101010100110";
end tb;
