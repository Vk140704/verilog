module tb_rca();                                                        
                                                                        
    parameter N = 8; // You can change this for 4-bit, 8-bit, etc.      
                                                                        
    reg  [N-1:0] a, b;                                                  
    reg          cin;                                                   
    wire [N-1:0] sum, cout;                                             
                                                                          
    rca #(.size(N)) DUT (                                               
        .a(a),                                                          
        .b(b),                                                          
        .cin(cin),                                                      
        .sum(sum),                                                      
        .cout(cout)                                                     
    );                                                                  
                                                                            
    initial begin                                                       
        $monitor("Time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b",  
                 $time, a, b, cin, sum, cout);                          
    end                                                                 
                                                                                                                  
    initial begin                                                       
        a = 8'b00000000; b = 8'b00000000; cin = 0; #10;                 
        a = 8'b00000001; b = 8'b00000001; cin = 0; #10;                 
        a = 8'b00001111; b = 8'b00000001; cin = 0; #10;                 
        a = 8'b11111111; b = 8'b00000001; cin = 0; #10;                 
        a = 8'b01010101; b = 8'b00110011; cin = 1; #10;                 
        a = 8'b11110000; b = 8'b00001111; cin = 1; #10;                 
        a = 8'b10101010; b = 8'b01010101; cin = 0; #10;                 
        a = 8'b10000000; b = 8'b10000000; cin = 1; #10;                 
                                                                        
        $finish;                                                        
    end                                                                 
                                                                        
endmodule                                                               
                                                                        
