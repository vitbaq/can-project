module interFrameSpace_TB ();
	reg 	samplePoint_tb, canRX_tb, frameReady_tb, endOverload_tb;
	wire  isOverload_tb, isStart_tb;

	interFrameSpace dut(samplePoint_tb, canRX_tb, frameReady_tb, endOverload_tb, isOverload_tb, isStart_tb);
	
	//Para testar os casos, alterar no bloco initial abaixo os valores de samplePoint_tb, canRX_tb, frameReady_tb e endOverload_tb
	
initial
	begin
		samplePoint_tb = 0;
	end
	
	
	always
		#5 samplePoint_tb = ~samplePoint_tb;
		

	initial
	begin
		
		canRX_tb = 1'b1;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b0; endOverload_tb = 1'b0; #5
	
	/*
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b0;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5	//START OF FRAME
		canRX_tb = 1'b0;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
	bus idle */
	
	/*
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b0;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5 //START OF FRAME
		canRX_tb = 1'b0;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
	start of frame no 3 bit do intermission */
	
	
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b1;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b0;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
		canRX_tb = 1'b0;	frameReady_tb = 1'b1; endOverload_tb = 1'b0; #5
	/*overload */
		
	
		$stop;
	
	end
endmodule