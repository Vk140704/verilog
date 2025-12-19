module sync_fifo_TB;
  parameter DATA_WIDTH = 8;
  parameter DEPTH = 8;
  
  reg clk, rst;
  reg w_en, r_en;
  reg [DATA_WIDTH-1:0] data_in;
  wire [DATA_WIDTH-1:0] data_out;
  wire full, empty;
  
  // Memory to store expected data (replaces SystemVerilog queue)
  reg [DATA_WIDTH-1:0] expected_mem [0:99];
  integer write_idx = 0;
  integer read_idx = 0;
  integer mem_count = 0;
  reg [DATA_WIDTH-1:0] expected_data;
  
  // Instantiate YOUR fifo module
  fifo #(
    .depth(DEPTH),
    .data_width(DATA_WIDTH)
  ) dut (
    .clk(clk),
    .rst(rst),
    .w_en(w_en),
    .r_en(r_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
  );
  
  // Clock generation - 100MHz (10ns period)
  always #5 clk = ~clk;
  
  // Write test process
  initial begin
    // Initialize
    clk = 1'b0;
    rst = 1'b0;
    w_en = 1'b0;
    data_in = 0;
    
    // Reset sequence
    repeat(10) @(posedge clk);
    rst = 1'b1;
    
    // Run 2 test sequences
    repeat(2) begin
      for (integer i = 0; i < 30; i = i + 1) begin
        @(posedge clk);
        
        // Write on even cycles (0, 2, 4, ...)
        w_en = (i % 2 == 0) ? 1'b1 : 1'b0;
        
        if (w_en && !full) begin
          // Generate random data
          data_in = $random;
          
          // Store in memory (like push_back)
          expected_mem[write_idx] = data_in;
          write_idx = write_idx + 1;
          mem_count = mem_count + 1;
          
          // Wrap around if needed
          if (write_idx >= 100) write_idx = 0;
          
          $display("[WRITE] Time = %0t: data_in = %h, w_ptr = %d", 
                   $time, data_in, dut.w_ptr);
        end
        else begin
          w_en = 1'b0;
        end
      end
      #50; // Wait 50ns between sequences
    end
    
    // Wait for test completion
    #1000;
    $display("\n=== Write test completed ===");
    $finish;
  end
  
  // Read test process
  initial begin
    // Initialize read side
    r_en = 1'b0;
    
    // Wait longer before starting reads
    repeat(20) @(posedge clk);
    rst = 1'b1;
    
    // Run 2 test sequences
    repeat(2) begin
      for (integer i = 0; i < 30; i = i + 1) begin
        @(posedge clk);
        
        // Read on even cycles
        r_en = (i % 2 == 0) ? 1'b1 : 1'b0;
        
        if (r_en && !empty) begin
          // Wait a bit for data to appear
          #1;
          
          if (mem_count > 0) begin
            // Get expected data from memory (like pop_front)
            expected_data = expected_mem[read_idx];
            read_idx = read_idx + 1;
            mem_count = mem_count - 1;
            
            // Wrap around if needed
            if (read_idx >= 100) read_idx = 0;
            
            // Compare with FIFO output
            if (data_out !== expected_data) begin
              $display("[ERROR] Time = %0t: Expected = %h, Received = %h", 
                       $time, expected_data, data_out);
            end
            else begin
              $display("[PASS] Time = %0t: Expected = %h, Received = %h", 
                       $time, expected_data, data_out);
            end
          end
        end
        else begin
          r_en = 1'b0;
        end
      end
      #50; // Wait 50ns between sequences
    end
  end
  
  // Monitor to track FIFO state
  initial begin
    $monitor("Time=%0t: rst=%b, w_en=%b, r_en=%b, data_in=%h, data_out=%h, full=%b, empty=%b, w_ptr=%d, r_ptr=%d",
             $time, rst, w_en, r_en, data_in, data_out, full, empty, dut.w_ptr, dut.r_ptr);
  end
  
  // VCD dump for waveform viewing
  initial begin
    $dumpfile("fifo_dump.vcd");
    $dumpvars(0, sync_fifo_TB);
  end
  
  // Timeout to prevent infinite simulation
  initial begin
    #10000;
    $display("\n=== Simulation timeout ===");
    $finish;
  end
  
endmodule
