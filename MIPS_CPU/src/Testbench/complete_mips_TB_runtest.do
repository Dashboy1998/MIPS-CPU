SetActiveLib -work
comp -include "$dsn\src\HEX2Seven.vhd" 
comp -include "$dsn\src\Program.vhd" 
comp -include "$dsn\src\HiLo_Register.vhd" 
comp -include "$dsn\src\REG.vhd" 
comp -include "$dsn\src\PLL\pll1Mhz_0002.v" 
comp -include "$dsn\src\Memory.vhd" 
comp -include "$dsn\src\MIPS.vhd" 
comp -include "$dsn\src\PLL\pll1Mhz.vhd" 
comp -include "$dsn\src\Complete_MIPS.vhd" 
comp -include "$dsn\src\TestBench\complete_mips_TB.vhd" 
asim +access +r TESTBENCH_FOR_complete_mips 
wave 
wave -noreg CLOCK_50
wave -noreg SW
wave -noreg KEY
wave -noreg HEX0
wave -noreg HEX1
wave -noreg HEX2
wave -noreg HEX3
wave -noreg HEX4
wave -noreg HEX5
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\complete_mips_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_complete_mips 
