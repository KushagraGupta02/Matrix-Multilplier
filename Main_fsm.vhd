----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2022 07:37:13 PM
-- Design Name: 
-- Module Name: Main_fsm - Behavioral
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

entity Main_fsm is
  Port (clk : in STD_LOGIC;
        addrin : in STD_LOGIC_Vector(13 downto 0);
       display : out STD_LOGIC_VECTOR(15 downto 0));
end Main_fsm;

architecture Behavioral of Main_fsm is
component ROM1 is
  Port (a : in STD_LOGIC_VECTOR (13 downto 0);
        clk : in std_logic;
        spo : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component ROM2 is
  Port (a : in STD_LOGIC_VECTOR (13 downto 0);
        clk : in std_logic;
        spo : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component RAM_output is
  Port (a : in STD_LOGIC_VECTOR (13 downto 0);
        d : in STD_LOGIC_VECTOR (15 downto 0);
        clk : in std_LOGIC;
        we : IN std_logic;
        spo : out STD_LOGIC_VECTOR (15 downto 0));
end component;

    signal counter : integer :=0;
    signal temp : integer :=0;
    signal acc : integer :=0;
--    signal written : std_logic := '0';
    signal addr1,addr2,addr3 : STD_LOGIC_VECTOR (13 downto 0);
    signal input1,input2 : STD_LOGIC_VECTOR (7 downto 0);
    signal output : STD_LOGIC_VECTOR (15 downto 0);
    signal we : std_logic:= '0'; 
    signal board : STD_LOGIC_VECTOR (15 downto 0);
    signal go : std_logic_vector(3 downto 0) :="0010";
begin

o: ROM1 Port MAP(a=>addr1,clk=>clk,spo=>input1);
p: ROM2 PORT MAP(a=>addr2,clk=>clk,spo =>input2);
y : RAM_output PORT MAP(a => addr3, d=> output, clk => clk,we => we,spo => board);

--i - (counter/128)/128)
--j - (counter/128) mod 128
--k - counter mod 128
h :process(clk,counter,go)
begin
if rising_edge(clk) then
    if counter = 2097152 then
--        stop;2097152
       addr3 <= addrin;
       we<='0';
       display <= board;
       go <= "1100";
       
    elsif counter mod 128=0 and go = "0000" then
        acc <= 0;
        go <="0010";
        
    elsif go="0001" then
--        if temp=0 then
--        if temp=0 then
--            we<='1';
--            temp<=temp+1;
--        elsif temp=5 then
--            go<= "0101";
--            temp<=0;
--         end if;
            we<='1';
            go<="1110";
            
    elsif go="1110" then
            go<="0101";
--    we <='1';
--    go <= "0101";
             
    elsif go="0101" then
        we<='0';
        go<="0000";
       
    elsif go="0010" then
        addr1 <= std_logic_vector(to_unsigned((128*(counter mod 128)+((counter/128)/128)),14));
        addr2 <= std_logic_vector(to_unsigned((128*((counter/128) mod 128)+(counter mod 128)),14));
        go <="0011";
        
    elsif go="0011" then
        acc <= ((to_integer(unsigned(input1)))*(to_integer(unsigned(input2))))+acc;
        go <= "0100";
        
    elsif go ="0100" then
        output <= std_logic_vector(to_unsigned(acc, 16));
        go<="1111";
    
    elsif go="1111" then
        addr3 <=std_logic_vector(to_unsigned(((128 * ((counter/128) mod 128)+((counter/128)/128))),14));
        go <= "0111";
        
    elsif go="0111" then
        counter <= counter +1;
        go<= "0110";
        
    elsif go="0110" then
        if counter mod 128 =0 then
            go <="0001";
        else
            go<="0010";
        end if;
    end if;
end if;

end process;
--j : process(clk)
--begin
--if rising_edge(clk) then
--end if;
--end process;
end Behavioral;
