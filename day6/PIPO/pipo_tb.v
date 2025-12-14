
// Code your testbench here
// or browse Examples
module PIPO_tb();
  reg clk,rst;
  reg [3:0]data_in;
  wire [3:0]data_out;
  
  PIPO dut(clk,rst,data_in,data_out);
  always #5 clk=~clk;
  initial begin
    $dumpfile ("PIPO_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t clk=%b rst=%b Data_in=%b Data_out=%b",$time,clk,rst,data_in,data_out);
    
    clk=0; rst=1; data_in=1;
    #20 rst=0;
    #12 data_in=4'b0000;
    #12 data_in=4'b1010;
    #12 data_in=4'b1100;
    #12 data_in=4'b1110;
    #12 data_in=4'b0011;
    #12 data_in=4'b1101;
    #100 $finish;
  end
endmodule
