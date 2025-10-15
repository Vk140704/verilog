module mode_tb();
reg a,b,control;
wire out,cout;
full_adder uut(a,b,control,out,cout);
initial begin
#10 a=4'b0001; b=4'b1010; control=1;
#10 a=4'b0000; b=4'b1110; control=0;
#10 a=4'b1010; b=4'b0010; control=0;
#10 a=4'b1111; b=4'b0101; control=0;
#10 $finish;
end
initial begin
$dumpfile("mode_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | B=%b | control=%b | OUT=%b | RIPPLE_OUT=%b ",$time,a,b,control,out,cout);
end
endmodule
