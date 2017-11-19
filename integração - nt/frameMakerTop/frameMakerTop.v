module frameMakerTop (samplePoint, canRX, isError, isStuff, endOverload, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, EDL, BRS, frameReady, isRemote, size, frame);
	
	input wire samplePoint, canRX, isError, isStuff;
	output wire endOverload, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, EDL, BRS, frameReady, isRemote;
	output wire [9:0] size;
	output wire [589:0] frame;
	
	wire isOverloadFromInterframe, isStart, RTR_SRR, IDE, RTR_r1;
	
	interFrameSpace ifs (samplePoint, canRX, frameReady, endOverload, isOverloadFromInterframe, isStart);
	
	overload ov (samplePoint, canRX, isOverloadFromInterframe, isError, endOverload);
	
	framecontroller fc (samplePoint, canRX, isStart, isStuff, isError, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1, frameReady);
	
	DatavsRemote dr (RTR_SRR, IDE, RTR_r1, isRemote);
	
	frameSize fsz (samplePoint, isStuff, isStart, size);
	
	frameStorage fst (samplePoint, canRX, isStuff, isStart, frame);
	
endmodule