/**
*Codigo teste de modulo Aula2
*
*Autor: Víctor Vinicius Welter
*
*Data: Setembro de 2022
*
*Especificacao:
1) Crie um módulo chamado exe_9. Esse módulo deve ter 3 saídas: r, g, e b de 3 bits.
Internamente, deve definir um tipo enumerado colors_t que possui os estados RED
(3’b001), GREEN (3’b010) e BLUE (3’b100) codificados como one-hot, ou seja,
somente um bit do valor pode ser 1.
2) Atribua para r, o valor RED. Para g, o valor GREEN. Para b, o valor BLUE.
*/

module exe_09 (
    output logic [2:0] r,
    output logic [2:0] g,
    output logic [2:0] b
);

    typedef enum logic [2:0] {RED = 3'b001, GREEN = 3'b010, BLUE = 3'b100} states_t;

    assign r = RED;
    assign g = GREEN;
    assign b = BLUE;
    
endmodule