/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Outubro de 2022
*
*Especificacao:
● Implementar em SystemVerilog um módulo chamado interrupt.
● Também implementar um testbench.
● A entrega deve incluir todos os arquivos do trabalho (interrupt.sv, testbench.sv,
sim.do, e wave.do) em um arquivo .zip.
● O módulo interrupt deve implementar um codificador de prioridade para detecção
de interrupções em hardware. Para isso, o módulo possui 4 entradas p0~3, e uma
saída de 2 bits x. Além disso, também deve ter uma saída int
● O funcionamento deve converter um dos periféricos p que esteja em nível alto para
o seu código (exemplo, se p0 é 1, então a saída x deve ser 0, se p1 é 1, então a
saída x deve ser 1, e assim por diante).
● Atenção: o codificador deve ter prioridades, ou seja, se p3 e p0 estiverem ativos, a
prioridade deve ser do p3, e assim por diante (quanto maior o número do p, maior a
prioridade). Para isso, é possível usar if-else ou o operador ?:.
○ Opcional: quem quiser usar case, pode optar por usar p[3:0] ao invés de
p0~p3
● A saída int deve ser 1 sempre que algum dos sinais p estiver em 1, indicando uma
interrupção pendente. Faça isso também de forma combinacional, fora do bloco
always_comb.
*/
module interrupt (
    input logic p0,
    input logic p1, 
    input logic p2, 
    input logic p3, 

    output logic int1, 

    output logic [1:0] x 
);

assign int1 = (p3 | p2) | (p1 | p0);

always_comb begin
    if(p3 == 1) begin
        x = 2'b11;
    end
    else if(p2 == 1) begin 
        x = 2'b10;
    end
    else if(p1 == 1) begin 
        x = 2'b01;
    end
    else begin
        x = 2'b00;
    end
end

endmodule