
// Immediate extendor

module imm_extend(imm,ImmSrc,ImmExt);

input[24:0] imm;
input[1:0] ImmSrc;
output reg[31:0] ImmExt;

always @(*) begin
	case(ImmSrc)
	0: ImmExt = {{20{imm[24]}},imm[24:13]}; // I-Type
	1: ImmExt = {{20{imm[24]}},imm[24:18],imm[4:0]}; // S-Type
	2: ImmExt = {{20{imm[24]}},imm[0],imm[23:18],imm[4:1],1'b0}; // B-Type
	3: ImmExt = {{12{imm[24]}},imm[12:5],imm[13],imm[23:14],1'b0}; // J-Type
	default: ImmExt=0;
	endcase
end

endmodule