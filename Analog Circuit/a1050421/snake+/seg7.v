module seg7(
	input  [3:0]i,
	output [6:0]seg
);
reg [6:0] rom[15:0];
initial $readmemh("seg7.txt",rom);
assign seg=rom[i];
endmodule 