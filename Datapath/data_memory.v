
// Data Memory

//word_width = 32 bits
//mem_depth = 512 words = 2^9

module data_memory(data_addr,MemStrobeM,w_data,clk,rst,w_en,r_data);

input[31:0] data_addr,w_data;
input[1:0] MemStrobeM;
input clk,rst,w_en;
output[31:0] r_data;

reg[31:0] data_mem[0:511];

integer i;

always @(negedge clk or posedge rst) begin
	if (rst) begin
         data_mem[0]<=0;	
	end
	else if(w_en) begin
	case(MemStrobeM)
	    1: data_mem[data_addr[8:0]][7:0]<=w_data[7:0];
	    2: data_mem[data_addr[8:0]][15:0]<=w_data[15:0];
        default: data_mem[data_addr[8:0]]<=w_data;
        endcase
	end
end

assign r_data = (MemStrobeM == 2'b01) ? {{24{data_mem[data_addr[8:0]][7]}}, data_mem[data_addr[8:0]][7:0]} :
                (MemStrobeM == 2'b10) ? {{16{data_mem[data_addr[8:0]][15]}}, data_mem[data_addr[8:0]][15:0]} :
                data_mem[data_addr[8:0]];


endmodule