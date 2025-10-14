module halfadder(input a,b,output sum,carry);
//xor(sum,a,b);
//and(carry,a,b);
//dataflow model 
assign sum=a^b;
assign carry= a&b;
endmodule

