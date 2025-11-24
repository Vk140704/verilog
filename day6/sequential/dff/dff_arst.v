// Code your design here
module dff(input clk,rst,din,output reg q);
  always@(posedge clk or posedge rst)begin
    if(rst)begin
      q<=0;
    end
    else 
      q<=din;
  end
endmodule 
