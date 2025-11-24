// Code your design here
module dff(input clk ,rst , din,output reg q);
  always@(posedge clk)begin
    if (rst)
      q<=1'b0;
    else 
      q<=din;
    
  end
endmodule 
