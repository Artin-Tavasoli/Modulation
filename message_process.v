module message_process(
    input clk,
    input reset,
    input  send,
    input [4:0] Msg,
    output SerOut,
	 output valid
);

    wire ld_shiftreg, init_cnt_4bit, init_cnt_10bit, co;

    message_process_dp dp_inst (
        .clk(clk), 
        .reset(reset),  
        .ld_shiftreg(ld_shiftreg), 
        .init_cnt_4bit(init_cnt_4bit), 
        .init_cnt_10bit(init_cnt_10bit), 
        .Msg(Msg), 
        .SerOut(SerOut), 
        .co(co)
    );

    message_process_controller controller_inst (
        .clk(clk),
        .reset(reset),
        .send(send), 
        .co(co), 
        .ld_shiftreg(ld_shiftreg), 
        .init_cnt_4bit(init_cnt_4bit), 
        .init_cnt_10bit(init_cnt_10bit),
		  .valid(vaild)
    );


endmodule

