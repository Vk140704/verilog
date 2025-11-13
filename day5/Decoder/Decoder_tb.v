module decode_tb();              
reg [2:0]D;                      
wire [7:0]Y;                     
                                 
decoder d1(D,Y);                 
initial begin                    
$monitor("D=%0b -> Y=%0b",D,Y);  
repeat(5)begin                   
D=$random; #1;                   
end                              
end                              
endmodule                        
