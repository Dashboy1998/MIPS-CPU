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
wave -noreg Clk_1Mhz
wave -noreg SW
wave -noreg KEY
wave -noreg PC
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\complete_mips_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_complete_mips 
