`timescale 1ns / 1ps

module Instruction_Memory(Address, Read_data);
	input[7:0] Address;
	output[15:0] Read_data;
	reg[15:0] Mem[255:0];
	
	assign Read_data = Mem[Address];
	initial Mem[0]=16'b1100000000000000;	//li $r0,0 
	initial Mem[1]=16'b1100000100000100;	//li $r1,4  
	initial Mem[2]=16'b1100001100001010;	//li $r3,10
	initial Mem[3]=16'b1000000000001000;	//je end_Loop
	initial Mem[4]=16'b0000000001011011;	//add $r3,$r3 
	initial Mem[5]=16'b0000001111000000;	//inc $r0  
	initial Mem[6]=16'b0000010100001000;	//comp $r1,$r0 
	initial Mem[7]=16'b1010100000000011;	//jump loop
	initial Mem[8]=16'b1101001111001000;	//sm $r3,200


endmodule



