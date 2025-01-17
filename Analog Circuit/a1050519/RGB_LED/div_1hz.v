module div_1hz(
	input clk,rst,
	output reg clko
);
	reg[10:0]dly;
always @(posedge clk,negedge rst)
	if(!rst) dly<=11'h0;
	else if(dly>=11'd1599) dly<=11'h0;
	else dly<=dly+1'b1;
always @(posedge clk,negedge rst)
	if(!rst) clko<=1'b0;
	else if(dly<=11'd799) clko<=1'b0;
	else clko<=1'b1;
endmodule
