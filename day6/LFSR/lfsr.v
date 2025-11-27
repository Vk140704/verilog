module lfsr (input clk,rst,output reg [3:0]op);
  always@(posedge clk)begin
    if(rst)begin
      op <= 4'hf;
    end
    else 
      op <= {op[2:0],op[3]^op[2]};
  end
endmodule
