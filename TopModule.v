module TopModule(
    input clk,
    input rst,
    input [2:0] PL,
    input not_init_freqdivider,
    input Send,
    input [4:0] Msg, 
    input Mode,
    output wire Out
);
    wire  freq_div_out_msb, freq_div_out_lsb;
    wire init_freqdivider;
    not not_init_freqdivider_gate (init_freqdivider,not_init_freqdivider);
    freqdivider freq_div_msb (
        .clk(clk),
        .rst(rst),
        .init(init_freqdivider),
        .sel(1'b1),
        .cnt(PL),
        .carry_out(freq_div_out_msb)
    );

    freqdivider freq_div_lsb (
        .clk(clk),
        .rst(rst),
        .init(init_freqdivider),
        .sel(1'b0),
        .cnt(PL),
        .carry_out(freq_div_out_lsb)
    );
    wire  freq_div_out;

    wire SerOut;
    mux2to1  mux_DDS_clk (
        .a(freq_div_out_lsb),
        .b(freq_div_out_msb),
        .sel(SerOut),
        .y(freq_div_out)
    );
    wire [7:0] sign_mag_output;
    wire msb;
    Topmodule_DDS top_instance (
        .clk(freq_div_out),
        .reset(rst),
        .sign_mag_output(sign_mag_output),
        .msb(msb)
    );

    message_process msg_proc_inst (
        .clk(freq_div_out_msb),
        .reset(rst),
        .send(Send),
        .Msg(Msg),
        .SerOut(SerOut)
    );
    wire pwm_input_sel;
    wire [7:0] pwm_data;
    or pwm_mux_or (pwm_input_sel,Mode,SerOut);
    mux2to1 #(.WIDTH(8)) mux_pwm_input (
        .a(8'd128),
        .b(sign_mag_output), 
        .sel(pwm_input_sel),
        .y(pwm_data)
    );
    pwm pwm_inst (
        .clk(clk),
        .rst(rst),
        .data(pwm_data),
        .out(Out)
    );
endmodule