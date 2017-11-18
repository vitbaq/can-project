module framecontroller_tb
(
	
);

	//reg	[51:0] messageTest; // Para teste de CAN normal
	//reg [64:0] messageTest;	  // Para teste CANFD
	reg [75:0] messageTest;	  // Teste Extended CANFD
	reg	sp_tb, CAN_RX_tb, reset_tb,isStuff_tb,  errorFlag_tb;
	wire BSonoff_tb, BRS_Stop_tb, invalidBit_tb, CRCcalc_on_tb, CRCtime_tb, ackValue_tb, RTR_SRR_tb, IDE_tb, EDL_tb, BRS_tb, RTR_r1_tb, frameReady_tb;
	wire [1:0] CRCtype_tb;

	framecontroller dut(sp_tb, CAN_RX_tb, reset_tb, isStuff_tb, errorFlag_tb,BSonoff_tb, CRCtype_tb, BRS_Stop_tb, invalidBit_tb, CRCcalc_on_tb, CRCtime_tb, ackValue_tb, RTR_SRR_tb, IDE_tb, EDL_tb, BRS_tb, RTR_r1_tb, frameReady_tb );
	
	//messageTest = 52'b1100100100100000011010101001010101010101011111111111 //Frame CAN normal
	//messageTest = 65'b11001001001001010001010101010101010100101010101010101011111111111; //Frame CAN-FD Standard
	//messageTest = 76'b11001001001 11 010101010101010101  01011 0001 10101010 01010101010101010 111 1111111 1;
	
	initial
	begin
		$stop;
		CAN_RX_tb = 1'b0;
		sp_tb = 1'b0;
		reset_tb = 1'b1;
		//messageTest = 52'b1100100100100000011010101001010101010101011111111111; //Frame CAN normal
		//messageTest = 65'b11001001001001010001010101010101010100101010101010101011111111111; //Frame CAN-FD Standard
		messageTest = 76'b1100100100111010101010101010101010110001101010100101010101010101011111111111; //Frame CAN-FD Extended
		isStuff_tb = 1'b0;
		errorFlag_tb = 1'b0;
		#10 reset_tb = 1'b0;
	end
	 
	always @(posedge sp_tb)
	begin
		if(messageTest != 0)
		begin
			//#10 CAN_RX_tb = messageTest[51];
			//#10 CAN_RX_tb = messageTest[64];
			#10 CAN_RX_tb = messageTest[75];
			messageTest <= messageTest << 1;
			//$stop;
		end
		else
		begin
			$stop;
		end
	
	end
	
	always
		#5 sp_tb = !sp_tb;
		
endmodule
