module LCD(
	input clk,rst,
	output[7:0] lcd_d,
	output lcd_rs,lcd_rw,lcd_e
);
wire clko;
div40m u1(clk,rst,clko);

reg[23:0] clock;
always @(posedge clko,negedge rst)
	if(!rst) clock<=24'h0;
	else if(clock>=24'h235959) clock<=24'h0;
	else if(clock[0+:20]>=20'h95959) clock<=clock+20'ha6a6a7;
	else if(clock[0+:16]>=16'h5959) clock<=clock+16'ha6a7;
	else if(clock[0+:12]>=12'h59) clock<=clock+12'h6a7;
	else if(clock[0+:8]>=8'h9) clock<=clock+8'ha7;
	else clock<=clock+1'b1;
	
reg[127:0] row1,row2;
always @(posedge clk,negedge rst)
	if(!rst)
	begin
		row1="Clock		00:00:00";
		row2="FUCK THE NTIHS";
	end
	else
	begin
		row1[0+:8]	<= 8'h30+clock[0+:4];
		row1[1*8+:8]	<= 8'h30+clock[1*4+:4];
				
		row1[3*8+:8]	<= 8'h30+clock[2*4+:4];
		row1[4*8+:8]	<= 8'h30+clock[3*4+:4];
								
		row1[6*8+:8]	<= 8'h30+clock[4*4+:4];
		row1[7*8+:8]	<= 8'h30+clock[5*4+:4];
	end
lcd1602_drive u0(
	.clk(clk),
	.rst_n(rst),
	.lcd_data(lcd_d),
	.lcd_rs(lcd_rs),
	.lcd_rw(lcd_rw),
	.lcd_e(lcd_e),
	.row1_val(row1),
	.row2_val(row2)
);
endmodule
