module Datapath(

    input wire [5:0] address,
    input phasepose,
    input sign_bit,
    output[8:0] sign_mag_output
);
    wire [5:0] two_comp_address;
    wire [5:0] sin_rom_address;
    wire [7:0] sin_rom_out;
    wire [7:0] sign_mag_input;

    twos_complement twos_complement (
        .in(address),
        .out(two_comp_address)
    );    
    mux2to1_6bit mux_1 (
        .a(address),
        .b(two_comp_address),
        .sel(phasepose),
        .y(sin_rom_address)
    );
    ROM Sin_Rom (
        .address(sin_rom_address),
        .data(sin_rom_out)
    );
    wire sel_mux_2;
    assign sel_mux_2 = phasepose &( ~|{address});
    mux2to1_8bit mux_2 (
        .a(sin_rom_out),
        .b(8'b11111111),
        .sel(sel_mux_2),
        .y(sign_mag_input)
    );

    SignMagTo2Comp sign_mag_to_2comp (
        .sign_mag({sign_bit,sign_mag_input}),
        .two_comp(sign_mag_output)
    );

endmodule