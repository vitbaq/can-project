module frameStorage
(
	input	sp, CAN_RX, isStuff, reset,
	output reg [589:0] frame
);

	// Declare state register
	reg		[589:0] frameValue;
	
	initial begin
		frameValue = 0;
	end

	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge sp or posedge reset) begin
		if (reset)
			begin
				frameValue = 0;
			end
		else if (~isStuff)
			begin
				frameValue = frameValue < 1;
				frameValue = frameValue + CAN_RX;
			end
	end

	
	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	always @ (state or in)
	begin
			frame = frameValue;
	end

endmodule
