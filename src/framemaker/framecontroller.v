// Modulo da maquina de estados do Frame controller
// Redes Automotivas - CIn UFPE - 2017.2
//
module FrameMakerSM
(
	input	sp, CAN_RX, reset, isStuff, errorFlag,
	output BSonoff, CRCtype, BRS_Stop, invalidBit, 
	ackValue, RTR_SRR, IDE,	EDL, BRS, RTR_r1, frameReady
);

	// Declare state register
	reg		[4:0]state;
	reg		[7:0]cont;
	reg		[3:0]dlc;
	reg		[1:0]crc;
	reg		FD;

	// Declare states
	parameter arbID_st = 0, RTR_SRR_st = 1, IDE0_st = 2, IDE1_st = 3, r0_EDL_st = 4;
	parameter extID_st = 5, extRTR_st = 6, r1_EDL_st = 7, r0_FD_st = 8, BRS_st = 9;
	parameter ESI_st = 10, DLC_st = 11, data_st = 12, crc15_st = 13, crc17_st = 14;
	parameter crc21_st = 15, crcDel_st = 16, ack_st = 17, ackdel_st = 18, eof_st = 19;
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
			crc = 0;
			//Sinais de saida reiniciados
			BSonoff = 0;
			CRCtype = 0;
			BRS_Stop = 0;
			invalidBit = 0;
			ackValue = 0;
			RTR_SRR = 0;
			IDE = 0;
			EDL = 0;
			BRS = 0;
			RTR_r1 = 0;
			frameReady = 0;
		end
		else
			if(~isStuff)
			begin
				//#1 inc = 1; // Incremento em forma de clock
				//#1 inc = 0; // A gente pode usar a expressao (sp ^ ~isStuff) para criar um incremento em qualquer bloco
				case (state)
					arbID_st: // ID 
						if(cont < 10)
						begin
							cont = cont +1;
						end
						else
						begin
							state <= RTR_SRR_st;
						end
					RTR_SRR_st: // RTR_SRR
						if (CAN_RX)
						begin
							state <= IDE1_st;
						end
						else
						begin
							state <= IDE0_st;
						end
					IDE0_st:
						if(~CAN_RX)
						begin
						state <= r0_EDL_st;
						end
						else
						begin
						state <= error_st;
						end
					IDE1_st:
						if (CAN_RX)
						begin
							cont = 0;
							state <= extID_st;
						end
						else
						begin
							RTR = 1;
							state <= r0_EDL_st;
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
							RTR = CAN_RX;
							state <= r1_EDL_st;
						end
					r1_EDL_st:
						if (CAN_RX)
						begin
							state <= r0_FD_st;
						end
						else
						begin
							state <= r0_EDL_st;
						end
					r0_EDL_st:
						if (CAN_RX)
						begin
							state <= r0_FD_st;
						end
						else
						begin
							cont = 0;
							state <= DLC_st;
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
						state <= ESI_st;
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
								if(FD == 0)
								begin
									state <= crc15_st;
								end
								else if(DLC <= 16)
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
							cont = cont + 1;
							if (cont==8*dlc) //Definir DLC em algum lugar
							begin
								if(FD == 0)
								begin
									state <= crc15_st;
								end
								else if(DLC <= 16)
								begin
									state <= crc17_st;
								end
								else
								begin
									state <= crc21_st;
								end
							end
						end
					crc15_st:
						begin
							cont = cont +1;
							if (cont==15)
							begin
								state <= crcDel_st;
							end
						end
					crc17_st:
						begin
							cont = cont +1;
							if (cont==17)
							begin
								state <= crcDel_st;
							end
						end
					crc21_st:
						begin
							cont = cont +1;
							if (cont==21)
							begin
								state <= crcDel_st;
							end
						end
					crcDel_st:
						if(CAN_RX)
						begin
							state <= ack_st;
						end
						else
						begin
							state <= error_st;
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
						frameReady = 1;
					error_st:
						begin
							state <= arbID_st;
							cont = 0;
							dlc = 0;
							FD = 0;
							crc = 0;
							//Sinais de saida reiniciados
							BSonoff = 0;
							CRCtype = 0;
							BRS_Stop = 0;
							invalidBit = 0;
							ackValue = 0;
							RTR_SRR = 0;
							IDE = 0;
							EDL = 0;
							BRS = 0;
							RTR_r1 = 0;
							frameReady = 0;
						end
				endcase
			end
	end

	// Determine the output based only on the current state
	// and the input (do not wait for a clock edge).
	always @ (state or in)
	begin
			case (state)
				arbID_st:
					BS_onoff = 1;
				RTR_SRR_st:
					RTR_SRR = CAN_RX;
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
					CRCtype = 1;
					end
				crc17_st:
					begin
					CRCtype = 2;
					end
				crc21_st:
					begin
					CRCtype = 3;
					end
				crcDel_st:
					begin
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
					invalidBit = 1;
			endcase
	end

endmodule
