module testbench;
timeunit 1ns; timeprecision 1ns;
logic p0 = 0;
logic p1 = 0; 
logic p2 = 0; 
logic p3 = 0; 

logic int1; 

logic [1:0] x;

interrupt mod_trabalho_02(
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3),
    .int1(int1),
    .x(x)
);

    always # 20 p0 = ~p0;
    always # 40 p1 = ~p1;
    always # 80 p2 = ~p2;
    always # 160 p3 = ~p3;
    
endmodule