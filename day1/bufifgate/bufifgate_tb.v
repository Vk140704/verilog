module bufif_tb();
reg a,control;
wire y;
bufifgate uut(.a(a),.control(control),.y(y));
initial begin
a=0; control=0;
#10 a=0; control=1;
#10 a=1; control=0;
#10 a=1; control=1;
#10 $finish;
end
initial begin
$dumpfile("bufif_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | CONTROL=%b | Y=%b ",$time,a,control,y);
end
endmodule

