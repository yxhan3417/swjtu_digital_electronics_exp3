module yxh_2690_3_1(clk,en,Q);
input clk,en;
output reg[2:0]Q;
always@(posedge clk) begin //时序电路
    if(en==1'b1) 
        if(Q<3'd6) Q<=Q+1'b1;  // 计数到6后清零
        else Q<=0;//0-6循环
    else Q<=Q;  // 使能为低时保持计数
end
endmodule
