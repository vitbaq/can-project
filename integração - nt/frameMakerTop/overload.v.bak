module overload (samplePoint, canRX, isOverload, isError, endOverload);

	input wire samplePoint, canRX, isOverload, isError;
	output wire endOverload;
	
	
	parameter overload_flag = 0, overload_superposition = 1, overload_delimiter = 2;
	
	reg [1:0]state = overload_flag;
	reg [4:0]count = 0;
	reg endOverload0 = 0;
	
	assign endOverload = endOverload0;
	
	always @ (posedge samplePoint) begin
	
		if (endOverload0) begin
			endOverload0 <= 0;
		end

		if (isOverload == 1 || isError == 1) begin
		
			case (state)
				overload_flag: //seis bit, porem um ja foi contado no bloco interframe space para um frame overload
					if (isOverload) begin
						if (canRX == 0) begin 
							if (count == 4) begin
								state <= overload_superposition;
								count <= count + 1;
							end else begin
								count <= count + 1;
							end
						end else if (canRX == 1) begin
							count <= 0;
							state <= overload_flag;
						end
					end else if (isError) begin
						if (canRX == 0) begin 
							if (count == 5) begin
								state <= overload_superposition;
								count <= count + 1;
							end else begin
								count <= count + 1;
							end
						end else if (canRX == 1) begin
							count <= 0;
							state <= overload_flag;
						end
					end
				overload_superposition:
					if (canRX == 0) begin 
						if (count < 11) begin
							count <= count + 1;
						end else begin
							count <= 0;
							state <= overload_flag;
						end
					end else if (canRX == 1) begin
						state <= overload_delimiter;
						count <= 1;
					end
					
				overload_delimiter:
					if (canRX == 1) begin 
						if (count < 7) begin
							count <= count + 1;
						end else begin
							endOverload0 <= 1;
							state <= overload_flag;
							count <= 0;
						end
					end else if (canRX == 0) begin
					
						if (count == 7) begin 
							state <= overload_flag;
							count <= 1;
						end else begin
							count <= 0;
							state <= overload_flag;
						end
					end
					
			endcase
			
		end
		
	end
endmodule