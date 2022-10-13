/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Outubro de 2022
*
*Especificacao:
Implemente um circuito exe_17 que simula o comportamento de um decodificador de
teclas. Adicione entrada para 4 teclas: a, b, c e d. A saída deve ser no formato do código
ASCII (8 bits).
● Exemplo: quando a tecla a está pressionada, a saída deve ser 0x41
● Usar constantes para armazenar o valor em ASCII de cada tecla
● Fazer um testbench para testar
Dica: usar operador ?:, if-else, ou case

*/
module exe_17 (
    input logic a,
    input logic b,
    input logic c,
    input logic d,

    output logic [7:0] code
);

always_comb begin
    if(a == 1) begin
        code = 8'h41;
    end
    else if(b == 1) begin 
        code = 8'h42;
    end
    else if(c == 1) begin 
        code = 8'h43;
    end
    else if(d == 1) begin 
        code = 8'h44;
    end
    else begin 
        code = '0;
    end
end

endmodule