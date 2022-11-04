/**
*Codigo LÓGICA SEQUENCIAL
*
*Autor: Víctor Vinicius Welter
*
*Data: Novembro de 2022
*
*Especificacao:
Implemente um circuito que possui entradas clk, rst_n, e uma saída counter de 8 bits.
● Implemente um contador de 8 bits: a todo pulso de clock, o valor de counter deve 
ser aumentado em 1. Ligue esse contador à saída counter.
● Lembre-se de configurar um valor inicial para o contador. (Dica: lógica de reset)
● Faça um testbench que gera um clock de 50 MHz. Lembre de realizar o reset por um 
tempo maior que um ciclo de clock ao começo da simulação (sugestão: 100 ns).
*/

module exe_19 (
	input logic clk_i = 1'b0,
	input logic rst_ni = 1'b0,

	output logic [7:0] counter_o
);

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) begin
			counter_o <= '0;
		end else begin
			counter_o <= counter_o + 1'b1;
		end
	end

endmodule