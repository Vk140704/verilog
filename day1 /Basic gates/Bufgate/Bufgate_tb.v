module buf_tb();
reg a;
wire y;
bufgate uut(.a(a),.y(y));
initial begin 
a=0;
#10 a=1;
#10 a=0;
#10 $finish;
end 
initial begin
$dumpfile("buf_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | y=%b  ",$time,a,y);
end
endmodule
