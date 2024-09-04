
// Adder

module addr(in_a,in_b,out);

input[31:0] in_a,in_b;
output[31:0] out;

assign out = in_a+in_b;

endmodule