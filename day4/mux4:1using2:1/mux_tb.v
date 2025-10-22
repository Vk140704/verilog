module mux_tb();                                                            
reg sel0,sel1;                                                              
reg i0,i1,i2,i3;                                                            
wire y;                                                                     
mux4_1 uut(i0,i1,i2,i3,sel0,sel1,y);                                        
initial begin                                                               
$monitor("sel0=%0b,  sel=%0b -> i0 =%0b, i1 =%0b, i2 =%b, i3 =%b, y=%0b ",sel0,sel1,i0,i1,i2,i3,y);                                                     
{i0,i1,i2,i3} = 4'h5;                                                       
 repeat(6)begin                                                             
 {sel0,sel1} = $random;                                                     
#5;                                                                         
end                                                                         
end                                                                         
endmodule                                                                   
