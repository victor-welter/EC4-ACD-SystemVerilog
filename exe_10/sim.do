vlib work

vmap work work

vlog -work work definitions.sv
vlog -work work exe_10.sv

vsim -voptargs=+acc work.exe_10

do wave.do

force /exe_10/address 00BABACA

run 100 ns
