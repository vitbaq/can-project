module interFrameSpace (samplePoint, canRX, frameReady, endOverload, isOverload, isStart);

	input wire samplePoint, canRX, frameReady, endOverload;
	output wire isOverload, isStart;
	
	parameter bit1_intermission = 0, bit2_intermission = 1, bit3_intermission = 2, bus_idle = 3;
	
	reg [2:0]state = bus_idle;
	reg isOverload0 = 0, isStart0 = 0;
	reg endError = 0;
	
	assign isOverload = isOverload0;
	assign isStart = isStart0;
	
	always @ (posedge samplePoint) begin
		
		if (frameReady == 0)begin
		
			state <= bit1_intermission;
			isOverload0 <= 0;
			isStart0 <= 0;
			if (endOverload)
				endError <= 1;
		
		end
		
		if (isOverload) begin
			isOverload0 <= 0;
		end

		if (frameReady == 1 && endOverload == 1) begin
			
			if (canRX == 1) begin
				state <= bit2_intermission;
				isOverload0 <= 0;
				isStart0 <= 0;
			end else begin
				state <= bit1_intermission;
				isOverload0 <= 1;
				isStart0 <= 0;
			end
			
		end

		if ((frameReady == 1 && endOverload == 0) || endError == 1) begin
			case (state)
				bit1_intermission:
					if (canRX == 1) begin
						state <= bit2_intermission;
						isOverload0 <= 0;
						isStart0 <= 0;
					end else begin
						state <= bit1_intermission;
						isOverload0 <= 1;
						isStart0 <= 0;
						endError <= 0;
					end
					
				bit2_intermission:
					if (canRX == 1) begin
						state <= bit3_intermission;
						isOverload0 <= 0;
						isStart0 <= 0;
					end else begin
						state <= bit1_intermission;
						isOverload0 <= 1;
						isStart0 <= 0;
						endError <= 0;
					end
					
				bit3_intermission:
					if (canRX == 1) begin
						state <= bus_idle;
						isOverload0 <= 0;
						isStart0 <= 0;
					end else begin
						state <= bit1_intermission;
						isOverload0 <= 0;
						isStart0 <= 1;
						endError <= 0;
					end
					
				bus_idle:
					if (canRX == 1) begin
						state <= bus_idle;
						isOverload0 <= 0;
						isStart0 <= 0;
					end else begin
						state <= bit1_intermission;
						isOverload0 <= 0;
						isStart0 <= 1;
						endError <= 0;
					end
			endcase
		end
	end
endmodule