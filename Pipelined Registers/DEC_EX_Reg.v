
module DEC_EX_Reg(
	input clk,rst,RegWriteD,MemWriteD,JumpD,BranchD,ALUSrcD,FlushE,
    input[1:0] ResultSrcD,ImmSrcD,MemStrobeD,
    input[3:0] ALUControlD,
    input[31:0] RD1D,RD2D,PCD,ImmExtD,PCPlus4D,
    input[4:0] RdD,Rs1D,Rs2D,

    output reg RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE,
    output reg[1:0] ResultSrcE,ImmSrcE,MemStrobeE,
    output reg[3:0] ALUControlE,
    output reg[31:0] RD1E,RD2E,PCE,ImmExtE,PCPlus4E,
	output reg[4:0] RdE,Rs1E,Rs2E
	);

always @(posedge clk or posedge rst) begin
	if (rst || FlushE) begin
		RegWriteE<=0;
		MemWriteE<=0;
		JumpE<=0;
		BranchE<=0;
		ALUSrcE<=0;
		ResultSrcE<=0;
		ImmSrcE<=0;
		MemStrobeE<=0;
		ALUControlE<=0;
		RD1E<=0;
		RD2E<=0;
		PCE<=0;
		ImmExtE<=0;
		PCPlus4E<=0;
		RdE<=0;
		Rs1E<=0;
		Rs2E<=0;
	end
	else begin
		RegWriteE<=RegWriteD;
		MemWriteE<=MemWriteD;
		JumpE<=JumpD;
		BranchE<=BranchD;
		ALUSrcE<=ALUSrcD;
		ResultSrcE<=ResultSrcD;
		ImmSrcE<=ImmSrcD;
		MemStrobeE<=MemStrobeD;
		ALUControlE<=ALUControlD;
		RD1E<=RD1D;
		RD2E<=RD2D;
		PCE<=PCD;
		ImmExtE<=ImmExtD;
		PCPlus4E<=PCPlus4D;
		RdE<=RdD;
		Rs1E<=Rs1D;
		Rs2E<=Rs2D;
	end
end

endmodule