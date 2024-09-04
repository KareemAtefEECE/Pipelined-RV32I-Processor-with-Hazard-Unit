
// Instruction Memory

// inst_width = 32 bits
// mem_depth = 256 instruction (2^8)

module instruction_memory(pc_addr,inst);

input[31:0] pc_addr;
output[31:0] inst;

reg[31:0] inst_mem[0:255];

assign inst = inst_mem[pc_addr>>2] ;

endmodule