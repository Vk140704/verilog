// Code your design here
module seq_1111(input clk,rst,x,output z);
  parameter A = 4'h1;
  parameter B = 4'h2;
  parameter C = 4'h3;
  parameter D = 4'h4;
  
  reg[3:0]state,next_state;
  reg z_reg;
  
  always@(posedge clk)begin
    if(rst)begin
      next_state <= A;  
    end
    else begin
      state <= next_state;
     end 
  end
  
  always@(*)begin
    case(state)
    A: begin
      if(x==0)begin
        next_state =A;
      end
      else begin
        next_state =B;
      end
  end
    
    B: begin
      if(x==0)begin
        next_state = A;
    end
      else begin
        next_state = C;
      end 
    end
    
    C: begin
      if(x==0)begin
        next_state = A;
      end
      else begin
        next_state = D;
      end 
    end 
    
    D: begin
      if(x==0)begin
        next_state = A;
      end 
      else begin
        next_state = A;
      end
    end
      default : next_state = A;
    endcase
  end
  
  always @ (posedge clk)begin
    if(rst)begin
      z_reg <= 1'b0;
    end
    else begin
      z_reg <= ((state==D)&&(x==1));
    end
  end
  assign z = z_reg;
endmodule 
