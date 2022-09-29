/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
1) Adicione ao definitions.sv criado no exercício 10 um tipo estruturado opcode_t que 
possui dois campos word_t chamados instruction e absolute.
2) Crie um módulo chamado exe_11 baseado no exercício 10. A entrada deve 
permanecer igual, porém as duas saídas devem ser substituídas pelo tipo opcode_t, 
com uma saída nomeada opcode.
3) Para testar:
a) Force o valor DEADBEEF para address

Resultado: opcode.instruction deve ser DEAD e opcode.absolute deve ser BEEF
*/

module exe_11 
    import definitions::*;
(
    input dword_t address,

	output opcode_t opcode
);

    assign opcode.instruction = address[31:16];
    assign opcode.absolute = address[15:0];
    
endmodule