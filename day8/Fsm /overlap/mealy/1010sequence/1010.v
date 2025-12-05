module seq_1010 (input clk,rst,x,output z);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
  
  reg[3:0]state,next_state;
  reg z_reg;
  always@(posedge clk)begin
    if(rst) state <= A;
    else state <= next_state;
  end
  
  always@(*)begin
    case(state)
      A: next_state = (x==0) ? A : B;
      B: next_state = (x==0) ? C : B;
      C: next_state = (x==0) ? A : D;
      D: next_state = (x==0) ? C : B;  // Overlapping: 10 remains for next sequence
      default : next_state=A;
    endcase
  end
  
  always@(posedge clk)begin
    if(rst)begin
      z_reg <=1'b0;
    end
    else begin
      z_reg <= (state==D && x==0);
      end
  end
    assign z=z_reg; 
endmodule
