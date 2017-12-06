module frameMakerTop_TB();

	reg	[124:0] messageTest; // Alterar tamanho dependendo da mensagem testada
	
	reg samplePoint_tb, samplePointFD_tb, canRX_tb, isError_tb, isStuff_tb;
	wire endOverload_tb, BS_onoff_tb, BRS_Stop_tb, invalidBit_tb, CRCcalc_on_tb, CRCtime_tb, ackValue_tb, IDE_tb, EDL_tb, BRS_tb, isRemote_tb, frameReady_tb, isStart_tb;
	wire [1:0] CRCtype_tb;
	wire [9:0] size_tb;
	wire [150:0] frame_tb;
	
	frameMakerTop dut(samplePoint_tb, samplePointFD_tb, canRX_tb, isError_tb, isStuff_tb, endOverload_tb, BS_onoff_tb, CRCtype_tb, BRS_Stop_tb, invalidBit_tb, CRCcalc_on_tb, CRCtime_tb, ackValue_tb, IDE_tb, EDL_tb, BRS_tb, isRemote_tb, size_tb, frame_tb, frameReady_tb, isStart_tb);
	
	//messageTest = 51'b 110010010010000001101010100101010101010101111111111 //Frame CAN normal
	//messageTest = 64'b1100100100100101000101010101010101010010101010101010101111111111; //Frame CAN-FD Standard
	//messageTest = 75'b110010010011101010101010101010101011000110101010010101010101010101111111111;	
	//65'b11110 11001 00100 10000 00110 10101 00101 01010 10101 01111 11111 11110 11110
	initial
	begin
		$stop;
		canRX_tb = 1'b1;
		samplePoint_tb = 1'b1;
		samplePointFD_tb = 1'b0;
		isStuff_tb = 1'b0;
		isError_tb = 1'b0;

		// \/ - dataCANFDext_interframe_dataCAN_overload_interframe
		//messageTest = 157'b1101100100100111010101010101010101010110001101010100101010101010101011111111111110110010010010000001101010100101010101010101111111111100000011111111111110111;
		
		// \/ - dataCANFDcTrocasp_interframe_dataCAN_overload_interframe
		//messageTest = 146'b11011001001001001010001010101010101010100101010101010101011111111111110110010010010000001101010100101010101010101111111111100000011111111111110111;
		
		// \/ - dataCAN_interframe_remote_overload_interframe
		messageTest = 125'b11011001001001000000110101010010101010101010111111111111101100100100110000000101010101010101111111111100000011111111111110111;
		
		// \/ - dataCAN_interframe_dataCANcERROR_ERROR
		//messageTest = 89'b11011001001001000000110101010010101010101010111111111111101100100100000011111111111110111;
		//#790 isError_tb = 1;
	end
	
	always
		begin
		#5 samplePoint_tb = ~samplePoint_tb;
		#1 samplePointFD_tb = ~samplePointFD_tb;
		end
	 
	always @(posedge samplePoint_tb)
	begin
		if(messageTest != 0)
		begin
			#5 canRX_tb = messageTest[124];
			messageTest <= messageTest << 1;
			//$stop;
		end
		else
		begin
			$stop;
		end
	
	end
		
endmodule
