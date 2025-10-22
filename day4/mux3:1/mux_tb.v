module mux_tb();                                                            
reg i0,i1,i2,sel0,sel1;                                                     
wire y;                                                                     
mux3_1 uut(.i0(i0),.i1(i1),.i2(i2),.sel0(sel0),.sel1(sel1),.y(y));          
initial begin                                                               
$monitor("sel0 =%b sel1=%b -> i0 =%b, i1 =%b, i2 =%b, y =%b",sel0,sel1,i0,i1,i2,y);                                                                     
{i0,i1,i2} = 3'h5;                                                          
repeat(6)begin                                                              
{sel0,sel1}=$random;                                                        
#5;                                                                         
end                                                                         
end                                                                         
endmodule                                                                   
