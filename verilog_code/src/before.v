`timescale 1ns / 1ps

module before(clk, inst, result, control);

input clk, control;
input [15:0] inst;
output reg [15:0] result;

always@ (posedge clk) begin
    if (!control)
        result <= inst;
end


endmodule