module mux(input i0,i1,sel,output y);
assign y = sel ? i1 : i0;
endmodule

module mux3_1(input i0,i1,i2,sel0,sel1,output y);
wire y0;
mux m1(.i0(i0),.i1(i1),.sel(sel1),.y(y0));
mux m2(.i0(y0),.i1(i2),.sel(sel0),.y(y));
endmodule
