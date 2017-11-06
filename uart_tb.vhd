--------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:   15:29:01 08/20/2017
-- Design Name:
-- Module Name:   /home/anupam/Xilinx_projects/lab4_gcd/lab4_gcd_tb.vhd
-- Project Name:  lab4_gcd
-- Target Device:
-- Tool versions:
-- Description:
--
-- VHDL Test Bench Created by ISE for module: gcd_comp
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes:
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

ENTITY uart_tb IS
END uart_tb;

ARCHITECTURE behavior OF uart_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT uart_tx
    PORT (
      data_input:in std_logic_vector(15 downto 0):="0000000000000000";
      clk:in std_logic;
      reset:in STD_LOGIC:='0';--upButton
      send:in STD_LOGIC:='0';--middle button
      sendL:in std_logic:='0';
      sendR:in std_logic:='0';

      data:out STD_LOGIC;--RS32
      sim_mode:in STD_LOGIC;
    --  busy:out std_logic;
      led:out std_logic_vector(15 downto 0);
      cathode:out std_logic_vector(6 downto 0);
      anode:out std_logic_vector(3 downto 0)
      --to leds?
    	);
    END COMPONENT;

	-- Custom Types
	-- type display_output is array (0 to 9) of std_logic_vector(6 downto 0);
	-- type anode_output_array is array(0 to 3) of std_logic_vector(3 downto 0);

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal send : std_logic := '0';
   signal sendL : std_logic := '0';
   signal sendR : std_logic := '0';

   signal data_input : std_logic_vector(15 downto 0) := (others => '0');
  --  signal b_i : std_logic_vector(7 downto 0) := (others => '0');
  --  signal pushbutton : std_logic := '0';

 	--Outputs
   signal data : std_logic;
   signal led : std_logic_vector(15 downto 0);
   signal cathode : std_logic_vector(6 downto 0);
   signal anode : std_logic_vector(3 downto 0);
   -- Clock period definitions

   constant clk_periodFast : time := 10 ps;
   
--   constant clk_period : time := 104180 ns;--clk * 10418
   constant clk_period : time := 10 ps;--clk * 10418
	signal err_cnt_signal : integer := 0;
--	constant intToCathodeValue : display_output := ("1000000","1111001","0100100","0110000","0011001","0010010","0000010","1111000","0000000","0010000");
--	constant anodeValues : anode_output_array := ("0111","1011","1101","1110");
  signal outData : std_logic_vector(7 downto 0 ) := (others => '0');
     signal sim_mode:std_logic:='0';
     signal success:std_logic:='0';

BEGIN

	-- Instantiate the Unit Under Test (UUT)

      uart: uart_tx PORT MAP(
        data_input => data_input,
        clk =>clk,
        reset => reset,
        send => send,
        sendL => sendL,
        sendR => sendR,
        sim_mode => sim_mode,
        data=>data,
        led => led,
        cathode=>cathode,
        anode => anode
      );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_periodFast/2;
		clk <= '1';
		wait for clk_periodFast/2;
   end process;

    
   -- Stimulus process
   stim_proc: process

--		type intArray is array(0 to 3) of integer;
--		variable cathodeGroundTruth : intArray := (0,1,0,1);
--		variable err_cnt : INTEGER := 0;
   begin
		------------------------------------------------------------
      --------------------- pre-case 0 ---------------------------
		------------------------------------------------------------
	
	reset<='1';
	sim_mode<='1';
	wait for clk_period;
	reset<='0';
	wait for clk_period;
	
	
    assert(data = '1') report "Stop bit error";
    send <= '0';
    data_input <= "0000000100000001";
    
    wait for 4*clk_period;
    send <= '1';
    wait for 2*clk_period;
    send <= '0';
     
    outData <= (others => '0');
    assert(led="0000000100000001") report "LED outputs don't match";
    assert(data = '0') report "Start bit error";
    wait for clk_period;
    
    collector : for i in 0 to 7 loop
      outData <=  (data) & outData(7 downto 1) ;
      wait for clk_period;
    end loop;
    assert(outData="00000001") report "Incorrect output bits";
    assert(data = '1') report "Incorrect stop bit";
    wait for clk_period;

    outData <= (others => '0');
    assert(data = '0') report "Start bit error";
    wait for clk_period;
    collector2 : for i in 0 to 7 loop
      outData <=  (data) & outData(7 downto 1) ;
      wait for clk_period;
    end loop;
    assert(outData="00000001") report "Incorrect output bits";
    assert(data = '1') report "Incorrect stop bit";
    wait for 3*clk_period;

    if(data='1') then
        success<='1';
    end if;
    
    wait for 3*clk_period;
    success <= '0';
        
--    assert(data = '0') report "SUCCESS! ";

		-- err_cnt_signal <= err_cnt;
    --
		-- if (err_cnt=0) then
		-- 	 assert false
		-- 	 report "Testbench of UART completed successfully!"
		-- 	 severity note;
		-- else
		-- 	 assert false
		-- 	 report "Something wrong, try again"
		-- 	 severity error;
		-- end if;
    --
		-- wait for clk_period*100;
    --
    --   wait;
   end process;

END;
