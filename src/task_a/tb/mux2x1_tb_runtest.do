SetActiveLib -work
comp -include "$dsn\src\task_a\mux2x1.vhd" 
comp -include "$dsn\src\task_a\tb\mux2x1_tb.vhd"
asim +access +r mux2x1_tb tb

wave 

wave -noreg S
wave -noreg A
wave -noreg B

wave -noreg	Z_beh
wave -noreg Z_struct

wave -noreg Error

run 200 ns