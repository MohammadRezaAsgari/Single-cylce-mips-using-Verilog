`timescale 1ns / 1ps

module Control(op, AluSrc, MemToReg, RegWrite, MemRead, MemWrite, Jump, LS, Aluop);
	input[9:0] op;
	output reg AluSrc;
	output reg MemToReg;
	output reg RegWrite;
	output reg MemRead;
	output reg MemWrite;
	output reg [2:0] Jump;
	output reg LS;
	output reg [3:0] Aluop;
	
always@(op)begin
	if(op[9]==0)begin
		AluSrc =(op[3]==1)? 1 : 0;
		MemToReg = 0;
		RegWrite =(op==0)? 0 :
					(op[4:2]==3'b101)? 0:1;
		MemRead = 0;
		MemWrite	= 0;	
		Jump = 6;
		LS = 0;
		if(op[4]==0)
			Aluop=op[3:0];
		else if(op[4]==1)
			Aluop=(op[3:0]==0)? 7:3;				
	end
	else if(op[9]==1)begin
		AluSrc = 0;
		MemToReg =(op[8:5]==4'b1001)? 1:0;
		RegWrite =(op[8:5]==4'b1001)? 1 :
					(op[8:5]==4'b1000)? 1:0;
		MemRead =(op[8:5]==4'b1001)? 1:0;
		MemWrite	=(op[8:5]==4'b1010)? 1:0;	
		Jump = (op[8]==1)? 6: op[8:5];
		LS =(op[8]==1)? 1:0;
		Aluop =(op[8:5]==4'b1000)? 6:0;	
	end
end
endmodule
