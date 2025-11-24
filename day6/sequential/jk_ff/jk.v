// Code your design here
// Code your design here
module jk(input j,k,clk,output reg q);
  always@(posedge clk )begin
    if(j&k)begin
      q<=~q;
    end
    else if(k)begin
      q<=~k;
    end
    else if (j) begin
     q<=j;
    end
    else begin
    q<=q;
    end
  end 
endmodule
