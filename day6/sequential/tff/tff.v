// Code your design here
module tff(input clk,rst,t,output reg q);
  always@(posedge clk )begin
    if(rst)begin
      q<=0;
    end
    else begin
      q<=~t;
    end
  end
endmodule
