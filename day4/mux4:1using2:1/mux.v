module mux(
 input i0,i1,
 input sel,
output y);

assign y = sel? i1 : i0 ;

endmodule

// output reg y/* it is basically correct to use reg to always block ou
t but here we want to instant with other module so it must in wire so w
e using continuous assignment*/

/*always@(*)begin
if(sel)
y=i1;
else
y=i0;
end*/

module mux4_1(
input i0,i1,i2,i3,
input sel0,sel1,
output  y);
wire y0,y1;

mux m1(.i0(i0),.i1(i1),.sel(sel1),.y(y0));
mux m2(.i0(i2),.i1(i3),.sel(sel1),.y(y1));
mux m3(.i0(y0),.i1(y1),.sel(sel0),.y(y));
endmodule
