module overload (samplePoint, canRX, isOverload, endOverload, invalidBit);

	input wire samplePoint, canRX, isOverload;
	output wire endOverload, invalidBit;
	
	
	parameter overload_flag = 0, overload_superposition = 1, overload_delimiter = 2;
	
	reg [1:0]state = overload_flag;
	reg [4:0]count = 0;
	reg endOverload0 = 0, invalidBit0 = 0;
	
	assign endOverload = endOverload0;
	assign invalidBit = invalidBit0;
	
	always @ (posedge samplePoint) begin
		
		if (isOverload) begin
		
			case (state)
				overload_flag: //seis bit, porem um ja foi contado no bloco interframe space
					if (canRX == 0) begin 
						if (count == 4) begin
							state <= overload_superposition;
							count <= count + 1;
						end else begin
							count <= count + 1;
						end
					end else if (canRX == 1) begin
						invalidBit0 <= 0;
						count <= 0;
						state <= overload_flag;
					end

				overload_superposition:
					if (canRX == 0) begin 
						if (count < 10) begin
							count <= count + 1;
						end else begin
							invalidBit0 <= 0;
							count <= 0;
							state <= overload_flag;
						end
					end else if (canRX == 1) begin
						state <= overload_delimiter;
						count <= 1;
					end
					
				overload_delimiter:
					if (canRX == 1) begin 
						if (count < 6) begin
							count <= count + 1;
						end else begin
							endOverload0 = 1;
							state <= overload_flag;
							count <= 0;
						end
					end else if (canRX == 0) begin
					
						if (count == 6) begin 
							state <= overload_flag;
							count <= 1;
						end else begin
							invalidBit0 <= 0;
							count <= 0;
							state <= overload_flag;
						end
					end
					
			endcase
			
		end
		
	end
endmodule