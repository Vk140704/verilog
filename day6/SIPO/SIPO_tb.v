// Code your testbench here
// or browse Examples
module SIPO_tb();
  reg clk,rst,data_in;
  wire [3:0]data_out;
  
  SIPO dut(clk,rst,data_in,data_out);
  
  always #5 clk=~clk;
  initial begin
    $dumpfile("SIPO_tb.vcd");
    $dumpvars();
    $monitor(" TIME=%0t clk=%b rst=%b data_in=%b data_out=%b ",$time,clk,rst,data_in,data_out);
   clk=0;
    rst=1; data_in=0;
    #20rst = 0;
    #12 data_in=1;
    #12 data_in=0;
    #12 data_in=1;
    #12 data_in=1;
    #12 data_in=1;
    #12 data_in=0;
    #12 data_in=0;
    #10$finish;
  end
endmodule 
