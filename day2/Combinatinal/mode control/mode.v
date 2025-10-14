module full_adder(input a,b,cin,output sum,carry);
assign sum = a^b^cin;
assign carry = (a&b)|(b&cin)|(cin&a);
endmodule
module adder_sub (input [3:0]a,b,input control,output [3:0]out,output cout);
wire[3:0]b_inverter=b^{4{control}};
wire[2:0] ripple_out;
full_adder f1(a[0],b_inverter[0],control,out[0],ripple_out[0]);
full_adder f2(a[1],b_inverter[1],ripple_out[0],out[1],ripple_out[1]);
full_adder f3(a[2],b_inverter[2],ripple_out[1],out[2],ripple_out[2]);
full_adder f4(a[3],b_inverter[3],ripple_out[2],out[3],cout);
endmodule
