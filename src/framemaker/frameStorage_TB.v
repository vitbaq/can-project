module frameStorage_TB
(
	
);

	// Declare state register
	reg	sp_tb, CAN_RX_tb, isStuff_tb, reset_tb;
	reg [589:0] frame_tb;

	frameStorage dut(sp_tb, CAN_RX_tb, isStuff_tb, reset_tb, frame_tb);
	
	initial
	begin
		sp_tb = 1'b0; CAN_RX_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b0; CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; CAN_RX_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; CAN_RX_tb = 1'b1; isStuff_tb = 1'b1; reset_tb =1'b0; #5
		sp_tb = 1'b1; CAN_RX_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b0; CAN_RX_tb = 1'b0; isStuff_tb = 1'b0; reset_tb =1'b1; #5
		// Valor esperado : 11001 e depois reseta
		
		sp_tb = 1'b1; CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		sp_tb = 1'b1; CAN_RX_tb = 1'b1; isStuff_tb = 1'b0; reset_tb =1'b0; #5
		// Valor esperado : 11
		$stop;
	end
endmodule
