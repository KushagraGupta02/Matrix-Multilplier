----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 03:04:16 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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
use ieee.numeric_std.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder is
  Port ( X1 : in std_logic_vector(15 downto 0);
        X2 : in std_logic_vector(15 downto 0);
        X3 : out std_logic_vector(15 downto 0));
end adder;

architecture Behavioral of adder is
signal t1 : integer;
signal t2 : integer;
signal t3 : integer;
begin
mult:process (t1,X1,t2,X2,t3)
begin
    t1 <= to_integer(unsigned(X1));
    t2 <= to_integer(unsigned(X2));
    t3 <= t1+t2;
 end process;  
  
X3 <= std_logic_vector(to_unsigned(t3, 16));


end Behavioral;
