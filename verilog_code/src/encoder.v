`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:46:08
// Design Name: 
// Module Name: encoder
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


module encoder(encoder_in,sel,encoder_out);		//booth encoder
	input [31:0] encoder_in;
	input [2:0] sel;
	output reg [32:0] encoder_out;
	
	always@ (*)
	begin
		case(sel)
			3'b000: encoder_out<=32'd0;	//0
			3'b001: encoder_out<={encoder_in[31],encoder_in};	//x
			3'b010: encoder_out<={encoder_in[31],encoder_in};	//x
			3'b011: encoder_out<={encoder_in,1'b0};				//2x
			3'b100: encoder_out<=~{encoder_in,1'b0}+1'b1;		//-2x
			3'b101: encoder_out<=~{encoder_in[31],encoder_in}+1'b1;		//-x
			3'b110: encoder_out<=~{encoder_in[31],encoder_in}+1'b1;		//-x
			3'b111: encoder_out<=32'd0;		//0
		endcase
	end
endmodule
