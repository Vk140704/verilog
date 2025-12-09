// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse Examples
module seq_1110_tb();
  reg clk,rst,x;
  wire z;
  
  seq_1110 dut(clk,rst,x,z);
  always #6 clk =~clk;
  initial begin
    $dumpfile("seq_1110_tb.vcd");
    $dumpvars();
    $monitor(" Time=%0t | clk=%b | rst=%b | x=%b | state=%h | z=%b ",$time,clk,rst,x,dut.state,z);
    
    clk=0; rst=1; x=0;
    #2rst=0;
    
    #11 x=1;
    #12 x=0;
    #12 x=1;
    #12 x=0;
    #12 x=1;
    #12 x=1;
    #12 x=1;
    #12 x=0;
    #12 x=0;
    #12 x=0;
    #12 x=1;
    #12 x=0;
    #12 x=1;
    
    #30 $finish;
   
  end
endmodule  
