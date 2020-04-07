module dekey(
	input clk100,key,
	output kout
	);
reg[1:0]state;
always @(posedge clk100)
case(state)
2'd0:if(!key)state<=2'd1;
2'd1:state<=2'd2;
2'd2:if(key) state<=2'd0;
default:state<=0;
endcase
assign kout=state[0];
endmodule
