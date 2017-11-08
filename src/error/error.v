module error(reset, samplePoint, eofErro, crcErro, stuffErro, overloadFlag, output erro, interframe);


	input wire reset, samplePoint, eofErro, crcErro, stuffErro, overloadFlag, canRX;
	output wire erro, interframe;

	reg 		[3:0]stateRead;
	reg 		[4:0]counter = 0;
	
	initial 	erro = 1'b1;
	
	parameter 	reset = 0; 
	parameter	state = 0;
	parameter 	stateAux = 1;
  
  
  
	always	@ (posedge samplePoint or posedge reset) begin
		if(reset)
			begin
			  stateRead <= state;
			  crcErro <= 1'b1;
			  counter <= counter + 1;
			end
		
		else
			if (~reset)
				begin
					case(stateRead)
					  	state : 
							begin		
								if( (eofErro    == 1'b0) || 
									(stuffErro  == 1'b0) || 
									(crcErro    == 1'b0) ||
								   )
									begin
										stateRead <= stateAux;
									end
								interframe <= 1'b1;
								
								if(overloadFlag == 1'b0)
									begin
										stateRead <= stateAux;
									end
								
							end
						
					  	stateAux : 
							begin		
							  stateRead <= state;
							end

						overloadFlag: 
							if (canRX == 0) 
								begin 
									if (count == 4) 
										begin
											counter <= counter + 1;
										end 
									else 
										begin
											counter <= counter + 1;
										end
								end 

							else 
								if (canRX == 1) 
									begin
										counter <= 0;
										state <= overloadFlag;
									end
					endcase
				end
		
	end
    
endmodule
