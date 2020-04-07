module Sound(
	input clk,
	output reg[3:0] com,
	output reg[6:0] seg,
	output speak,
	output led
);
reg[23:0] dly;
reg hz4;

assign led=hz4;
always @(posedge clk)
	if(dly>=24'd9999999)
	begin 
   hz4=1'b1;
	dly<=24'd0;
	end 
	else 
	begin 
	dly<=dly+1'b1;
	hz4=1'b0;
	end
	
reg[1:0] div4;
reg[15:0] div,ori;
always@(posedge clk)
	if(cy) div<=ori; else div<=div+1'b1;
assign cy=(16'd65535==div);
always@(posedge cy) div4<=div4+1'b1;
assign speak=div4[1];

reg[5:0] cnt;
reg[2:0] mid,low;
reg[1:0] hight;
always@(posedge hz4)
begin
	if(cnt>=6'd23) cnt<=6'd0;else cnt<=cnt+1'b1;end
always@(*)	
	case(cnt)
		6'd0:{hight,mid,low}=8'b00_001_000;
		6'd1:{hight,mid,low}=8'b00_001_000;
		6'd2:{hight,mid,low}=8'b00_001_000;
		6'd3:{hight,mid,low}=8'b00_001_000;
		6'd4:{hight,mid,low}=8'b00_001_000;
		6'd5:{hight,mid,low}=8'b00_001_000;
		6'd6:{hight,mid,low}=8'b00_011_000;
		6'd7:{hight,mid,low}=8'b00_011_000;
		6'd8:{hight,mid,low}=8'b00_010_000;
		6'd9:{hight,mid,low}=8'b00_010_000;
		6'd10:{hight,mid,low}=8'b00_001_000;
		6'd11:{hight,mid,low}=8'b00_001_000;
		6'd12:{hight,mid,low}=8'b00_011_000;
		6'd13:{hight,mid,low}=8'b00_011_000;
		6'd14:{hight,mid,low}=8'b00_011_000;
		6'd15:{hight,mid,low}=8'b00_011_000;
		6'd16:{hight,mid,low}=8'b00_011_000;
		6'd17:{hight,mid,low}=8'b00_101_000;
		6'd18:{hight,mid,low}=8'b00_101_000;
		6'd19:{hight,mid,low}=8'b00_100_000;
		6'd20:{hight,mid,low}=8'b00_100_000;
		6'd21:{hight,mid,low}=8'b00_011_000;
		6'd22:{hight,mid,low}=8'b00_011_000;
		6'd23:{hight,mid,low}=8'b00_101_000;
	endcase
always@(*)	
	case({hight,mid,low})
		8'b00_000_001:ori=16'd27236;
		8'b00_000_010:ori=16'd31521;
		8'b00_000_011:ori=16'd35232;
		8'b00_000_100:ori=16'd36882;
		8'b00_000_101:ori=16'd40025;
		8'b00_000_110:ori=16'd42808;
		8'b00_000_111:ori=16'd45292;
		8'b00_001_000:ori=16'd46415;
		8'b00_010_000:ori=16'd48499;
		8'b00_011_000:ori=16'd50360;
		8'b00_100_000:ori=16'd51208;
		8'b00_101_000:ori=16'd52780;
		8'b00_110_000:ori=16'd54171;
		8'b00_111_000:ori=16'd55414;
		8'b01_000_000:ori=16'd55975;
		8'b10_000_000:ori=16'd57024;
		8'b11_000_000:ori=16'd57948;
	endcase

reg [3:0]i;
always@(*)
	case(dly[14:13])
		'd0:begin com=4'h7;i={2'b0,hight};end
		'd1:begin com=4'hb;i={1'b0,mid};end
		'd2:begin com=4'hd;i={1'b0,low};end
		default:com=4'hf;
	endcase
	seg7 u1 (i,seg);
endmodule

	