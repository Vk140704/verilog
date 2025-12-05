module seq_1010_tb();
  reg clk,rst,x;
  wire z;
  seq_1010 dut(clk,rst,x,z);
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("seq_1010_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t | clk=%b | x=%b | state=%h | z=%b ",$time,clk,x,dut.state,z);
    
    clk=0; x=0; rst=1;
    #2 rst=0;
    
    // Test 1010 overlapping
    #10 x=1;  // First 1
    #12 x=0;  // 0
    #12 x=1;  // 1
    #12 x=0;  // 0 → z=1 (first detection)
    #12 x=1;  // Next 1 (overlap)
    #12 x=0;  // 0 → z=1 again (second detection)
    
    #30 $finish;
  end 
endmodule
