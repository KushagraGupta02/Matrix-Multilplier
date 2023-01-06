----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2022 04:36:18 PM
-- Design Name: 
-- Module Name: reg - Behavioral
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

entity reg is
  Port (clk : in std_logic;
        read : in std_logic;
        write : in std_logic;
        din : in STD_LOGIC_VECTOR (15 downto 0);
         dout : out STD_LOGIC_VECTOR (15 downto 0));
end reg;

architecture Behavioral of reg is
signal Regis : STD_LOGIC_VECTOR(15 downto 0);
begin
    assign: process(clk,read,write,Regis,din)
    begin
    if Rising_Edge(clk) then
        if write='1' and read='0' then
            Regis <= din;
            dout <= "0000000000000000";
        elsif read='1' and write='0' then
            dout <= Regis;
        end if;
    end if;
   end process;        
end Behavioral;
