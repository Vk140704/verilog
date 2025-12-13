// Code your testbench here
// or browse Examples
module jk_tb();
  reg j,k;
  wire q;
  
  jk_latch dut(j,k,q);
  initial begin
    $dumpfile("jk_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t j=%b k=%b q=%b ",$time,j,k,q);
    
    j=0; k=0; #10;
    j=0; k=1; #10;
    j=1; k=0; #10;
    j=1; k=1; #10;
     $finish;
    
  end
endmodule
