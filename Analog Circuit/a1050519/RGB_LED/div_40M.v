module div_40M(
	input clk,rst,
	output reg clko
);
	reg[25:0]dly;
always @(posedge clk,negedge rst)
	if(!rst) dly<=26'h0;
	else if(dly>=26'd39_999_999) dly<=26'h0;
	else dly<=dly+1'b1;
always @(posedge clk,negedge rst)
	if(!rst) clko<=1'b0;
	else if(dly<=26'd19_999_999) clko<=1'b0;
	else clko<=1'b1;
endmodule
