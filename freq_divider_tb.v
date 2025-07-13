`timescale 1ns / 1ns

module freq_divider_tb;

    reg clk;
    reg reset;
    wire divided_clk;
    freqdivider uut (
        .clk(clk),
        .rst(reset),
        .init(1'b0),
        .sel(1'b0),
        .cnt(3'b111),
        .carry_out(divided_clk)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10;
        
        reset = 0;
        #100000; 

        $stop;
    end

endmodule