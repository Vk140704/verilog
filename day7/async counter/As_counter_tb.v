// Enter testbench code here
module async_count_tb();
reg clk,rst;
wire[3:0] q;

async_count dut(.clk(clk),.rst(rst),.q(q));

always #5 clk=~clk;

initial begin
$dumpfile("async_count_tb.vcd");
$dumpvars();
$monitor(" Time=%0t | clk=%b | rst=%b | q=%b ",$time,clk,rst,q);
clk=0; rst=1;
#10 rst=0;
#200 $finish;

end

endmodule 
