module clock(
	input P19,P21,P5,P22,P7,P20,clr,clk4m,
	output reg [5:0]hcnt,
	output P8,P6,P4
);
reg [15:0]dly;
always @(posedge clk4m) dly<=dly+1'h1;
reg k20,k21,k5,k22;
always @(posedge dly[15])
begin
k20<=P20;
k5<=P5;
k21<=P21;
k22<=P22;
end
assign P8=(k20)?k5&k22:P7;
assign P4=(k20)?1'b0:P22;
assign P6=(k20)?1'b1:P7;
wire M24=k20?k21&k22:P19;
always @(posedge M24,posedge clr)
if(clr)hcnt<=6'h0;
else if(hcnt>=6'h23)hcnt<=6'h0;
else if(hcnt[3:0]>=4'h9)begin hcnt<=hcnt+6'h7;end
else hcnt<=hcnt+1'h1;
endmodule