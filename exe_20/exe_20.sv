/**
*Codigo LÓGICA SEQUENCIAL
*
*Autor: Víctor Vinicius Welter
*
*Data: Novembro de 2022
*
*Especificacao:
Crie um circuito com as entradas clk, rst_n, e in1 de 4 bits. Deve ter uma saída equal_cnt
de 8 bits.
● O circuito deve ter internamente os sinais in1_high e in1_low, ambos de 2 bits, que
recebem a parte alta e baixa da entrada in1, respectivamente
● A cada ciclo de clock, se in1_high e in1_low forem iguais, equal_cnt deve ser
incrementado em 1. Lembre-se de inicializar equal_cnt.
● Faça o testbench.
*/

module exe_20 (
	input logic clk_i,
	input logic rst_ni,

	input logic [3:0] in1,

	output logic [7:0] equal_cnt
);
	logic [1:0] in1_high;
	logic [1:0] in1_low;

	assign in1_high = in1[3:2];
	assign in1_low = in1[1:0];

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) begin
			equal_cnt <= '0;
		end else begin
			if(in1_high == in1_low) begin
				equal_cnt <= equal_cnt + 1'b1;
			end
		end
	end

endmodule