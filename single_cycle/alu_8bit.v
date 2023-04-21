`timescale 1ns / 1ps

module alu_8bit(a, b, func, zf, of, cf, sf, res);
input[7:0] a,b;
input[3:0] func;
output reg zf,of,cf,sf;
output reg[7:0] res;



always @(func or a or b) begin
    case(func)
	 //no_op
    0:res=0;	
	 
	 //add
    1:begin   
		{cf,res} = a + b;
		sf= res[7];
		zf=(res==0)? 1 : 0; 
		of=(res[7]!=(a[7]==b[7]))? 1 : 0;
	 end
	 
	 //and
	 2:begin   
		res = a & b;
		sf= res[7];
		zf=(res==0)? 1 : 0; 
		of = 0;
		cf = 0;
	 end
	 
	 //sub - comp
    3:begin   
		{cf,res} = a - b;
		sf= res[7];
		zf=(res==0)? 1 : 0; 
		of=(res[7]!=(a[7]==b[7]))? 1 : 0;
	 end
	 
	 //or
    4:begin   
		res = a | b;
		sf= res[7];
		zf=(res==0)? 1 : 0; 
		of = 0;
		cf = 0;
	 end
	 
	 //xor
    5:begin   
		res = a ^ b;
		sf= res[7];
		zf=(res==0)? 1 : 0; 
		of = 0;
		cf = 0;
	 end
	 
	 //move - li
    6: res=b;
	 
	 //dec
    7:begin   
		{cf,res} = a - 1;
		sf= res[7];
		zf=(res==0)? 1 : 0; 
		of=(res[7]!=(a[7]==b[7]))? 1 : 0;
	 end
	 
	 //not
	 8: res=~a;
	 
	 //sar
	 9:begin   
		{res[6:0], cf} = a >> b;
		res[7] = a[7];
		of=0;
		sf = res[7];
		zf=(res==0)? 1 : 0; 
	 end
	 
	 //slr
	 10:begin   
		{res, cf} = a >> b;
		of = (res[7] != a[7])? 1 : 0;
		sf = res[7];
		zf=(res==0)? 1 : 0; 
	 end
	 
	 //sal
	 11:begin   
		{cf, res} = a << b;
		of = (res[7] != a[7])? 1 : 0;
		sf = res[7];
		zf=(res==0)? 1 : 0; 
	 end
	 
	 //sll
	 12:begin   
		{cf, res} = a << b;
		of = (res[7] != a[7])? 1 : 0;
		sf = res[7];
		zf=(res==0)? 1 : 0; 
	 end
	 
	 //rol
	 13:begin   
		res= {a, a} >> b[2:0];
		of = (res[7] != a[7])? 1 : 0;
		cf = res[7];
		sf = res[7];
		zf =(res==0)? 1 : 0; 
	 end
	 
	 //ror
	 14:begin   
		res= {a, a} << b[2:0];
		of = (res[7] != a[7])? 1 : 0;
		cf = res[7];
		sf = res[7];
		zf =(res==0)? 1 : 0; 
	 end
	 
	 //inc
	 15:begin   
		{cf,res} = a + 1;
		sf= res[7];
		zf=(res==0)? 1 : 0; 
		of=(res[7]!=(a[7]==b[7]))? 1 : 0;
	 end
endcase
end

endmodule
