module half_tb();
wire dif,brw;
reg a,b;
halfsubtract uut(.a(a),.b(b),.dif(dif),.brw(brw));
initial begin 
#10 a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin 
$dumpfile("half_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | B=%b | DIF=%b | BRW=%b",$time,a,b,dif,brw);
end 
endmodule
