module a1050225(
	input clk,
	output [6:0]seg,
	output led);

reg[24:0]dly;
reg[3:0]cnt;
always @(posedge clk)
dly<=dly+1'b1;
assign led=dly[24];

always @(posedge dly[24])
if(cnt>=4'd15)
	cnt<=4'd0;
else
	cnt=cnt+1'd1;


reg[6:0]seg1;
always @(*)
case (cnt)
    4'd0:seg1=7'b1111110;
    4'd1:seg1=7'b0110000;
    4'd2:seg1=7'b1101101;
    4'd3:seg1=7'b1111001;
    4'd4:seg1=7'b0110011;
    4'd5:seg1=7'b1011011;
    4'd6:seg1=7'b1011111;
    4'd7:seg1=7'b1110000;
    4'd8:seg1=7'b1111111;
    4'd9:seg1=7'b1111011;
    4'ha:seg1=7'b1110111;
    4'hb:seg1=7'b0011111;
    4'hc:seg1=7'b1001110;
    4'hd:seg1=7'b0111101;
    4'he:seg1=7'b1001111;
    4'hF:seg1=7'b1000111;
endcase 
	 assign seg=~seg1;
endmodule
