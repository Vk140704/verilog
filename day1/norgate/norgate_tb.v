module nor_tb();
reg a,b;
wire out;
norgate uut(.a(a),.b(b),.out(out));
initial begin 
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin
$dumpfile("nor_tb.vcd");
$dumpvars();
$monitor("%0t | A =%B | B =%b | OUT =%b",$time,a,b,out);
end 
endmodule
