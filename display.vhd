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
use IEEE.NUMERIC_STD.ALL;

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

type display_output is array (0 to 10) of std_logic_vector(6 downto 0);
type anode_output_array is array(0 to 3) of std_logic_vector(3 downto 0);
type res is array(3 downto 0) of integer range 0 to 10;
signal result: res;
signal intToCathodeValue : display_output;-- := ("1000000","1111001","0100100","0110000","0011001","0010010","0000010","1111000","0000000","0010000","1111111");
signal anodeValues : anode_output_array;-- := ("0111","1011","1101","1110");

signal clock: std_logic;
signal slow_clock:std_logic;
signal int1:integer range 0 to 255;
signal int2:integer range 0 to 255;
signal comparator1:STD_LOGIC;
signal comparator2:STD_LOGIC;
signal anode_internal:std_logic_vector(3 downto 0);
signal data_input_internal:std_logic_vector(15 downto 0):="0000000000000000";
begin

  intToCathodeValue <= ("1000000","1111001","0100100","0110000","0011001","0010010","0000010","1111000","0000000","0010000","1111111");
  anodeValues  <= ("0111","1011","1101","1110");
   anode<=anode_internal;
   
   
   clock<= clk when (sim_mode='1')else slow_clock;

slow_clock1: ENTITY WORK.display_clock(struc)
	PORT MAP(clock=>clk,out_clock=>slow_clock);

--THIS OR 4X SLOW CLOCK???????????????????????????????????????????????????

	-- process(clock)
	-- r<=0;---how many times will it run??????????????????????????
	-- begin
	-- 	anode<= anodeValues(r mod 4);
	-- 	r = (r+1) mod 4;
	-- end process;

  anode1x: ENTITY WORK.ring_counter(struc)
          PORT MAP(clock=>clock,count=>anode_internal);


	PROCESS (clock)
		BEGIN
			CASE anode_internal IS
				WHEN "1110" => cathode <= intToCathodeValue( result(0) mod 11);
				WHEN "1101" => cathode <= intToCathodeValue( result(1) mod 11);
				WHEN "1011" => cathode <= intToCathodeValue( result(2) mod 11);
				WHEN others => cathode <= intToCathodeValue( result(3) mod 11);
			END CASE;
		END PROCESS;

		-- process(clock)
	  -- begin
		-- 	-- c <=  sig;
    --   -- to_integer(unsigned(sig));
    -- cathode<= intToCathodeValue(sig mod 10);
		--  --  c <= (c+1) mod 7;
	  -- end process;

int1 <= to_integer(unsigned(data_input(7 downto 0 )));
int2 <= to_integer(unsigned(data_input(15 downto 8 )));
comparator1 <= '0' when((data_input(7 downto 0) xnor data_input_internal(7 downto 0)) = "11111111") else '1';
comparator2 <= '0' when((data_input(15 downto 8) xnor data_input_internal(15 downto 8)) = "11111111") else '1';

  process(clock)
	BEGIN
	 if (comparator2='1') then
       --int1
       result(3) <= (int2 / 100) mod 10;
       result(2) <= (int2 / 10) mod 10;
       result(1) <= (int2 ) mod 10;
       result(0) <= 10;--nothing;
           data_input_internal(15 downto 8)<=data_input(15 downto 8);

 end if;
 if (comparator1='1') then
    --int1
      result(3) <= (int1 / 100) mod 10;
       result(2) <= (int1 / 10) mod 10;
       result(1) <= (int1 ) mod 10;
       result(0) <= 10;--nothing;
           data_input_internal(7 downto 0)<=data_input(7 downto 0);

  end if;

	end PROCESS;
end struc;
