/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
● Crie um projeto exe_6 com uma entrada address de 32 bits e duas saídas instruction 
e absolute ambas de 16 bits. O comportamento deve ser:
○ instruction recebe a parte alta de address
○ absolute recebe a parte baixa de address
● Para testar:
○ Force o valor F00F1010 para address

*/

module exe_06 (
    input [31:0] in1,

    output [15:0] out1,
    output [15:0] out2
);

    assign out1 = in1[15:0];
    assign out2 = in1[31:16];
    
endmodule