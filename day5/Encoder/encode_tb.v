module en_tb();                                                
reg [7:0]d;                                                    
wire [2:0]y;                                                   
                                                               
encode e1(d,y);                                                
                                                               
initial begin                                                  
                                                               
        d=8'b00000001;#1;                                      
        for(integer i=0;i<8;i=i+1)begin                        
        $display("D=%0b(in dec: %0d) ->  y=%0h",d,i,y);        
d=d<<1;#1;                                                     
end                                                            
end                                                            
endmodule                                                      
