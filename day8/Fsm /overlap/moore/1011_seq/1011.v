module seq_1011 (input clk,rst,x,output reg z);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
  parameter E = 4'h5;
  
  reg[3:0]state,next_state;
  always@(posedge clk)begin
    if(rst) state <= A;
    else state <= next_state;
  end
  
  always@(*)begin
    case(state)
      A: next_state = (x==0) ? A : B;
      B: next_state = (x==0) ? C : B;
      C: next_state = (x==0) ? A : D;
      D: next_state = (x==0) ? A : E;
      E: next_state = (x==0) ? D : B;
      // Overlapping: 10 remains for next sequence
      default : next_state=A;
    endcase
  end
  
  always@(state)begin
    case(state)
      A: z=0;
      B: z=0;
      C: z=0;
      D: z=0;
      E: z=1;
      default: z=0;
    endcase
  end
endmodule
