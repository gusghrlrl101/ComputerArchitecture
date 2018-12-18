`timescale 1ns / 1ps

module mux_32bit_3(Sel, a, b, c, y);

input [1:0] Sel;
input [31:0] a, b, c;
output [31:0] y;
	
assign y = (Sel[1] ? c : (Sel[0] ? b : a) );


endmodule