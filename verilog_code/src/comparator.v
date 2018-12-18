`timescale 1ns / 1ps

module comparator(a, control, result);
input [31:0] a;
input [1:0] control;
output reg result;

always @(*) begin
    if (control == 0) begin
        if (a != 0)
            result = 1;
        else
            result = 0;
    end
    else if (control == 1) begin
        if (a == 0 || a[31] == 1)
            result = 0;
        else
            result = 1;
    end
    else if (control == 2) begin
        if (a == 0 || a[31] == 0)
            result = 0;
        else
            result = 1;
    end
    else
        result = 0;
end


endmodule