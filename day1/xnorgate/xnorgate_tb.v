module xnor_tb();
reg a,b;
wire out;
xnorgate uut(.a(a),.b(b),.out(out));
initial begin
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin 
$dumpfile("xnor_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | B=%b | out=%b",$time,a,b,out);
end
endmodule
