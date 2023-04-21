`timescale 1ns / 1ps

module Data_Mem(MemRead, MemWrite, Address, Write_data, Read_data);
	input MemRead;
	input MemWrite;
	input[7:0] Address;
	input[7:0] Write_data;
	output reg[7:0] Read_data;

	reg[7:0] Mem[255:0];

	always@(MemRead or MemWrite or Address or Write_data) begin
		if(MemWrite==1)
			Mem[Address]=Write_data;
		else if(MemRead==1)
			Read_data = Mem[Address];
	end
	
endmodule
