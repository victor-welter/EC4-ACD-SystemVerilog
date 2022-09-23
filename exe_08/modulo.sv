module modulo (
    input logic a,
    input logic b,

    output logic c
);

    logic sig1;
    logic sig2;

    assign sig1 = a & b;
    assign sig2 = ~b;

    assign c = sig1 | sig2;
    
endmodule