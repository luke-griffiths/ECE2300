module one_bit_adder(A, B, S, CI, COUT);
	input A;
	input B;
	input CI;
	output S;
	output COUT;
	reg G;
	reg P;
	reg S;
	reg COUT;


	always @(*) begin
	G=A & B;
	P=A|B;
	COUT=G|P&CI;
	S=A^B^CI;


	end
	
endmodule