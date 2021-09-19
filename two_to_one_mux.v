module two_to_one_mux(A,B,S,OUT);
input [7:0] A;		//selected when S==0
input [7:0] B;		//selected when S==1
input S;
output reg [7:0] OUT;
	always@ (*)begin
		if (S) OUT = B;
		else OUT = A;
	
	end

endmodule