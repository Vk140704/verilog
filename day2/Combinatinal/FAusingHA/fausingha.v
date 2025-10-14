module halfadder(input a,b,output sum,cout);
assign sum=a^b;
assign cout=a+b;
endmodule

module fulladder(input a,b,cin,output sum,cout);
wire sumout1,carry1,carry2;
halfadder h1(a,b,sumout1,carry1);
halfadder h2(sumout1,cin,sum,carry2);
or(cout,carry1,carry2);
endmodule
