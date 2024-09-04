
// Register File

// word_width = 32 bits
// reg_file_depth = 32 words

module register_file(clk,A1,A2,A3,WD3,RD1,RD2,rst,WE);

input clk,rst,WE;
input[4:0] A1,A2,A3;
input[31:0] WD3;
output[31:0] RD1,RD2;

reg[31:0] reg_file[0:31];

integer i;

always @(negedge clk or posedge rst) begin
	if (rst) begin
		reg_file[0]<=0;
	end
	else if (WE) reg_file[A3]<=WD3;
end

assign RD1 = reg_file[A1];
assign RD2 = reg_file[A2];

endmodule