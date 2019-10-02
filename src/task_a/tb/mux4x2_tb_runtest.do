SetActiveLib -work
comp -include "$dsn\src\task_a\mux4x2.vhd" 
comp -include "$dsn\src\task_a\tb\mux4x2_tb.vhd"
asim +access +r mux4x2_tb tb

wave 

wave -noreg S
wave -noreg A
wave -noreg B

wave -noreg	Z_beh
wave -noreg Z_struct

wave -noreg Error

run 800 ns