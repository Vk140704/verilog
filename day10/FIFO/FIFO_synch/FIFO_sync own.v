// Code your design here
module fifo #(parameter depth = 8 ,data_width = 8)(
  input clk,
  input rst,
  input w_en,
  input r_en,
  input [data_width-1:0]data_in,
  output reg [data_width-1:0]data_out,
  output full,empty);
  
  reg[$clog2(depth)-1:0] w_ptr,r_ptr;
  reg [data_width-1:0]fifo[depth];
  
  always@(posedge clk )begin
    if(!rst)begin
      w_ptr<=0; 
      r_ptr<=0;
      data_out<=0;
    end
  end
  
  always@(posedge clk)begin
    if(w_en && !full)begin
      fifo[w_ptr]<=data_in;
      w_ptr<= w_ptr+1;
  end
  end
  
  always@(posedge clk)begin
    if(r_en && !empty)begin
      data_out <= fifo[r_ptr];
      r_ptr <= r_ptr+1;
    end
  end
  
  assign full = (r_ptr == w_ptr+1'b1);
  assign empty = (r_ptr == w_ptr);
endmodule
