`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:48:29
// Design Name: 
// Module Name: ppg_D_FF
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


module ppg_D_FF(pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15,
                  d_pp0,d_pp1,d_pp2,d_pp3,d_pp4,d_pp5,d_pp6,d_pp7,d_pp8,d_pp9,d_pp10,d_pp11,d_pp12,d_pp13,d_pp14,d_pp15);

input [32:0] pp0,pp1,pp2,pp3,pp4,pp5,pp6,pp7,pp8,pp9,pp10,pp11,pp12,pp13,pp14,pp15;
output reg [32:0] d_pp0,d_pp1,d_pp2,d_pp3,d_pp4,d_pp5,d_pp6,d_pp7,d_pp8,d_pp9,d_pp10,d_pp11,d_pp12,d_pp13,d_pp14,d_pp15;

always@ (*)
begin
 
      d_pp0 <= pp0;
      d_pp1 <= pp1;
      d_pp2 <= pp2;
      d_pp3 <= pp3;
      d_pp4 <= pp4;
      d_pp5 <= pp5;
      d_pp6 <= pp6;
      d_pp7 <= pp7;
      d_pp8 <= pp8;
      d_pp9 <= pp9;
      d_pp10 <= pp10;
      d_pp11 <= pp11;
      
      d_pp12 <= pp12;
      d_pp13 <= pp13;
      d_pp14 <= pp14;
      d_pp15 <= pp15;
end

endmodule
