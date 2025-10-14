module bufifgate(input a,control,output reg y);
//bufif(y,a,control);
//behavioural
always@(*)
begin
if(control)
y=a;
else
y=1'bz;
end
endmodule

