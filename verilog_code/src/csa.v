`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:51:01
// Design Name: 
// Module Name: csa
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


module csa #(parameter Num=25)(pp0,pp1,pp2,sum,carry);	//3-2 carry save adder
	input [Num-1:0] pp0;
	input [Num-1:0] pp1;
	input [Num-1:0] pp2;
	output [Num-1:0] sum;
	output [Num-1:0] carry;

	genvar i;
	wire [Num-1:0] temp0;
	wire [Num-1:0] temp1;
	wire [Num-1:0] temp2;
	wire [Num-1:0] temp3;
	wire [Num-1:0] temp4;

	assign temp0 = pp0;
	assign temp1 = pp1;
	assign temp2 = pp2;

	generate for(i=0;i<Num;i=i+1)		
	begin:fa
		FA FA(.a(temp0[i]),
				.b(temp1[i]),
				.c_in(temp2[i]),
				.c_out(temp3[i]),
				.sum(temp4[i]));
	end
	endgenerate
	
	assign sum = temp4;
	assign carry = temp3;
	
endmodule