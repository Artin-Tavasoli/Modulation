module freqdivider (
    input clk,
    input rst,
    input wire init,
    input sel,
    input [2:0] cnt,
    output wire carry_out
);
    wire [8:0] out;
    Counter #(.WIDTH(9)) counter_inst (
        .clk(clk),
        .rst(rst),
        .cnt_en(1'b1),
        .init(carry_out | init ),   
        .ld({sel,cnt,5'b0}),      
        .out(out),
        .co(carry_out)
    );

   

endmodule