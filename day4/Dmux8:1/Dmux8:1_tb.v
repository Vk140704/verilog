module tb_dmux;                                                       
                                                                      
  reg [7:0] a;                                                        
  reg [2:0] sel;                                                      
  wire out;                                                           
                                                                                                          
  dmux uut (                                                          
    .a(a),                                                            
    .sel(sel),                                                        
    .out(out)                                                         
  );                                                                  
                                                                      
  integer i;                                                          
                                                                      
  initial begin                                                                                                      
    $monitor("Time=%0t : sel=%b a=%b out=%b", $time, sel, a, out);    
                                                                    
    for (i = 0; i < 20; i = i + 1) begin                              
      a = $random;      // random 8-bit input                         
      sel = $random % 8; // random 3-bit select (0 to 7)             
      #10;                                                            
    end                                                               
                                                                      
    $finish;                                                          
  end                                                                 
                                                                      
endmodule                                                             
                                                                      
