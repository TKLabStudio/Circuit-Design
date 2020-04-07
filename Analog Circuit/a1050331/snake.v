module snake (
	input clk,clear,
	output f1_19,
	output reg[6:0] seg,
	output reg[3:0] com
	);
reg[24:0] dly;
reg[6:0]seg1,seg2,seg3,seg4;
reg[4:0] cnt;

always@ (posedge clk) dly<=dly+1'b1;
assign f1_19=dly[24];


always@(posedge dly[22],negedge clear)
if(!clear) cnt<=5'd0;
else if(cnt>=5'd 19)cnt<=5'd0;else cnt<=cnt+1'd1;


always@(*)
case(cnt)
5'd0 :begin seg1=7'b100_0000;seg2=7'b100_0000;seg3=7'b100_0000;seg4=7'b000_0000;end
5'd1 :begin seg1=7'b000_0000;seg2=7'b100_0000;seg3=7'b100_0000;seg4=7'b100_0000;end
5'd2 :begin seg1=7'b000_0000;seg2=7'b000_0000;seg3=7'b100_0000;seg4=7'b110_0000;end
5'd3 :begin seg1=7'b000_0000;seg2=7'b000_0000;seg3=7'b000_0000;seg4=7'b110_0001;end
5'd4 :begin seg1=7'b000_0000;seg2=7'b000_0000;seg3=7'b000_0001;seg4=7'b010_0001;end
5'd5 :begin seg1=7'b000_0000;seg2=7'b000_0001;seg3=7'b000_0001;seg4=7'b000_0001;end
5'd6 :begin seg1=7'b000_0001;seg2=7'b000_0001;seg3=7'b000_0001;seg4=7'b000_0000;end
5'd7 :begin seg1=7'b000_0101;seg2=7'b000_0001;seg3=7'b000_0000;seg4=7'b000_0000;end
5'd8 :begin seg1=7'b000_1101;seg2=7'b000_0000;seg3=7'b000_0000;seg4=7'b000_0000;end
5'd9 :begin seg1=7'b000_1100;seg2=7'b000_1000;seg3=7'b000_0000;seg4=7'b000_0000;end
5'd10:begin seg1=7'b000_1000;seg2=7'b000_1000;seg3=7'b000_1000;seg4=7'b000_0000;end
5'd11:begin seg1=7'b000_0000;seg2=7'b000_1000;seg3=7'b000_1000;seg4=7'b000_1000;end
5'd12:begin seg1=7'b000_0000;seg2=7'b000_0000;seg3=7'b000_1000;seg4=7'b001_1000;end
5'd13:begin seg1=7'b000_0000;seg2=7'b000_0000;seg3=7'b000_0000;seg4=7'b001_1001;end
5'd14:begin seg1=7'b000_0000;seg2=7'b000_0000;seg3=7'b000_0001;seg4=7'b001_0001;end
5'd15:begin seg1=7'b000_0000;seg2=7'b000_0001;seg3=7'b000_0001;seg4=7'b000_0001;end
5'd16:begin seg1=7'b000_0001;seg2=7'b000_0001;seg3=7'b000_0001;seg4=7'b000_0000;end
5'd17:begin seg1=7'b000_0011;seg2=7'b000_0001;seg3=7'b000_0000;seg4=7'b000_0000;end
5'd18:begin seg1=7'b100_0011;seg2=7'b000_0000;seg3=7'b000_0000;seg4=7'b000_0000;end
5'd19:begin seg1=7'b100_0010;seg2=7'b100_0000;seg3=7'b000_0000;seg4=7'b000_0000;end
default:begin seg1=7'h0;seg2=7'h0;seg3=7'h0;seg4=7'h0;end
endcase


always@(*)
case(dly[15:14])
2'd0:begin com=4'b0111;seg=seg1;end
2'd1:begin com=4'b1011;seg=seg2;end
2'd2:begin com=4'b1101;seg=seg3;end
2'd3:begin com=4'b1110;seg=seg4;end
endcase

endmodule
