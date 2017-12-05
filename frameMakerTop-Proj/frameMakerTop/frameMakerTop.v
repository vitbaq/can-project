module frameMakerTop (samplePoint, canRX, isError, isStuff, endOverload, isStart, frameReadyFromFramecontroller, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1);

	input wire samplePoint, canRX, isError, isStuff;
	output wire endOverload, isStart, frameReadyFromFramecontroller, BS_onoff, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1;
	output wire [1:0] CRCtype;
	
	wire isOverloadFromInterframe;//, frameReadyFromFramecontroller;
	
	interFrameSpace ifs (samplePoint, canRX, frameReadyFromFramecontroller, endOverload, isOverloadFromInterframe, isStart);
	overload ov (samplePoint, canRX, isOverloadFromInterframe, isError, endOverload);
	framecontroller fc (samplePoint, canRX, isStart, isStuff, isError, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1, frameReadyFromFramecontroller);
	
	
endmodule