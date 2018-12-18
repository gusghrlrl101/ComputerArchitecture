`timescale 1ns / 1ps

module STAGE1(clk,
              en, Next_pc, 
              pc, instruction, D, address,
              count, count_out
             );
             
input [1:0] count;
input clk, en;
input [7:0] Next_pc;

output reg[7:0] pc;
output [15:0] instruction;
output [3:0] D;
output [7:0] address;
output reg[1:0] count_out;

always@ (posedge clk) begin
    if (!en) begin
        pc <= 0;
        count_out <= 0;
    end
    else begin
        pc <= Next_pc;
        count_out <= count;
    end
end
                
Inst_cache Inst_cache1(.PC(pc), .en(en),
                       .instruction(instruction), .D(D), .address(address) );
         
                      
endmodule