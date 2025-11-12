 module full_adder (input a,b,input cin,output cout,sum );
  assign {cout,sum}={((a&b)|(b&cin)|(cin&a)),a^b^cin};
 endmodule
 
 module rca #(parameter size=4)
 (input [size-1:0]a,b,input cin,output[size-1:0]sum,output[size-1:0]cout);
 
 genvar g;
 generate
  full_adder fa0(a[0],b[0],cin,sum[0],cout[0]);
  for(g=1;g<size;g=g+1)begin:name
  full_adder fa(a[g],b[g],cout[g-1],sum[g],cout[g]);
 end
  endgenerate
  endmodule
