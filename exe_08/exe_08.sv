/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
● Crie um módulo chamado modulo que tem entradas a e b e uma
saída c que faz a operação da figura ao lado.
● Crie um módulo exe_8 que será o top-level do nosso projeto. Esse
módulo deve ter uma entrada in1 de 4 bits e uma saída out1. O
comportamento deve ser o seguinte: ○ Dentro de exe_8 instancie duas vezes “modulo” com os nomes
modulo1 e modulo2
○ Os dois bits mais significativos de in1 devem ser conectados às
entradas a e b de módulo 1, respectivamente
○ Os dois bits menos significativos de in2 devem ser conectados às
entradas a e b de módulo 2, respectivamente
○ As saídas de modulo1 e modulo2 devem ser conectados à sinais
internos para que possamos operar antes de conectar à saída
○ A saída out1 é o resultado do OR das saídas dos dois módulos
instanciados
● Para testar: ○ Force o valor 6 para in1 ○ Force o valor 5 para in1
*/

module exe_08 (
    input logic [3:0] in1,

    output logic out1
);

    logic sig1;
    logic sig2;

    modulo modulo1(
    .a(in1[3]),
    .b(in1[2]),
    .c(sig1)
    );

    modulo modulo2(
    .a(in1[1]),
    .b(in1[0]),
    .c(sig2)
    );

    assign out1 = sig1 | sig2;

endmodule