// Code your testbench here
// or browse Examples
module t_tb();
  reg en, t;
  wire q;
  
  t_latch dut(en,t,q);
  initial begin
    $dumpfile("t_tb.vcd");
    $dumpvars;
    $monitor(" Time=%0t en=%b t=%b q=%b ",$time,en,t,q);
    
    en=0; t=0;#10;
    en=0; t=1;#10;
    en=1; t=0;#10;
    en=1; t=1;#10;
    $finish;
  end
endmodule 
