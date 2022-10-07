module testbench;
timeunit 1ns; timeprecision 1ns;
logic [1:0] in1 = 2'b01;
logic [1:0] in2 = 2'b10;

logic sel = 0;

logic [1:0] out1;

exe_16 mod_exe_16(
    .in1(in1),
    .in2(in2),
    .sel(sel),
    .out1(out1)
);

always # 20 sel = ~sel;

endmodule