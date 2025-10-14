module all_tb();
wire and_out,or_out,nand_out,nor_out,not_out,xor_out,xnor_out;
reg a,b;
allgate uut(.a(a),.b(b),.and_out(and_out),.or_out(or_out),.not_out(not_out),.nor_out(nor_out),.xor_out(xor_out),.nand_out(nand_out),.xnor_out(xnor_out));
initial begin
a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end
initial begin 
$dumpfile("all_tb.vcd");
$dumpvars();
$monitor("%0t | A=%b | B=%b | AND_OUT=%b | OR_OUT=%b | NOT_OUT=%b | NAND_OUT=%b | NOR_OUT=%b | XOR_OUT=%b | XNOR_OUT=%b",$time,a,b,and_out,or_out,not_out,nand_out,nor_out,xor_out,xnor_out);
end
endmodule
