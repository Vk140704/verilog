module lfsr_tb();
reg clk,rst;
wire [3:0]out;

lfsr dut(.clk(clk),.rst(rst),.out(out));
initial begin
$dumpfile("lfsr_tb.vcd");
$dumpvars();
$monitor(" Time=%0t | clk=%0b | rst=%b | out=%b ",$time,clk,rst,out);
clk=0; rst=1;
#5 rst=0;
#50 $finish;
end
always #2 clk = ~clk;
endmodule

