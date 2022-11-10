module testbench;
    timeunit 1ns; timeprecision 1ns;
    logic clk_i = 0;
    logic rst_ni = 0;

    logic [3:0] in1 = '0;

    logic [7:0] equal_cnt;

    exe_20 mod_exe_20(
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .in1(in1),
        .equal_cnt(equal_cnt)
    );

    initial begin
        #100 rst_ni = 0;
    end

    always #10 clk_i = ~clk_i;  // 50 MHz
    
    always #20  in1 = in1 + 1'b1;
    
endmodule