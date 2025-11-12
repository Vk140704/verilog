module ripplecarry_add_sub #(parameter size=4)(input[size-1:0] a,
input [size-1:0]b,
input ctrl,
output[size-1:0] s,
output[size-1:0]cout);
wire  [size-1:0] bc;
genvar g;
assign bc[0] = b[0]^ctrl;

fulladder fa0(a[0],bc[0],ctrl,s[0],cout[0]);
generate
 for(g=1;g<size;g=g+1)begin : add_sub
assign bc[g]=b[g]^ctrl;
fulladder fa(a[g],bc[g],cout[g-1],s[g],cout[g]);
end
endgenerate
endmodule

module fulladder(input a,b,cin,output sum , cout);
assign {cout,sum}={((a&b)|(b&cin)|(a&cin)),(a^b^cin)};
endmodule
