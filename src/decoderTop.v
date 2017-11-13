module decoderTop (samplePoint, samplePointFD, edl, brs, brsStop, canRX, bsOnOff, stuffing, bsError);

	input wire samplePoint, samplePointFD, edl, brs, brsStop, canRX, bsOnOff;
	output wire stuffing, bsError;

	
	wire samplePointFromDatarate;
	
	
	datarate dt (samplePoint, samplePointFD, edl, brs, brsStop, samplePointFromDatarate);
	bitstuffing bt (samplePointFromDatarate, canRX, bsOnOff, stuffing, bsError);
	

endmodule