module adder(A, B, CI, Y, C, V); // add all inputs and outputs inside parentheses

  // inputs
  input [7:0] A;
  input [7:0] B;
  input CI;

  // outputs
  output [7:0] Y;
  output C;
  output V;
	reg [7:0] G;
	reg [7:0] P;
	reg C;
	reg V;
	wire [7:0] COUT;

	
	one_bit_adder a1(
	.A(A[0]),
	.B(B[0]),
	.S(Y[0]),
	.CI(CI),
	.COUT(COUT[0])
	);
	
	one_bit_adder a2(
	.A(A[1]),
	.B(B[1]),
	.S(Y[1]),
	.CI(COUT[0]),
	.COUT(COUT[1])
	);
	
	
	one_bit_adder a3(
	.A(A[2]),
	.B(B[2]),
	.S(Y[2]),
	.CI(COUT[1]),
	.COUT(COUT[2])
	);
	
	one_bit_adder a4(
	.A(A[3]),
	.B(B[3]),
	.S(Y[3]),
	.CI(COUT[2]),
	.COUT(COUT[3])
	);
	
	one_bit_adder a5(
	.A(A[4]),
	.B(B[4]),
	.S(Y[4]),
	.CI(COUT[3]),
	.COUT(COUT[4])
	);

	one_bit_adder a6(
	.A(A[5]),
	.B(B[5]),
	.S(Y[5]),
	.CI(COUT[4]),
	.COUT(COUT[5])
	);
	
	one_bit_adder a7(
	.A(A[6]),
	.B(B[6]),
	.S(Y[6]),
	.CI(COUT[5]),
	.COUT(COUT[6])
	);

	one_bit_adder a8(
	.A(A[7]),
	.B(B[7]),
	.S(Y[7]),
	.CI(COUT[6]),
	.COUT(COUT[7])
	);
	
	always @(*) begin
	C=COUT[7];
	V=COUT[7]^COUT[6];
	end
	
	
 /**
  always@(*) begin
	G[0]=A[0] & B[0];
	P[0]=A[0]|B[0];
	// C[0] is the carry out from the [0] position
	COUT[0]=G[0]|P[0]&CI;
	
	G[1]=A[1] & B[1];
	P[1]=A[1]|B[1];
	COUT[1]=G[1]|P[1]&COUT[0];
	
	G[2]=A[2] & B[2];
	P[2]=A[2]|B[2];
	COUT[2]=G[2]|P[2]&COUT[1];
	
	G[3]=A[3] & B[3];
	P[3]=A[3]|B[3];
	COUT[3]=G[3]|P[3]&COUT[2];
	
	G[4]=A[4] & B[4];
	P[4]=A[4]|B[4];
	COUT[4]=G[4]|P[4]&COUT[3];
	
	G[5]=A[5] & B[5];
	P[5]=A[5]|B[5];	
	COUT[5]=G[5]|P[5]&COUT[4];

	G[6]=A[6] & B[6];
	P[6]=A[6]|B[6];
	COUT[6]=G[6]|P[6]&COUT[5];

	G[7]=A[7] & B[7];
	P[7]=A[7]|B[7];
	COUT[7]=G[7]|P[7]&COUT[6];

	C=COUT[7];
	
	V=COUT[7]^COUT[6];
	
	Y[0]=A[0]^B[0]^CI;
	Y[1]=A[1]^B[1]^COUT[0];
	Y[2]=A[2]^B[2]^COUT[1];	
	Y[3]=A[3]^B[3]^COUT[2];	
	Y[4]=A[4]^B[4]^COUT[3];	
	Y[5]=A[5]^B[5]^COUT[4];
	Y[6]=A[6]^B[6]^COUT[5];	
	Y[7]=A[7]^B[7]^COUT[6];	
  
  end
  **/

endmodule