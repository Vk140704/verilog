module full_tb();
reg a,b,bin;
wire dif,brw;
fullsubtract uut(a,b,bin,dif,brw);
initial begin
#10 a=0; b=0; bin=0;
#10 a=0; b=0; bin=1;
#10 a=0; b=1; bin=0;
#10 a=0; b=1; bin=1;
#10 a=1; b=0; bin=0;
#10 a=1; b=0; bin=1;
#10 a=1; b=1; bin=0;
#10 a=1; b=1; bin=1;
#10 $finish;
end 
initial begin
$dumpfile("full_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | B=%b | BIN=%b | DIF=%b | BRW=%b",$time,a,b,bin,dif,brw);
end
endmodule
