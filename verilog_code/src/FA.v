`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:51:51
// Design Name: 
// Module Name: FA
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


module FA( a,b,c_in,c_out,sum);   //full adder
   input a;
   input b;
   input c_in;
   output c_out;
   output sum;
   assign {c_out,sum} = a + b + c_in;
endmodule
