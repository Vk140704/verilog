// Code your testbench here
// or browse Examples
module piso_tb;
  reg clk, rst,load;
  reg [3:0]data_in;
  wire data_out;

  
  PISO  uut (.clk(clk),
             .rst(rst),
             .load(load),
             .data_in(data_in),
             .data_out(data_out)
            );

  initial begin
    clk = 0;
    forever #10 clk = ~clk; 
  end
  

 
  initial begin
    $dumpfile("piso.vcd");
    $dumpvars(0, piso_tb);
    $monitor("time=%0t clk=%b rst=%b data_in=%b data_out=%b",$time,clk,rst,data_in,data_out);

    rst = 1; load=0; data_in=4'b0000;#10;
    
    rst = 0; load=1; data_in=4'b1010; #10;
    
    load=0;#60;
    
    $finish;
    

    #100 $finish; 
  end
endmodule
