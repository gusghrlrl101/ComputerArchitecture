`timescale 1ns / 1ps


module Adder(A,B,cin,sum,c_out); //CSA(Carry Select Adder)
parameter N=4;
input [N-1:0] A,B;
input cin;
output [N-1:0]sum;
output c_out;

wire [N-1:0]p,g;
wire [N:0]c;
wire [N-1:0]carry0,carry1;
wire [N-1:0]sum0,sum1;

assign c[0] = cin;
genvar i;
generate for(i=0;i<N;i=i+1) begin:csa
	assign p[i] = A[i]^B[i]; //compute propagation 
	assign g[i] = A[i]&B[i]; //compute generate 
   
	assign carry0[i] = (p[i]&1'b0)|g[i];
	assign carry1[i] = (p[i]&1'b1)|g[i];
	
	assign sum0[i] = p[i]^1'b0;
	assign sum1[i] = p[i]^1'b1;
	
	mux_32bit mux0(.Sel(c[i]), .a(carry0[i]),.b(carry1[i]), .y(c[i+1]));
	mux_32bit mux1(.Sel(c[i]), .a(sum0[i]),.b(sum1[i]), .y(sum[i]));

end	
endgenerate

  assign c_out = c[N];
 
endmodule

