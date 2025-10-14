module fullsubtract(input a,b,bin,output dif,brw);
xor(dif,a,b,bin);
and(brw,~a,b,bin);
endmodule
