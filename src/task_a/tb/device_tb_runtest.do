SetActiveLib -work
comp -include "$dsn\src\task_a\device.vhd" 
comp -include "$dsn\src\task_a\tb\device_tb.vhd"
asim +access +r device_tb tb

wave 

wave -noreg X
wave -noreg Y
wave -noreg Z

wave -noreg	F_beh
wave -noreg F_struct

wave -noreg Error

run 200 ns