`timescale 1ns / 1ps

module Register_Bank(clk, RegWrite, ReadReg1, ReadReg2, WriteReg, Write_data, Read_data1, Read_data2);
	input clk;
	input RegWrite;
	input[2:0] ReadReg1;
	input[2:0] ReadReg2;
	input[2:0] WriteReg;
	input[7:0] Write_data;
	output[7:0] Read_data1;
	output[7:0] Read_data2;

	reg[7:0] Registers[7:0];
	
	assign Read_data1=Registers[ReadReg1];
	assign Read_data2=Registers[ReadReg2];
	
	always@(posedge clk)begin
		if(RegWrite==1)
			Registers[WriteReg] = Write_data;
	end
	
endmodule
