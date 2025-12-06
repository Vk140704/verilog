
module seq_1111_tb();
  reg clk,rst,x;
  wire z;
  
  
  seq_1111 dut(clk,rst,x,z);
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("seq_1111_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t | clk=%b | rst=%b | x=%b | state=%h |z=%b ",$time,clk,rst,x,dut.state,z);
    
    clk=0; rst=1; x=0;
    #10rst=0;
    #12 x=1;
    #12 x=1;
    #12 x=0;
    #12 x=1;
    #12 x=1;
    #12 x=1;
    #12 x=1;
    #12 x=1;
    #12 x=1;
    #30 $finish;
  end
endmodule
