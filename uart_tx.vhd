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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart_tx is
PORT (
  data_input:in std_logic_vector(15 downto 0);
  clk:in std_logic;
  reset:in STD_LOGIC;--upButton
  send:in STD_LOGIC;--middle button
  data:out STD_LOGIC;--RS32
  busy:out std_logic;
  led:out std_logic_vector(15 downto 0);
  cathode:out std_logic_vector(6 downto 0);
  anode:out std_logic_vector(3 downto 0)
  --to leds?
	);

end uart_tx;

architecture structural of uart_tx is

signal data_internal: std_logic:='1';
signal busy_internal,send_pulse,sending_pos,clock: std_logic:='0';
signal counter: std_logic_vector(8 downto 0):="000000000";
signal data1,data2:std_logic_vector(7 downto 0):="00000000";
begin

data1<=data_input(15 downto 8);
data2<=data_input(7 downto 0);

led<=data_input;

clocker: ENTITY WORK.transmitter_clock(struc)
	PORT MAP(clock=>clk,out_clock=>clock);
    

	pulse: ENTITY WORK.level2pulseConverter(struc)
	PORT MAP(clk=>clk,in1=>send,out1=>send_pulse);

	display: ENTITY WORK.display(struc)
	PORT MAP(clk=>clk,data=>data_input,anode=>anode,cathode=>cathode);

data<=data_internal;
busy<=busy_internal;

process(clock,reset,send)
begin
    if(reset='1') then
    
        data_internal<='1';
        busy_internal<='0';
        counter<="000000000";
        sending_pos<='0';
        
    elsif (rising_edge(clock)) then
        if(send_pulse='1' and busy_internal='0') then
               busy_internal<='1';
               data_internal<='0';
               counter<=counter+1;
        elsif(busy_internal='1') then       
              if(counter="100000000") then
                data_internal<='1';
                counter<="000000000";
                
                if(sending_pos='0') then
                    sending_pos<='1';
                else
                busy_internal<='0'; 
                sending_pos<='0';
                end if;
                
              elsif(sending_pos='0')       then
                if((data1 or counter(7 downto 0))> "00000000") then
                    data_internal<='1';
                else 
                    data_internal<='0';
                end if;
                counter<=counter(7 downto 0) & '0';
                else
                    if((data2 or counter(7 downto 0))> "00000000") then
                        data_internal<='1';
                    else 
                        data_internal<='0';
                    end if;
                    counter<=counter(7 downto 0) & '0';
            end if;
            
            
            
--            end if;

        end if;
    end if;
end process;
end structural;
