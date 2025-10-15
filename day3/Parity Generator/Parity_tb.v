 module parity_tb();                                      
 reg[3:0] a;                                              
 wire y;                                                  
 paritygen uut(.a(a),.y(y));                              
 initial begin                                            
 #10 a=4'b0000;                                           
 #10 a=4'b0100;                                           
 #10 a=4'b0101;                                           
 #10 a=4'b0010;                                           
 #10 a=4'b0110;                                           
 #10 a=4'b1111;                                           
 #10 $finish;                                             
 end                                                      
 initial begin                                            
 $dumpfile("parity_tb.vcd");                              
 $dumpvars();                                             
 $monitor("%0t | A=%b | Y=%b ",$time,a,y);                
 end                                                      
 endmodule                                                
