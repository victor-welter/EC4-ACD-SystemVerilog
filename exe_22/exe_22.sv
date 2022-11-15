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

module exe_22 (
	input logic clk_i,
	input logic rst_ni,

	input logic coin_i,
	input logic push_i,

	output logic locked_o,
	output logic unlocked_o,

	output logic [7:0] counter_o
);
	typedef enum logic [2 - 1:0] {  
		LOCKED = 2'b01,
		UNLOCKED = 2'b10
	} fsm_t;

	fsm_t cs;
	fsm_t ns; 

	assign locked_o = (cs == LOCKED);
	assign unlocked_o = (cs == UNLOCKED);

	always_comb begin
		case(cs)
			LOCKED:
				if(coin_i)
					ns = UNLOCKED;
				else
					ns = LOCKED;
			UNLOCKED:
				if(push_i)
					ns = LOCKED;
				else
					ns = UNLOCKED;
			default:
				ns = LOCKED;
		endcase
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni)
			cs <= LOCKED;
		else
			cs <= ns;
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) begin
			counter_o <= '0;
		end else begin
			if(push_i && cs == UNLOCKED)
				counter_o <= counter_o + 1'b1;
		end
	end

endmodule