module RGB_LED(
	input clk,rst,
	output r,g,b,led,
	output [6:0]seg
);
wire c40u,c1hz;
div_40M u0(.clk(clk),.rst(rst),.clko(c1hz));
div_1hz u1(clk,c40u);
assign led=c1hz;
reg [3:0] sec;
always @(posedge c1hz,negedge rst)
	if(!rst) sec<=4'h0;
	else sec<=sec+1'b1;
reg [7:0] cnt;
always @(posedge c40u,negedge rst)
	if(!rst) cnt<=8'h0;
	else cnt<=cnt+1'b1;

reg [23:0] mem[15:0];
initial $readmemh("rgb.txt",mem);
wire [23:0] cmp=mem[sec];

assign r=(cnt>=cmp[2*8+:8])?1'b0:1'b1;
assign g=(cnt>=cmp[1*8+:8])?1'b0:1'b1;
assign b=(cnt>=cmp[0+:8])	?1'b0:1'b1;
seg7 u2(sec,sega);
wire [6:0]sega;
assign seg=~sega;
endmodule
