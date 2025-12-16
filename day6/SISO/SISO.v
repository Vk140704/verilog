// Code your design here
module SISO #(parameter width = 4)(input clk,rst,data_in,output reg data_out);
  always@(posedge clk or posedge rst)begin
    if(rst)
      data_out<=1'b0;
    else 
      data_out<= data_in;
    
  end
endmodule
