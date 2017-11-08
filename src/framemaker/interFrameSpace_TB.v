module interFrameSpace_TB ();
	reg 	samplePoint_tb, canRX_tb, frameReady_tb, endOverload_tb;
	wire  isOverload_tb, isStart_tb;

	interFrameSpace dut(samplePoint_tb, canRX_tb, frameReady_tb, endOverload_tb, isOverload_tb, isStart_tb);
	
	//Para testar os casos, alterar no bloco initial abaixo os valores de samplePoint_tb, canRX_tb, frameReady_tb e endOverload_tb
	
	initial
	begin
	
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
	
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		
		$stop
	
	end
endmodule