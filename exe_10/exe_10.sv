/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
1) Crie um package chamado definitions em um arquivo definitions.sv que possua uma 
definição word_t de 16 bits e uma definição dword_t de 32 bits.
2) Crie um módulo chamado exe_10 baseado no exercício 6. Modifique para usar 
somente variáveis com tipos definidos (instruction, absolute, e address devem usar 
word_t ou dword_t da forma correta). Lembre de compilar o definitions antes de 
exe_10 no sim.do.
3) Para testar:
    a) Force o valor 00BABACA para address

Resultado: instruction deve ser 00BA e absolute deve ser BACA
*/

module exe_10 
    import definitions::*;
(
    input dword_t address,

	output word_t instruction,
	output word_t absolute
);

    assign instruction = address[15:0];
    assign absolute = address[31:16];
    
endmodule