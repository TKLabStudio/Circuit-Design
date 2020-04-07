module snake (
	input clk,clear,key,ken,kud,
	output f1_19,
	output [6:0] seg,
	output reg[3:0] com,
	output [7:0] sega
	);
reg[24:0] dly;
reg[6:0]seg1,seg2,seg3,seg4;
reg[4:0] cnt;

always@ (posedge clk) dly<=dly+1'b1;
assign f1_19=dly[24];

always@(posedge fout,negedge clear)
begin
if(!clear)	cnt<=5'd0;
	else if(!en) begin
		if(!ud) begin
			if(cnt>=5'd 19)	cnt<=5'd0;
			else cnt<=cnt+1'd1;
		end
	
		else begin
			if(cnt==5'd 0)	cnt<=5'd19;
			else cnt<=cnt-1'd1;
		end
	end
end

wire keyout;
dekey u1(dly[17],key,keyout);
reg[1:0] sel;
reg fout;
always @(posedge keyout) sel<=sel+2'd1;
always @(*)
case(sel)
2'd0:fout=dly[22];	
2'd1:fout=dly[20];	
2'd2:fout=dly[18];	
2'd3:fout=dly[16];	
endcase

wire kenout,kudout;
dekey u2(dly[17],ken,kenout);
dekey u3(dly[17],kud,kudout);
reg en,ud;
always @(posedge kenout) en<=~en;
always @(posedge kudout) ud<=~ud;
assign {leden,ledun}={en,ud};

always@(*)
case(dly[15:14])
2'd0:begin com=4'b0111;end
2'd1:begin com=4'b1011;end
2'd2:begin com=4'b1101;end
2'd3:begin com=4'b1110;end
endcase

reg[6:0] rom[127:0];
initial $readmemh("snake.txt",rom);
assign seg=rom[{dly[15:14],cnt}];
wire[6:0] segb;
seg7 u4(cnt[3:0],segb);
assign sega=~{segb,cnt[4]};
endmodule
