`timescale 1ns / 1ps

///////////////////////////////////////////////////////////////////////////////

module tb_pc;

	// Inputs
	reg clk;
	reg [7:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	Program_counter uut (
		.clk(clk), 
		.in(in), 
		.out(out)
	);
  initial 
  begin
    clk = 1'b1;
    forever #10 clk = ~clk;
  end
	initial begin

	

	end
      
endmodule

