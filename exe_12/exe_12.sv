/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
1) Adicione ao definitions.sv modificado no exercício 11 um tipo union chamado inst_t que 
pode ser opcode_t (opcode) ou word_t (address).
2) Crie um módulo chamado exe_12 baseado no exercício 9. A entrada (que será chamada in) 
e a saída (que será chamada out) devem mudar para o tipo inst_t.
3) Para testar:
a) Force o valor CAFE00FE para in.address

Atenção: você deve alterar typedef struct para typedef struct packed para poder usar na union 
packed
*/

module exe_12 
    import definitions::*;
(
    input inst_t in,

	output inst_t out
);

    assign out.opcode.instruction = in.address[31:16];
    assign out.opcode.absolute = in.address[15:0];
    
endmodule