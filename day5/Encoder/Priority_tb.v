module pencode_tb();                  
reg [7:0]D;                           
wire [2:0]Y;                          
                                      
pencode p1(D,Y);                      
                                      
initial begin                         
$monitor("D=%b -> y = %0b",D,Y);      
repeat(8)begin                        
D= $random; #1;                       
end                                   
end                                   
endmodule                             
