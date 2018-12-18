`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:54:39
// Design Name: 
// Module Name: CLA_generate
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


module CLA_generate(x,y,cin,sum,cout);		//generate CLA
	parameter N=50;
	input [N-1:0] x,y;
	input cin;
	output [N-1:0] sum;
	output cout;
	wire [N-1:0]p,g;
	wire [N:0] c;
	assign c[0] = cin;
	
	genvar i;
	generate for (i = 0; i <N; i = i + 1) begin: pq_cla
	assign p[i] = x[i] ^ y[i];
	assign g[i] = x[i] & y[i];
	end endgenerate // compute generate and propagation
	generate for (i = 1; i < N+1; i = i + 1) begin: carry_cla
	assign c[i] = g[i-1] | (p[i-1] & c[i-1]);
	end endgenerate // compute carry for each stage
	generate for (i = 0; i < N; i = i + 1) begin: sum_cla
	assign sum[i] = p[i] ^ c[i];
	end endgenerate // compute sum
	assign cout = c[N]; // assign final carry
endmodule // end of cla adder generate module
	

