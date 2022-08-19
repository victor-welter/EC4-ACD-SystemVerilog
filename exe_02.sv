/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Agosto de 2022
*
*Especificacao:
Desenvolva um projeto exe_2.sv que implemente as seguintes expressões (veremos os
operadores próxima aula):

● assign s1 = a & ~b;
● assign s2 = a & b | c & d;
● assign s3 = a & ~b | ~(c & (a | d));

1) Implemente o módulo em SystemVerilog. Lembre de definir as entradas e saídas s1,
s2, s3, a, b, c, d.
2) Compile no Questa como vimos na última aula
*/

module exe_02 (
    input logic a,
    input logic b,
    input logic c,
    input logic d,

    output logic s1,
    output logic s2,
    output logic s3
);

    assign s1 = a & ~b;
    assign s2 = a & b | c & d;
    assign s3 = a & ~b | ~(c & (a | d));
    
endmodule