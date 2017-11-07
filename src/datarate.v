module datarate (samplePoint, samplePointFD, edl, brs, brsStop, samplePointOUT);

input wire samplePoint, samplePointFD, edl, brs, brsStop;
output wire samplePointOUT;

wire switch; 

assign switch = edl & brs & brsStop;

assign samplePointOUT = (switch == 0) ? samplePoint : samplePointFD;

endmodule