/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Outubro de 2022
*
*Especificacao:
Implemente um circuito exe_16 com duas entradas de 2 bits chamadas in1 e in2.
Adicione uma terceira entrada sel de 1 bit. O circuito deve ter uma única saída out1 de 2
bits.
● O sinal out1 deve receber o valor de in1 quando control está ativo, caso contrário o
sinal de out1 deve receber o valor de in2
● Fazer um testbench para testar

Dica: usar operador assign <> ? <> : <>, if <> else <>, ou case <> endcase
*/
module exe_16 (
    input logic [1:0] in1,
    input logic [1:0] in2,

    input logic sel,

    output logic [1:0] out1
);

always_comb begin
    if(sel == 1) begin
        out1 = in1;
    end
    else begin 
        out1 = in2;
    end
end

endmodule