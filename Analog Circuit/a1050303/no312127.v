module no312127(
	input clk,
	output a1,b1,c1,d1,e1,f1,g1
);
reg[3:0] cnt;
div40m(clk,f1_19);
wire f1_19,a,b,c,d;
always @(posedge f1_19)
cnt<=cnt+1'b1;
assign {d,c,b,a}=cnt;
/*assign a1=~(b|c&!a | c&b);
assign b1=~(c|b);
assign c1=~(!c|a);
assign d1=~(c|b&!a | !c&!b&a);
assign e1=~(!a|!c&!b | c&!a);
assign f1=~(0);
assign g1=~(b|c&!a | !b&!c);*/


assign a1=!((d|c|b)&(d|c|!a)&(!d|!c|b|a)&(!d|c|!b|a)&(d|b|!a));
assign b1=!((d|b|c)&(!d|c|!b|!a));
assign c1=!((d|!c|a)&(!d|c|b|a));
assign d1=!((d|!b|!a)&(d|!c|!a)&(d|c|b|a)&(!d|!c|b|a)&(!d|c|!b|a));
assign e1=!((c|!b)&(d|!c|!a)&(!d|!c|b|a));
assign f1=!((a|b)&(!d|c|a)&(d));
assign g1=!((!d|!c|a)&(!d|b|!a)&(d|!c|!a)&(d|!b|!a)&(!d|!b|a));
endmodule
