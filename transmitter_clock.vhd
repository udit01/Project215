----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2017 14:56:29
-- Design Name: 
-- Module Name: transmitter_clock - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity transmitter_clock is
--  Port ( );
  Port ( 
clock : in STD_LOGIC;
        out_clock : out STD_LOGIC);

end transmitter_clock;

architecture Behavioral of transmitter_clock is
SIGNAL ring : std_logic_vector (14 downto 0) := "000000000000000";
--begin
--process(clock)
--	begin
--	IF (clock='1' AND clock'EVENT) THEN 
--	ring <= ring +1;
               
--	END IF;
----	 slow_gcd <= ring(26);
	 
	 
	 
--	 out_clock <= ring(14);
	 
----	 fast_gcd <= ring(1);
--	end process;

signal count : integer :=1;
signal clk:std_logic:='0';
begin
process(clock)
	begin
	if(clock'event and clock='1') then
    count <=count+1;
    -- Decide on this count to make it 9600 bauds
    if(count = 10000000) then
clk <= not clk;
    count <=1;
    end if;
    end if;
	end process;
out_clock<=clk;

end Behavioral;
