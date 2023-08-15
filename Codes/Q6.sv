`timescale 1ns/1ns

module ones_counter(input [126:0] i, output reg [6:0] S);
	int n;
	always @(i) begin
		#630 S=7'b0;
		for (n=0;n<126;n=n+1)begin
			if(i[n])S=S+1;
		end
	end
endmodule