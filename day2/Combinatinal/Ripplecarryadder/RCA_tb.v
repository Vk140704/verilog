module rca_tb();                                                         
reg[3:0] a,b;                                                            
wire[3:0]sum;                                                            
wire carry;                                                              
rca uut(.a(a),.b(b),.sum(sum),.carry(carry));                            
initial begin                                                            
#10 a=4'b0000; b=4'b0000;                                                
#10 a=4'b0001; b=4'b0001;                                                
#10 a=4'b1111; b=4'b0101;                                                
#10 a=4'b1111; b=4'b1111;                                                
#10 $finish;                                                             
end                                                                      
initial begin                                                            
$dumpfile("rca_tb.vcd");                                                 
$dumpvars();                                                             
$monitor("%0t | A=%b | B=%b | SUM=%b  | CARRY=%b",$time,a,b,sum,carry);  
end                                                                      
endmodule                                                                
