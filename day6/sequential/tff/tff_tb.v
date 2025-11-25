// Code your testbench here
// or browse Examples
module tff_tb();
  reg clk,rst,t;
  wire q;
  tff dut(clk,rst,t,q);
  
  initial begin
    $dumpfile("tff_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t | clk=%b | rst=%b | t=%b | q=%b |",$time,clk,rst,t,q);
    clk=0;rst=0;t=0;
   
   
    #10 t=1;
    #10 t=0;
    #80 $finish;
     
  end
  always #5 clk = ~clk;
  always #15 rst =~rst;
endmodule
