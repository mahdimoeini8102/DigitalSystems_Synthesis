module TB ();
	reg [126:0] ii=1'd0;
	int n;
	wire [6:0] SS;
	ones_counter my_ic(ii, SS);
	initial begin
		for (n=0;n<127;n=n+1)begin
			#1000 ii=(ii+1)*2-1;
		end
		for (n=0;n<127;n=n+1)begin
			#1000 ii=ii*2;
		end
		#1000 $stop;
	end
endmodule