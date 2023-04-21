`timescale 1ns / 1ps

module Program_counter(clk, in, out);
input clk;
input [7:0] in;
output reg[7:0] out;

	integer i;
	initial i=0;
	
	reg[7:0] pc;
	always@(posedge clk)begin
		if(i==0)begin
			out = 0;
			i = 1;
			end
		else begin
			pc = in;
			out = pc;
			end
end
endmodule
