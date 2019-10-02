SetActiveLib -work
comp -include "$dsn\src\task_c\and5.vhd" 
comp -include "$dsn\src\task_c\tb\and5_tb.vhd"
asim +access +r and5_tb tb

wave 

wave -noreg A

wave -noreg	Z_beh
wave -noreg Z_struct

wave -noreg Error

run 320 ns