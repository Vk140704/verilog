module nand_tb();
reg a,b;
wire out;
nandgate uut(.a(a),.b(b),.out(out));
initial begin
a=0; b=0;
#10 a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
$finish;
end
initial begin
$dumpfile("nand_tb.vcd");
$dumpvars();
$monitor("%0t  | A =%b | B =%b | OUT =%b ",$time,a,b,out);
end
endmodule
