`timescale 1ns / 1ps

module pipeline(clk, en, out, finish);

// input
input clk, en;
output out;
output finish;


// control unit
wire [31:0] X, Y;
wire RegWrite, RegInsrc; 
wire DataRead, DataWrite, JumpSrc;
wire [1:0] ALU_control, comparator_control, s1_src, s2_src;
wire isSub, Jcond, isJDI, isIMD, isIMM;
wire control;
wire [1:0] count;
wire [1:0] count_out;

// stage 1
wire [7:0] pc;
wire [15:0] instruction;
wire [3:0] D;
wire [7:0] address;

// stage2
wire [31:0] data;
wire [31:0] S1, S2;
wire [3:0] D_2;
wire [7:0] address_2;
wire RegWrite_2, RegInsrc_2; 
wire DataRead_2, DataWrite_2, JumpSrc_2;
wire [1:0] ALU_control_2, comparator_control_2;
wire isSub_2;
wire [7:0] pc_next;
wire [7:0] JDI_addr;

// stage3
wire [31:0] ALU_Result_out;  
wire [3:0] D_3;
wire [7:0] address_3;
wire RegWrite_3, RegInsrc_3; 
wire DataRead_3, DataWrite_3, JumpSrc_3;
wire X_to_next_addr;

// stage4
wire [31:0] Data_Cache_out, ALU_Result_out_2;
wire [3:0] D_4;
wire RegWrite_4, RegInsrc_4; 




ControlUnit ControlUnit1(.clk(clk), .en(en), .PC(pc), .count(count), .count_out(count_out), .control(control),
                         .current(instruction), .X_reg(ALU_Result_out), .Y_reg(Data_Cache_out),
                         .X(X), .Y(Y), 
                         .RegWrite(RegWrite), .RegInsrc(RegInsrc), 
                         .DataRead(DataRead), .DataWrite(DataWrite), .JumpSrc(JumpSrc), 
                         .ALU_control(ALU_control), .comparator_control(comparator_control), .s1_src(s1_src), .s2_src(s2_src), .isSub(isSub), .Jcond(Jcond),
                         .isJDI(isJDI), .isIMD(isIMD), .isIMM(isIMM)
                        ); 

nextaddress nextaddr(.PC(pc), .address(address),
                     .JumpSrc(JumpSrc), .Jcond(Jcond),
                     .isJDI(isJDI), .JDI_addr(JDI_addr),
                     .X_in(X_to_next_addr),
                     .result(pc_next), .control2(control), .control2_out(pc)
                    );

STAGE1 STAGE1(.clk(clk), .en(en),
              .Next_pc(pc_next), 
              .pc(pc), .instruction(instruction), .D(D), .address(address),
              .count(count_out), .count_out(count)
             ); 

STAGE2 STAGE2(.clk(clk), .control(control),
              .instruction(instruction), .data(data), .D_dest(D_4), .X_reg(X), .Y_reg(Y), .D(D), .address(address),
              
              .s1_out(S1), .s2_out(S2), .D_out(D_2), .address_out(address_2),
              
              .RegWrite(RegWrite), .RegInsrc(RegInsrc), .RegWrite_to_Reg(RegWrite_4),
              .DataRead(DataRead), .DataWrite(DataWrite), .JumpSrc(JumpSrc),
              .ALU_control(ALU_control), .comparator_control(comparator_control), .isSub(isSub), .Jcond(Jcond),
              .s1_src(s1_src), .s2_src(s2_src),
              .isJDI(isJDI), .isIMD(isIMD), .isIMM(isIMM),

              .RegWrite_out(RegWrite_2), .RegInsrc_out(RegInsrc_2),
              .DataRead_out(DataRead_2), .DataWrite_out(DataWrite_2), .JumpSrc_out(JumpSrc_2),
              .ALU_control_out(ALU_control_2), .comparator_control_out(comparator_control_2), .isSub_out(isSub_2),
              .JDI_addr(JDI_addr),
              .result_out(out), .finish(finish)
             );

STAGE3 STAGE3(.clk(clk), .control(control),
              .s1(S1), .s2(S2),

              .ALU_Result_out(ALU_Result_out),  . X_to_next_addr(X_to_next_addr),

              .D(D_2), .address(address_2),
              .RegWrite(RegWrite_2), .RegInsrc(RegInsrc_2),
              .DataRead(DataRead_2), .DataWrite(DataWrite_2), .JumpSrc(JumpSrc_2), 
              .ALU_control(ALU_control_2), .comparator_control(comparator_control_2), .isSub(isSub_2),

              .D_out(D_3), .address_out(address_3), 
              .RegWrite_out(RegWrite_3), .RegInsrc_out(RegInsrc_3),
              .DataRead_out(DataRead_3), .DataWrite_out(DataWrite_3), .JumpSrc_out(JumpSrc_3)
             );

STAGE4 STAGE4(.clk(clk),
              .data(ALU_Result_out), 

              .Data_Cache_out(Data_Cache_out), .ALU_Result_out(ALU_Result_out_2),

              .D(D_3), .address(address_3),
              .RegWrite(RegWrite_3), .RegInsrc(RegInsrc_3),
              .DataRead(DataRead_3), .DataWrite(DataWrite_3),
              
              .D_out(D_4),
              .RegWrite_out(RegWrite_4), .RegInsrc_out(RegInsrc_4),
              .mux_out(data)
             );     
              
              
endmodule