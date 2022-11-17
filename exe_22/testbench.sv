module testbench;
    timeunit 1ns; timeprecision 1ns;
    logic clk_i = 0;
    logic rst_ni = 0;

    logic coin_i = 0;
    logic push_i = 0;

    logic locked_o;
    logic unlocked_o;

    logic [7:0] counter_o;

    exe_22 mod_exe_22(
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .coin_i(coin_i),
        .push_i(push_i),
        .locked_o(locked_o),
        .unlocked_o(unlocked_o),
        .counter_o(counter_o)
    );

    initial begin
        #100 rst_ni =  ~rst_ni;
    end

    always #10 clk_i = ~clk_i;  // 50 MHz

    always #20 coin_i = ~coin_i;
    always #40 push_i = ~push_i;
    
endmodule