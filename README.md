# 1 实验描述
基于Verilog HDL 层次化设计方法，将 7 进制计数器与译码器模块级联，实现汽车流动转向灯 LED 循环点亮效果，并在 FPGA 实验箱完成编译、仿真、引脚锁定与硬件验证。
# 2 代码 
## 2.1 顶层文件（yxh_2690_3_3）

```Verilog

module yxh_2690_3(clk,en,Q,codeout);
input clk;
input en;
output wire [2:0]Q;
output [6:0]codeout;
yxh_2690_3_1 cnt(
		.clk(clk),
		.en(en),
		.Q(Q)

);
yxh_2690_3_2 dec(
		.codein(Q),
		.codeout(codeout)
);
endmodule 


```
## 2.2 七位计数器

```Verilog

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

```
## 2.3 解码器

```Verilog

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

```

## 2.4 测试文件

```Verilog

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

```
# 3 仿真波形
![alt text](https://github.com/yxhan3417/swjtu_digital_electronics_exp3/imgs/boxingtu.png?raw=true)
<img src="/imgs/boxingtu.png" width = "80%">

# 4 引脚分配
![alt text](https://github.com/yxhan3417/swjtu_digital_electronics_exp3/imgs/pin.png?raw=true)
<img src="/imgs/pin.png" width = "80%">
