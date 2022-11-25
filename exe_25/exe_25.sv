/**
*Codigo LÓGICA SEQUENCIAL
*
*Autor: Víctor Vinicius Welter
*
*Data: Novembro de 2022
*
*Especificacao:
● Projete uma FSM que controla uma luz piscante. 
● Quando o circuito for ligado (resetado), a luz deve permanecer ligada por um breve 
momento para evitar que o usuário pense que a luz não está funcionando.
● Após isso, a luz deve ficar acesa por T1 ciclos de clock e apagada por T2 ciclos de 
clock.
● A máquina deve ter um sinal de enable para parar a operação e desligar a luz.
*/

module exe_25
(
	input logic clk_i,
	input logic rst_ni,

	input logic enable_i,
	output logic light_o
);
	typedef enum logic [3 - 1:0] {  
		STOP = 3'b001,
		ON   = 3'b010,
		OFF  = 3'b100
	} fsm_t;

	fsm_t cs;
	fsm_t ns;

	// Nosso clock é 50 MHz, portanto cada incremento leva 1/50MHz = 20 ns
	// Vamos ficar 1 segundo com a luz acesa, tem que contar até... 1 / 0.000'000'020 = 50000000
	// Precisamos de ceil( log2 50000000 ) bits para armazenar esse valor, portanto 26 bits
	// Para manter apagada, vamos contar até 0.5 s
	logic [25:0] timer;

	assign light_o = (cs == ON);

	always_comb begin
		case(cs)
			STOP:
				if(enable_i)
					ns = ON;
				else
					ns = STOP;
			ON:
				if(!enable_i)
					ns = STOP;
				// else if(timer == 26'h2FAF080)	// Vamos deixar um segundo aceso, portanto 1/20ns = 50000000 = 0x2FAF080
				else if(timer == 27'h2)
					ns = OFF;
				else
					ns = ON;
			OFF:
				if(!enable_i)
					ns = STOP;
				// else if(timer == 26'h17D7840)	// Vamos deixar meio segundo apagado, portanto 0.5/20ns = 25000000 = 0x17D7840
				else if(timer == 27'h1)
					ns = ON;
				else
					ns = OFF;
			default:
				ns = STOP;
		endcase
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni)
			cs <= STOP;
		else
			cs <= ns;
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) begin
			timer <= '0;
		end else begin
			if(cs != ns)
				timer <= '0;
			else
				timer <= timer + 1'b1;
		end
	end

endmodule
