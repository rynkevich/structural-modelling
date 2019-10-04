SetActiveLib -work
comp -include "$dsn\src\task_d\half_adder.vhd" 
comp -include "$dsn\src\task_d\tb\half_adder_tb.vhd"
asim +access +r half_adder_tb tb

wave 

wave -noreg A
wave -noreg B

wave -noreg S_beh
wave -noreg C_beh

wave -noreg	S_struct
wave -noreg C_struct

wave -noreg Error

run 200 ns