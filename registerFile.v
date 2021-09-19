module registerFile(SA, SB, LD, DR, D_in, CLK, RESET, DataA, DataB);

input CLK,RESET,LD;
input [2:0] SA, SB, DR;
input [7:0] D_in;
output reg [7:0] DataA;
output reg [7:0] DataB;
reg [7:0] R0,R1,R2,R3,R4,R5,R6,R7;

always@(*) begin
	case(SA)
		0: DataA <= R0;
		1: DataA <= R1;
		2: DataA <= R2;
		3: DataA <= R3;
		4: DataA <= R4;
		5: DataA <= R5;
		6: DataA <= R6;
		7: DataA <= R7;
	endcase
	
	case(SB)
		0: DataB <= R0;
		1: DataB <= R1;
		2: DataB <= R2;
		3: DataB <= R3;
		4: DataB <= R4;
		5: DataB <= R5;
		6: DataB <= R6;
		7: DataB <= R7;
	endcase
end

always@(posedge CLK) begin
	if (RESET) begin
		R0 <= 0;
		R1 <= 0;
		R2 <= 0;
		R3 <= 0;
		R4 <= 0;
		R5 <= 0;
		R6 <= 0;
		R7 <= 0;
	end
	else if (LD) begin
		case(DR)
			0: R0 <= D_in;
			1: R1 <= D_in;
			2: R2 <= D_in;
			3: R3 <= D_in;
			4: R4 <= D_in;
			5: R5 <= D_in;
			6: R6 <= D_in;
			7: R7 <= D_in;
			endcase
	end else begin
		R0 <= R0;
		R1 <= R1;
		R2 <= R2;
		R3 <= R3;
		R4 <= R4;
		R5 <= R5;
		R6 <= R6;
		R7 <= R7;
	end
end

endmodule 