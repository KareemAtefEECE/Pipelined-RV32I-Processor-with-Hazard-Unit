

// Main Decoder

module main_decoder(opcode,funct3,Branch,Jump,ResultSrc,MemWrite,ALUSrc,ImmSrc,MemStrobe,RegWrite,ALUOp);

input[6:0] opcode;
input[2:0] funct3;
output reg Branch,Jump,MemWrite,ALUSrc,RegWrite;
output reg[1:0] ResultSrc,ImmSrc,ALUOp,MemStrobe;

// LB,SB -> MemStrobe=01
// LH,SH -> MemStrobe=10
// LW,SW -> MemStrobe=11

always @(*) begin
	case(opcode)
    7'b0000011:begin
        {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b1_00_1_0_01_0_00_0; // Load
        case(funct3)
        0: MemStrobe = 2'b01;
        1: MemStrobe = 2'b10;
        default: MemStrobe = 2'b11;
        endcase
    end
    7'b0100011:begin
        {RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b0_01_1_1_xx_0_00_0; // Store
         case(funct3)
        0: MemStrobe = 2'b01;
        1: MemStrobe = 2'b10;
        default: MemStrobe = 2'b11;
        endcase
    end
    7'b0110011:{RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b1_xx_0_0_00_0_10_0; //R-type
    7'b1100011:{RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b0_10_0_0_xx_1_01_0; //beq
    7'b0010011:{RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b1_00_1_0_00_0_10_0; //I-type alu
    7'b1101111:{RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 11'b1_11_x_0_10_0_xx_1; //jal
    default:{RegWrite,ImmSrc,ALUSrc,MemWrite,ResultSrc,Branch,ALUOp,Jump} = 0;
    endcase
end

endmodule