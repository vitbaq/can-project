module overload_TB();
	reg 	samplePoint_tb, canRX_tb, isOverload_tb, isError_tb;
	wire  endOverload_tb;

	overload dut(samplePoint_tb, canRX_tb, isOverload_tb, isError_tb, endOverload_tb);
	
	//Para testar os casos, alterar no bloco initial abaixo os valores de samplePoint_tb, canRX_tb e isOverload_tb
	
	initial
	begin
		samplePoint_tb = 0;
	end
	
	
	always
		#5 samplePoint_tb = ~samplePoint_tb;
	
	
	initial
	begin
	
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
	/*	
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
	_superposition block*/	

		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b1; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		canRX_tb = 1'b0; isOverload_tb = 1'b1; isError_tb = 1'b0; #5
		
		$stop;
	end
endmodule