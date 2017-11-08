module crcCalculation(input reset, samplePoint, canRX, isStuff,CRCcalc_on, output CRCresult);

reg			[4:0]CRCtype;
parameter 	crc0, crc15, crc17, crc21;

initial 	conter = 9'd0;

always @ (posedge samplePoint or posedge reset) begin
    if ( (reset == 1) && (CRCcalc_on == 1) ) 
    begin
        case(CRCtype)
        	crc0:
        		conter <= 9'd0;
        	crc15:

        	crc17:

        	crc21:


    else if (~isStuff)
    	begin

    	end
    	
	end

endmodule