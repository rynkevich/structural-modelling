SetActiveLib -work
comp -include "$dsn\src\task_d\full_adder2.vhd" 
comp -include "$dsn\src\task_d\tb\full_adder2_tb.vhd"
asim +access +r full_adder2_tb tb

wave 

wave -noreg A
wave -noreg B

wave -noreg S_beh
wave -noreg C_beh

wave -noreg	S_struct
wave -noreg C_struct

wave -noreg Error

run 400 ns