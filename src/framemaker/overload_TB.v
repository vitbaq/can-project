module overload_TB();
	reg 	samplePoint_tb, canRX_tb, isOverload_tb;
	wire  endOverload_tb, invalidBit_tb;

	overload dut(samplePoint_tb, canRX_tb, isOverload_tb, endOverload_tb, invalidBit_tb);
	
	//Para testar os casos, alterar no bloco initial abaixo os valores de samplePoint_tb, canRX_tb e isOverload_tb
	
	initial
	begin
	
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b0;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
		samplePoint_tb = 1'b1;	canRX_tb = 1'b0; isOverload_tb = 1'b0; #5
		
	end
endmodule