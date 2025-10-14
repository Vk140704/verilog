module full_tb();                                                           
reg a,b,cin;                                                                
wire sum,cout;                                                              
fulladder uut(a,b,cin,sum,cout);                                            
initial begin                                                               
#10 a=0; b=0; cin=0;                                                        
#10 a=0; b=0; cin=1;                                                        
#10 a=0; b=1; cin=0;                                                        
#10 a=0; b=1; cin=1;                                                        
#10 a=1; b=0; cin=0;                                                        
#10 a=1; b=0; cin=1;                                                        
#10 a=1; b=1; cin=0;                                                        
#10 a=1; b=1; cin=1;                                                        
#10 $finish;                                                                
end                                                                         
initial begin                                                               
$dumpfile("full_tb.vcd");                                                   
$dumpvars();                                                                
$monitor("%0t|  A=%b | B=%b | cin=%b | SUM=%b | COUT=%b ",$time,a,b,cin,sum,
cout);                                                                      
end                                                                         
endmodule                                                                   
