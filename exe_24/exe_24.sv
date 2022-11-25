/**
*Codigo LÓGICA SEQUENCIAL
*
*Autor: Víctor Vinicius Welter
*
*Data: Novembro de 2022
*
*Especificacao:
● Faça uma FSM capaz de controlar a abertura e fechamento de um portão
● Assuma entradas fca_i e fcc_i indicando o fim de curso aberto e fechado do portão
● Quando um botão btn_i tiver um pulso em 1, o portão deve fechar caso esteja 
aberto, ou abrir caso esteja fechado até o sinal correspondente de fim de curso seja 
1.
● Se o btn_i for pressionado durante o movimento do portão, reverter o sentido de 
abertura/fechamento
● Usar saídas abrir_o e fechar_o para simular o controle do motor do portão
● Faça a máquina de estados, o código em SystemVerilog, e o testbench
*/

module exe_24
(
	input logic clk_i,
	input logic rst_ni,

	input logic btn_i,
	input logic fcc_i,
	input logic fca_i,

	output logic abrir_o,
	output logic fechar_o
);
	typedef enum logic [3 - 1:0] {  
		ABERTO  = 3'b001,
		MEIO    = 3'b010,
		FECHADO = 3'b100
	} fsm_t;

	fsm_t cs;
	fsm_t ns;

	always_comb begin
		case(cs)
			ABERTO:
				if(fca_i)
					ns = ABERTO;
				else
					ns = MEIO;
			FECHADO:
				if(fcc_i)
					ns = FECHADO;
				else
					ns = MEIO;
			MEIO:
				if(fcc_i)
					ns = FECHADO;
				else if(fca_i)
					ns = ABERTO;
				else
					ns = MEIO;
			default:
				ns = MEIO;
		endcase
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni)
			cs <= MEIO;
		else
			cs <= ns;
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) begin
			abrir_o = 1'b0;
			fechar_o <= 1'b0;
		end else begin
			if(btn_i) begin
				if(cs == FECHADO || fechar_o) begin
					fechar_o <= 1'b0;
					abrir_o <= 1'b1;
				end else begin // cs == ABERTO ou abrir_o está ativo
					fechar_o <= 1'b1;
					abrir_o <= 1'b0;
				end
			end

			if(fcc_i)
				fechar_o <= 1'b0;

			if(fca_i)
				abrir_o <= 1'b0;
		end
	end

endmodule
