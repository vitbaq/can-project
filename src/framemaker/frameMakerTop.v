module frameMakerTop (samplePoint, canRX, frameReady, isError, endOverload, isStart);

	input wire samplePoint, canRX,  frameReady, isError;
	output wire endOverload, isStart;
	
	wire isOverloadFromInterframe;
	
	interFrameSpace ifs (samplePoint, canRX, frameReady, endOverload, isOverloadFromInterframe, isStart);
	overload ov (samplePoint, canRX, isOverloadFromInterframe, isError, endOverload);
	
endmodule