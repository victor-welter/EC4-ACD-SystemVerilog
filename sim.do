vlib work

vmap work work

vlog -work work exe_04.sv

vsim -voptargs=+acc work.exe_04

do wave.do

force /exe_04/in1 0
force /exe_04/in2 0
force /exe_04/in3 0

run 100 ns

force /exe_04/in1 1
force /exe_04/in2 0
force /exe_04/in3 0

run 100 ns

force /exe_04/in1 1
force /exe_04/in2 0
force /exe_04/in3 1

run 100 ns

force /exe_04/in1 0
force /exe_04/in2 0
force /exe_04/in3 0

run 100 ns