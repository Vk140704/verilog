// Code your testbench here
// or browse Examples
module sr_tb();
  reg s,r,clk;
  wire q;
   
  sr  dut(.s(s),.r(r),.clk(clk),.q(q));
  
 always  #5 clk = ~clk;
  initial begin
    $dumpfile("sr_tb.vcd");
    $dumpvars();
    $display(" Time \tclk \ts \tr \tq");
    $display("________________________________");
    $monitor(" %0t \t%b  \t%b \t%b \t%b",$time,clk,s,r,q);
    //initially
  #0  clk=0; s=0; r=0;
    #10 s=0; r=0;
    #10 s=0; r=1;
    #10 s=1; r=0;
    #10 s=1; r=1;
    #10 s=0; r=0;
    
    #20;
    $finish;
  end
endmodule 
