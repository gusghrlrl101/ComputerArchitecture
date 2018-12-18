`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/05 22:10:56
// Design Name: 
// Module Name: mux_16bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mux_8bit(Sel, a, b, y);
input [7:0]a,b;
input Sel;
output [7:0]y;

assign y = Sel ? b : a;

endmodule