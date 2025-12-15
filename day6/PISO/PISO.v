// Code your design here
module PISO #(parameter width = 4)(
  input clk,rst,load,
  input [width-1:0]data_in,
  output reg data_out );
  
  reg [width-1:0] shift_reg;
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      shift_reg <= 0;
    else if(load)
      shift_reg <= data_in;
    else
      shift_reg <= {shift_reg[width-2:0],1'b0};   
  end
  
  always@(*)begin
    data_out = shift_reg[width-1];
  end
endmodule
