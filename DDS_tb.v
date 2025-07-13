`timescale 1ns / 1ns

module Topmodule_tb_DDS;

    reg clk;
    reg reset;
    wire [8:0] output_signal;
    wire [7:0]out;
Topmodule_DDS uut (
        .clk(clk),
        .reset(reset),
        .sign_mag_output(output_signal)
    );
    assign out = output_signal[8:1];
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;

        #20;
        reset = 0;
        #20000;
        $stop;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b  | output_signal = %b", 
                 $time, clk, reset, output_signal);
    end

endmodule
