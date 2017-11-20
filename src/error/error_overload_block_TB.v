module error_overload_block_TB;

reg reset, samplePoint, 
	eofErro, crcErro, stuffErro, overloadFlag;
	
reg erro;
wire saida;

error_overload_block(reset, samplePoint, eofErro, crcErro, stuffErro, overloadFlag, erro, interframe);

	initial begin
		reset = 1;
		samplePoint = 0;
	end
	
	always
	#5 samplePoint = ~samplePoint;
	
	initial begin
		
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b0; eofErro = 1'b1; crcErro = 1'b1;	 #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b0; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b0;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		reset = 1'b0; stuffErro = 1'b1; eofErro = 1'b1; crcErro = 1'b1;  #5;
		
		$stop;
		
	end
endmodule