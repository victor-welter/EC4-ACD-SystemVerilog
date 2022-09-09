/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Agosto de 2022
*
*Especificacao:
● Crie um projeto exe_3 com sinal de entrada in1 e 3 sinais de saída out{1, 2, 3}, todos de 1
bit.
● Crie 3 constantes como sinais intermediários (após a definição de module();):
    ○ ENABLED do tipo logic que tem valor 1
    ○ BUS_S de 8 bits que armazena o valor decimal 242 (lembrar boas práticas: codificar em hexa)
    ○ INDEX do tipo int que possui valor 7
● Comportamento
    ○ out1 recebe in1 & ENABLED
    ○ out2 recebe o 5º bit MAIS SIGNIFICATIVO de BUS_S (dica: não é o bit 5)
    ○ out3 recebe o bit que está na posição INDEX de BUS_S
*/

module exe_03 (
    input logic in1,

    output logic s1,
    output logic s2,
    output logic s3
);

    const logic ENABLED = 1;
    const logic [7:0] BUS_S = 8'hF2;
    const int INDEX = 7;

    assign s1 = in1 & ENABLED;
    assign s2 = BUS_S[3];
    assign s3 = BUS_S[INDEX];
    
endmodule