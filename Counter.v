module Counter #(parameter WIDTH = 6) (
    input  clk,
    input  rst,
    input  cnt_en,
    input  init,
    input  [WIDTH-1:0] ld,
    output reg [WIDTH-1:0] out,
    output wire co
);
    assign co =&out;
    always @(posedge clk or posedge rst) begin
        if (rst)
            out <= 0;    
        else if (init)
                out<=ld;
        else if (cnt_en) 
                out <= out + 1'b1;
		  else 
              out <= out;      
            
        end
endmodule