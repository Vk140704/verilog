module seq_1110(input clk,rst,x,output reg z);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
  parameter E = 4'h5;
  
  reg [3:0]state,next_state;
  always@(posedge clk)begin
    if(rst) next_state = A;
    else  state = next_state;
  end
  always@(*)begin
    case(state)
      A: begin
        if(x==0) next_state = A;
        else next_state = B;
      end
      
      B: begin  
        if(x==0) next_state = A;
        else next_state = C;
      end
      
      C: begin
        if(x==0)next_state = A;
        else next_state = D;
      end
      
      D: begin
        if(x==0)next_state = E ;
        else next_state = D;
      end 
          
      E: begin
        if(x==0)next_state = D;
        else next_state = B;
      end
      default : next_state = A;
    endcase
  end 
      
      always@(posedge clk)begin
        case(state)
          A: z=0;
          B: z=0;
          C: z=0;
          D: z=0;
          E: z=1;
          default z=0;
        endcase
      end 
      endmodule
