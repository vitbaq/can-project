module frameMakerTop (samplePoint, canRX, isError, isStuff, endOverload, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1, isRemote, size, frame);

	input wire samplePoint, canRX, isError, isStuff;
	output wire endOverload, BS_onoff, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1, isRemote;
	output wire [1:0] CRCtype;
	output wire [9:0] size;
	output wire [150:0] frame;
	
	wire isOverloadFromInterframe, frameReadyFromFramecontroller, isStart;
	
	interFrameSpace ifs (samplePoint, canRX, frameReadyFromFramecontroller, endOverload, isOverloadFromInterframe, isStart);
	overload ov (samplePoint, canRX, isOverloadFromInterframe, isError, endOverload);
	framecontroller fc (samplePoint, canRX, isStart, isStuff, isError, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1, frameReadyFromFramecontroller);
	DatavsRemote dr (RTR_SRR, IDE, RTR_r1, isRemote);
	frameSize fsz (samplePoint, isStuff, isStart, size);
	frameStorage fst (samplePoint, canRX, isStuff, isStart, frame);
	
	
	
endmodule