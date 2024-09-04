

// RV32I Testbench

module RV32I_tb();

reg clk,rst;
wire halt;

RV32I DUT(clk,rst,halt);

initial begin
	clk=0;
	forever
	#5 clk=~clk;
end

initial $readmemh("inst_memory.mem",DUT.Inst_Mem.inst_mem);
initial $readmemh("data_memory.mem",DUT.DAT_MEM.data_mem);
initial $readmemh("reg_file_memory.mem",DUT.RF.reg_file);


initial begin
	rst=1;
	#10
	rst=0;
	#400
	$writememh("final_data_memory.mem",DUT.DAT_MEM.data_mem);
	$writememh("final_reg_file_memory.mem",DUT.RF.reg_file);
	#400
	$stop;
end

endmodule