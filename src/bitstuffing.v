module bitstuffing (samplePoint, canRX, bsOnOff, stuffing, bsError);

input wire samplePoint, canRX, bsOnOff;
output wire stuffing, bsError;

reg [2:0]count = 3'b000;
reg mem = 0;
reg stuffing0 = 0, bsError0 = 0;
reg debug = 0;

assign stuffing = stuffing0;
assign bsError = bsError0;

always @ (posedge samplePoint) begin

	if (bsOnOff == 1'b1) begin
		
		if (canRX == mem) begin
		
			if (count == 3'b101) begin
			
				bsError0 <= 1'b1;
				stuffing0 <= 1'b0;
				count <= 3'b000;
				
			end else begin
			
				bsError0 <= 1'b0;
				stuffing0 <= 1'b0;
				count <= count + 1;
				
			end
			
		end else begin
		
			if (count == 5) begin
			
				bsError0 <= 1'b0;
				stuffing0 <= 1'b1;
				count <= 3'b000;
				
			end else begin
			
				mem <= canRX;
				bsError0 <= 1'b0;
				stuffing0 <= 1'b0;
				count <= 3'b001;
				
			end
			
		end
		
	end else begin
	
		count <= 3'b000;
		bsError0 <= 1'b0;
		stuffing0 <= 1'b0;

	end
end
endmodule