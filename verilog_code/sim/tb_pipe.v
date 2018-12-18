module tb_pipe;
reg clk;
reg en;
wire out;
wire finish;

pipeline uut(.clk(clk), .en(en), .out(out), .finish(finish));

initial begin
    clk = 0;
    en = 0;
    forever #5
        clk = ~clk;
end

initial
    #100 en = 1;

endmodule