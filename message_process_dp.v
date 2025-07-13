module message_process_dp(input clk, reset, ld_shiftreg,init_cnt_4bit, init_cnt_10bit, input [4:0] Msg, output SerOut, co);
    wire [8:0] shift_in;
    wire [8:0] reg_out;
    wire co_10bit;
    assign shift_in = {4'b0101,Msg};
     shift_right_register #(.WIDTH(9)) shift_inst (
    .clk(clk), .reset(reset), .shift_en(co_10bit), .ld_shiftreg(ld_shiftreg),
    .data_in(shift_in), .data_out(reg_out), .Shift_out(SerOut));

    wire [3:0] cnt_out_4bit;
    wire [9:0] cnt_out_10bit;

 Counter #(.WIDTH(4)) counter_inst1 (.clk(clk), .rst(reset | init_cnt_4bit), .cnt_en(co_10bit), .init(1'b0), .ld(4'b0), .out(cnt_out_4bit), .co(co));
    
 Counter #(.WIDTH(10)) counter_inst2 (.clk(clk), .rst(reset | init_cnt_10bit), .cnt_en(1'b1), .init(1'b0), .ld(10'b0), .out(cnt_out_10bit), .co(co_10bit));

endmodule