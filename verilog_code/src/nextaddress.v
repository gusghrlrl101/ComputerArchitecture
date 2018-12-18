`timescale 1ns / 1ps

module nextaddress(
                   PC, address,
                   JumpSrc, Jcond,
                   isJDI, JDI_addr,
                   X_in,
                   result, control2, control2_out
                   );
                   
input control2;
input JumpSrc, Jcond;
input [7:0] PC, address,control2_out;
input X_in;
input isJDI;
input [7:0] JDI_addr;

output [7:0] result;

wire [7:0] out1, out2, out3, out4, out5, out6;

assign out4 = PC + 1;
assign result = out6;

mux_8bit mux0(.Sel(isJDI), .a(address), .b(JDI_addr), .y(out1));
mux_8bit mux1(.Sel(X_in), .a(out4), .b(address), .y(out2));
mux_8bit mux2(.Sel(Jcond), .a(out1), .b(out2), .y(out3));
mux_8bit mux3(.Sel(JumpSrc), .a(out4), .b(out3), .y(out5));
mux_8bit mux4(.Sel(control2), .a(out5), .b(control2_out), .y(out6));


endmodule