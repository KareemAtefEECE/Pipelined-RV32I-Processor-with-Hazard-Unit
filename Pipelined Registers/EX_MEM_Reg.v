
module EX_MEM_Reg(
	input clk,rst,RegWriteE,MemWriteE,
	input[1:0] ResultSrcE,MemStrobeE,
	input[31:0] ALUResultE,WriteDataE,
	input[4:0] RdE,
	input[31:0] PCPlus4E,

	output reg RegWriteM,MemWriteM,
	output reg[1:0] ResultSrcM,MemStrobeM,
	output reg[31:0] ALUResultM,WriteDataM,PCPlus4M,
	output reg[4:0] RdM
	);


always @(posedge clk or posedge rst) begin
	if (rst) begin
		RegWriteM<=0;
		MemWriteM<=0;
		ResultSrcM<=0;
		MemStrobeM<=0;
		ALUResultM<=0;
		WriteDataM<=0;
		RdM<=0;
		PCPlus4M<=0;
	end
	else begin
		RegWriteM<=RegWriteE;
		MemWriteM<=MemWriteE;
		ResultSrcM<=ResultSrcE;
		MemStrobeM<=MemStrobeE;
		ALUResultM<=ALUResultE;
		WriteDataM<=WriteDataE;
		RdM<=RdE;
		PCPlus4M<=PCPlus4E;
	end
end

endmodule