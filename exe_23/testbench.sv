module testbench;
    timeunit 1ns; timeprecision 1ns;
    logic clk_i = 1'b0;
    logic rst_ni = 1'b0;

    logic coin_i = 1'b0;
    logic push_i = 1'b0;

    logic locked_o;
    logic unlocked_o;

    logic [7:0] counter_o;

    exe_23 mod_exe_23(
        .clk_i(clk_i),
        .rst_ni(rst_ni),
        .coin_i(coin_i),
        .push_i(push_i),
        .locked_o(locked_o),
        .unlocked_o(unlocked_o),
        .counter_o(counter_o)
    );

    always #10 clk_i = ~clk_i;

	initial begin
		#100 rst_ni = 1'b1;
		@(negedge clk_i) coin_i = 1'b1;
		#100 coin_i = 1'b0; // Equivalente a inserção de 5 coins (100ns / 20ns de clock = 5)
		@(negedge clk_i) push_i = 1'b1;
		#40 push_i = 1'b0; // Equivalente a 2 pessoas passando (40ns / 20 ns)

		// As linhas abaixo simulam 1 moeda e 1 passagem
		@(negedge clk_i) coin_i = 1'b1;
		@(negedge clk_i) coin_i = 1'b0;
		push_i = 1'b1;
		@(negedge clk_i) push_i = 1'b0;

		// Agora passam (ou tentam passar) 5
		@(negedge clk_i) push_i = 1'b1;
		#100 push_i = 1'b0;
	end
    
endmodule