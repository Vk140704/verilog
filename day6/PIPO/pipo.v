// Code your design here
module PIPO #(parameter width=4)(
  input clk,rst, 
  input [width-1:0]data_in,
  output reg [width-1:0]data_out);
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      data_out<= 0;
    else 
      data_out<= data_in;
  end
endmodule
