module frameStorage_TB
(
	
);

	// Declare state register
	reg	sp_tb, CAN_RX_tb, isStuff_tb, reset_tb;
	wire [589:0] frame_tb;

	frameStorage dut(sp_tb, CAN_RX_tb, isStuff_tb, reset_tb, frame_tb);
	
	initial
	begin
		sp_tb = 0;
		CAN_RX_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b1; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b1; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		// Valor esperado : 11001 e depois reseta
		$stop;
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b1; #10
		
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #10
		// Valor esperado : 11
		$stop;
	end
	
	always
		#5 sp_tb = !sp_tb;
		
endmodule
