module Topmodule_DDS(
    input clk,
    input reset,
    output [7:0] sign_mag_output,
    output msb
);

    wire [5:0] address;
    wire phasepose;
    wire signbit;

    controller ctrl (
        .clk(clk),
        .reset(reset),
        .phasepose(phasepose),
        .signbit(signbit),
        .adr(address)
    );

    Datapath dp (

        .address(address),
        .phasepose(phasepose),
        .sign_bit(signbit),
        .sign_mag_output({msb,sign_mag_output})
    );

endmodule