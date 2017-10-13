module mips(input  logic        clk, reset,
            output logic [31:0] adr, writedata,
            output logic        memwrite,
            input  logic [31:0] readdata);

  logic        zero, pcen, irwrite, regwrite,
               alusrca, iord, memtoreg, regdst;
  logic [1:0]  alusrcb, pcsrc;
  logic [3:0]  alucontrol;
  logic [5:0]  op, funct;

  controller c(clk, reset, op, funct, zero,
               pcen, memwrite, irwrite, regwrite,
               alusrca, iord, memtoreg, regdst, 
               alusrcb, pcsrc, alucontrol);
  datapath dp(clk, reset, 
              pcen, irwrite, regwrite,
              alusrca, iord, memtoreg, regdst,
              alusrcb, pcsrc, alucontrol,
              op, funct, zero,
              adr, writedata, readdata);
endmodule

module controller(input  logic       clk, reset,
                  input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       pcen, memwrite, irwrite, regwrite,
                  output logic       alusrca, iord, memtoreg, regdst,
                  output logic [1:0] alusrcb, pcsrc,
                  output logic [3:0] alucontrol);

  logic [1:0] aluop;
  logic       branch, pcwrite;

  // Main Decoder and ALU Decoder subunits.
  maindec md(clk, reset, op,
             pcwrite, memwrite, irwrite, regwrite,
             alusrca, branch, iord, memtoreg, regdst, 
             alusrcb, pcsrc, aluop);
  aludec  ad(funct, aluop, alucontrol);

  // ADD CODE HERE

  // Add combinational logic (i.e. an assign statement) 
  // to produce the PCEn signal (pcen) from the branch, 
  // zero, and pcwrite signals
 
endmodule

module maindec(input  logic       clk, reset, 
               input  logic [5:0] op, 
               output logic       pcwrite, memwrite, irwrite, regwrite,
               output logic       alusrca, branch, iord, memtoreg, regdst,
               output logic [1:0] alusrcb, pcsrc,
               output logic [1:0] aluop);
 
  parameter   FETCH   = 4'b0000; 	// State 0
  parameter   DECODE  = 4'b0001; 	// State 1
  parameter   MEMADR  = 4'b0010;	// State 2
  parameter   MEMRD   = 4'b0011;	// State 3
  parameter   MEMWB   = 4'b0100;	// State 4
  parameter   MEMWR   = 4'b0101;	// State 5
  parameter   RTYPEEX = 4'b0110;	// State 6
  parameter   RTYPEWB = 4'b0111;	// State 7
  parameter   BEQEX   = 4'b1000;	// State 8
  parameter   ADDIEX  = 4'b1001;	// State 9
  parameter   ADDIWB  = 4'b1010;	// state 10
  parameter   JEX     = 4'b1011;	// State 11
  parameter   ANDIEX  = 4'b1100;	// State 12
  parameter   ANDIWB  = 4'b1101;	// State 13

  parameter   LW      = 6'b100011;	// Opcode for lw
  parameter   SW      = 6'b101011;	// Opcode for sw
  parameter   RTYPE   = 6'b000000;	// Opcode for R-type
  parameter   BEQ     = 6'b000100;	// Opcode for beq
  parameter   ADDI    = 6'b001000;	// Opcode for addi
  parameter   J       = 6'b000010;	// Opcode for j
  parameter   ANDI    = 6'b001100;

  logic [3:0]  state, nextstate;
  logic [14:0] controls;

  // state register
  always_ff @(posedge clk or posedge reset)			
    if(reset) state <= FETCH;
    else state <= nextstate;

  // ADD CODE HERE
  // First two states (FETCH AND DECODE) are done.
  // next state logic
  always_comb
    case(state)
      FETCH:   nextstate <= DECODE;
      DECODE:  case(op)
                 LW:      nextstate <= MEMADR;
                 SW:      nextstate <= MEMADR;
                 RTYPE:   nextstate <= RTYPEEX;
                 BEQ:     nextstate <= BEQEX;
                 ADDI:    nextstate <= ADDIEX;
                 J:       nextstate <= JEX;
		 ANDI:	  nextstate <= ANDIEX;
                 default: nextstate <= 4'bx; // should never happen
               endcase
 		// Add code here
      MEMADR:	case(op)
		  LW:	  nextstate <= MEMRD;
		  SW:	  nextstate <= MEMWR;
      MEMRD: 	nextstate <= MEMWB;
      MEMWB: 	nextstate <= FETCH;
      MEMWR: 	nextstate <= FETCH;
      RTYPEEX: 	nextstate <= RTYPEWB;
      RTYPEWB: 	nextstate <= FETCH;
      BEQEX:    nextstate <= FETCH;
      ADDIEX:   nextstate <= ADDIWB;
      ADDIWB:   nextstate <= FETCH;
      JEX:      nextstate <= FETCH;
      ANDIEX:	nextstate <= ANDIWB;
      ANDIWB:	nextstate <= FETCH;
      default: nextstate <= 4'bx; // should never happen
		endcase
    endcase

  // output logic
  assign {pcwrite, memwrite, irwrite, regwrite, 
          alusrca, branch, iord, memtoreg, regdst,
          alusrcb, pcsrc, aluop} = controls;

  // ADD CODE HERE
  // Fetch and Logic are done, follow example.
  // Insert your hex codes.
  always_comb
    case(state)
      FETCH:   controls <= 15'h5010;
      DECODE:  controls <= 15'h0030;
      MEMADR:  controls <= 15'h0420;
      MEMRD:   controls <= 15'h0100;
      MEMWB:   controls <= 15'h0880;
      MEMWR:   controls <= 15'h2100;
      RTYPEEX: controls <= 15'h0402;
      RTYPEWB: controls <= 15'h0840;
      BEQEX:   controls <= 15'h0605;
      ADDIEX:  controls <= 15'h0420;
      ADDIWB:  controls <= 15'h0800;
      JEX:     controls <= 15'h4008;
      ANDIEX:  controls <= 15'h0423;	 
      default: controls <= 15'hxxxx; // should never happen
    endcase
