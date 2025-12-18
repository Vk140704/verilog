module FIFO_sync #(
  parameter FIFO_depth = 8,
  parameter data_width = 4
)(
  input clk,
  input rst,
  input cs, 
  input w_en,
  input r_en,
  input [data_width-1:0] data_in,
  output reg [data_width-1:0] data_out,
  output wire full,
  output wire empty
);
  
  localparam FIFO_depth_log = $clog2(FIFO_depth);
  reg [data_width-1:0] fifo [0:FIFO_depth-1];
  reg [FIFO_depth_log:0] write_pointer;
  reg [FIFO_depth_log:0] read_pointer;
  
  // Write logic
  always@(posedge clk or negedge rst) begin
    if(!rst) begin
      write_pointer <= 0;
    end
    else if(cs && w_en && !full) begin
      fifo[write_pointer[FIFO_depth_log-1:0]] <= data_in;
      write_pointer <= write_pointer + 1'b1;
    end
  end
  
  // Read logic - FIXED: Only increment on read enable
  always@(posedge clk or negedge rst) begin
    if(!rst) begin
      data_out <= 0;
      read_pointer <= 0;
    end
    else if(cs && r_en && !empty) begin
      data_out <= fifo[read_pointer[FIFO_depth_log-1:0]];
      read_pointer <= read_pointer + 1'b1;
    end
  end
  
  // Status flags
  assign empty = (read_pointer == write_pointer);
  assign full = (read_pointer[FIFO_depth_log-1:0] == write_pointer[FIFO_depth_log-1:0]) && 
                (read_pointer[FIFO_depth_log] != write_pointer[FIFO_depth_log]);
  
endmodule
