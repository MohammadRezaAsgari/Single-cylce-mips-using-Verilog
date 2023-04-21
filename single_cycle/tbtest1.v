`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:29:12 06/21/2022
// Design Name:   Data_Mem
// Module Name:   C:/Users/Roham/Desktop/proj07/single_cycle/tbtest1.v
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

module tbtest1;

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
		MemWrite = 1;
		Address = 255;
		Write_data = 352;

		// Wait 100 ns for global reset to finish
		#20;
		
		MemRead = 0;
		MemWrite = 1;
		Address = 254;
		Write_data = 3452;

		// Wait 100 ns for global reset to finish
		#20;
        
		// Add stimulus here

	end
      
endmodule

