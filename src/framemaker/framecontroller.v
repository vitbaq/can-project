// Modulo da maquina de estados do Frame controller
// Redes Automotivas - CIn UFPE - 2017.2
//
module framecontroller
(
	input	sp, CAN_RX, reset, isStuff, errorFlag,
	output reg BS_onoff,
	output reg CRCtype,
	output reg BRS_Stop,
	output reg invalidBit,
	output reg  CRCcalc_on,
	output reg  CRCtime, 
	output reg ackValue,
	output reg  RTR_SRR,
	output reg  IDE,
	output reg 	EDL,
	output reg  BRS,
	output reg RTR_r1,
	output reg frameReady
);

	// Declare state register
	reg		[4:0]state;
	reg		[7:0]cont;
	reg		[3:0]dlc;
	reg		FD;
	reg		bitlido;

	// Declare states
	parameter arbID_st = 0, RTR_SRR_st = 1, IDE0_st = 2, IDE1_st = 3, r0_EDL_st = 4;
	parameter extID_st = 5, extRTR_st = 6, r1_EDL_st = 7, r0_FD_st = 8, BRS_st = 9;
	parameter ESI_st = 10, DLC_st = 11, data_st = 12, crc15_st = 13, crc17_st = 14;
	parameter crc21_st = 15, crcDel_st = 16, ack_st = 17, ackDel_st = 18, eof_st = 19;
	parameter ready_st = 20, error_st = 21;

	// Determine the next state synchronously, based on the
	// current state and the input
	always @ (posedge sp or posedge reset) begin
		if (reset)
		begin
			state <= arbID_st;
			cont = 0;
			dlc = 0;
			FD = 0;
			//Saidas
			BS_onoff = 0;
			CRCtype = 0;
			CRCtime = 0;
			CRCcalc_on = 0;
			BRS_Stop = 0;
			invalidBit = 0;
			ackValue = 0;
			RTR_SRR = 0;
			IDE = 0;
			EDL = 0;
			BRS = 0;
			RTR_r1 = 0;
			frameReady = 0;
			BS_onoff = 1;
			CRCcalc_on = 1;
			if(errorFlag)
			begin
				state <= error_st;
			end
		end
		else
			if(~isStuff)
			begin
				case (state)
					arbID_st: // ID
						begin
							if(cont < 10)
							begin
								cont = cont +1;
							end
							else
							begin
								state <= RTR_SRR_st;
							end
						end
					RTR_SRR_st: // RTR_SRR
						begin
							RTR_SRR = CAN_RX;
							if (CAN_RX)
							begin
								state <= IDE1_st;
							end
							else
							begin
								state <= IDE0_st;
							end
						end
					IDE0_st:
						begin
						IDE = CAN_RX;
						if(~CAN_RX)
							begin
								state <= r0_EDL_st;
							end
						else
							begin
								state <= error_st;
							end
						end
					IDE1_st:
						begin
						IDE = CAN_RX;
						if (CAN_RX)
							begin
								cont = 0;
								state <= extID_st;
							end
							else
							begin
								state <= r0_EDL_st;
							end
						end
					extID_st:
						if (cont < 17)
						begin
							cont = cont + 1;
						end
						else
						begin
							state <= extRTR_st;
						end
					extRTR_st:
						begin
							RTR_r1 = CAN_RX;
							state <= r1_EDL_st;
						end
					r1_EDL_st:
						begin
							EDL = CAN_RX;
							if (CAN_RX)
							begin
								state <= r0_FD_st;
							end
							else
							begin
								state <= r0_EDL_st;
							end
						end
					r0_EDL_st:
						begin
							EDL = CAN_RX;
							if (CAN_RX)
							begin
								state <= r0_FD_st;
							end
							else
							begin
								cont = 0;
								state <= DLC_st;
							end
						end
					r0_FD_st:
						if(~CAN_RX)
						begin
							FD = 1;
							state <= BRS_st;
						end
						else
						begin
							state <= error_st;
						end
					BRS_st:
						begin
							BRS = CAN_RX;
							BRS_Stop = CAN_RX;
							state <= ESI_st;
						end
					ESI_st:
						begin
							cont = 0;
							state <= DLC_st;
						end
					DLC_st: 
						begin
							dlc = dlc << 1;
							dlc = dlc + CAN_RX;
							cont = cont + 1;
							bitlido = CAN_RX;
							if (cont == 4  && dlc != 0) 
							begin
								cont = 0;
								if(dlc > 8)
								begin
									case(dlc)
										9:
											dlc = 12;
										10:
											dlc = 16;
										11:
											dlc = 20;
										12:
											dlc = 24;
										13:
											dlc = 32;
										14:
											dlc = 48;
										15:
											dlc = 64;
									endcase
								end
								state <= data_st;
							end
							else if(cont == 4 && dlc == 0)
							begin
								cont =0;
								if(FD == 0)
								begin
									state <= crc15_st;
								end
								else if(dlc <= 16)
								begin
									state <= crc17_st;
								end
								else
								begin
									state <= crc21_st;
								end
							end
						end
					data_st:
						begin
							if(FD)
								begin
									BRS_Stop = 1;
								end
							cont = cont + 1;
							if (cont==8*dlc) //Definir DLC em algum lugar
							begin
								if(FD == 0)
								begin
									cont = 0;
									state <= crc15_st;
								end
								else if(dlc <= 16)
								begin
									cont = 0;
									state <= crc17_st;
								end
								else
								begin
									cont = 0;
									state <= crc21_st;
								end
							end
						end
					crc15_st:
						begin
							CRCcalc_on =0;
							CRCtime = 1;
							CRCtype = 1;
							cont = cont +1;
							if (cont==15)
							begin
								state <= crcDel_st;
							end
						end
					crc17_st:
						begin
							CRCcalc_on =0;
							CRCtime = 1;
							CRCtype = 2;
							cont = cont +1;
							if (cont==17)
							begin
								state <= crcDel_st;
							end
						end
					crc21_st:
						begin
							CRCcalc_on =0;
							CRCtime = 1;
							CRCtype = 3;
							cont = cont +1;
							if (cont==21)
							begin
								state <= crcDel_st;
							end
						end
					crcDel_st:
						begin
							CRCtime = 0;
							CRCtype = 0;
							BS_onoff = 0;
							BRS_Stop = 0;
							if(CAN_RX)
							begin
								state <= ack_st;
							end
							else
							begin
								state <= error_st;
							end
						end
					ack_st:
						state <= ackDel_st;
					ackDel_st:
						if(CAN_RX)
						begin
							cont = 0;
							state <= eof_st;
						end
						else
						begin
							state <= error_st;
						end
					eof_st:
						begin
							cont = cont +1;
							if(cont==7)
							begin
								state <= ready_st;
							end
						end
					ready_st:
						begin
							frameReady = 1;
							state <= ready_st;
						end
					error_st:
						begin
							cont = 0;
							dlc = 0;
							FD = 0;
						end
				endcase
			end
	end

	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	/*always @ (state)
	begin
			case (state)
				arbID_st:
				begin
					BS_onoff = 0;
					CRCtype = 0;
					CRCtime = 0;
					CRCcalc_on = 0;
					BRS_Stop = 0;
					invalidBit = 0;
					ackValue = 0;
					RTR_SRR = 0;
					IDE = 0;
					EDL = 0;
					BRS = 0;
					RTR_r1 = 0;
					frameReady = 0;
					BS_onoff = 1;
					CRCcalc_on = 1;
				end
				//RTR_SRR_st:
					//RTR_SRR = CAN_RX;
				IDE0_st:
					IDE = CAN_RX;
				IDE1_st:
					IDE = CAN_RX;
				//extID_st:
					
				extRTR_st:
					RTR_r1 = CAN_RX;
				r1_EDL_st:
					EDL = CAN_RX;
				r0_EDL_st:
					EDL = CAN_RX;
				//r0_FD_st:
					
				BRS_st:
					begin
					BRS = CAN_RX;
					BRS_Stop = CAN_RX; // Sample Point FD pode ser ativado aqui
					end
				//ESI_st:
					
				//DLC_st:
					
				data_st:
					if(FD)
					begin
						BRS_Stop = 1;
					end			
				crc15_st:
					begin
					CRCcalc_on =0;
					CRCtime = 1;
					CRCtype = 1;
					end
				crc17_st:
					begin
					CRCcalc_on =0;
					CRCtime = 1;
					CRCtype = 2;
					end
				crc21_st:
					begin
					CRCcalc_on =0;
					CRCtime = 1;
					CRCtype = 3;
					end
				crcDel_st:
					begin
					CRCtime = 0;
					CRCtype = 0;
					BS_onoff = 0;
					BRS_Stop = 0; // Sample Point volta ao normal
					end
				ack_st:
					begin
						ackValue = CAN_RX;
						BS_onoff= 0;
					end
				ackDel_st:
					BS_onoff = 0;
				eof_st:
					BS_onoff = 0;			
				ready_st:
					frameReady = 1;
				error_st:
				begin
					BS_onoff = 0;
					CRCtype = 0;
					BRS_Stop = 0;
					invalidBit = 0;
					ackValue = 0;
					//RTR_SRR = 0;
					IDE = 0;
					EDL = 0;
					BRS = 0;
					RTR_r1 = 0;
					frameReady = 0;
					invalidBit = 1;
				end
			endcase
	end*/

endmodule
