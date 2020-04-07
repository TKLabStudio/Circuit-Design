module seg7(
	input  a1,b1,c1,d1,
	output reg a,b,c,d,e,f,g
);
always @(*)
case ({d1,c1,b1,a1})
   4'd0:{a,b,c,d,e,f,g}=7'b1111110;
	4'd1:{a,b,c,d,e,f,g}=7'b0110000;
	4'd2:{a,b,c,d,e,f,g}=7'b1101101;
	4'd3:{a,b,c,d,e,f,g}=7'b1111001;
	4'd4:{a,b,c,d,e,f,g}=7'b0110011;
	4'd5:{a,b,c,d,e,f,g}=7'b1011011;
	4'd6:{a,b,c,d,e,f,g}=7'b1011111;
	4'd7:{a,b,c,d,e,f,g}=7'b1110000;
	4'd8:{a,b,c,d,e,f,g}=7'b1111111;
	4'd9:{a,b,c,d,e,f,g}=7'b1111011;
	4'ha:{a,b,c,d,e,f,g}=7'b1110111;
	4'hb:{a,b,c,d,e,f,g}=7'b0011111;
	4'hc:{a,b,c,d,e,f,g}=7'b1001110;
	4'hd:{a,b,c,d,e,f,g}=7'b0111101;
	4'he:{a,b,c,d,e,f,g}=7'b1001111;
	4'hF:{a,b,c,d,e,f,g}=7'b1000111;
endcase 
endmodule 