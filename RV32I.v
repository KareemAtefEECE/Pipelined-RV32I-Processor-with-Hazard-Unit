

module RV32I(clk,rst);

input clk,rst;

wire[31:0] pc_current,pc_nxt,ImmExtD,ImmExtE,ALUResultE,ALUResultM,ALUResultW,PCTargetE,WriteDataM,ReadDataM,ReadDataW;
wire[31:0] PCPlus4F,InstF,InstD,PCD,PCPlus4D,RD1D,RD2D,RD1E,RD2E,PCE,PCPlus4E,PCPlus4M,PCPlus4W,SrcBE1,SrcBE2,SrcAE,ResultW;


wire ZeroE,PCSrcE,BranchCond,FlushE,FlushD,StallD,StallF;

wire RegWriteD,MemWriteD,JumpD,BranchD,ALUSrcD;
wire RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE;
wire RegWriteM,MemWriteM;
wire RegWriteW;

wire[4:0] RdE,RdM,RdW,Rs1E,Rs2E;

wire[1:0] ResultSrcD,ImmSrcD,MemStrobeD,ResultSrcE,ResultSrcM,ResultSrcW,ImmSrcE,MemStrobeE,MemStrobeM,ForwardAE,ForwardBE;

wire[3:0] ALUControlD,ALUControlE;



/////////////////Hazard Unit/////////////////

hazard_unit HU(
	Rs1E,Rs2E,InstD[19:15],InstD[24:20],
	RdE,RdM,RdW,RegWriteM,RegWriteW,ResultSrcE[0],
	PCSrcE,FlushE,FlushD,StallD,StallF,ForwardAE,ForwardBE);

/////////////////START OF FETCH STAGE/////////////////

pc PC(pc_current,pc_nxt,clk,rst,StallF);

instruction_memory Inst_Mem(pc_nxt,InstF);

IF_DEC_Reg FD_Reg(InstF,InstD,pc_nxt,PCD,PCPlus4F,PCPlus4D,clk,rst,StallD,FlushD);

addr PCPlus4(pc_nxt,4,PCPlus4F);

/////////////////END OF FETCH STAGE/////////////////


/////////////////START OF DECODE STAGE/////////////////

control_unit CU(
	InstD[6:0],{InstD[30],InstD[5],InstD[14:12]},
	RegWriteD,ResultSrcD,MemWriteD,JumpD,BranchD,ALUControlD,ALUSrcD,ImmSrcD,MemStrobeD
	);

register_file RF(clk,InstD[19:15],InstD[24:20],RdW,ResultW,RD1D,RD2D,rst,RegWriteW);

imm_extend ImmExt(InstD[31:7],ImmSrcD,ImmExtD);

DEC_EX_Reg DE_Reg(
	 clk,rst,RegWriteD,MemWriteD,JumpD,BranchD,ALUSrcD,FlushE,
     ResultSrcD,ImmSrcD,MemStrobeD,
     ALUControlD,
     RD1D,RD2D,PCD,ImmExtD,PCPlus4D,
     InstD[11:7],InstD[19:15],InstD[24:20],
     RegWriteE,MemWriteE,JumpE,BranchE,ALUSrcE,
     ResultSrcE,ImmSrcE,MemStrobeE,
     ALUControlE,
     RD1E,RD2E,PCE,ImmExtE,PCPlus4E,
	 RdE,Rs1E,Rs2E
	);

/////////////////END OF DECODE STAGE/////////////////


/////////////////START OF EXECUTE STAGE/////////////////

assign SrcBE1 = (ForwardBE==2)?ALUResultM:(ForwardBE==1)?ResultW:RD2E;

assign SrcBE2 = ALUSrcE?ImmExtE:SrcBE1;

assign SrcAE = (ForwardAE==2)?ALUResultM:(ForwardAE==1)?ResultW:RD1E;

alu ALU(SrcAE,SrcBE2,ALUResultE,ZeroE,ALUControlE);

addr JMPADDER(PCE,ImmExtE,PCTargetE);

and(BranchCond,ZeroE,BranchE);
or(PCSrcE,JumpE,BranchCond);

assign pc_current = PCSrcE?PCTargetE:PCPlus4F;

EX_MEM_Reg EM_Reg(
	 clk,rst,RegWriteE,MemWriteE,
	 ResultSrcE,MemStrobeE,
	 ALUResultE,SrcBE1,RdE,PCPlus4E,
     RegWriteM,MemWriteM,
	 ResultSrcM,MemStrobeM,
	 ALUResultM,WriteDataM,PCPlus4M,
	 RdM
	);

/////////////////END OF EXECUTE STAGE/////////////////


/////////////////START OF WRITE BACK STAGE/////////////////

data_memory DAT_MEM(ALUResultM,MemStrobeM,WriteDataM,clk,rst,MemWriteM,ReadDataM);

MEM_WB_Reg MW_Reg(
	clk,rst,RegWriteM,
	ResultSrcM,
	RdM,
	ALUResultM,ReadDataM,PCPlus4M,
	RegWriteW,
	ResultSrcW,
	RdW,
	ALUResultW,ReadDataW,PCPlus4W
	);

assign ResultW = (ResultSrcW==0)?ALUResultW:(ResultSrcW==1)?ReadDataW:(ResultSrcW==2)?PCPlus4W:0;

/////////////////END OF WRITE BACK STAGE/////////////////

endmodule