module not_tb();
reg a;
wire out;
notgate uut(.a(a),.out(out));
initial begin
#10 a=0;
#10 a=1;
#10 $finish;
end
initial begin
$dumpfile("not_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | out=%b ",$time,a,out);
end
endmodule

