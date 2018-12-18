`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/01 14:49:45
// Design Name: 
// Module Name: wallace_tree
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


module wallace_tree(wt_pp0,wt_pp1,wt_pp2,wt_pp3,wt_pp4,wt_pp5,wt_pp6,
wt_pp7,wt_pp8,wt_pp9,wt_pp10,wt_pp11,wt_pp12,wt_pp13,wt_pp14,wt_pp15,wt_sum,wt_carry);
	input [32:0] wt_pp0;
	input [32:0] wt_pp1;
	input [32:0] wt_pp2;
	input [32:0] wt_pp3;
	input [32:0] wt_pp4;
	input [32:0] wt_pp5;
	input [32:0] wt_pp6;
	input [32:0] wt_pp7;
	input [32:0] wt_pp8;
	input [32:0] wt_pp9;
	input [32:0] wt_pp10;
	input [32:0] wt_pp11;
	
	input [32:0] wt_pp12;
	input [32:0] wt_pp13;
	input [32:0] wt_pp14;
	input [32:0] wt_pp15;
		
	
	output [63:0] wt_carry;
	output [63:0] wt_sum;
	
	wire [36:0] csa1_carry;
	wire [36:0] csa1_sum;
	wire [36:0] csa1_pp0;
	wire [36:0] csa1_pp1;
	wire [36:0] csa1_pp2;
	assign csa1_pp0 = {{4{wt_pp0[32]}},wt_pp0};			//25bit->29bit로 확장(concatenation을 활용하여 sign bit 확장)
	assign csa1_pp1 = {{2{wt_pp1[32]}},wt_pp1,2'd0}; //25bit->29bit로 확장(concatenation을 활용하여 sign bit 확장)
	assign csa1_pp2 = {wt_pp2,4'd0};													//25bit->29bit로 확장
	csa #(37) csa1 (.pp0(csa1_pp0),.pp1(csa1_pp1),.pp2(csa1_pp2),.sum(csa1_sum),.carry(csa1_carry)); //CSA를 이용한 덧셈연산
	
	wire [38:0] csa2_carry;
	wire [38:0] csa2_sum;
	wire [38:0] csa2_pp0;
	wire [38:0] csa2_pp1;
	wire [38:0] csa2_pp2;
	assign csa2_pp0 = {wt_pp3,6'd0};			//25bit->31bit로 확장
	assign csa2_pp1 = {{csa1_carry[36]},csa1_carry,1'b0};//29bit->31bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa2_pp2 = {{2{csa1_sum[36]}},csa1_sum};					//29bit->31bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(39) csa2 (.pp0(csa2_pp0),.pp1(csa2_pp1),.pp2(csa2_pp2),.sum(csa2_sum),.carry(csa2_carry)); //CSA를 이용한 덧셈연산
	
	wire [40:0] csa3_carry;
	wire [40:0] csa3_sum;
	wire [40:0] csa3_pp0;
	wire [40:0] csa3_pp1;
	wire [40:0] csa3_pp2;
	assign csa3_pp0 = {wt_pp4,8'd0};	//25bit->33bit로 확장
	assign csa3_pp1 = {csa2_carry[38],csa2_carry,1'b0};//31bit->33bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa3_pp2 = {{2{csa2_sum[38]}},csa2_sum};					//31bit->33bit로 확장(mux를 활용하여 sign bit 확장)
	csa #(41) csa3 (.pp0(csa3_pp0),.pp1(csa3_pp1),.pp2(csa3_pp2),.sum(csa3_sum),.carry(csa3_carry)); //CSA를 이용한 덧셈연산

	wire [42:0] csa4_carry;
	wire [42:0] csa4_sum;
	wire [42:0] csa4_pp0;
	wire [42:0] csa4_pp1;
	wire [42:0] csa4_pp2;
	assign csa4_pp0 = {wt_pp5,10'd0};	//25bit->35bit로 확장
	assign csa4_pp1 = {csa3_carry[40],csa3_carry,1'b0};//33bit->35bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa4_pp2 = {{2{csa3_sum[40]}},csa3_sum};					//33bit->35bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(43) csa4 (.pp0(csa4_pp0),.pp1(csa4_pp1),.pp2(csa4_pp2),.sum(csa4_sum),.carry(csa4_carry)); //CSA를 이용한 덧셈연산
	
	wire [44:0] csa5_carry;
	wire [44:0] csa5_sum;
	wire [44:0] csa5_pp0;
	wire [44:0] csa5_pp1;
	wire [44:0] csa5_pp2;
	assign csa5_pp0 = {wt_pp6,12'd0};	//25bit->37bit로 확장
	assign csa5_pp1 = {csa4_carry[42],csa4_carry,1'b0};//35bit->37bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa5_pp2 = {{2{csa4_sum[42]}},csa4_sum};					//35bit->37bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(45) csa5 (.pp0(csa5_pp0),.pp1(csa5_pp1),.pp2(csa5_pp2),.sum(csa5_sum),.carry(csa5_carry)); //CSA를 이용한 덧셈연산
	
	wire [46:0] csa6_carry;
	wire [46:0] csa6_sum;
	wire [46:0] csa6_pp0;
	wire [46:0] csa6_pp1;
	wire [46:0] csa6_pp2;
	assign csa6_pp0 = {wt_pp7,14'd0};	//25bit->39bit로 확장
	assign csa6_pp1 = {csa5_carry[44],csa5_carry,1'b0};//37bit->39bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa6_pp2 = {{2{csa5_sum[44]}},csa5_sum};					//37bit->39bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(47) csa6 (.pp0(csa6_pp0),.pp1(csa6_pp1),.pp2(csa6_pp2),.sum(csa6_sum),.carry(csa6_carry)); //CSA를 이용한 덧셈연산
	
	wire [48:0] csa7_carry;
	wire [48:0] csa7_sum;
	wire [48:0] csa7_pp0;
	wire [48:0] csa7_pp1;
	wire [48:0] csa7_pp2;
	assign csa7_pp0 = {wt_pp8,16'd0};	//25bit->41bit로 확장
	assign csa7_pp1 = {csa6_carry[46],csa6_carry,1'b0};//39bit->41bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa7_pp2 = {{2{csa6_sum[46]}},csa6_sum};					//39bit->41bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(49) csa7 (.pp0(csa7_pp0),.pp1(csa7_pp1),.pp2(csa7_pp2),.sum(csa7_sum),.carry(csa7_carry)); //CSA를 이용한 덧셈연산
	
	wire [50:0] csa8_carry;
	wire [50:0] csa8_sum;
	wire [50:0] csa8_pp0;
	wire [50:0] csa8_pp1;
	wire [50:0] csa8_pp2;
	assign csa8_pp0 = {wt_pp9,18'd0};	//25bit->43bit로 확장
	assign csa8_pp1 = {csa7_carry[48],csa7_carry,1'b0};//41bit->43bit로 확장(concatenation을 활용하여 sign bit 확장)), carry이므로 1bit shift
	assign csa8_pp2 = {{2{csa7_sum[48]}},csa7_sum};					//41bit->43bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(51) csa8 (.pp0(csa8_pp0),.pp1(csa8_pp1),.pp2(csa8_pp2),.sum(csa8_sum),.carry(csa8_carry)); //CSA를 이용한 덧셈연산
	
	wire [52:0] csa9_carry;
	wire [52:0] csa9_sum;
	wire [52:0] csa9_pp0;
	wire [52:0] csa9_pp1;
	wire [52:0] csa9_pp2;
	assign csa9_pp0 = {wt_pp10,20'd0};	//25bit->45bit로 확장
	assign csa9_pp1 = {csa8_carry[50],csa8_carry,1'b0};//43bit->45bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa9_pp2 = {{2{csa8_sum[50]}},csa8_sum};					//43bit->45bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(53) csa9 (.pp0(csa9_pp0),.pp1(csa9_pp1),.pp2(csa9_pp2),.sum(csa9_sum),.carry(csa9_carry)); //CSA를 이용한 덧셈연산
	
	wire [54:0] csa10_carry;
	wire [54:0] csa10_sum;
	wire [54:0] csa10_pp0;
	wire [54:0] csa10_pp1;
	wire [54:0] csa10_pp2;
	assign csa10_pp0 = {wt_pp11,22'd0};	//25bit->47bit로 확장
	assign csa10_pp1 = {csa9_carry[52],csa9_carry,1'b0};//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa10_pp2 = {{2{csa9_sum[52]}},csa9_sum};					//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(55) csa10 (.pp0(csa10_pp0),.pp1(csa10_pp1),.pp2(csa10_pp2),.sum(csa10_sum),.carry(csa10_carry)); //CSA를 이용한 덧셈연산
	
	/////////////////
	wire [56:0] csa11_carry;
	wire [56:0] csa11_sum;
	wire [56:0] csa11_pp0;
	wire [56:0] csa11_pp1;
	wire [56:0] csa11_pp2;
	assign csa11_pp0 = {wt_pp12,24'd0};	//25bit->47bit로 확장
	assign csa11_pp1 = {csa10_carry[54],csa10_carry,1'b0};//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa11_pp2 = {{2{csa10_sum[54]}},csa10_sum};					//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(57) csa11 (.pp0(csa11_pp0),.pp1(csa11_pp1),.pp2(csa11_pp2),.sum(csa11_sum),.carry(csa11_carry)); //CSA를 이용한 덧셈연산
	
	wire [58:0] csa12_carry;
	wire [58:0] csa12_sum;
	wire [58:0] csa12_pp0;
	wire [58:0] csa12_pp1;
	wire [58:0] csa12_pp2;
	assign csa12_pp0 = {wt_pp13,26'd0};	//25bit->47bit로 확장
	assign csa12_pp1 = {csa11_carry[56],csa11_carry,1'b0};//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa12_pp2 = {{2{csa11_sum[56]}},csa11_sum};					//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(59) csa12 (.pp0(csa12_pp0),.pp1(csa12_pp1),.pp2(csa12_pp2),.sum(csa12_sum),.carry(csa12_carry)); //CSA를 이용한 덧셈연산
	
	wire [60:0] csa13_carry;
	wire [60:0] csa13_sum;
	wire [60:0] csa13_pp0;
	wire [60:0] csa13_pp1;
	wire [60:0] csa13_pp2;
	assign csa13_pp0 = {wt_pp14,28'd0};	//25bit->47bit로 확장
	assign csa13_pp1 = {csa12_carry[58],csa12_carry,1'b0};//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa13_pp2 = {{2{csa12_sum[56]}},csa12_sum};					//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(61) csa13 (.pp0(csa13_pp0),.pp1(csa13_pp1),.pp2(csa13_pp2),.sum(csa13_sum),.carry(csa13_carry)); //CSA를 이용한 덧셈연산
	
	
	wire [62:0] csa14_carry;
	wire [62:0] csa14_sum;
	wire [62:0] csa14_pp0;
	wire [62:0] csa14_pp1;
	wire [62:0] csa14_pp2;
	assign csa14_pp0 = {wt_pp15,30'd0};	//25bit->47bit로 확장
	assign csa14_pp1 = {csa13_carry[60],csa13_carry,1'b0};//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장), carry이므로 1bit shift
	assign csa14_pp2 = {{2{csa13_sum[60]}},csa13_sum};					//45bit->47bit로 확장(concatenation을 활용하여 sign bit 확장)
	csa #(63) csa14 (.pp0(csa14_pp0),.pp1(csa14_pp1),.pp2(csa14_pp2),.sum(csa14_sum),.carry(csa14_carry)); //CSA를 이용한 덧셈연산
	
	assign wt_carry = {csa14_carry,1'b0};			
	assign wt_sum = {csa14_sum[62],csa14_sum};	
	
endmodule
