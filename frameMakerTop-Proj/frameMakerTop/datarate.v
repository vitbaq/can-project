module datarate (samplePoint, samplePointFD, edl, brs, brsStop, samplePointOUT);

	input wire samplePoint, samplePointFD, edl, brs, brsStop;
	output wire samplePointOUT;

	reg switch;
	reg init = 1;

	assign samplePointOUT = (switch == 0) ? samplePoint : samplePointFD;

	always @(samplePoint)
		begin
			if (init) begin
				init <= 0;
				switch <= 0;
			end else begin
				if (edl & brs & brsStop)
					switch <= edl & brs & brsStop;
				else
					switch <= 0;
			end
		end

endmodule