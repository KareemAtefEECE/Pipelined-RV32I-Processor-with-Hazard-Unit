
// ALU

module alu(SrcA,SrcB,ALUResult,zero,ALUControl);

input[31:0] SrcA,SrcB;
input[3:0] ALUControl;
output zero;
output reg[31:0] ALUResult;

always @(*) begin
	case(ALUControl)
	0: ALUResult = SrcA+SrcB;
	1: ALUResult = SrcA-SrcB;
	2: ALUResult = SrcA&SrcB;
	3: ALUResult = SrcA|SrcB;
	4: ALUResult = SrcA<<SrcB[4:0];
	5: ALUResult = ($signed(SrcA)<$signed(SrcB));
	6: ALUResult = SrcA>>SrcB[4:0];
	7: ALUResult = SrcA>>>SrcB[4:0];
	8: ALUResult = SrcA^SrcB;
    9: ALUResult = (SrcB<SrcA)?1:0;
    default: ALUResult = 0;
    endcase
end

assign zero = ((SrcA-SrcB)==0)?1:0;

endmodule