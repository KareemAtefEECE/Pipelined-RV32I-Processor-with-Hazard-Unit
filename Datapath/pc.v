
// PC

module pc(pc_current,pc_nxt,clk,rst,StallF);

input clk,rst,StallF;
input[31:0] pc_current;
output reg[31:0] pc_nxt;

always @(posedge clk or posedge rst) begin
	if (rst) pc_nxt<=0;
	else if(StallF==0) pc_nxt<=pc_current;	
end

endmodule