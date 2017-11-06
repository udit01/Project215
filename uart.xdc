## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

## Clock signal
#set_property PACKAGE_PIN W5 [get_ports clk]
	#set_property IOSTANDARD LVCMOS33 [get_ports clk]
	#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

# Clock signal
#Bank = 34, Pin name = ,	Sch name = CLK100MHZ
	set_property PACKAGE_PIN W5 [get_ports clk]
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]
   # set_property ALLOW_COMBINATORIAL_LOOPS TRUE [net_nets <myHier/myNet>]

## data_inputitches
set_property PACKAGE_PIN V17 [get_ports data_input[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[0]]
set_property PACKAGE_PIN V16 [get_ports data_input[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[1]]
set_property PACKAGE_PIN W16 [get_ports data_input[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[2]]
set_property PACKAGE_PIN W17 [get_ports data_input[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[3]]
set_property PACKAGE_PIN W15 [get_ports data_input[4]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[4]]
set_property PACKAGE_PIN V15 [get_ports data_input[5]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[5]]
set_property PACKAGE_PIN W14 [get_ports data_input[6]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[6]]
set_property PACKAGE_PIN W13 [get_ports data_input[7]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[7]]
set_property PACKAGE_PIN V2 [get_ports data_input[8]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[8]]
set_property PACKAGE_PIN T3 [get_ports data_input[9]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[9]]
set_property PACKAGE_PIN T2 [get_ports data_input[10]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[10]]
set_property PACKAGE_PIN R3 [get_ports data_input[11]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[11]]
set_property PACKAGE_PIN W2 [get_ports data_input[12]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[12]]
set_property PACKAGE_PIN U1 [get_ports data_input[13]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[13]]
set_property PACKAGE_PIN T1 [get_ports data_input[14]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[14]]
set_property PACKAGE_PIN R2 [get_ports data_input[15]]
	set_property IOSTANDARD LVCMOS33 [get_ports data_input[15]]


## LEDs
set_property PACKAGE_PIN U16 [get_ports led[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[0]]
set_property PACKAGE_PIN E19 [get_ports led[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[1]]
set_property PACKAGE_PIN U19 [get_ports led[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[2]]
set_property PACKAGE_PIN V19 [get_ports led[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[3]]
set_property PACKAGE_PIN W18 [get_ports led[4]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[4]]
set_property PACKAGE_PIN U15 [get_ports led[5]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[5]]
set_property PACKAGE_PIN U14 [get_ports led[6]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[6]]
set_property PACKAGE_PIN V14 [get_ports led[7]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[7]]
set_property PACKAGE_PIN V13 [get_ports led[8]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[8]]
set_property PACKAGE_PIN V3 [get_ports led[9]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[9]]
set_property PACKAGE_PIN W3 [get_ports led[10]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[10]]
set_property PACKAGE_PIN U3 [get_ports led[11]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[11]]
set_property PACKAGE_PIN P3 [get_ports led[12]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[12]]
set_property PACKAGE_PIN N3 [get_ports led[13]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[13]]
set_property PACKAGE_PIN P1 [get_ports led[14]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[14]]
set_property PACKAGE_PIN L1 [get_ports led[15]]
	set_property IOSTANDARD LVCMOS33 [get_ports led[15]]


##7 segment display#cathodes
set_property PACKAGE_PIN W7 [get_ports cathode[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[0]]
set_property PACKAGE_PIN W6 [get_ports cathode[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[1]]
set_property PACKAGE_PIN U8 [get_ports cathode[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[2]]
set_property PACKAGE_PIN V8 [get_ports cathode[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[3]]
set_property PACKAGE_PIN U5 [get_ports cathode[4]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[4]]
set_property PACKAGE_PIN V5 [get_ports cathode[5]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[5]]
set_property PACKAGE_PIN U7 [get_ports cathode[6]]
	set_property IOSTANDARD LVCMOS33 [get_ports cathode[6]]

#what's the pin below?
#set_property PACKAGE_PIN V7 [get_ports dp]
	#set_property IOSTANDARD LVCMOS33 [get_ports dp]

set_property PACKAGE_PIN U2 [get_ports anode[0]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[0]]
set_property PACKAGE_PIN U4 [get_ports anode[1]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[1]]
set_property PACKAGE_PIN V4 [get_ports anode[2]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[2]]
set_property PACKAGE_PIN W4 [get_ports anode[3]]
	set_property IOSTANDARD LVCMOS33 [get_ports anode[3]]

##Push Buttons
#center button below
set_property PACKAGE_PIN U18 [get_ports send]
	set_property IOSTANDARD LVCMOS33 [get_ports send]
	
set_property PACKAGE_PIN W19 [get_ports sendL]
        set_property IOSTANDARD LVCMOS33 [get_ports sendL]

#up button below
set_property PACKAGE_PIN T18 [get_ports reset]
	set_property IOSTANDARD LVCMOS33 [get_ports reset]


##Buttons-generic
#set_property PACKAGE_PIN U18 [get_ports btnC]
	#set_property IOSTANDARD LVCMOS33 [get_ports btnC]
#set_property PACKAGE_PIN T18 [get_ports btnU]
	#set_property IOSTANDARD LVCMOS33 [get_ports btnU]
#set_property PACKAGE_PIN W19 [get_ports btnL]
	#set_property IOSTANDARD LVCMOS33 [get_ports btnL]
set_property PACKAGE_PIN T17 [get_ports sendR]
	set_property IOSTANDARD LVCMOS33 [get_ports sendR]
set_property PACKAGE_PIN U17 [get_ports sim_mode]
	set_property IOSTANDARD LVCMOS33 [get_ports sim_mode]

##USB-RS232 Interface
#set_property PACKAGE_PIN B18 [get_ports RsRx]
#	set_property IOSTANDARD LVCMOS33 [get_ports RsRx]
set_property PACKAGE_PIN A18 [get_ports data]
	set_property IOSTANDARD LVCMOS33 [get_ports data]


##USB HID (PS/2)
#set_property PACKAGE_PIN C17 [get_ports PS2Clk]
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Clk]
	#set_property PULLUP true [get_ports PS2Clk]
#set_property PACKAGE_PIN B17 [get_ports PS2Data]
	#set_property IOSTANDARD LVCMOS33 [get_ports PS2Data]
	#set_property PULLUP true [get_ports PS2Data]



# Others (BITSTREAM, CONFIG)
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]

set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
