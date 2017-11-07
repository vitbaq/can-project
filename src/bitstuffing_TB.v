module bitstuffing_TB;

	reg 	samplePoint_tb, canRX_tb, bsOnOff_tb;
	wire  stuffing_tb, bsError_tb;

bitstuffing dut(samplePoint_tb, canRX_tb, bsOnOff_tb, stuffing_tb, bsError_tb);

initial
begin

	samplePoint_tb = 1'b0;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5

	samplePoint_tb = 1'b1;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5	
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5 
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b1;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5

	samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b0;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	samplePoint_tb = 1'b1;	canRX_tb = 1'b0;	bsOnOff_tb = 1'b1; #5
	
	$stop;

end
endmodule