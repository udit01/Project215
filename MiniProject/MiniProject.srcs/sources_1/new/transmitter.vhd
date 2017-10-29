----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.10.2017 14:55:55
-- Design Name: 
-- Module Name: transmitter - struc
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

entity transmitter is
  Port ( send : in std_logic;
           reset: in std_logic;
           data: in std_logic_vector(7 downto 0);
           busy: out std_logic;
           transmission: out std_logic:='1'
            );
end transmitter;

architecture struc of transmitter is
signal transmission_internal: std_logic:='1';

begin


end struc;
