`timescale 1ns / 1ps

module STAGE2(clk,
              control,
              instruction, data, X_reg, Y_reg, 

              s1_out, s2_out, 

              D_dest, D, address,
              RegWrite, RegInsrc, RegWrite_to_Reg,
              DataRead, DataWrite, JumpSrc,
              ALU_control, comparator_control, isSub, Jcond,
              s1_src, s2_src,
              isJDI, isIMD, isIMM,

              D_out, address_out,
              RegWrite_out, RegInsrc_out,
              DataRead_out, DataWrite_out, JumpSrc_out,
              ALU_control_out, comparator_control_out, isSub_out,
              JDI_addr,
              result_out, finish
             );

input clk;   
input control;

// basic input
input [15:0] instruction;
input [31:0] X_reg, Y_reg, data;
input [7:0] address;
input [3:0] D;
input [3:0] D_dest;

// basic output
output [31:0] s1_out, s2_out;
output[3:0] D_out;
output[7:0] address_out;

// control input
input RegWrite, RegInsrc, RegWrite_to_Reg;
input DataRead, DataWrite, JumpSrc;
input [1:0] ALU_control, comparator_control;
input isSub, Jcond;
input [1:0] s1_src, s2_src;
input isJDI, isIMD, isIMM;

// control output
output reg RegWrite_out, RegInsrc_out;
output DataRead_out, DataWrite_out, JumpSrc_out;
output [1:0] ALU_control_out, comparator_control_out;
output isSub_out;
output [7:0] JDI_addr;
output result_out, finish;

reg [31:0] S1_temp;
wire [31:0] mux1_out, mux2_out;
wire [31:0] S1, S2, D_temp;

assign s1_out = mux1_out;
assign s2_out = mux2_out;
assign D_out = D;
assign address_out = address;
assign DataRead_out = DataRead;
assign DataWrite_out = DataWrite; 
assign JumpSrc_out = JumpSrc;
assign comparator_control_out = comparator_control;
assign ALU_control_out = ALU_control;
assign isSub_out = isSub;

always@(*) begin
    // if STORE or JNE, JGT, JLT
    if(instruction[15:12] == 4'b0010 || Jcond)
        S1_temp <= D_temp;
    else
        S1_temp <= S1;
end

always@ (posedge clk) begin
    RegWrite_out <= RegWrite;
    RegInsrc_out <= RegInsrc;
end

register_file register_file1(.clk(clk),
                             .instruction(instruction), .D_dest(D_dest), .data(data), .RegWrite(RegWrite_to_Reg),
                             .S1_out(S1), .S2_out(S2), .D_temp(D_temp),
                             .isJDI(isJDI), .isIMD(isIMD), .isIMM(isIMM),
                             .JDI_addr(JDI_addr),
                             .result_out(result_out), .finish(finish)
                             );

mux_32bit_3 muxthree1(.Sel(s1_src), .a(S1_temp), .b(X_reg), .c(Y_reg), .y(mux1_out) );
mux_32bit_3 muxthree2(.Sel(s2_src), .a(S2), .b(X_reg), .c(Y_reg), .y(mux2_out) );

endmodule