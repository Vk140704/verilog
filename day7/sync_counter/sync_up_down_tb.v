 // Code your testbench here
// or browse Examples
module syncounter_tb();
  reg clk,rst,up,down;
  wire [3:0]count;
  
  syncounter dut(clk,rst,up,down,count);
  initial begin
    $dumpfile("syncounter_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t | clk=%b | rst=%b | up=%b | down=%b | count=%b",$time,clk,rst,up,down,count);
    clk=0; rst=1;  down=0; up=1;
    #5 rst=0;
    #4 up=~up;
    #4 down=~down;
    #100 $finish;
    
  end
 always #2 clk=~clk;
endmodule
