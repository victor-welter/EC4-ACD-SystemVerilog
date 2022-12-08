module testbench;
	timeunit 1ns; timeprecision 1ns;

	logic clk_i = 1'b0;
	always #10 clk_i = ~clk_i;

	logic rst_ni = 1'b0;
	logic [4:0] troom_i = 5'b11001;
	logic up_i = 1'b0;
	logic dn_i = 1'b0;
	logic cool_o;
	logic heat_o;

	trabalho_03 mod_exe(
		.clk_i(clk_i),
		.rst_ni(rst_ni),
		.troom_i(troom_i),
		.up_i(up_i),
		.dn_i(dn_i),
		.cool_o(cool_o),
		.heat_o(heat_o)
	);

	initial begin
		// Espera o tempo de reset e para de resetar após
		#100 rst_ni = 1'b1;

		#80;
		// Simula 1 clique do botão
		@(negedge clk_i) up_i = 1'b1;
		@(negedge clk_i) up_i = 1'b0;

		#80;
		// Simula 1 clique do botão
		@(negedge clk_i) up_i = 1'b1;
		@(negedge clk_i) up_i = 1'b0;

		#80;
		// Simula 1 clique do botão
		@(negedge clk_i) up_i = 1'b1;
		@(negedge clk_i) up_i = 1'b0;


		//Simula que após um tempo a temperatura voltou para 28C°
		#60 troom_i = 5'b11100;

		#80;
		// Simula 1 clique do botão
		@(negedge clk_i) dn_i = 1'b1;
		@(negedge clk_i) dn_i = 1'b0;

		#80;
		// Simula 1 clique do botão
		@(negedge clk_i) dn_i = 1'b1;
		@(negedge clk_i) dn_i = 1'b0;

		#80;
		// Simula 1 clique do botão
		@(negedge clk_i) dn_i = 1'b1;
		@(negedge clk_i) dn_i = 1'b0;

		
		//Simula que após um tempo a temperatura voltou para 25C°
		#60 troom_i = 5'b11001;

		//Simula que após um tempo a temperatura voltou para 28C°
		#60 troom_i = 5'b11100;
	end

endmodule
