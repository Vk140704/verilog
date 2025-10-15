module rca(input[3:0] a,b,output [3:0]sum,output carry);
wire[2:0]cout;
fulladder f1(a[0],b[0],1'b0,sum[0],cout[0]);
fulladder f2(a[1],b[1],cout[0],sum[1],cout[1]);
fulladder f3(a[2],b[2],cout[1],sum[2],cout[2]);
fulladder f4(a[3],b[3],cout[2],sum[3],carry);
endmodule 


module fulladder(input a,b,cin,output sum,carry);
assign sum = a^b^cin;
assign carry = (a&b)|(b&cin)|(cin&a);
endmodule 
