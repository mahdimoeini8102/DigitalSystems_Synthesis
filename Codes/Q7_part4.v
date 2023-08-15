`timescale 1ns/1ns

module full_adder_1(a, b, c, Co, S);
	input a;
	input b;
	input c;
	output Co;
	output S;
	assign {Co,S} = a + b + c;
endmodule

module full_adder_2(a, b, c, Co, S);
	input [1:0] a;
	input [1:0] b;
	input c;
	output Co;
	output [1:0] S;
	assign {Co,S} = a + b + c;
endmodule

module full_adder_3(a, b, c, Co, S);
	input [2:0] a;
	input [2:0] b;
	input c;
	output Co;
	output [2:0] S;
	assign {Co,S} = a + b + c;
endmodule

module full_adder_4(a, b, c, Co, S);
	input [3:0] a;
	input [3:0] b;
	input c;
	output Co;
	output [3:0] S;
	assign {Co,S} = a + b + c;
endmodule

module full_adder_5(a, b, c, Co, S);
	input [4:0] a;
	input [4:0] b;
	input c;
	output Co;
	output [4:0] S;
	assign {Co,S} = a + b + c;
endmodule

module full_adder_6(a, b, c, Co, S);
	input [5:0] a;
	input [5:0] b;
	input c;
	output Co;
	output [5:0] S;
	assign {Co,S} = a + b + c;
endmodule

module ones_counter(input [126:0] i, output [6:0] S);

	wire [95:0] input_1bit;
	wire [79:0] input_2bit;
	wire [55:0] input_3bit;
	wire [35:0] input_4bit;
	wire [21:0] input_5bit;
	wire [12:0] input_6bit;
	genvar n;
	
	assign input_1bit [95:0] = i[95:0];
	assign input_2bit [79:64] = i[111:96];
	assign input_3bit [55:48] = i[119:112];
	assign input_4bit [35:32] = i[123:120];
	assign input_5bit [21:20] = i[125:124];
	assign input_6bit [12] = i[126];
		
	generate
		for (n=0;n<32;n=n+1) begin: one_bits
			full_adder_1 one_bit(input_1bit[3*n+1],input_1bit[3*n],input_1bit[3*n+2],input_2bit[2*n+1],input_2bit[2*n]);
		end
		
		for (n=0;n<16;n=n+1) begin: two_bits
			full_adder_2 two_bit(input_2bit[4*n+1:4*n],input_2bit[4*n+3:4*n+2],input_2bit[n+64],input_3bit[3*n+2],input_3bit[3*n+1:3*n]);
		end
		
		for (n=0;n<8;n=n+1) begin: three_bits
			full_adder_3 three_bit(input_3bit[6*n+2:6*n],input_3bit[6*n+5:6*n+3],input_3bit[n+48],input_4bit[4*n+3],input_4bit[4*n+2:4*n]);
		end
		
		for (n=0;n<4;n=n+1) begin: four_bits
			full_adder_4 four_bit(input_4bit[8*n+3:8*n],input_4bit[8*n+7:8*n+4],input_4bit[n+32],input_5bit[5*n+4],input_5bit[5*n+3:5*n]);
		end
		
		for (n=0;n<2;n=n+1) begin: five_bits
			full_adder_5 five_bit(input_5bit[10*n+4:10*n],input_5bit[10*n+9:10*n+5],input_5bit[n+20],input_6bit[6*n+5],input_6bit[6*n+4:6*n]);
		end
		
			full_adder_6 six_bit(input_6bit[5:0],input_6bit[11:6],input_6bit[12],S[6],S[5:0]);

	endgenerate
endmodule