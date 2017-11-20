module crcCalculation(input reset, samplePoint, canRX, isStuff,CRCcalc_on, output CRCresult);

reg         [4:0]CRCtype;
reg         [9:0]CRClength;
parameter   crc0, crc15, crc17, crc21;

initial     conter = 9'd0;

always @ (posedge samplePoint or posedge reset) begin
    if ( (reset == 1) && (CRCcalc_on == 1) ) 
    begin
        CRClength = 0;
        case(CRCtype)
            crc0:
                conter <= 9'd0;
            crc15:
                if (CRClength < 15)
                    begin   
                        CRClength = CRClength +1
                    end

            crc17:
                if (CRClength < 17)
                    begin   
                        CRClength = CRClength +1
                    end

            crc21:
                if (CRClength < 21)
                    begin   
                        CRClength = CRClength +1
                    end


endmodule
