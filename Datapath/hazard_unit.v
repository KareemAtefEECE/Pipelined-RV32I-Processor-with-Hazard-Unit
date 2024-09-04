
// Hazard Unit

module hazard_unit(Rs1E,Rs2E,Rs1D,Rs2D,RdE,RdM,RdW,RegWriteM,RegWriteW,ResultSrc0,PCSrcE,FlushE,FlushD,StallD,StallF,ForwardAE,ForwardBE);

input[4:0] Rs1E,Rs2E,Rs1D,Rs2D,RdE,RdM,RdW;
input RegWriteM,RegWriteW,ResultSrc0,PCSrcE;
output reg[1:0] ForwardAE,ForwardBE;
output reg FlushE,FlushD,StallD,StallF;
reg lwStall;

always @(*) begin
	//Data Forwarding From Memory Stage
	if((Rs1E==RdM) && RegWriteM && (Rs1E!=0)) ForwardAE=2'b10;

	//Data Forwarding From WB Stage
	else if((Rs1E==RdW) && RegWriteW && (Rs1E!=0)) ForwardAE=2'b01;

	else ForwardAE=2'b00;

	//Data Forwarding From Memory Stage
	if((Rs2E==RdM) && RegWriteM && (Rs2E!=0)) ForwardBE=2'b10;

	//Data Forwarding From WB Stage
	else if((Rs2E==RdW) && RegWriteW && (Rs2E!=0)) ForwardBE=2'b01;

	else ForwardBE=2'b00;

    // Stalling in lw instruction
	lwStall = ((Rs1D==RdE)||(Rs2D==RdE)) && ResultSrc0;
    {FlushE,FlushD,StallD,StallF} = {lwStall|PCSrcE,PCSrcE,lwStall,lwStall};
end

endmodule