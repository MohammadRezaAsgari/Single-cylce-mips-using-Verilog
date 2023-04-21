`timescale 1ns / 1ps


module tt11;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg [3:0] func;

	// Outputs
	wire zf;
	wire of;
	wire cf;
	wire sf;
	wire [7:0] res;

	// Instantiate the Unit Under Test (UUT)
	alu_8bit uut (
		.a(a), 
		.b(b), 
		.func(func), 
		.zf(zf), 
		.of(of), 
		.cf(cf), 
		.sf(sf), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		a = 5;
		b = 5;
		func = 1;
		#50;
		
		a = 5;
		b = 5;
		func = 3;
		#50;
	end
      
endmodule

