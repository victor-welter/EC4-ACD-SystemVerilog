module testbench;
timeunit 1ns; timeprecision 1ns;
logic a = 0;
logic b = 0;
logic c = 0;
logic d = 0;

logic [7:0] code;

exe_17 mod_exe_17(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .code(code)
);

initial begin 
    a = 1; 
    # 40 a = 0; 
    
    b = 1;
    # 40 b = 0;

    c = 1;
    # 40 c = 0;

    d = 1;
    # 40 d = 0;
end

endmodule