module datarate_TB;
	
	reg 	samplePoint_tb, samplePointFD_tb, edl_tb, brs_tb, brsStop_tb;
	wire  samplePointOUT_tb;

	datarate dut(samplePoint_tb, samplePointFD_tb, edl_tb, brs_tb, brsStop_tb, samplePointOUT_tb);
	
	
	initial
	begin
	
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b0;   brsStop_tb = 1'b0;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b0;   brsStop_tb = 1'b0;  #5
	
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b0;   brsStop_tb = 1'b0;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b1;   samplePointFD_tb = 1'b0;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b0;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b0;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b1;   samplePointFD_tb = 1'b0;   edl_tb = 1'b0;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b1;   samplePointFD_tb = 1'b0;   edl_tb = 1'b1;   brs_tb = 1'b0;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b0;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b1;   brs_tb = 1'b1;   brsStop_tb = 1'b1;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b0;   brsStop_tb = 1'b0;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b0;   brsStop_tb = 1'b0;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b0;   brsStop_tb = 1'b0;  #5
		
		samplePoint_tb = 1'b0;   samplePointFD_tb = 1'b1;   edl_tb = 1'b0;   brs_tb = 1'b0;   brsStop_tb = 1'b0;  #5
	
		$stop;
	end
endmodule