module testbench;
	timeunit 1ns; timeprecision 1ns;

	logic clk = 1'b0;
	always #10 clk = ~clk;

	logic rst_n = 1'b0;
	logic btn = 1'b0;
	logic fcc = 1'b0;
	logic fca = 1'b0;
	logic abrir;
	logic fechar;

	exe_24 mod_exe(
		.clk_i(clk),
		.rst_ni(rst_n),
		.btn_i(btn),
		.fcc_i(fcc),
		.fca_i(fca),
		.abrir_o(abrir),
		.fechar_o(fechar)
	);

	initial begin
		// Vamos assumir que o portão encontra-se fechado quando reiniciamos
		fca = 1'b0;
		fcc = 1'b1;

		// Espera o tempo de reset e para de resetar após
		#100 rst_n = 1'b1;

		#10;

		// Simula 1 clique do botão
		@(negedge clk) btn = 1'b1;
		@(negedge clk) btn = 1'b0;
		// Após um pequeno tempo o portão não está mais completamente fechado
		#20 fcc = 1'b0;

		// Simula que após um tempo o portão vai ficar completamente aberto
		#80 fca = 1'b1;

		#10;
		// Simula 1 clique do botão
		@(negedge clk) btn = 1'b1;
		@(negedge clk) btn = 1'b0;
		// Após um pequeno tempo o portão não está mais completamente aberto
		#20 fca = 1'b0;

		// Simula 1 clique do botão enquanto o portão está fechado mas não fechou por completo
		# 40;
		@(negedge clk) btn = 1'b1;
		@(negedge clk) btn = 1'b0;

		//Simula que após um tempo o portão abriu novamente
		#60 fca = 1'b1;
	end

endmodule
