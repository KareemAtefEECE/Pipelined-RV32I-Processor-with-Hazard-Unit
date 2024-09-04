
// ALU Decoder

module alu_decoder(ALUOp,funct,ALUControl);

input[1:0] ALUOp;
input[4:0] funct; //{funct7,op5,funct3}
output reg[3:0] ALUControl;

//ALU signals
/*
0000->add , 0001->sub , 0010->and , 0011->or , 0100->SLL , 0101->SLT , 0110->SRL , 0111->SRA , 1000->XOR , 1001->SLTU
*/

always @(*) begin
	case(ALUOp)
	0: ALUControl = 4'b0000; // lw,sw -> add signal(000)
	1: ALUControl = 4'b0001; // beq -> sub signal(001)
	2: begin
		case(funct[2:0]) 
		0:ALUControl=(funct[4]&funct[3])?4'b0001:4'b0000; //add or sub
		1:ALUControl=4'b0100;
		2:ALUControl=4'b0101;
		3:ALUControl=4'b1001;
		4:ALUControl=4'b1000;
		5:ALUControl=funct[4]?4'b0111:4'b0110;
		6:ALUControl=4'b0011;
		7:ALUControl=4'b0010;
		default:ALUControl=0;
		endcase
	end
	default:ALUControl=0;
	endcase
end

endmodule