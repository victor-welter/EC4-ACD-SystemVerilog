/**
*Codigo LÓGICA SEQUENCIAL
*
*Autor: Víctor Vinicius Welter
*
*Data: Novembro de 2022
*
*Especificacao:
● Modifique o exercício da catraca(exe_22) para fazer um contador de créditos.
● Para isso, crie um sinal interno de 8 bits para armazenar a quantidade de crédito
● No reset, a quantidade de créditos deve ir a 0
● Sempre que houver crédito, a catraca deve permanecer desbloqueada
● Quando inserido uma moeda, independente do estado, o crédito deve ser
aumentado em 1
● Quando alguém passar pela catraca (push com a catraca destravada) o crédito deve
ser reduzido em 1
*/

module exe_23 (
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
	logic [7:0] credit;

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
				if(credit != '0)
					ns = UNLOCKED;
				else
					ns = LOCKED;
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
			credit <= '0;
		end else begin
			if(push_i && credit != '0) begin
				counter_o <= counter_o + 1'b1;
				credit <= credit - 1'b1;
			end else if(coin_i) begin
				credit <= credit + 1'b1;
			end
		end
	end

endmodule