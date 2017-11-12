module frameSize_TB
(
	
);

	// Declare state register
	reg	sp_tb, isStuff_tb, reset_tb;
	wire [9:0] size_tb;

	frameSize dut(sp_tb, isStuff_tb, reset_tb, size_tb);
	
	initial
	begin
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b1; #5
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; isStuff_tb = 1'b1; reset_tb =1'b0; #5
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		$stop;
		
		// Valor esperado : 5 e depois reseta
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b1; #5
		sp_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		// Valor esperado : 2
		$stop;
	end
endmodule
