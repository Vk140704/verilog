module sr_tb();
  reg s,r; wire q;  
  sr_latch uut(s,r,q);
  initial begin 
    $dumpfile ("sr_tb.vcd");  
    $dumpvars(); 
    $monitor(" Time=%0t s=%b r=%b q=%b ",$time,s,r,q); 
    s=0; r=0;#10; 
    s=0; r=1;#10;
    s=1; r=0;#10; 
    s=1; r=1;#10;
    $finish; end
endmodule
