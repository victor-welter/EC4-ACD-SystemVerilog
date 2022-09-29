vlib work

vmap work work

vlog -work work definitions.sv
vlog -work work exe_12.sv

vsim -voptargs=+acc work.exe_12

do wave.do

force /exe_12/in.address CAFE00FE

run 100 ns
