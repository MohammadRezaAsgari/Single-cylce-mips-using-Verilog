`timescale 1ns / 1ps

module ttm(input[1:0] a,input[1:0] b,output reg[1:0] res,output reg carry);
always@(a,b)
	{carry, res} = a + b;
endmodule
