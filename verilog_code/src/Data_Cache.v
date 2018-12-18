`timescale 1ns / 1ps

module Data_cache(clk,
                  data, addr, 
                  DataRead, DataWrite,
                  data_out
                  );

input clk;
input [31:0] data;
input [7:0] addr;
input DataRead, DataWrite;

output reg [31:0] data_out;

reg[31:0] data_storage[255:0];

always@ (posedge clk) begin
    data_out = data;
    if (DataRead)
        data_out = data_storage[addr];
    if (DataWrite)
        data_storage[addr] = data;
end


endmodule