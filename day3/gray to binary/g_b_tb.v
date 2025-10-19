module b_g_tb();                          
reg[3:0]in;                               
wire[3:0] outb,outg;                      
bi_gr uut1(.b(in),.g(outg));              
gr_bi uut2(.g(in),.b(outb));              
                                          
initial begin                             
in=4'b0000;                               
#10 in=4'b0101;                           
#10 in=4'b0010;                           
#10 in=4'b1110;                           
#10 in=4'b1111;                           
$finish;                                  
end                                       
                                          
initial begin                             
$dumpfile("b_g_tb.vcd");                  
$dumpvars();                              
$monitor("%0t | B=%b | G=%b | outb=%b |out
g=%b",$time,in,in,outb,outg);             
end                                       
endmodule                                 