endmodule

module aludec(input  logic [5:0] funct,
              input  logic [1:0] aluop,
              output logic [3:0] alucontrol);

  // ADD CODE HERE
  // Complete the design for the ALU Decoder.
  // ALUOp=00 and 01 are done, and one with the funct code.
  // Add the other funct codes.
  always @(*)
     case(aluop)
       2'b00: alucontrol <= 4'b0010;
       2'b01: alucontrol <= 4'b1110;
       2'b11: alucontrol <= 4'b0000;
       default:
          case(funct)
             6'b100000: alucontrol <= 4'b0010; // ADD CASE
             6'b100100: alucontrol <= 4'b0000;
	     6'b100101: alucontrol <= 4'b0001;
	     6'b101010: alucontrol <= 4'b1100;
	     6'b100010: alucontrol <= 4'b1100;
	     //6'b001100: alucontrol <= 4'b0011;
	   endcase
	endcase
endmodule





// The datapath unit is a structural verilog module.  That is,
// it is composed of instances of its sub-modules.  For example,
// the instruction register is instantiated as a 32-bit flopenr.
// The other submodules are likewise instantiated.
module datapath(input  logic        clk, reset,
                input  logic        pcen, irwrite, regwrite,
                input  logic        alusrca, iord, memtoreg, regdst,
                input  logic [1:0]  alusrcb, pcsrc, 
                input  logic [3:0]  alucontrol,
                output logic [5:0]  op, funct,
                output logic        zero,
                output logic [31:0] adr, writedata, 
                input  logic [31:0] readdata);

  // Below are the internal signals of the datapath module.

  logic [4:0]  writereg;
  logic [31:0] pcnext, pc;
  logic [31:0] instr, data, srca, srcb;
  logic [31:0] a;
  logic [31:0] aluresult, aluout;
  logic [31:0] signimm;  	 // the sign-extended immediate
  logic [31:0] signimmsh;	 // the sign-extended immediate shifted left by 2
  logic [31:0] wd3, rd1, rd2;
  logic [31:0] error;
  logic [0:0] slt; 
  logic [31:0] posOrNeg; 											//check

  // op and funct fields to controller
  assign op = instr[31:26];
  assign funct = instr[5:0];

  // You will complete this in Project 5.
  flopenr #(32) regPC(clk, reset, pcen, pcnext, pc);
  mux2 #(32) muxPC(pc, aluout, iord, adr);
  flopenr #(32) regPC2(clk, reset, irwrite, readdata, instr);
  flopr #(32) regPC3(clk, reset, readdata, data);
  mux2 #(32) muxMEM(instr[20:16], instr[15:11], regdst, a);
  mux2 #(32) muxMEM2(aluout, data, memtoreg, wd3); 
  regfile rFile(clk, regwrite, instr[25:21], instr[20:16], a, wd3, rd1, rd2);
  signext extension(instr[15:0], signimm);
  flopr #(32) regA(clk, reset, rd1, rd1);
  flopr #(32) regB(clk, reset, rd2, rd2);
  sl2 extAdd(signimm, signimmsh);
  mux2 #(32) muxALU(pc, rd1, alusrca, srca);
  mux4 #(32) mux4ALU(rd2, 32'b00000000000000000000000000000100, signimm, signimmsh, alusrcb, srcb);
  ALU32 alu(srca, srcb, alucontrol[0], alucontrol[1], alucontrol[2], alucontrol[3], aluresult, zero, error);
  signext aluResultExt(aluresult[31], posOrNeg);							//check
  mux2 #(32) muxAluResult(aluresult, posOrNeg, slt, aluresult);						//check
  flopr #(32) regFinal(clk, reset, aluresult, aluout);
  //sl2 extJump(instr[25:0], {instr[25:0], 2'b00});
  mux3 #(32) muxEnd(aluresult, aluout, {pc[31:28], instr[25:0], 2'b00}, pcsrc, pcnext);			//check
  and7 andSLT(funct[3], ~op[31], ~op[30], ~op[29], ~op[28], ~op[27], ~op[26], slt);   			//check
  
endmodule