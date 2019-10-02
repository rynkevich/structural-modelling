SetActiveLib -work
comp -include "$dsn\src\task_b\demux1x4.vhd" 
comp -include "$dsn\src\task_b\tb\demux1x4_tb.vhd"
asim +access +r demux1x4_tb tb

wave 

wave -noreg X
wave -noreg A
wave -noreg B

wave -noreg	Z_beh
wave -noreg Z_struct

wave -noreg Error

run 200 ns