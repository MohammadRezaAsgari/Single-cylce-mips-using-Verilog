`timescale 1ns / 1ps

module Mux2to1_3bit(a,b,sel,out);
input[2:0] a,b;
input sel;
output reg[2:0] out;

always @(sel or a or b) begin
    case(sel)
    0:   out=a;
    1:   out=b;
    endcase
end
endmodule
