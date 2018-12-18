`timescale 1ns / 1ps

module ControlUnit(clk, en, PC, count, count_out, control,
                    current, X_reg, Y_reg,
                    X, Y, 
                    RegWrite, RegInsrc, 
                    DataRead, DataWrite, JumpSrc, 
                    ALU_control, comparator_control, s1_src, s2_src, isSub, Jcond,
                    isJDI, isIMD, isIMM
                   );
                    
input clk, en;
input [7:0] PC;
input [1:0] count;
output reg[1:0] count_out;
output reg control;
        
input [15:0] current;
input [31:0] X_reg, Y_reg;

output reg [31:0] X, Y;
output reg RegWrite, RegInsrc;
output reg DataRead, DataWrite, JumpSrc;
output reg [1:0] ALU_control, comparator_control, s1_src, s2_src;
output reg isSub, Jcond, isJDI, isIMD, isIMM;

wire [15:0] before, before_of_before;

before before1(.clk(clk), .inst(current), .result(before), .control(control));

before before2(.clk(clk), .inst(before), .result(before_of_before), .control(control));

always@(*) begin
    if (!en) begin
        control = 0;
        count_out = 0;
    end
    
    X = X_reg;
    Y = Y_reg;
    RegWrite = 0; 
    RegInsrc = 0;
    DataRead = 0;
    DataWrite = 0;
    ALU_control = 0;
    comparator_control = 0; 
    s1_src = 0;
    s2_src = 0;
    isSub = 0;
    Jcond = 0;
    isJDI = 0;
    isIMD = 0;
    isIMM = 0;
    JumpSrc = current[15];

    // IMD
    if (current[15:12] == 4'b0011) 
        isIMD = 1;
    // IMM
    else if (current[15:12] == 4'b0111)
        isIMM = 1;
    // current ADD, SUB, MUL
    else if (current[15:14] == 2'b01) begin
        RegWrite = 1;
        RegInsrc = 1;
        ALU_control = current[14:13];
        isSub = current[12];
        
        // before_of_before ADD, SUB, MUL, LOAD
        if (before_of_before[15:12] != 4'b0111 && before_of_before[15:14] == 2'b01 || before_of_before[15:12] == 4'b0001) begin
            // before_of_before.D == current.S1 or S2
            if (before_of_before[11:8] == current[7:4])
                s1_src = 2'b10;
            if (before_of_before[11:8] == current[3:0])
                s2_src = 2'b10;
        end
        
        // before ADD, SUB, MUL
        if (before[15:12] != 4'b0111 && before[15:14] == 2'b01) begin
            // before.D == current.S1 or S2
            if (before[11:8] == current[7:4])
                s1_src = 2'b01;
            if (before[11:8] == current[3:0])
                s2_src = 2'b01;
        end
        // before LOAD
        else if (before[15:12] == 4'b0001) begin
            if (before[11:8] == current[7:4] || before[11:8] == current[3:0]) begin
                // insert 1 bubble
                if (count == 1) begin
                    control = 0;
                    count_out = 0;
                end
                else begin
                    control = 1;
                    count_out = count + 1;
                end
                
                // before.D == current.S1
                if (before[11:8] == current[7:4])
                    s1_src = 2'b10;
                // before.D == current.S2
                if (before[11:8] == current[3:0])
                    s2_src = 2'b10;
            end
        end
    end
    // current STORE
    else if (current[15:12] == 4'b0010) begin
        DataWrite = 1;
        
        // before_of_before ADD, SUB, MUL, LOAD
        if (before_of_before[15:12] != 4'b0111 && before_of_before[15:14] == 2'b01 || before_of_before[15:12] == 4'b0001) begin
            // before_of_before.D == current.D
            if (before_of_before[11:8] == current[11:8])
                s1_src = 2'b10;
        end
        
        // before ADD, SUB, MUL
        if (before[15:12] != 4'b0111 && before[15:14] == 2'b01) begin
            // before.D == current.D
            if (before[11:8] == current[11:8])
                s1_src = 2'b01;
        end
        // before LOAD
        else if (before[15:12] == 4'b0001) begin
            // before.D == current.D
            if(before[11:8] == current[11:8]) begin
                s1_src = 2'b10;
                
                // bubble 1
                if(count == 1) begin
                    control = 0;    
                    count_out = 0;     
                end
                else begin
                    control = 1;
                    count_out = count + 1;
                end
            end
        end
    end
    // current LOAD
    else if (current[15:12] == 4'b0001) begin
        RegWrite = 1;
        DataRead = 1;
        
        // before STORE, before.addr == current.addr
        if (before[15:12] == 4'b0010 && before[7:0] == current[7:0])
                s1_src = 2'b01;
    end
    // JNE, JGT, JLT
    else if (current[15:14] == 2'b11) begin
        Jcond = 1;
        ALU_control = 2'b01;
        comparator_control = current[13:12];
        
        // before ADD, SUB, MUL
        if (before[15:12] != 4'b0111 && before[15:14] == 2'b01) begin
            // before.D == current.D
            if (before[11:8] == current[11:8])
                s1_src = 2'b01;
        end
        
        if(count == 1) begin
            control = 0;
            count_out = 0;
        end
        else begin;
            control = 1;
            count_out = count + 1;
        end
    end       
    // JDI
    else if (current[15:12] == 4'b1001)
        isJDI = 1;
end


endmodule