`timescale 1ns / 1ps


module tb;

	// Inputs
	reg [1:0] a;
	reg [1:0] b;

	// Outputs
	wire [1:0] res;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	ttm uut (
		.a(a), 
		.b(b), 
		.res(res), 
		.carry(carry)
	);

	initial begin
		a = 0;
		b = 0;
		#50;
		
      a = 1;
		b = 1;
		#50;
		
		a = 2;
		b = 3;
		#50;

	end
      
endmodule

