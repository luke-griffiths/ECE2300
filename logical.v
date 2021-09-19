module logical(A, B, OP, Y); 

// add all inputs and outputs inside parentheses
  // inputs

  input [7:0] A;
  input [7:0] B;
  input OP;

  // outputs
  output [7:0] Y;	

  // reg and internal variable definitions
	reg [7:0]Y;


  // implement module here
always@(*) begin
// AND
	if (OP==1'b1)
	begin
		Y[7]=A[7]&B[7];
		Y[6]=A[6]&B[6];
		Y[5]=A[5]&B[5];
		Y[4]=A[4]&B[4];
		Y[3]=A[3]&B[3];
		Y[2]=A[2]&B[2];
		Y[1]=A[1]&B[1];
		Y[0]=A[0]&B[0];
		
	end
	
// OR
	else
	begin
		Y[7]=A[7]|B[7];
		Y[6]=A[6]|B[6];
		Y[5]=A[5]|B[5];
		Y[4]=A[4]|B[4];
		Y[3]=A[3]|B[3];
		Y[2]=A[2]|B[2];
		Y[1]=A[1]|B[1];
		Y[0]=A[0]|B[0];
	end
end
endmodule