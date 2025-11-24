// Code your testbench here
// or browse Examples
module tb;

  reg clk;
  reg rst;
  reg din;
  wire q;

  // Instantiate DFF
  dff dut (clk, rst, din, q);

  // Clock: toggles every 5 ns → period 10 ns
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;  // reset active initially
    din = 0;

    // monitor prints real-time values
    $monitor("TIME=%0t  clk=%b  rst=%b  din=%b  q=%b",
              $time, clk, rst, din, q);

    #12 rst = 0;   // release reset

    #10 din = 1;    // change input
    #10 din = 1;

    #10 din = 1;
    #10 din = 1;

    #10 rst = 1;   // reset again
    #10 rst = 0;   // release reset

    #20 $finish;
  end

  // waveform dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

endmodule
