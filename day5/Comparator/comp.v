module comp(input [3:0]a,b,output reg a_gt_b,a_ls_b,a_eq_b);
always@(*)begin
a_gt_b =0; a_ls_b =0; a_eq_b =0;
if(a>b) a_gt_b =1'b1;
else if(a<b) a_ls_b =1'b1;
else a_eq_b = 1'b1;
end
endmodule
