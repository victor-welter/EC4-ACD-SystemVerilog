/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
● Crie um projeto exe_7 que possui entrada in1 de 4 bits e uma saída out1 de 6 bits. 
Deve possuir uma constante ZERO de 6 bits. O comportamento deve ser: 
○ Ver figura 
○ Note que in1 os bits mais significativos são usados na porta AND. Cuidar quais bits 
são usados para determinada ligação.
● Testar com os valores 
○ in1 forçado para C (que em binário é 1100)
*/

module exe_07 (
    input logic [3:0] in1,

    output [5:0] out1
);

    const logic [5:0] ZERO = 0;

    logic sig1;

    assign sig1 = in1[3] & in1[2];

    assign out1[5] = sig1;
    assign out1[4] = sig1 | in1[1];
    assign out1[3] = in1[0];
    assign out1[2:0] = ZERO[5:3];
    
endmodule