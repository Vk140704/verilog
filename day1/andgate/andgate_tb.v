module and_tb ();
reg i0,i1;
wire out;
and_gate uut(.i0(i0),.i1(i1),.out(out));
initial
 begin
#10 i0=0; i1=0;
#10 i0=0; i1=1;
#10 i0=1; i1=0;
#10 i0=1; i1=1;
$finish;
end
initial 
begin
$dumpfile("and_tb.vcd");
$dumpvars();
$monitor("Time=%0t | I0 =%b | I1 =%b | out=%b",$time,i0,i1,out);
end
endmodule
