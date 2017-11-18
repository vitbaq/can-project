module frameMakerTop_TB ();

	reg samplePoint_tb, canRX_tb,  frameReady_tb, isError_tb;
	wire endOverload_tb, isStart_tb;
	
	frameMakerTop dut(samplePoint_tb, canRX_tb,  frameReady_tb, isError_tb, endOverload_tb, isStart_tb);
	
	initial
	begin
		samplePoint_tb = 1;
	end
	
	always
		#5 samplePoint_tb = ~samplePoint_tb;

	
	initial
	begin
	
		canRX_tb = 1'b0;  frameReady_tb = 1'b0;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b0;  isError_tb = 1'b0; #5

		
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
	
		
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b1;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		canRX_tb = 1'b0;  frameReady_tb = 1'b1;  isError_tb = 1'b0; #5
		
	
		$stop;
	
	end
	
endmodule