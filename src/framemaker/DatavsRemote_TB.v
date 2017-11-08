
module DatavsRemote_TB;
	
	reg 	RTR_SRR_tb, IDE_tb, RTR_r1_tb;
	wire  isRemote_tb;

	DatavsRemote dut(RTR_SRR_tb, IDE_tb, RTR_r1_tb, isRemote_tb);
	
	initial
	begin
		
		RTR_SRR_tb = 1'b0;	IDE_tb = 1'b0;  	RTR_r1_tb = 1'b0; #5
		RTR_SRR_tb = 1'b0;	IDE_tb = 1'b0;  	RTR_r1_tb = 1'b1; #5
		RTR_SRR_tb = 1'b0;	IDE_tb = 1'b1;  	RTR_r1_tb = 1'b0; #5
		RTR_SRR_tb = 1'b0;	IDE_tb = 1'b1;  	RTR_r1_tb = 1'b1; #5
		RTR_SRR_tb = 1'b1;	IDE_tb = 1'b0;  	RTR_r1_tb = 1'b0; #5
		RTR_SRR_tb = 1'b1;	IDE_tb = 1'b0;  	RTR_r1_tb = 1'b1; #5
		RTR_SRR_tb = 1'b1;	IDE_tb = 1'b1;  	RTR_r1_tb = 1'b0;	#5
		RTR_SRR_tb = 1'b1;	IDE_tb = 1'b1;  	RTR_r1_tb = 1'b1;	#5

		$stop;
	end
endmodule