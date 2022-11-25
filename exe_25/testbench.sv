module testbench;
	timeunit 1ns; timeprecision 1ns;

	logic clk = 1'b0;
	always #10 clk = ~clk;

	logic rst_n = 1'b0;
	logic enable = 1'b1;
	logic light;

	exe_25 mod_exe(
		.clk_i(clk),
		.rst_ni(rst_n),
		.enable_i(enable),
		.light_o(light)
	);

	initial begin
		// Espera o tempo de reset e para de resetar após
		#100 rst_n = 1'b1;

		// Após um tempo, desativa a lâmpada
		// #10s enable = 1'b0; // Percebam: aqui deixei explícito 10 SEGUNDOS
		#300 enable = 1'b0;

		// Após mais um tempo, volta a ativar a lâmpada
		// #5s enable = 1'b1;
		#150 enable = 1'b1;
	end


endmodule
