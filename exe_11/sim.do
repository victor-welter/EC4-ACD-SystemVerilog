vlib work

vmap work work

vlog -work work definitions.sv
vlog -work work exe_11.sv

vsim -voptargs=+acc work.exe_11

do wave.do

force /exe_11/address DEADBEEF

run 100 ns
