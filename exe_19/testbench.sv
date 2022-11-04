module testbench;
    timeunit 1ns; timeprecision 1ns;
    logic clk_i = 0;
    logic rst_ni = 0;

    logic [7:0] counter_o;

    exe_19 mod_exe_19(
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .counter_o(counter_o)
    );

    initial begin
        #100 rst_ni = 1'b1;
    end

    always #10 clk_i = ~clk_i;  // 50 MHz
    
endmodule