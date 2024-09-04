
// Control Unit Module

module control_unit(opcode,funct,RegWrite,ResultSrc,MemWrite,Jump,Branch,ALUControl,ALUSrc,ImmSrc,MemStrobe);

input[6:0] opcode;
input[4:0] funct;
output RegWrite,MemWrite,Jump,Branch,ALUSrc;
output[1:0] ResultSrc,ImmSrc,MemStrobe;
output[3:0] ALUControl;

wire[1:0] ALUOp;


main_decoder main_dec(opcode,funct[2:0],Branch,Jump,ResultSrc,MemWrite,ALUSrc,ImmSrc,MemStrobe,RegWrite,ALUOp);
alu_decoder alu_dec(ALUOp,funct,ALUControl);

endmodule

