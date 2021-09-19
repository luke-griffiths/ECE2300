module signExtend(IMM, IMMOUT);
input [5:0]IMM;
output [7:0] IMMOUT;
reg [7:0] IMMOUT;

always@(*)begin
	IMMOUT={IMM[5], IMM[5], IMM[5:0]};
	end
endmodule