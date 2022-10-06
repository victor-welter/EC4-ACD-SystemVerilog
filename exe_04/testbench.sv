module testbench;
timeunit 1ns; timeprecision 1ns;
logic in1 = 0;
logic in2 = 0;
logic in3 = 0;

logic out1;

exe_04 mod_exe_04(
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .out1(out1)
);

always # 20 in1 = ~in1;
always # 40 in2 = ~in2;
always # 80 in3 = ~in3;
endmodule