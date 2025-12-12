// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module  ringcounter_tb();
 reg clk,rst;
  wire [3:0]q;
  
  ringcounter uut(clk,rst,q);
  initial begin
    clk=0;
    forever#5 clk=~clk;
  end
  
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars();
  end
  
  initial begin
    $monitor(" clk=%b rst=%b q=%b",clk,rst,q);
    rst=1; #20;
    rst=0; #100;
    rst=1; #20;
    rst=0; #100;
    #10;
    $finish;
  end
endmodule
