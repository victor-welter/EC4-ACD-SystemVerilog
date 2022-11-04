/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Outubro de 2022
*
*Especificacao:
Implemente um circuito com entradas in1 e in2 de 3 bits, a, b, c, de 1 bit, e uma saída
out1 de 3 bits.
● Implemente a funcionalidade da figura ao lado que ao final gera um sinal interno sel
● Use o sinal sel para decidir qual valor será atribuído para out1. Quando sel é 1, out1
recebe in1. Caso contrário, recebe in2.
Dica: usar operador ?:, if-else, ou case
*/

module exe_18 (
    input logic [2:0] in1,
    input logic [2:0] in2,

    input logic a,
    input logic b,
    input logic c,
    
    input logic sel,

    output logic [2:0] out1
);

always_comb begin
    if(sel == 1) begin
        out1 = in1;
    end
    else begin 
        out1 = in2;
    end
end

endmodule