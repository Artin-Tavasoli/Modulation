module pwm(
    input clk,
    input rst,
    input [7:0] data,
    output wire out
);
    wire [7:0] counter_out;
    wire co;
    Counter #(.WIDTH(8)) counter_inst (
        .clk(clk),
        .rst(rst),
        .cnt_en(1'b1),
        .init(1'b0),
        .ld(8'b0),
        .out(counter_out),
        .co(co)
    );
    assign out = (counter_out<data) ? 1'b1 : 1'b0;

endmodule
