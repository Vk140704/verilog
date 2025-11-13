module comp_tb();                                                           
reg [3:0]a,b;                                                               
wire a_gt_b,a_ls_b,a_eq_b;                                                  
                                                                            
comp c1(a,b,a_gt_b,a_ls_b,a_eq_b);                                          
                                                                            
initial begin                                                               
                                                                            
$monitor("a=%0h b=%0h a_gtb=%0b  a_ls_b=%0b a_eq_b=%0b",a,b,a_gt_b,a_ls_b,a_eq_b);                                                                      
                                                                            
repeat(8)begin                                                              
a=$random; b=$random; #1;                                                   
end                                                                         
end                                                                         
endmodule                                                                   
