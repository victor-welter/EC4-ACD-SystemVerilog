/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
● Crie um projeto exe_4 que possui entradas in{1,2,3} e uma saída out1. 
● Crie dois sinais internos sig1 e sig2 e implemente a lógica da figura ao lado.
○ sig1 recebe a saída OR entre in1 e in2
○ sig2 recebe a NOT de in3
○ out1 recebe a saída de AND entre sig1 
e sig2
*/

module exe_04 (
    input logic in1,
    input logic in2,
    input logic in3,

    output logic out1
);

    logic sig1;
    logic sig2;

    assign sig1 = in1 || in2;
    assign sig2 = !in3;

    assign out1 = sig1 && sig2;
    
endmodule