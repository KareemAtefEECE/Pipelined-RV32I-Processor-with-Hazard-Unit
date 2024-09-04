

module IF_DEC_Reg(InstrF,InstrD,PCF,PCD,PCPlus4F,PCPlus4D,clk,rst,StallD,FlushD);

input[31:0] InstrF,PCF,PCPlus4F;
input clk,rst,StallD,FlushD;
output reg[31:0] InstrD,PCD,PCPlus4D;

always @(posedge clk or posedge rst) begin
	if (rst || FlushD) begin
        InstrD<=0;
        PCD<=0;
        PCPlus4D<=0;
	end
	else if(StallD==0) begin
		InstrD<=InstrF;
		PCD<=PCF;
		PCPlus4D<=PCPlus4F;
	end
end

endmodule