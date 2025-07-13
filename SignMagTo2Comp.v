module SignMagTo2Comp (

    input [8:0] sign_mag,  
    output [8:0] two_comp
);
    wire sign_bit;
    wire [7:0] magnitude;

    assign sign_bit = sign_mag[8];       
    assign magnitude = sign_mag[7:0];   

    assign two_comp = sign_bit ? (~magnitude + 1'b1 + 9'd256) : sign_mag;

endmodule