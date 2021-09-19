module cpu(CLK, RESET, EN_L, Iin, Din, PC, NextPC, DataA, DataB, DataC, DataD, MW);
  input         CLK;
  input         RESET;
  input         EN_L;
  input  [15:0] Iin;
  input  [7:0]  Din;
  
  output [7:0]  PC;
  output [7:0]  NextPC;
  output [7:0]  DataA;
  output [7:0]  DataB;
  output [7:0]  DataC;
  output [7:0]  DataD;
  output        MW;
  
  // register file to fetch the data
  // decoder to decode the instruction
  // iram
  // dram
  //DataC=the input Din in the register file
  //DataD=the 8-bit output from the ALU
 
 
  
  wire [2:0] DR;
  wire [2:0] SA;
  wire [2:0] SB;
  wire [5:0] IMM;
  wire MB;
  wire [2:0] FS;
  wire MD;
  wire LD;
  wire [2:0] BS;
  wire [5:0] OFF;
  wire HALT;
  wire [7:0] IMMOUT;
  wire [7:0] DataMB;
  
  signExtend se(
  .IMM(IMM),
  .IMMOUT(IMMOUT)
  );
  
  wire C;
  wire N;
  wire V;
  wire Z;
  wire H;
  

	alu alu_unit(
	.A(DataA),
	.B(DataMB),
	.OP(FS),
	.Y(DataD),
	.C(C),
	.V(V),
	.N(N),
	.Z(Z)
	);

  decoder decode(
  .INST(Iin),
  .DR(DR),
  .SA(SA),
  .SB(SB),
  .IMM(IMM),
  .MB(MB),
  .FS(FS),
  .MD(MD),
  .LD(LD),
  .MW(MW),
  .BS(BS),
  .OFF(OFF),
  .HALT(HALT)
  );

  registerFile rg(
  .SA(SA),
  .SB(SB),
  .LD(LD),
  .DR(DR),
  .D_in(DataC),
  .CLK(CLK),
  .RESET(RESET),
  .DataA(DataA),
  .DataB(DataB)
  );
  
  
  
  // comment the two lines out below if you use a submodule to generate PC/NextPC
  reg [7:0] PC;
  reg [7:0] NextPC;
  //wire [7:0] finalPC;
  wire MW;
  
  // ADD YOUR CODE BELOW THIS LINE
	assign MP = (BS == 3'b000) ? Z : ((BS == 3'b001) ? ~Z : ((BS == 3'b010) ? ~N : ((BS == 3'b011) ? N : 0)));

// code for HALT logic	
halt_logic hl(
	.HALT(HALT), 
	.EN_L(EN_L), 
	.H(H),
	.CLK(CLK));
	
	
	always@(posedge CLK)
	begin
	if (RESET) begin PC <= 0; 
	end else begin
		PC<=NextPC;
	end
	end
	wire [7:0] extOFF;
assign NextPCmux0 = PC + 8'd2;
assign extOFF[7] = OFF[5];
assign extOFF[6:1] = OFF;
assign extOFF[0] = 0;

assign NextPCmux1 = NextPCmux0 + extOFF;
	always@(*)begin
	if (H) begin
		NextPC = PC;
	end else if (MP)begin
		NextPC = NextPCmux1; end
	else begin
		NextPC = NextPCmux0;
		end
		end
		

assign DataMB = MB ? IMMOUT : DataB;
assign DataC = MD ? Din : DataD;
  // ADD YOUR CODE ABOVE THIS LINE

endmodule
