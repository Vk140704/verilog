// Code your design here
module syncounter #(parameter width=4)(input clk,rst,up,down ,output reg [width-1:0]count);
  always@(posedge clk )begin
    if(rst)begin
      count<=4'b0;
    end
    else 
      if(up)begin
        count<= count+1'b1;
      end
      else begin
        if(down)begin
        count<= count-1'b1;
        end
        else count<=count;
      end
  end
endmodule 
