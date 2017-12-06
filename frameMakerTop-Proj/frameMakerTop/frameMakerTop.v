module frameMakerTop (samplePoint, samplePointFD, canRX, isError, isStuff, endOverload, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, IDE, EDL, BRS, isRemote, size, frame, frameReady, isStart);

	input wire samplePoint, samplePointFD, canRX, isError, isStuff;
	output wire endOverload, BS_onoff, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, IDE, EDL, BRS, isRemote, frameReady, isStart;
	output wire [1:0] CRCtype;
	output wire [9:0] size;
	output wire [150:0] frame;
	
	wire isOverloadFromInterframe, samplePointOUT, RTR_SRR, RTR_r1;
	
	datarate dt(samplePoint, samplePointFD, EDL, BRS, BRS_Stop, samplePointOUT);
	interFrameSpace ifs (samplePointOUT, canRX, frameReady, endOverload, isOverloadFromInterframe, isStart);
	overload ov (samplePointOUT, canRX, isOverloadFromInterframe, isError, endOverload);
	framecontroller fc (samplePointOUT, canRX, isStart, isStuff, isError, BS_onoff, CRCtype, BRS_Stop, invalidBit, CRCcalc_on, CRCtime, ackValue, RTR_SRR, IDE, EDL, BRS, RTR_r1, frameReady);
	DatavsRemote dr (RTR_SRR, IDE, RTR_r1, isRemote);
	frameSize fsz (samplePointOUT, isStuff, isStart, size);
	frameStorage fst (samplePointOUT, canRX, isStuff, isStart, frame);
	
endmodule