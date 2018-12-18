`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:37:19
// Design Name: 
// Module Name: ppg
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


module ppg(ppg_in1,ppg_in2,
ppg_out0,ppg_out1,ppg_out2,ppg_out3,ppg_out4,ppg_out5
,ppg_out6,ppg_out7,ppg_out8,ppg_out9,ppg_out10,ppg_out11,ppg_out12,ppg_out13,ppg_out14,ppg_out15);	//partial product generator
	input [31:0] ppg_in1;
	input [31:0] ppg_in2;

	output [32:0] ppg_out0;
	output [32:0] ppg_out1;
	output [32:0] ppg_out2;
	output [32:0] ppg_out3;
	output [32:0] ppg_out4;
	output [32:0] ppg_out5;
	output [32:0] ppg_out6;
	output [32:0] ppg_out7;
	output [32:0] ppg_out8;
	output [32:0] ppg_out9;
	output [32:0] ppg_out10;
	output [32:0] ppg_out11;
	output [32:0] ppg_out12;
	output [32:0] ppg_out13;
	output [32:0] ppg_out14;
	output [32:0] ppg_out15;
	
	
	
	wire [32:0] w_ppg_out0;
	wire [32:0] w_ppg_out1;
	wire [32:0] w_ppg_out2;
	wire [32:0] w_ppg_out3;
	wire [32:0] w_ppg_out4;
	wire [32:0] w_ppg_out5;
	wire [32:0] w_ppg_out6;
	wire [32:0] w_ppg_out7;
	wire [32:0] w_ppg_out8;
	wire [32:0] w_ppg_out9;
	wire [32:0] w_ppg_out10;
	wire [32:0] w_ppg_out11;
	wire [32:0] w_ppg_out12;
	wire [32:0] w_ppg_out13;
	wire [32:0] w_ppg_out14;
	wire [32:0] w_ppg_out15;
	
	
	wire [32:0] w_ppg_in2;
	assign w_ppg_in2={ppg_in2,1'b0};		//radix-4 boot recoding
	
	encoder ppg1(.encoder_in(ppg_in1),.sel(w_ppg_in2[2:0]),.encoder_out(w_ppg_out0));	//generate ppg for each block
	encoder ppg2(.encoder_in(ppg_in1),.sel(w_ppg_in2[4:2]),.encoder_out(w_ppg_out1));
	encoder ppg3(.encoder_in(ppg_in1),.sel(w_ppg_in2[6:4]),.encoder_out(w_ppg_out2));
	encoder ppg4(.encoder_in(ppg_in1),.sel(w_ppg_in2[8:6]),.encoder_out(w_ppg_out3));
	encoder ppg5(.encoder_in(ppg_in1),.sel(w_ppg_in2[10:8]),.encoder_out(w_ppg_out4));
	encoder ppg6(.encoder_in(ppg_in1),.sel(w_ppg_in2[12:10]),.encoder_out(w_ppg_out5));
	encoder ppg7(.encoder_in(ppg_in1),.sel(w_ppg_in2[14:12]),.encoder_out(w_ppg_out6));
	encoder ppg8(.encoder_in(ppg_in1),.sel(w_ppg_in2[16:14]),.encoder_out(w_ppg_out7));
	encoder ppg9(.encoder_in(ppg_in1),.sel(w_ppg_in2[18:16]),.encoder_out(w_ppg_out8));
	encoder ppg10(.encoder_in(ppg_in1),.sel(w_ppg_in2[20:18]),.encoder_out(w_ppg_out9));
	encoder ppg11(.encoder_in(ppg_in1),.sel(w_ppg_in2[22:20]),.encoder_out(w_ppg_out10));
	encoder ppg12(.encoder_in(ppg_in1),.sel(w_ppg_in2[24:22]),.encoder_out(w_ppg_out11));

	encoder ppg13(.encoder_in(ppg_in1),.sel(w_ppg_in2[26:24]),.encoder_out(w_ppg_out12));
	encoder ppg14(.encoder_in(ppg_in1),.sel(w_ppg_in2[28:26]),.encoder_out(w_ppg_out13));
	encoder ppg15(.encoder_in(ppg_in1),.sel(w_ppg_in2[30:28]),.encoder_out(w_ppg_out14));
	encoder ppg16(.encoder_in(ppg_in1),.sel(w_ppg_in2[32:30]),.encoder_out(w_ppg_out15));

	assign ppg_out0=w_ppg_out0;
	assign ppg_out1=w_ppg_out1;
	assign ppg_out2=w_ppg_out2;
	assign ppg_out3=w_ppg_out3;
	assign ppg_out4=w_ppg_out4;
	assign ppg_out5=w_ppg_out5;
	assign ppg_out6=w_ppg_out6;
	assign ppg_out7=w_ppg_out7;
	assign ppg_out8=w_ppg_out8;
	assign ppg_out9=w_ppg_out9;
	assign ppg_out10=w_ppg_out10;
	assign ppg_out11=w_ppg_out11;
   assign ppg_out12=w_ppg_out12;
	assign ppg_out13=w_ppg_out13;
	assign ppg_out14=w_ppg_out14;
	assign ppg_out15=w_ppg_out15;
	
endmodule

