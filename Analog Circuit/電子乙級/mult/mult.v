module mult(
	input ck1,clr,ck2,clk4m,
	output reg P12,P10,P8,P6,
	output P16,P14
);
reg [15:0]cnt;
reg [1:0] scan;
reg ck2out,ck1out;
always @(posedge clk4m)
begin ck2out<=ck2;
ck1out<=ck1;	
end
always @(posedge ck1out,posedge clr)
	if(clr)cnt<=16'h0;
	else if(cnt>=16'h9999)cnt<=16'h0;
	else if(cnt[11:0]>=12'h999) cnt<=cnt+16'h667;
	else if(cnt[7:0]>=8'h99)	cnt<=cnt+16'h67;
	else if(cnt[3:0]>=4'h9)	cnt<=cnt+16'h7;
	else cnt<=cnt+1'h1;
always @(posedge ck2out) scan<=scan+1'b1;
always @(scan)
case(scan)
	2'd0:{P12,P10,P8,P6}=cnt[15:12];
	2'd1:{P12,P10,P8,P6}=cnt[11:8];
	2'd2:{P12,P10,P8,P6}=cnt[7:4];
	2'd3:{P12,P10,P8,P6}=cnt[3:0];
endcase
assign {P16,P14}=scan;
endmodule
	