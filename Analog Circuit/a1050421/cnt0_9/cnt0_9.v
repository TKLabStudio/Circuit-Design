module cnt0_9(
	input clk,
	output [6:0] seg
	);
reg [24:0] dly;
always@ (posedge clk) dly<=dly+1'b1;
reg[3:0] cnt;
always @(posedge dly[24])
if(cnt>=4'd9) cnt<=4'd0;else cnt<=cnt+1'h1;
wire [6:0] sega;
seg7 u1(cnt,sega);
assign seg=~sega;
endmodule
