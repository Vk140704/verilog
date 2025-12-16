// Code your design here
module SIPO #(parameter width=4)(input clk,rst,data_in,output reg [width-1:0]data_out);
  always@(posedge clk or posedge rst)begin
    if(rst)
      data_out <= 1'b0;
    else 
      data_out <= {data_out[width-2:0],data_in};
  end
endmodule
      
      
  
