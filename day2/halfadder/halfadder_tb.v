module half_tb();
reg a,b;
wire sum,carry;
halfadder uut(.a(a),.b(b),.sum(sum),.carry(carry));
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
$monitor("%0t | A=%b | B=%b | SUM=%b | CARRY=%b ",$time,a,b,sum,carry);
end
endmodule

