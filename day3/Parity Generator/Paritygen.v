module paritygen(input[3:0]a,output y);
assign y=^a;
endmodule

//behavioural
module paritygen(input[3:0]a,output reg y); 
always@(a)
begin
 y=^a;
end 
endmodule 
