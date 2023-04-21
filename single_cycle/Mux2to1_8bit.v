`timescale 1ns / 1ps

module Mux2to1_8bit(a,b,sel,out);
input[7:0] a,b;
input sel;
output reg[7:0] out;

always @(sel or a or b) begin
    case(sel)
    0:   out=a;
    1:   out=b;
    endcase
end

endmodule
