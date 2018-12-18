`timescale 1ns / 1ps

module register_file(clk,
                      instruction, D_dest, data, RegWrite,
                      isJDI, isIMD, isIMM,
                      S1_out, S2_out, D_temp,
                      JDI_addr,
                      result_out, finish);

input clk;
input [15:0] instruction;
input [3:0] D_dest;
input [31:0] data;
input RegWrite;
input isJDI, isIMD, isIMM;

output [31:0] S1_out, S2_out, D_temp;
output reg [7:0] JDI_addr;
output result_out, finish;

reg[31:0] reg_storage[15:0];
wire [3:0] OP, D, S1, S2;
wire [7:0] imd;

assign OP = instruction[15:12];
assign D = instruction[11:8];
assign imd = instruction[7:0];
assign S1 = instruction[7:4];
assign S2 = instruction[3:0];
assign D_temp = reg_storage[D];
assign S1_out = reg_storage[S1];
assign S2_out = reg_storage[S2];
assign result_out = reg_storage[14][0];
assign finish = reg_storage[15][0];
assign result_out = reg_storage[14][0];
assign finish = reg_storage[15][0];

always@ (*) begin
    // if JDI
    if(isJDI)
        JDI_addr = reg_storage[D][15:0];
    else
        JDI_addr = 0;
end

always@ (posedge clk) begin
    if (RegWrite)
        reg_storage[D_dest] <= data;
    
    // if IMD
    if (isIMD || isIMM) begin
        // if IMM
        if(isIMM)
            reg_storage[D][31:8] <= 24'b1111_1111_1111_1111_1111_1111;
        else
            reg_storage[D][31:8] <= 24'b0000_0000_0000_0000_0000_0000;
        reg_storage[D][7:0] <= imd;
    end
end


endmodule