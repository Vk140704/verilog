// Enter source text here
module dff(input clk,rst,d,output reg q);
always@(posedge clk or posedge rst)begin
if(rst)begin
    q<=1'b0;
end
else begin
 q<=d;
end
end
endmodule

module async_count(input clk,rst,output [3:0] q);

dff d0(.clk(clk),.rst(rst),.d(~q[0]),.q(q[0]));
dff d1(.clk(q[0]),.rst(rst),.d(~q[1]),.q(q[1]));
dff d2(.clk(q[1]),.rst(rst),.d(~q[2]),.q(q[2]));
dff d3(.clk(q[2]),.rst(rst),.d(~q[3]),.q(q[3]));



endmodule
