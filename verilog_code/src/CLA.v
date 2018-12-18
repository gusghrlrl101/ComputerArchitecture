`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:52:39
// Design Name: 
// Module Name: CLA
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


module CLA(input1,input2,result);		//call CLA generate module
	parameter N=50;
	input [N-1:0] input1,input2;
	output [N:0] result;
	wire [N-1:0] CLA_sum; 
	wire CLA_cout;
	wire CLA_cin;
	assign CLA_cin=1'b0;
	CLA_generate #(N) CLA_generate1(.x(input1),.y(input2),.cin(CLA_cin),.sum(CLA_sum),.cout(CLA_cout));
	assign result = {CLA_cout,CLA_sum};

endmodule
