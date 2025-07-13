module shift_right_register #(parameter WIDTH = 9) (
    input clk, reset, shift_en, ld_shiftreg,
    input wire [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out,
    output Shift_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= {WIDTH{1'b0}};
        end
        else begin
            if(ld_shiftreg) begin
            data_out <= data_in;
            end
            else begin 
                if (shift_en) begin
                data_out <= {data_out[WIDTH-2:0],1'b0};
                end 
            end
    end
    end
assign Shift_out= data_out[WIDTH-1];
endmodule
