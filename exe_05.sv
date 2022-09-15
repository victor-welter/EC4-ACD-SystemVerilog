/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Agosto de 2022
*
*Especificacao:
● Crie um projeto exe_5 que possui as entradas in{1,2} ambas de 8 bits e uma saída 
out1 de 32 bits. Adicione uma constante ZERO de 16 bits com todos bits em zero 
(para isso use ZERO = ‘0;). O circuito deve ter o seguinte comportamento:
○ out1 recebe in1 na parte mais significativa seguido por in2
○ Os 16 bits vagos de out1 na parte menos significativa devem receber ZERO
● Atribuir para os sinais
○ in1 é forçado para 10 (em hexadecimal) -> force /exe_4/in1 10
○ in2 é forçado para 20 (em hexadecimal) -> force /exe_4/in2 20
*/

module exe_05 (
    input logic [7:0] in1,
    input logic [7:0] in2,

    output logic [31:0] out1
);
  
    const logic [15:0] ZERO = 0;

    assign out1 = {in1, in2, ZERO};
    
endmodule