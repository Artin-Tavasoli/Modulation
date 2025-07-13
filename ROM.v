module ROM (
    input wire [5:0] address,  
    output wire [7:0] data    
);

    reg [7:0] memory [0:63];  

    initial begin
        $readmemb("sine.mem", memory);
    end
    assign data = memory[address];

endmodule
