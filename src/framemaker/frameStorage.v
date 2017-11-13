module frameStorage
(
	input	sp, CAN_RX, isStuff, reset,
	//output reg [589:0] frame
	output reg [589:0] frame
);

	
	initial begin
		frame = 0;
	end

	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge sp or posedge reset) begin
		if (reset)
			begin
				frame = 0;
			end
		else if (~isStuff)
			begin
				frame = frame << 1;
				frame = frame + CAN_RX;
			end
	end
	
endmodule
