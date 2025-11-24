// Code your testbench here
// or browse Examples
module jk_tb();
  reg j,k,clk;
  wire q;
   
  jk  dut(.j(j),.k(k),.clk(clk),.q(q));
  
 always  #5 clk = ~clk;
  initial begin
    $dumpfile("jk_tb.vcd");
    $dumpvars();
    $display(" Time \tclk \tj \tk \tq");
    $display("________________________________");
    $monitor(" %0t \t%b  \t%b \t%b \t%b",$time,clk,j,k,q);
    //initially
  #0  clk=0; j=0; k=0;
    #10 j=0; k=0;
    #10 j=0; k=1;
    #10 j=1; k=0;
    #10 j=1; k=1;
    #10 j=0; k=0;
    
    #20;
    $finish;
  end
endmodule 
