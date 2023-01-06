----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/11/2022 03:12:57 PM
-- Design Name: 
-- Module Name: MAC_tb - Behavioral
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

entity MAC_tb is
--  Port ( );
end MAC_tb;

architecture tb of MAC_tb is
component MAC
  Port (input1 : in std_logic_vector(7 downto 0);
        input2 : in std_logic_vector(7 downto 0);
        clk : in STD_LOGIC;
        cntrl : in STD_LOGIC;
        accumulate : out std_logic_vector(15 downto 0));    
end component;
signal clk : std_logic := '0';
signal cntrl : std_logic := '1';
signal input1, input2 : std_logic_vector(7 downto 0);
signal accumulate : std_logic_vector(15 downto 0);
begin
UUT:MAC port map (input1, input2, clk,cntrl,accumulate);
clk<= not clk after 10 ns;
   cntrl <= '0' after 2560 ns, '1' after 2600 ns, '0' after 5160 ns, '1' after 5200 ns, '0' after 7760 ns, '1' after 7800 ns, '0' after 10360ns ;
   input1 <= "00000111", "00000001" after 640 ns, "00001011" after 1200ns, "00000010" after 1800ns ;
   input2 <= "00000001", "00000001" after 520 ns, "00000011" after 3000ns;
end tb;
