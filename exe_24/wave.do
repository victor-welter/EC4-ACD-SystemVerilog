onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/clk
add wave -noupdate /testbench/rst_n
add wave -noupdate /testbench/btn
add wave -noupdate /testbench/fca
add wave -noupdate /testbench/fcc
add wave -noupdate /testbench/abrir
add wave -noupdate /testbench/fechar
add wave -noupdate /testbench/mod_exe/cs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {233 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 149
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {634 ns}
