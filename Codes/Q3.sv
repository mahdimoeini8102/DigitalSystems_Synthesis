`timescale 1ns/1ns

module TB ();
	reg [3:0] aa;
	reg [3:0] bb;
	reg cc;
	
	wire [3:0] SS;
	wire CoCo;
	nbit_full_adder #4 my_ic(aa, bb, cc, CoCo, SS);
	initial begin
		repeat (20) #500 {aa,bb,cc}=$random;
		#200 $stop;
	end
endmodule