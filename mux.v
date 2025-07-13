module mux2to1_6bit (
    input [5:0] a,    
    input [5:0] b,    
    input sel,        
    output [5:0] y    
);
    assign y = sel ? b : a; 
endmodule

module mux2to1_8bit (
    input [7:0] a,    
    input [7:0] b,    
    input sel,        
    output [7:0] y    
);
    assign y = sel ? b : a; 
endmodule
module mux2to1 #(parameter WIDTH=1) (
    input [WIDTH-1:0] a,    
    input [WIDTH-1:0] b,    
    input sel,        
    output [WIDTH-1:0] y    
);
    assign y = sel ? b : a; 
endmodule

module mux2 (
    input  a,    
    input  b,    
    input sel,        
    output  y    
);
    assign y = sel ? b : a; 
endmodule
