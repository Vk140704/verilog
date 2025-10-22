module dmux_tb();                     
reg i,sel;                            
wire y0,y1;                           
dmux uut(.i(i),.sel(sel),.y0(y0),.y1(y
1));                                  
initial begin                         
 sel=0; i=0; #1;                      
 sel=0; i=1; #1;                      
 sel=1; i=0; #1;                      
 sel=1; i=1; #1;                      
end                                   
initial begin                         
$monitor("sel =%b -> i =%b, y0 =%b, y1
 =%b",sel,i,y0,y1);                   
#5;                                   
end                                   
endmodule                             
