module a1050310(
	input clk,clr,key,ken,kud,
	output leden,ledun,
	output [6:0]seg,
	output reg [3:0]com
);
reg[24:0] dly;
always @(posedge clk) dly<=dly+1'b1;
reg [1:0] scan;
reg [15:0] cnt;
reg [3:0] i;
always @(posedge dly[14]) 	scan<=scan+1'b1;

wire keyout;
dekey u1(dly[17],key,keyout);
reg[1:0] sel;
reg fout;
always @(posedge keyout) sel<=sel+2'd1;
always @(*)
case(sel)
2'd0:fout=dly[24];	
2'd1:fout=dly[20];	
2'd2:fout=dly[15];	
2'd3:fout=dly[12];	
endcase

wire kenout,kudout;
dekey u2(dly[17],ken,kenout);
dekey u3(dly[17],kud,kudout);
reg en,ud;
always @(posedge kenout) en<=~en;
always @(posedge kudout) ud<=~ud;
assign {leden,ledun}={en,ud};

always @(posedge fout,negedge clr) 
begin
if(!clr)	cnt<=16'h0;
	else if(!en) begin
		if(!ud) begin
			if(cnt>=16'h9999)	cnt<=16'h0;
			else if(cnt[11:0]>=12'h999)	cnt<=cnt+16'h667;
			else if(cnt[7:0]>=8'h99)	cnt<=cnt+16'h67;
			else if(cnt[3:0]>=4'h9)	cnt<=cnt+16'h7;
			else cnt<=cnt+16'h1;
		end
	
		else begin
			if(cnt==16'h0)	cnt<=16'h9999;
			else if(cnt[11:0]==12'h1000)	cnt<=cnt-16'h667;
			else if(cnt[7:0]==8'h100)	cnt<=cnt-16'h67;
			else if(cnt[3:0]==4'h10)	cnt<=cnt-16'h7;
			else cnt<=cnt-16'h1;
		end
	end
end

always@(*)
	case(scan)
		2'd0:begin i<=cnt[15:12];com=4'b0111;	end
		2'd1:begin i<=cnt[11:8];com=4'b1011;	end
		2'd2:begin i<=cnt[7:4];com=4'b1101;	end
		2'd3:begin i<=cnt[3:0];com=4'b1110;	end
	endcase
	seg7 u4(i,seg);

endmodule
