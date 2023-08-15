`timescale 1ns/1ns

module nbit_full_adder(a, b, c, Co, S);
	parameter n = 6;
	input [n-1:0] a;
	input [n-1:0] b;
	input c;
	output Co;
	output [n-1:0] S;
	wire [n-1:0] inner_S;
	wire inner_Co;
	
	assign {inner_Co,inner_S} = a + b + c;
	assign #(38*n,42*n)S = inner_S;
	assign #(35*n,39*n)Co=inner_Co;
endmodule