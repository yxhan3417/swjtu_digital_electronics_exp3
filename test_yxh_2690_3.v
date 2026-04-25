`timescale 1ns/1ns
module test_yxh_2690_3;
reg clk;
reg en;
wire [2:0]Q;
wire [6:0]codeout;
yxh_2690_3 uut(
		.clk(clk),
		.en(en),
		.Q(Q),
		.codeout(codeout)

);
initial begin
	clk = 1'b1;
	forever #50 clk = ~clk;
end
initial begin
	en = 1'b1;
	#400;
	en = 1'b0;
	#200;
	en = 1'b1;
	#800;
	$stop;
end
endmodule
