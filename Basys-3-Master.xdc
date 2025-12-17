## Clock signal (100 MHz) on W5
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { clk }]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }]

## Reset button (BTNC, U18)
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { reset }]

## SW0: DDS frequency select (1 kHz / 4 kHz)
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { sw[0] }]

## SW1: FIR input select (DDS sine / 1 kHz square)
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { sw[1] }]

## SW2: Filter bypass (filtered / unfiltered)
## (Basys3 SW2 is W16)
set_property -dict { PACKAGE_PIN W16   IOSTANDARD LVCMOS33 } [get_ports { sw[2] }]

## PWM output to JA1 (J1)
set_property -dict { PACKAGE_PIN J1    IOSTANDARD LVCMOS33 } [get_ports { pwm_out }]
