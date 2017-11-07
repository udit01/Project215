--Created By:-
--Shashwat Shivam & Udit Jain
--2016CS10328 & 2016CS10327

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

entity display is
--  Port ( );
PORT (
	data_input: in std_logic_vector(15 downto 0);
	clk: in std_logic;
	sim_mode: in std_logic;
	anode : out std_logic_vector (3 downto 0);
	cathode : OUT std_logic_vector (6 downto 0)
	);

end display;

architecture struc of display is

-- Custom Types
type display_output is array (0 to 9) of std_logic_vector(6 downto 0);
type anode_output_array is array(0 to 3) of std_logic_vector(3 downto 0);
constant intToCathodeValue : display_output := ("1000000","1111001","0100100","0110000","0011001","0010010","0000010","1111000","0000000","0010000");
constant anodeValues : anode_output_array := ("0111","1011","1101","1110");

signal clock: std_logic;
signal slow_clock:std_logic;
signal r:int:=0;
signal c:int:=0;
-- SIGNAL sig : std_logic_vector(3 downto 0):="0000";
begin

--
slow_clock1: ENTITY WORK.display_clock(struc)
	PORT MAP(clock=>clk,out_clock=>slow_clock);

--THIS OR 4X SLOW CLOCK???????????????????????????????????????????????????
clock<= clk when (sim_mode='1')else slow_clock;
--
-- anode1x: ENTITY WORK.ring_counter(struc)
--         PORT MAP(clock=>display_clock,count=>anode);
	process(clock)
	r<=0;---how many times will it run??????????????????????????
	begin
		anode<= anodeValues(r mod 4);
		r = (r+1) mod 4;
	end process;

	PROCESS (clock)
		BEGIN
			CASE anode IS
				WHEN "1110" => sig <= result(3 downto 0);
				WHEN "1101" => sig <= result(7 downto 4);
				WHEN "1011" => sig <= result(11 downto 8);
				WHEN others => sig <= result(15 downto 12);
			END CASE;
		END PROCESS;

		process(clock)
	  begin
			c <= to_integer(unsigned(sig));
	 	 cathode<= intToCathodeValue(c mod 10);
		 --  c <= (c+1) mod 7;
	  end process;

	process(data_input)
	BEGIN

	end PROCESS;
end struc;
