// Code your testbench here
// or browse Examples
module tb;
  reg[3:0] x1,x2,x3;
  reg[3:0] i1,i2,i3;
  
  initial begin: seq_blk1
    
    $monitor(" Time=%0t i1=%0d i2=%0d i3=%0d x1=%0d x2=%0d x3=%0d",$time,i1,i2,i3,x1,x2,x3);
    
    i1=4;
    #2 i2=3;
    #5 i3=7;
    
  end
    
  initial begin: seq_blk2
    
    #10
    //parallel block
    fork: prl_blk
      x1= i1;
      #2 x2 =i2;
      #5x3 =i3;
    join
    #15 x1 =i1+i2;
  end
endmodule
    
