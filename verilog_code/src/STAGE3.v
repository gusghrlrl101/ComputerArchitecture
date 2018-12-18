`timescale 1ns / 1ps

module STAGE3(clk, control,
              s1, s2,

              ALU_Result_out, X_to_next_addr,

              D, address,
              RegWrite, RegInsrc,
              DataRead, DataWrite, JumpSrc, 
              ALU_control, comparator_control, isSub,

              D_out, address_out, 
              RegWrite_out, RegInsrc_out,
              DataRead_out, DataWrite_out, JumpSrc_out
             );

input clk;
input control;
// basic input
input [31:0] s1, s2;
// basic output
output reg [31:0] ALU_Result_out;
output X_to_next_addr;

// control input
input [3:0] D;
input [7:0] address;
input RegWrite, RegInsrc;
input DataRead, DataWrite, JumpSrc;
input [1:0] ALU_control, comparator_control;
input isSub;
// control output
output reg [3:0] D_out;
output reg [7:0] address_out;
output reg RegWrite_out, RegInsrc_out;
output reg DataRead_out, DataWrite_out, JumpSrc_out;

wire [31:0] result;

assign X_to_next_addr = result[0];

always@ (posedge clk) begin
    ALU_Result_out <= result;
    D_out <= D;
    address_out <= address;
    RegWrite_out <= RegWrite;
    RegInsrc_out <= RegInsrc;
    DataRead_out <= DataRead;
    DataWrite_out <= DataWrite; 
    JumpSrc_out <= JumpSrc;
end     

ALU alu1( .a(s1), .b(s2), .isSub(isSub), .ALU_Control(ALU_control), .comparator_control(comparator_control), .result(result));


endmodule