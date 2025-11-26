module universal_shift #(parameter WIDTH=4)(
    input clk,rst,
    input [1:0]mode,
    input [WIDTH-1:0]d_in,
    input shift_right,
    input shift_left,
    output reg  [WIDTH-1:0]d_out 
);

always@(posedge clk or posedge rst)begin
    if(rst)begin
        d_out<=0;
    end
    else begin
        case(mode)

        2'b00 : d_out<=d_out;
        2'b01 : d_out<={ d_out[WIDTH-2:0],shift_left};
        2'b10 : d_out<={shift_right,d_out[WIDTH-1:1]};
        2'b11 : d_out<=d_in;
        default : d_out<=d_out;
        endcase
    end
end
endmodule
