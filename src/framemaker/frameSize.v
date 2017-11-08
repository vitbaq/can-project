module frameSize
(
	input	sp, isStuff, reset,
	output reg [9:0] size
);

	reg		[9:0] sizeValue;
	
	initial begin
		sizeValue = 0;
	end

	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge sp or posedge reset) begin
		if (reset)
			begin
				sizeValue = 0;
			end
		else if (~isStuff)
			begin
				sizeValue = sizeValue + 1;
			end
	end

	
	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	always @ (state or in)
	begin
			size = sizeValue;
	end
 
endmodule
