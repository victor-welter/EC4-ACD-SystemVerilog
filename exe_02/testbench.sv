module testbench;
timeunit 1ns; timeprecision 1ns;
logic a = 0;
logic b = 0;
logic c = 0;
logic d = 0;

logic s1;
logic s2;
logic s3;

exe_02 mod_exe_02(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .s1(s1),
    .s2(s2),
    .s3(s3)
);
always # 20 a = ~a;
always # 40 b = ~b;
always # 80 c = ~c;
always # 160 d = ~d;
endmodule