module halfsubtract(input a,b,output dif,brw);
xor(dif,a,b);
and(brw,~a,b);
endmodule 

module fullsubtract(input a,b,bin,output dif,brw);
wire difout1,brw1,brw2;
halfsubtract h1(a,b,difout,brw1);
halfsubtract h2(cin,difout1,dif,brw2);
or(brw,brw1,brw2);
endmodule 
