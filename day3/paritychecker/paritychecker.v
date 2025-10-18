module paritychecker(input[4:0]a,output evenparity);
assign evenparity =~^a;
endmodule
