module or_tb();
reg a,b;
wire out;
orgate uut(.a(a),.b(b),.out(out));
initial 
begin
a=0; b=0;
#10 a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
$finish;
end
initial begin
$dumpfile("or_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | B=%b | out=%b",$time,a,b,out);
end 
endmodule
