module frameMakerTop_TB();

	reg	[62:0] messageTest; // Para teste de CAN normal
	//reg [64:0] messageTest;	  // Para teste CANFD
	//reg [75:0] messageTest;	  // Teste Extended CANFD
	
	reg samplePoint_tb, canRX_tb, isError_tb, isStuff_tb;
	wire endOverload_tb, isStart_tb, frameReadyFromFramecontroller_tb, BS_onoff_tb, BRS_Stop_tb, invalidBit_tb, CRCcalc_on_tb, CRCtime_tb, ackValue_tb, RTR_SRR_tb, IDE_tb, EDL_tb, BRS_tb, RTR_r1_tb;
	wire [1:0] CRCtype_tb;
	
	frameMakerTop dut(samplePoint_tb, canRX_tb, isError_tb, isStuff_tb, endOverload_tb, isStart_tb, frameReadyFromFramecontroller_tb, BS_onoff_tb, CRCtype_tb, BRS_Stop_tb, invalidBit_tb, CRCcalc_on_tb, CRCtime_tb, ackValue_tb, RTR_SRR_tb, IDE_tb, EDL_tb, BRS_tb, RTR_r1_tb);
	
	//messageTest = 52'b 11001001001 000 0001 10101010 010101010101010 1 11 1 1111111 //Frame CAN normal
	//messageTest = 65'b11001001001001010001010101010101010100101010101010101011111111111; //Frame CAN-FD Standard
	//messageTest = 76'b11001001001 11 010101010101010101  01011 0001 10101010 01010101010101010 111 1111111 1;	
	//65'b11110 11001 00100 10000 00110 10101 00101 01010 10101 01111 11111 11110 11110
	initial
	begin
		$stop;
		canRX_tb = 1'b1;
		samplePoint_tb = 1'b1;
		messageTest = 63'b110110010010010000001101010100101010101010101111111111111011110; //Frame CAN normal
		//messageTest = 65'b11001001001001010001010101010101010100101010101010101011111111111; //Frame CAN-FD Standard
		//messageTest = 76'b1100100100111010101010101010101010110001101010100101010101010101011111111111; //Frame CAN-FD Extended
		isStuff_tb = 1'b0;
		isError_tb = 1'b0;
	end
	
	always
		#5 samplePoint_tb = ~samplePoint_tb;
	 
	always @(posedge samplePoint_tb)
	begin
		if(messageTest != 0)
		begin
			//#10 canRX_tb = messageTest[51];
			//#10 canRX_tb = messageTest[64];
			#5 canRX_tb = messageTest[62];
			messageTest <= messageTest << 1;
			//$stop;
		end
		else
		begin
			$stop;
		end
	
	end
		
endmodule
