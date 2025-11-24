// Code your design here
module sr(input s,r,clk,output reg q);
  always@(posedge clk )begin
    if(s&r)begin
      q<=1'bx;
    end
    else if(r)begin
      q<=~r;
    end
    else if (s) begin
     q<=s;
    end
    else begin
    q<=q;
    end
  end 
endmodule
