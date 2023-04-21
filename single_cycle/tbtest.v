`timescale 1ns / 1ps



module tbtest;

	// Inputs
	reg [7:0] Address;

	// Outputs
	wire [15:0] Read_data;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Memory uut (
		.Address(Address), 
		.Read_data(Read_data)
	);

	initial begin
		// Initialize Inputs
		Address = 1;
		#50;
      Address = 2;
		#50;
		// Add stimulus here

	end
      
endmodule

