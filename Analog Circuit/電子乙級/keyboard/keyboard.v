module keyboard(
	input P13,P14,clk4m,
	input P2,P4,P10,
	output reg P18,P16,P19,P15,
	output reg P7,P3,P5,P9,
	output P20,P21,P1
);
reg [11:0]dly;
always @(posedge clk4m) dly<=dly+1'h1;
reg[3:0]scan,keycnt;
reg press;
always @(posedge dly[11])
if(press)scan<=scan+1'h1;
always@(scan)
begin
	case(scan[3:2])
	2'd0:{P18,P16,P19,P15}=4'b0111;
	2'd1:{P18,P16,P19,P15}=4'b1011;
	2'd2:{P18,P16,P19,P15}=4'b1101;
	2'd3:{P18,P16,P19,P15}=4'b1110;
	endcase
	case(scan[1:0])
	2'd0:press=P2;
	2'd1:press=P4;
	2'd2:press=P10;
	2'd3:press=1'b1;
	endcase
end

always @(posedge dly[11])
if(press)keycnt<=4'd0;
else if(keycnt<4'd15)keycnt<=keycnt+1'd1;
else keycnt<=keycnt;
wire valid=keycnt==4'd12;
always@(posedge valid) {P5,P9,P7,P3}={scan};
assign P21=keycnt==4'd13;
assign P20=keycnt==4'd14;
assign P1=!(P13|P14);
endmodule
