`timescale 1ns/1ns
module TopModule_tb;

    reg clk;
    reg rst;
    reg [2:0] PL;
    reg not_init_freqdivider;
    reg Send;
    reg [4:0] Msg;
    reg Mode;
    wire Out;

    TopModule uut (
        .clk(clk),
        .rst(rst),
        .PL(PL),
        .not_init_freqdivider(not_init_freqdivider),
        .Send(Send),
        .Msg(Msg),
        .Mode(Mode),
        .Out(Out)
    );

    initial clk = 0;
    always #5 clk = ~clk; 

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;
        Mode = 0;
        Send = 0;
        Msg = 5'b10111;
        PL = 3'b000;
        not_init_freqdivider = 1;
        #100;
        rst = 0;
        #50; 
        Send = 1;
        #100

        #300000000;
        $stop;
    end


endmodule