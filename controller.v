module controller(input clk, reset, output reg phasepose, signbit, output [5:0] adr);

    parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] ns,ps;
    always @(posedge clk, posedge reset)begin
        if (reset)
            ps <= A;
        else
            ps <= ns;
    end
    wire co;
    Counter #(.WIDTH(6)) cnt_in_controller(.clk(clk), .rst(reset), .cnt_en(1'b1), .init(1'b0), .ld(6'b0), .out(adr), .co(co));


    always @(ps, co)begin
        ns = A;
        case(ps)
            A: ns = co ? B : A;
            B: ns = co ? C : B;
            C: ns = co ? D : C;
            D: ns = co ? A : D;
            default: ns = A;
        endcase
    end

    always @(ps)begin
        {phasepose, signbit} = 2'b00;
        case(ps)
            A:  {phasepose, signbit} = 2'b00;  
            B:  {phasepose, signbit} = 2'b10; 
            C:  {phasepose, signbit} = 2'b01; 
            D:  {phasepose, signbit} = 2'b11; 
            default: {phasepose, signbit} = 2'b00;  
        endcase
    end

endmodule
