module testbench;
timeunit 1ns; timeprecision 1ns;
logic [2:0] in1 = 3'b010;;
logic [2:0] in2 = 3'b101;

logic a = 0;
logic b = 0;
logic c = 0;

logic sel = 0;

logic [2:0] out1;

exe_18 mod_exe_18(
    .in1(in1),
    .in2(in2),
    .a(a),
    .b(b),
    .c(c),
    .sel(sel),
    .out1(out1)
);

    always # 40 a = 1;
    always # 40 c = 1;
    always # 40 sel = a & b | ~c;
    always # 40 b = 1;
    always # 40 c = 0;
    always # 40 sel = a & b | ~c;
    always # 40 b = 0;
    always # 40 c = 1;
    always # 40 sel = a & b | ~c;
    
endmodule