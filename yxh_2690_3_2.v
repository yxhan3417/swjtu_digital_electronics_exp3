module yxh_2690_3_2(codein,codeout);
input [2:0 ]codein;//3位输入 (就是Q)
output reg [6:0] codeout;//七位输出 控制LED
always @(*)
begin
	case(codein)
		3'd0: codeout = 7'b1111100;
		3'd1: codeout = 7'b0111110;
		3'd2: codeout = 7'b0011111;
		3'd3: codeout = 7'b0001111;
		3'd4: codeout = 7'b0000111;
		3'd5: codeout = 7'b0000011;
		3'd6: codeout = 7'b0000001;
		default: codeout = 7'b0000000;
	endcase
end
endmodule
