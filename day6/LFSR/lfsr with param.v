// Enter source text here
module lfsr #(parameter Width = 4)(input clk,rst,output reg [Width-1:0]out );
always@(posedge clk)begin
if(rst)begin
out <= 4'hf;
end
else begin
 out <= {out[Width-2:0],(out[3]^out[2])};
end
end
endmodule
