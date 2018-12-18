`timescale 1ns / 1ps

module STAGE4(clk,
              data, 

              Data_Cache_out, ALU_Result_out,

              D, address,
              RegWrite, RegInsrc,
              DataRead, DataWrite,
              
              D_out,
              RegWrite_out, RegInsrc_out,
              mux_out
              );

input clk;

// basic input
input[31:0] data;
// basic output
output [31:0] Data_Cache_out;
output reg [31:0] ALU_Result_out;

// control input
input[3:0] D;
input[7:0] address;
input RegWrite, RegInsrc;
input DataRead, DataWrite;
// control output
output reg [3:0] D_out;
output RegWrite_out, RegInsrc_out;
wire[31:0] data_out;

assign Data_Cache_out = data_out;
assign RegWrite_out = RegWrite;
assign RegInsrc_out = RegInsrc;
output [31:0] mux_out;

always@ (posedge clk) begin
    ALU_Result_out <= data;
    D_out <= D;
end

Data_cache Data_cache1(.clk(clk),
                       .data(data), .addr(address), 
                       .DataRead(DataRead), .DataWrite(DataWrite),
                       .data_out(data_out)
);

mux_32bit final_mux(.Sel(RegInsrc), .a(Data_Cache_out), .b(ALU_Result_out), .y(mux_out));

endmodule