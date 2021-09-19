module control(OP, CISEL, BSEL, OSEL, SHIFT_LA, SHIFT_LR, LOGICAL_OP); // add other inputs and outputs here

// inputs (add others here)
	input [2:0] OP;
	output CISEL;
	output BSEL;
	output [1:0] OSEL;
	output SHIFT_LA;
	output SHIFT_LR;
	output LOGICAL_OP;
	reg BSEL;
	reg CISEL;
	reg [1:0] OSEL;
	reg SHIFT_LA;
	reg SHIFT_LR;
	reg LOGICAL_OP;

// implement module here (add other control signals below)

always@(*)
	if(OP==3'b000)
	begin
	BSEL=1'b0;
	CISEL=1'b0;
	OSEL=2'b00;
	SHIFT_LA=1'b0;
	SHIFT_LR=1'b0;
	LOGICAL_OP=1'b0;
	end
	else if (OP==3'b001)	
	begin
	BSEL=1'b1;
	CISEL=1'b1;
	OSEL=2'b00;
	SHIFT_LA=1'b0;
	SHIFT_LR=1'b0;
	LOGICAL_OP=1'b0;
	end
	else if (OP==3'b010)
	begin
	BSEL=1'b0;
	CISEL=1'b0;
	OSEL=2'b01;
	SHIFT_LA=1'b1;
	SHIFT_LR=1'b0;
	LOGICAL_OP=1'b0;
	end	
	else if (OP==3'b011)
	begin
	BSEL=1'b0;
	CISEL=1'b0;
	OSEL=2'b01;
	SHIFT_LA=1'b0;
	SHIFT_LR=1'b1;
	LOGICAL_OP=1'b0;
	end
	else if (OP==3'b100)
	begin
	BSEL=1'b0;
	CISEL=1'b0;
	OSEL=2'b01;
	SHIFT_LA=1'b0;
	SHIFT_LR=1'b0;
	LOGICAL_OP=1'b0;
	end
	else if (OP==3'b101)
	begin
	BSEL=1'b0;
	CISEL=1'b0;
	OSEL=2'b10;	
	SHIFT_LA=1'b0;
	SHIFT_LR=1'b0;
	LOGICAL_OP=1'b1;
	end
	else
	begin
	BSEL=1'b0;
	CISEL=1'b0;
	OSEL=2'b10;
	SHIFT_LA=1'b0;
	SHIFT_LR=1'b0;
	LOGICAL_OP=1'b0;
	end
	

endmodule