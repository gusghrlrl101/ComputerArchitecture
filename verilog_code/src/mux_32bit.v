`timescale 1ns / 1ps

module mux_32bit (Sel, a, b, y);

input [31:0] a, b;
input Sel;
output [31:0] y;

assign y = Sel ? b : a;


endmodule