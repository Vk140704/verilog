module tb;

  reg clk;
  reg arst;
  reg din;
  wire q;

  // Instantiate DFF
  dff dut (clk, arst, din, q);

  // Clock: toggles every 5 ns → period 10 ns
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    arst = 1;  // reset active initially
    din = 0;

    // monitor prints real-time values
    $monitor("TIME=%0t  clk=%b  arst=%b  din=%b  q=%b",
              $time, clk, arst, din, q);

    #12 arst = 0;   // release reset

    #10 din = 1;    // change input
    #10 din = 0;

    #10 din = 1;
    #10 din = 0;

    #10 arst = 1;   // reset again
    #10 arst = 0;   // release reset

    #20 $finish;
  end

  // waveform dump
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

endmodule
