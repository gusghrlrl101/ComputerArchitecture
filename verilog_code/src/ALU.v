`timescale 1ns / 1ps

module ALU( a, b, isSub, ALU_Control, comparator_control, result);
input [31:0] a, b;
input isSub;
input [1:0] ALU_Control;
input [1:0] comparator_control;
output [31:0] result;

// wire ............................
// 1
wire [31:0] w_s1; 
wire b_carry;
wire [31:0] b_out;
// 2
wire [1:0] sum1;
wire [3:0] sum2;
wire [4:0] sum3;
wire [5:0] sum4;
wire [6:0] sum5;
wire [7:0] sum6;
// 3
wire [31:0] w_mult;
wire w_comparator;
wire [31:0] w_sum;
wire c_1, c_2, c_3, c_4, c_5, c_out;

// assign .........................
// 1
assign w_s1 = a;
assign b_carry = (isSub == 1'b1) ? 1'b0 : 1'b1;
assign b_out = (isSub == 1'b1) ? (~b + 1) : (b - 1);
// 2
Adder #(2) adder_1(.A(a[1:0]), .B(b_out[1:0]), .cin(b_carry), .sum(sum1), .c_out(c_1));
Adder #(4) adder_2(.A(a[5:2]), .B(b_out[5:2]), .cin(c_1), .sum(sum2), .c_out(c_2));
Adder #(5) adder_3(.A(a[10:6]), .B(b_out[10:6]), .cin(c_2), .sum(sum3), .c_out(c_3));
Adder #(6) adder_4(.A(a[16:11]), .B(b_out[16:11]), .cin(c_3), .sum(sum4), .c_out(c_4));
Adder #(7) adder_5(.A(a[23:17]), .B(b_out[23:17]), .cin(c_4), .sum(sum5), .c_out(c_5));
Adder #(8) adder_6(.A(a[31:24]), .B(b_out[31:24]), .cin(c_5), .sum(sum6), .c_out(c_out));
// 3
Multiplier multi(.multiplier(a), .multiplicand(b), .result(w_mult));
comparator comp(.a(a), .control(comparator_control), .result(w_comparator));
assign w_sum = {sum6, sum5, sum4, sum3, sum2, sum1};

// output .........................
assign result = (ALU_Control == 2'b00) ? w_s1 :
                (ALU_Control == 2'b01) ? w_comparator :
                (ALU_Control == 2'b10) ? w_sum :
                (ALU_Control == 2'b11) ? w_mult :
                32'b0000000;
endmodule