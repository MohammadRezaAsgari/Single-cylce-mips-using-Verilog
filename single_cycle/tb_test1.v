`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:14 06/07/2022
// Design Name:   Data_Mem
// Module Name:   C:/Users/Roham/Desktop/proj07/single_cycle/tb_test1.v
// Project Name:  single_cycle
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Data_Mem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_test1;

	// Inputs
	reg MemRead;
	reg MemWrite;
	reg [7:0] Address;
	reg [7:0] Write_data;

	// Outputs
	wire [7:0] Read_data;

	// Instantiate the Unit Under Test (UUT)
	Data_Mem uut (
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Address(Address), 
		.Write_data(Write_data), 
		.Read_data(Read_data)
	);

	initial begin
		// Initialize Inputs
		MemRead = 0;
		MemWrite = 0;
		Address = 0;
		Write_data = 0;
		#100;
        
		  
		MemRead = 0;
		MemWrite = 1;
		Address = 255;
		Write_data = 156;
		#100;
		// Add stimulus here

	end
      
endmodule

