`timescale 1ns / 1ps


module test_bench;
	reg clk;

	CPU uut (
		.clk(clk)
	);

	initial begin
		clk = 0; 
		forever #20 clk=~clk;
	end
      
endmodule

