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

module trabalho_03
(
	input logic clk_i,
	input logic rst_ni,

	input logic [4:0] troom_i,

	input logic up_i,
	input logic dn_i,

	output logic cool_o,
	output logic heat_o
);
	typedef enum logic [3 - 1:0] {  
		HEAT = 3'b001,
		IDLE = 3'b010,
		COOL = 3'b100
	} fsm_t;

	fsm_t cs;
	fsm_t ns;
	logic [4:0] tref_i = 5'b11001;

	const logic deltaT = 1'b1;

	always_comb begin
		case(cs)
			HEAT:
				if(troom_i > tref_i) 
					ns = IDLE;
				else 
					ns = HEAT;
			COOL:
				if(troom_i < tref_i)
					ns = IDLE;
				else
					ns = COOL;
			IDLE:
				if(troom_i < (tref_i - deltaT)) 
					ns = HEAT;
				else if(troom_i > (tref_i + deltaT))
					ns = COOL;
				else
					ns = IDLE;
			default:
				ns = IDLE;
		endcase
	end

	assign cool_o = (cs == COOL);
	assign heat_o = (cs == HEAT);

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni)
			cs <= IDLE;
		else
			cs <= ns;
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) begin
			tref_i <= 5'b11001;
		end else begin
			if(up_i) begin
				tref_i <= tref_i + 1'b1;
			end

			if(dn_i) begin
				tref_i <= tref_i - 1'b1;
			end
		end
	end

endmodule
