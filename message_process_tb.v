`timescale 1ns/1ps

module message_process_tb;

    reg clk;
    reg reset;
    reg send;
    reg [4:0] MSG;
    wire SerOut;

    message_process uut (
        .clk(clk),
        .reset(reset),
        .send(send),
        .MSG(MSG),
        .SerOut(SerOut)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1;
        send = 0;
        MSG = 5'b00000;

        #10 reset = 0;

        // #10 MSG = 5'b10101;
        // send = 1;
        // #30 send = 0;

        // #50000;

        MSG = 5'b11011;
        send = 1;
        #30 send = 0;

        #50000;

        $stop;
    end

    initial begin
        $monitor("Time: %0t | reset: %b | send: %b | MSG: %b | SerOut: %b", 
                 $time, reset, send, MSG, SerOut);
    end

endmodule