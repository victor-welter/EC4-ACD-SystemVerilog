package definitions;
    typedef logic [15:0] word_t;
    typedef logic [31:0] dword_t; 
    
    typedef struct packed {
        word_t instruction;
        word_t absolute;
    } opcode_t;

   typedef union {
    opcode_t opcode;
    dword_t address;
   } inst_t;

endpackage