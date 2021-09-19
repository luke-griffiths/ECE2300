module shifter(A, LA, LR, Y, C); 
// add all inputs and outputs inside parentheses

  // inputs
	input [7:0] A;
	input LA;// logical shift or arithmetic shift
	input LR; // shift left or right
	output [7:0] Y;
	output C;
	reg [7:0] Y;
	reg C;
	
always@(*) begin
	if(LA==1'b1) begin
	
		Y = {A[7], A[7:1]};
	/**
		Y[7]=A[7];
		Y[6]=A[7];
		Y[5]=A[6];
		Y[4]=A[5];
		Y[3]=A[4];
		Y[2]=A[3];
		Y[1]=A[2];
		Y[0]=A[1];
		**/
		C=A[0];
		end
		
	// SRL
		else
		begin
		if(LR==1'b1) begin
		Y ={1'b0, A[7:1]};
	/**
		Y[7]=1'b0;
		Y[6]=A[7];
		Y[5]=A[6];
		Y[4]=A[5];
		Y[3]=A[4];
		Y[2]=A[3];
		Y[1]=A[2];
		Y[0]=A[1];
		**/
		C=A[0];
		end
		
	// SLL
   else
		begin
		Y={A[6:0], 1'b0};
	/**
		Y[7]=A[6];
		Y[6]=A[5];
		Y[5]=A[4];
		Y[4]=A[3];
		Y[3]=A[2];
		Y[2]=A[1];
		Y[1]=A[0];
		Y[0]=1'b0;
		**/
		C=A[7];
	end
	end
end
endmodule