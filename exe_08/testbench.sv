module testbench;
timeunit 1ns; timeprecision 1ns;
logic [3:0] in1 = 0;

logic out1;

exe_08 mod_exe_08(
    .in1(in1),
    .out1(out1)
);

always # 20 in1 = in1 + 1'b1;
endmodule