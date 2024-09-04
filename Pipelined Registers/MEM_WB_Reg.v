
module MEM_WB_Reg(
	input clk,rst,RegWriteM,
	input[1:0] ResultSrcM,
	input[4:0] RdM,
	input[31:0] ALUResultM,ReadDataM,PCPlus4M,

	output reg RegWriteW,
	output reg[1:0] ResultSrcW,
	output reg[4:0] RdW,
	output reg[31:0] ALUResultW,ReadDataW,PCPlus4W
	);

always @(posedge clk or posedge rst) begin
	if (rst) begin
		RegWriteW<=0;
		ResultSrcW<=0;
		RdW<=0;
		ALUResultW<=0;
		ReadDataW<=0;
		PCPlus4W<=0;
	end
	else begin
		RegWriteW<=RegWriteM;
		ResultSrcW<=ResultSrcM;
		RdW<=RdM;
		ALUResultW<=ALUResultM;
		ReadDataW<=ReadDataM;
		PCPlus4W<=PCPlus4M;
	end
end

endmodule