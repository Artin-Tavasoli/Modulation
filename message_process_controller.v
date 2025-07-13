module message_process_controller(input send, co, clk,reset,
output reg ld_shiftreg, init_cnt_4bit, init_cnt_10bit, valid);
    parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10;
    reg [1:0] ns,ps;
    always @(posedge clk, posedge reset)begin
        if (reset)
            ps <= A;
        else
            ps <= ns;
    end

    always @(ps, co, send)begin
        ns = A;
        case(ps)
            A: ns = send ? C : A;
            //B: ns = send ? B : C;
            C: ns = co ? A : C;
            default: ns = A;
        endcase
    end

    always @(ps, send)begin
        {ld_shiftreg, init_cnt_4bit, init_cnt_10bit,valid} = 4'b0000;
        case(ps)
            A:  begin ld_shiftreg = send; {init_cnt_4bit, init_cnt_10bit} = 2'b11; end 
            C: valid=1'b1;
				default: {ld_shiftreg} = 1'b0;  
        endcase
    end
endmodule