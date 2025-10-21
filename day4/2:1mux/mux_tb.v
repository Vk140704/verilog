module mux2_1_tb();                                                 
reg i0,i1,sel;                                                      
wire y;                                                             
mux2_1 uut(i0,i1,sel,y);                                            
initial begin                                                       
#10 i0=0; i1=0; sel=0;                                              
#10 i0=0; i1=1; sel=0;                                              
#10 i0=1; i1=0; sel=1;                                              
#10 i0=1; i1=1; sel=1;                                              
$finish;                                                            
end                                                                 
initial begin                                                       
$dumpfile("mux2:1_tb.vcd");                                         
$dumpvars();                                                        
$monitor("%0t | I0=%b | I1=%b | SEL=%b |Y=%b",$time,i0,i1,sel,y);   
end                                                                 
endmodule                                                           
