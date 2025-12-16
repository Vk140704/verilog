// Code your testbench here
// or browse Examples
module SISO_tb();
  reg clk,rst,data_in;
  wire data_out;
  
  SISO dut(clk,rst,data_in,data_out);
  
  initial begin
   forever #2 clk=~clk;
  end
  
initial  fork 
    $dumpfile("SISO_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t clk=%b rst=%b data_in=%b data_out=%b ",$time,clk,rst,data_in,data_out);
    
    clk=0; rst=1;data_in=0;
    #3 rst=0;
    #10 data_in=1;
    #12 data_in=1;
    #14 data_in=0;
    #16 data_in=1;
    #18 data_in=1;
    #20 data_in=0;
    #22 data_in=0;
    #24 data_in=0;
    #26 data_in=1;
    #50 $finish;
  
  join
endmodule 
