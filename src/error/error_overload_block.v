module error(input reset, samplePoint, eofErro, crcErro, stuffErro, overloadFlag, output erro, interframe);

	reg 		[3:0]stateRead;
	
	initial 	erro = 1'b1;
	
	parameter 	reset = 0; 
	parameter	state = 0;
	parameter 	stateAux = 1;
  
  
  
	always	@ (posedge samplePoint or posedge reset) begin
		if(reset)
			begin
			  stateRead <= state;
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
					endcase
				end
		
	end
    
endmodule