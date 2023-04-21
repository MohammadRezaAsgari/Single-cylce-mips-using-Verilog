`timescale 1ns / 1ps

module Mux7to1_1bit(a,b,c,d,e,sel,out);
input a,b,c,d,e;
input[2:0] sel;
output reg out;

always @(sel or a or b or c or d or e) begin
    case(sel)
    0:   out=a;
    1:   out=b;
	 2:   out=c;
    3:   out=d;
	 4:   out=e;
    5:   out=1;
	 6:   out=0;
    endcase
end
endmodule
