module testbench;
    timeunit 1ns; timeprecision 1ns;
    logic clk = 0;
    logic rst_n = 0;

    logic p0=0;
    logic p1=0; 
    logic p2=0; 
    logic p3=0; 
    logic int_r; 
    logic [1:0] x;

    interrupt mod_interrupt(
        .clk_i(clk),
        .rst_ni(rst_n),
        .p0_i(p0),
        .p1_i(p1),
        .p2_i(p2),
        .p3_i(p3),
        .intr_o(int_r),
        .x_o(x)
    );

    /////////////////////////////////////////////

    // Importante: controle da lógica síncrona

    initial begin
        #100 rst_n = 1'b1;
    end

    always #10 clk = ~clk;  // 50 MHz

    /////////////////////////////////////////////

    always #20  p0 = ~p0;   // No mínimo E múltiplo do período de clock
    always #40  p1 = ~p1;
    always #80  p2 = ~p2;
    always #160 p3 = ~p3;
    
endmodule