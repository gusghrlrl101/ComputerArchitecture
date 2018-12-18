`timescale 1ns / 1ps

module Multiplier(multiplier,multiplicand,result);
   input [31:0] multiplier;
   input [31:0] multiplicand;

   output reg [31:0] result;
   /////////////////////////////////Partial Product Generator///////////////////////////////////
   wire [32:0] m_ppg_out0;
   wire [32:0] m_ppg_out1;
   wire [32:0] m_ppg_out2;
   wire [32:0] m_ppg_out3;
   wire [32:0] m_ppg_out4;
   wire [32:0] m_ppg_out5;
   wire [32:0] m_ppg_out6;
   wire [32:0] m_ppg_out7;
   wire [32:0] m_ppg_out8;
   wire [32:0] m_ppg_out9;
   wire [32:0] m_ppg_out10;
   wire [32:0] m_ppg_out11;
   
   
   wire [32:0] m_ppg_out12;
   wire [32:0] m_ppg_out13;
   wire [32:0] m_ppg_out14;
   wire [32:0] m_ppg_out15;
   
   
   
   ppg main_ppg(.ppg_in1(multiplier),.ppg_in2(multiplicand),.ppg_out0(m_ppg_out0),.ppg_out1(m_ppg_out1),.ppg_out2(m_ppg_out2),.ppg_out3(m_ppg_out3)
   ,.ppg_out4(m_ppg_out4),.ppg_out5(m_ppg_out5),.ppg_out6(m_ppg_out6),.ppg_out7(m_ppg_out7),.ppg_out8(m_ppg_out8),.ppg_out9(m_ppg_out9)
   ,.ppg_out10(m_ppg_out10),.ppg_out11(m_ppg_out11),.ppg_out12(m_ppg_out12),.ppg_out13(m_ppg_out13),.ppg_out14(m_ppg_out14),.ppg_out15(m_ppg_out15));
   ////////////////////////////////////////////////////////////////////////////////////////////
   
   ////////////////////////////////////1st Pipeline(D-FF)///////////////////////////////////////
   wire [32:0] d_ppg_out0;
   wire [32:0] d_ppg_out1;
   wire [32:0] d_ppg_out2;
   wire [32:0] d_ppg_out3;
   wire [32:0] d_ppg_out4;
   wire [32:0] d_ppg_out5;
   wire [32:0] d_ppg_out6;
   wire [32:0] d_ppg_out7;
   wire [32:0] d_ppg_out8;
   wire [32:0] d_ppg_out9;
   wire [32:0] d_ppg_out10;
   wire [32:0] d_ppg_out11;
   
   
   wire [32:0] d_ppg_out12;
   wire [32:0] d_ppg_out13;
   wire [32:0] d_ppg_out14;
   wire [32:0] d_ppg_out15;
      
   
   ppg_D_FF DFF_1st(.pp0(m_ppg_out0),.pp1(m_ppg_out1),.pp2(m_ppg_out2),.pp3(m_ppg_out3),.pp4(m_ppg_out4),.pp5(m_ppg_out5)
      ,.pp6(m_ppg_out6),.pp7(m_ppg_out7),.pp8(m_ppg_out8),.pp9(m_ppg_out9),.pp10(m_ppg_out10),.pp11(m_ppg_out11),.pp12(m_ppg_out12),.pp13(m_ppg_out13),.pp14(m_ppg_out14),.pp15(m_ppg_out15)
      ,.d_pp0(d_ppg_out0),.d_pp1(d_ppg_out1),.d_pp2(d_ppg_out2),.d_pp3(d_ppg_out3),.d_pp4(d_ppg_out4),.d_pp5(d_ppg_out5),.d_pp6(d_ppg_out6)
      ,.d_pp7(d_ppg_out7),.d_pp8(d_ppg_out8),.d_pp9(d_ppg_out9),.d_pp10(d_ppg_out10),.d_pp11(d_ppg_out11),.d_pp12(d_ppg_out12),.d_pp13(d_ppg_out13),.d_pp14(d_ppg_out14),.d_pp15(d_ppg_out15));
   ////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////////Wallace's Tree////////////////////////////////////////   
   wire [63:0] m_wt_carry;
   wire [63:0] m_wt_sum;
   wallace_tree main_wallace_tree3(.wt_pp0(d_ppg_out0),.wt_pp1(d_ppg_out1),.wt_pp2(d_ppg_out2),.wt_pp3(d_ppg_out3),.wt_pp4(d_ppg_out4)
   ,.wt_pp5(d_ppg_out5),.wt_pp6(d_ppg_out6),.wt_pp7(d_ppg_out7),.wt_pp8(d_ppg_out8),.wt_pp9(d_ppg_out9),.wt_pp10(d_ppg_out10),.wt_pp11(d_ppg_out11),.wt_pp12(d_ppg_out12),.wt_pp13(d_ppg_out13),.wt_pp14(d_ppg_out14),.wt_pp15(d_ppg_out15)
   ,.wt_sum(m_wt_sum),.wt_carry(m_wt_carry));
   ////////////////////////////////////////////////////////////////////////////////////////////
   
   ////////////////////////////////////2nd Pipeline(D-FF)///////////////////////////////////////
//   wire [50:0] d_wt_carry;
   //wire [50:0] d_wt_sum;
//   two_DFF #(51) DFF_2nd(.clk(clk),.resetn(resetn),.wal_sum(m_wt_sum),.wal_carry(m_wt_carry),.d_wal_sum(d_wt_sum),.d_wal_carry(d_wt_carry));
   ////////////////////////////////////////////////////////////////////////////////////////////
   
   ////////////////////////////////////////CLA Adder///////////////////////////////////////////
   wire [64:0] CLA_result;
   CLA #(64) main_CLA(.input1(m_wt_sum),.input2(m_wt_carry),.result(CLA_result));
   ////////////////////////////////////////////////////////////////////////////////////////////
   
   ////////////////////////////////////3rd Pipeline(D-FF)///////////////////////////////////////
////   wire [51:0] d_CLA_result;
   //N_DFF #(52) DFF_3rd(.clk(clk),.resetn(resetn),.input_dff(CLA_result),.output_dff(d_CLA_result));
   ////////////////////////////////////////////////////////////////////////////////////////////
   
   //assign result = d_CLA_result[47:0];         //exception unnecessary sign bit
   //always@(posedge clk)               //강제로 1 clock delay 만들기
//   begin


//assign csa6_pp1 = {csa5_carry[44],csa5_carry,1'b0};
   wire [31:0]result_32;
   
   assign result_32 = { CLA_result[63],CLA_result[30:0]};
   
   always@(*)begin
      result = result_32[31:0];
   end

endmodule

