`timescale 1ns/1ns

module full_adder(input a, b, c, output Co, S);
	nand #(10,8) nand1(i, a, b), nand2(j, k, c), nand3(Co, i, j);
	xor #(17,21) xor1(k, a, b), xor2(S, k, c);
endmodule

module TB ();
	reg aa = 0, bb = 1, cc = 1; //First Initialize
	wire SS, CoCo;
	full_adder my_ic(aa, bb, cc, CoCo, SS);
	initial begin
		#100 bb=0; //Co to 0 -- S to 1
		#100 aa=1; //Co to 1
		#100 aa=0; bb=1; cc=0; //Reinitialize
		#100 aa=1; //SS to 0
		#100 $stop;
	end
endmodule