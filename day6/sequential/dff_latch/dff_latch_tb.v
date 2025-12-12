// Code your testbench here
// or browse Examples
module d_latch_tb();
  reg en,d;
  wire q;
  
  d_latch uut(en,d,q);
  
  initial begin
    $dumpfile("d_tb.vcd");
    $dumpvars();
  end
  
  
  initial begin
    $monitor(" time=%0t d=%b en=%b q=%b",$time,d,en,q);
    
    en=0; d=0;#10;
    en=1; d=1;#10;
    en=0; d=0;#10;
    en=1; d=0;#10;
    en=1; d=1;#10;
    $finish;
  end 
endmodule
