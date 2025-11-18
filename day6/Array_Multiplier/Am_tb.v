
`timescale 1ns/1ps                                                          
                                                                            
module tb_array_multiplier_4x4;                                             
                                                                            
    reg  [3:0] A;                                                           
    reg  [3:0] B;                                                           
    wire [7:0] P;                                                           
                                                                            
    // DUT                                                                  
    array_multiplier_4x4 uut (                                              
        .A(A),                                                              
        .B(B),                                                              
        .P(P)                                                               
    );                                                                      
                                                                            
    integer i, j;                                                           
    reg [7:0] expected;                                                     
                                                                            
    initial begin                                                           
        $display("===============================================");        
        $display("       4x4 ARRAY MULTIPLIER TESTBENCH");                  
        $display("===============================================");        
        $display("   A    B   |   DUT Output   | Expected | Pass?");        
        $display("-----------------------------------------------");        
                                                                            
        for (i = 0; i < 16; i = i + 1) begin                                
            for (j = 0; j < 16; j = j + 1) begin                            
                                                                            
                A = i;                                                      
                B = j;                                                      
                expected = i * j;                                           
                                                                            
                #1;  // small delay for output to settle                    
                                                                            
                $display("  %2d  x %2d  |    %3d (0x%02h) |  %3d     |  %s",
                    A, B, P, P, expected,                                   
                    (P == expected) ? "PASS" : "FAIL"                       
                );                                                          
                                                                            
            end                                                             
        end                                                                 
                                                                            
        $display("===============================================");        
        $display("               TEST FINISHED");                           
        $display("===============================================");        
                                                                            
        $finish;                                                            
    end                                                                     
                                                                            
endmodule                                                                   
                                                                            
