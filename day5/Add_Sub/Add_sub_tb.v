`timescale 1ns/1ps                                                      
                                                                        
module tb_ripplecarry_add_sub;                                          
                                                                        
  // 4-bit test signals                                                 
  reg  [3:0] a, b;                                                      
  reg  ctrl;                 // 0 = Add, 1 = Sub                        
  wire [3:0] s, cout;                                                   
                                                                        
  // Instantiate the DUT (Device Under Test)                            
  ripplecarry_add_sub DUT (                                             
    .a(a),                                                              
    .b(b),                                                              
    .ctrl(ctrl),                                                        
    .s(s),                                                              
    .cout(cout)                                                         
  );                                                                    
                                                                        
  // Apply test vectors                                                 
  initial begin                                                         
    $display("CTRL |   A   |   B   |   S(Result)  | Carry[3]");         
    $monitor("  %b   |  %b |  %b |     %b     |    %b", ctrl, a, b, s, cout[3]);                                                                
                                                                        
    // Test 1: ADDITION (CTRL = 0)                                      
    ctrl = 0; a = 4'b0011; b = 4'b0101; #10; // 3 + 5 = 8               
                                                                        
    // Test 2: ADDITION                                                 
    ctrl = 0; a = 4'b1111; b = 4'b0001; #10; // 15 + 1 = 16 (overflow)  
                                                                        
    // Test 3: SUBTRACTION (CTRL = 1)                                   
    ctrl = 1; a = 4'b0110; b = 4'b0011; #10; // 6 - 3 = 3               
                                                                        
    // Test 4: SUBTRACTION                                              
    ctrl = 1; a = 4'b0100; b = 4'b0111; #10; // 4 - 7 = -3 (2’s complement = 1101)                                                              
                                                                        
    // Test 5: SUBTRACTION (0 - 1)                                      
    ctrl = 1; a = 4'b0000; b = 4'b0001; #10; // 0 - 1 = 1111 (borrow)   
                                                                        
    $finish;                                                            
  end                                                                   
                                                                        
endmodule                                                               
