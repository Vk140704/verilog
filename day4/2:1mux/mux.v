module mux2_1(input i0,i1,sel,output reg y);
always@(*)begin
 if(sel)
    y<=i1;
 else
    y<=i0;

//next method

//assign y=sel?i1:i0;
end
endmodule
