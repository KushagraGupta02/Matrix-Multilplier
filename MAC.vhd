----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/09/2022 03:50:23 PM
-- Design Name: 
-- Module Name: MAC - Behavioral
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

entity MAC is
  Port ( input1 : in std_logic_vector(7 downto 0);
        input2 : in std_logic_vector(7 downto 0);
        clk : in STD_LOGIC;
        cntrl : in STD_LOGIC;
        accumulate : out std_logic_vector(15 downto 0));
end MAC;

architecture Behavioral of MAC is

--component multiplier
--  Port (
--  X1 : in std_logic_vector(7 downto 0);
--        X2 : in std_logic_vector(7 downto 0);
--        X3 : out std_logic_vector(15 downto 0)
--        );
--end component;

--component adder is
--  Port ( X1 : in std_logic_vector(15 downto 0);
--        X2 : in std_logic_vector(15 downto 0);
--        X3 : out std_logic_vector(15 downto 0));
--end component;

--component reg is
--  Port (clk : in std_logic;
--        read : in std_logic;
--        write : in std_logic;
--        din : in STD_LOGIC_VECTOR (15 downto 0);
--         dout : out STD_LOGIC_VECTOR (15 downto 0));
--end component;
signal Mult : STD_LOGIC_VECTOR(15 downto 0);
--signal accumulat : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
--signal temp : STD_LOGIC_VECTOR(15 downto 0);
--signal t1 : integer;
--signal t2 : integer;
--signal t3 : integer;
signal t4 : integer := 0;
begin

--o: Multiplier Port MAP(input1,input2,Mult);
--p: Reg PORT MAP(clk,re,we,accumulat2,accumulat);
--q : adder PORT MAP(accumulat,Mult,temp);
pro : process(clk,t4,cntrl,input1,input2)
begin
if rising_edge(cntrl) then
t4 <=0;
elsif  falling_edge(cntrl) then
accumulate <= std_logic_vector(to_unsigned(t4, 16));
elsif rising_edge(clk) then
    if cntrl ='1' then
--        t1 <= to_integer(unsigned(input1));
--        t2 <= to_integer(unsigned(input2));
--        t3 <= to_integer(unsigned(accumulat));
        t4 <= ((to_integer(unsigned(input1)))*(to_integer(unsigned(input2))))+t4;
    end if;
end if;
--end if;
end process;

--if cntrl = '0' then

end Behavioral;
