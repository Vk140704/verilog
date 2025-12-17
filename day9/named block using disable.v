module tb;
  integer count = 0;
  
  // Disable below count_loop block
  initial begin
    begin: count_loop
      forever begin
       count++;
        $display("At T = %0t: count = %0d", $time, count);
        if(count == 10) disable count_loop;
        #5;
      end
    end
  end
endmodule
