module halfsubtract(input a,b,output dif,brw);                                     
xor(dif,a,b);                                                               
and(brw,~a,b);                                                              
endmodule 

