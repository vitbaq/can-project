module DatavsRemote(
RTR_SRR,
IDE,
RTR_r1,
isRemote
);
	input RTR_SRR, IDE, RTR_r1;
	output isRemote;
	assign isRemote = RTR_SRR & (IDE ~^ RTR_r1);
endmodule
