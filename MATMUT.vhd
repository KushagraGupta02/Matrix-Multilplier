----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2022 07:27:07 PM
-- Design Name: 
-- Module Name: MATMUT - Behavioral
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

entity MATMUT is
  Port (input : in STD_LOGIC_VECTOR(13 downto 0);
  clk : in STD_LOGIC;
        s0 : out STD_LOGIC;
        s1 : out STD_LOGIC;
        s2 : out STD_LOGIC;
        s3 : out STD_LOGIC;
        s4 : out STD_LOGIC;
        s5 : out STD_LOGIC;
        s6 : out STD_LOGIC;
        an : out STD_LOGIC_VECTOR(3 downto 0));
end MATMUT;

architecture Behavioral of MATMUT is
component Main_fsm is
  Port (clk : in STD_LOGIC;
        addrin : in STD_LOGIC_Vector(13 downto 0);
       display : out STD_LOGIC_VECTOR(15 downto 0));
end component;
component segment is
  Port (b0 : in STD_LOGIC_VECTOR(3 downto 0);
        b1 : in STD_LOGIC_VECTOR(3 downto 0);  
        b2 : in STD_LOGIC_VECTOR(3 downto 0);
        b3 : in STD_LOGIC_VECTOR(3 downto 0);
        clk : in STD_LOGIC;
        s0 : out STD_LOGIC;
        s1 : out STD_LOGIC;
        s2 : out STD_LOGIC;
        s3 : out STD_LOGIC;
        s4 : out STD_LOGIC;
        s5 : out STD_LOGIC;
        s6 : out STD_LOGIC;
        an : out STD_LOGIC_VECTOR(3 downto 0));
end component;
Signal g : STD_LOGIC_VECTOR(15 downto 0);
begin
v : Main_fsm PORT MAP (clk,input,g);
w : segment PORT MAP (g(3 downto 0),g(7 downto 4), g(11 downto 8), g(15 downto 12), clk, s0, s1, s2, s3, s4, s5, s6, an);
end Behavioral;
