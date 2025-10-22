module mux_tb();                                                            
reg i0,i1,i2,i3;                                                            
reg [1:0]sel;                                                               
wire y;                                                                     
mux uut(i0,i1,i2,i3,sel,y);                                                 
                                                                            
                                                                            
initial begin                                                               
$dumpfile("mux_tb.vcd");                                                    
$dumpvars();                                                                
$monitor("sel=%b -> i3 = %0b, i2 = %0b, i1 = %0b, i0 = %0b -> y = %0b",sel,i
3,i2,i1,i0,y);                                                              
{i3,i2,i1,i0} = 4'h5;                                                       
repeat(6)begin                                                              
        sel =$random;                                                       
        #5;                                                                 
end                                                                         
end                                                                         
endmodule                                                                   
