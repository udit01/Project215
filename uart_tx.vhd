----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 27.08.2017 08:20:05
-- Design Name:
-- Module Name: display - struc
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

entity uart_tx is
PORT (
  sw:in std_logic_vector(15 downto 0);
  reset:in STD_LOGIC;--upButton
  send:in STD_LOGIC;--middle button
  data:out STD_LOGIC;--RS32
  led:out std_logic_vector(15 downto 0);
  cathode:out std_logic_vector(6 downto 0);
  anode:out std_logic_vector(3 downto 0)
  --to leds?
	);

end uart_tx;

architecture structural of uart_tx is

end structural;
