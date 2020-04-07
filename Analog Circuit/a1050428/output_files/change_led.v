module change_led(
	input clk,kuso,kfout,
	output [15:0]led,
	output [6:0]seg7
	);
reg[27:0] dly;

always@ (posedge clk) dly=dly+1'b1;

reg[3:0] kind;
wire kusoout;
dekey u1(dly[17],kuso,kusoout);
dekey u2(dly[17],kfout,kfout_led);
always@ (posedge kusoout)
if(kind>=4'd13) kind<=4'd0; else kind<=kind+1'd1;
reg[1:0] fcnt;
always@ (posedge kfout_led) fcnt<=fcnt+1'd1;
reg fout;
always@(*)
	case(fcnt)
		2'd0:fout=dly[23];
		2'd1:fout=dly[20];
		2'd2:fout=dly[17];
		2'd3:fout=dly[14];
	endcase
reg[15:0] ledFK;
reg dir;

always@ (posedge fout)
	case(kind)
		4'd0:if(ledFK==16'h0) ledFK<=16'hffff;else ledFK<=16'h0;
		4'd1:if(ledFK==16'h0) ledFK<=16'h8000;else ledFK<=ledFK>>1;
		4'd2:if(ledFK==16'h0) ledFK<=16'h1;else ledFK<=ledFK<<1;
		4'd3:if(ledFK==16'h0) ledFK<=16'h1;
			else if(ledFK==16'hffff) ledFK<=0;
			else ledFK<=(ledFK<<1)|16'h1;
		4'd4:if(ledFK==16'h0) ledFK<=16'h8000;
			else if(ledFK==16'hffff) ledFK<=0;
			else ledFK<=(ledFK>>1)|16'h8000;
		4'd5:if(ledFK==16'h0) ledFK<=16'h8001;
			else ledFK<={ledFK[15:8]>>1,ledFK[7:0]<<1};
		4'd6:if(ledFK==16'h0) ledFK<=16'h8001;
			else if(ledFK==16'hffff) ledFK<=0;
			else ledFK<={1'b1,ledFK[15:9],ledFK[6:0],1'b1};
		4'd7:if(ledFK==16'h0) ledFK<=16'h0180;
			else ledFK<={ledFK[15:8]<<1,ledFK[7:0]>>1};
		4'd8:if(ledFK==16'h0) ledFK<=16'h0180;
			else if(ledFK==16'hffff) ledFK<=0;
			else ledFK<={ledFK[14:8],1'b1,1'b1,ledFK[7:1]};
		4'd9:if(ledFK!=16'h0f0f) ledFK<=16'h0f0f;
			else ledFK<=16'hf0f0;	
		4'd10:if(ledFK!=16'h5555) ledFK<=16'h5555;
			else ledFK<=16'haaaa;	
		4'd11:if(ledFK==16'h0) ledFK<=16'hffff;
			else ledFK<={ledFK[15:8]<<1,ledFK[7:0]<<1};
		4'd12:if(ledFK==16'h0) ledFK<=16'hffff;
			else ledFK<={ledFK[15:8]>>1,ledFK[7:0]>>1};
		4'd13:begin
			if(ledFK==16'h6) dir<=1'b1;
			else if (ledFK==16'h6000||ledFK==16'd0) dir<=1'b0;
			if(ledFK==16'd0) ledFK<=16'hc000;
			else if(dir==1'd1) ledFK<=ledFK<<1;
			else ledFK<=ledFK>>1;
		end
	endcase
wire [6:0]sega;
seg7 u4(kind,sega);
assign seg7=~sega;
assign led=~ledFK;
endmodule
	