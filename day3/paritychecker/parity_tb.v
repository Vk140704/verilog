module parity_tb();                                         
reg [4:0]a;                                                 
wire evenparity;                                            
paritychecker uut(a,evenparity);                            
initial begin                                               
#10 a=5'b10100;                                             
#10 a=5'b11011;                                             
#10 a=5'b10011;                                             
#10 a=5'b11110;                                             
#10 $finish;                                                
end                                                         
initial begin                                               
$dumpfile("parity_tb.vcd");                                 
$dumpvars();                                                
$monitor("%0t | A=%b | EVENPARITY=%b",$time,a,evenparity);  
end                                                         
endmodule                                                   
