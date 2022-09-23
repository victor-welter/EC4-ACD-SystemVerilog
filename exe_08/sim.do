vlib work

vmap work work

vlog -work work modulo.sv
vlog -work work exe_08.sv

vsim -voptargs=+acc work.exe_08

do wave.do

force /exe_08/in1 6
run 100 ns

force /exe_08/in1 5
run 100 ns
