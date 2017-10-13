module ALU32(//input logic clk,
             //input logic reset,
             input logic [31:0] A,
             input logic [31:0] B,
             input logic Binv,
             input logic Cin,
             input logic Op1,
             input logic Op0,
             output logic [31:0] Y,
             output logic Zero,
             output logic Error);

logic [30:0] carries; // Y1 of each ALU
logic [31:0] zeroes;  // Zero of each ALU
logic [31:0] errors;  // Error of each ALU

logic toss; // Throw this bit away

// 32 ALUs.  They must be wired together, no clean way to do this through loops...
MyALU ALU31(/*clk, reset,*/ A[31], B[31], Binv, carries[30], Op0, Op1, Y[31], toss, zeroes[31], errors[31]);
MyALU ALU30(/*clk, reset,*/A[30], B[30], Binv, carries[29], Op0, Op1, Y[30], carries[30], zeroes[30], errors[30]);
MyALU ALU29(/*clk, reset,*/A[29], B[29], Binv, carries[28], Op0, Op1, Y[29], carries[29], zeroes[29], errors[29]);
MyALU ALU28(/*clk, reset,*/A[28], B[28], Binv, carries[27], Op0, Op1, Y[28], carries[28], zeroes[28], errors[28]);
MyALU ALU27(/*clk, reset,*/A[27], B[27], Binv, carries[26], Op0, Op1, Y[27], carries[27], zeroes[27], errors[27]);
MyALU ALU26(/*clk, reset,*/A[26], B[26], Binv, carries[25], Op0, Op1, Y[26], carries[26], zeroes[26], errors[26]);
MyALU ALU25(/*clk, reset,*/A[25], B[25], Binv, carries[24], Op0, Op1, Y[25], carries[25], zeroes[25], errors[25]);
MyALU ALU24(/*clk, reset,*/A[24], B[24], Binv, carries[23], Op0, Op1, Y[24], carries[24], zeroes[24], errors[24]);
MyALU ALU23(/*clk, reset,*/A[23], B[23], Binv, carries[22], Op0, Op1, Y[23], carries[23], zeroes[23], errors[23]);
MyALU ALU22(/*clk, reset,*/ A[22], B[22], Binv, carries[21], Op0, Op1, Y[22], carries[22], zeroes[22], errors[22]);
MyALU ALU21(/*clk, reset,*/A[21], B[21], Binv, carries[20], Op0, Op1, Y[21], carries[21], zeroes[21], errors[21]);
MyALU ALU20(/*clk, reset,*/A[20], B[20], Binv, carries[19], Op0, Op1, Y[20], carries[20], zeroes[20], errors[20]);
MyALU ALU19(/*clk, reset,*/A[19], B[19], Binv, carries[18], Op0, Op1, Y[19], carries[19], zeroes[19], errors[19]);
MyALU ALU18(/*clk, reset,*/A[18], B[18], Binv, carries[17], Op0, Op1, Y[18], carries[18], zeroes[18], errors[18]);
MyALU ALU17(/*clk, reset,*/A[17], B[17], Binv, carries[16], Op0, Op1, Y[17], carries[17], zeroes[17], errors[17]);
MyALU ALU16(/*clk, reset,*/A[16], B[16], Binv, carries[15], Op0, Op1, Y[16], carries[16], zeroes[16], errors[16]);
MyALU ALU15(/*clk, reset,*/A[15], B[15], Binv, carries[14], Op0, Op1, Y[15], carries[15], zeroes[15], errors[15]);
MyALU ALU14(/*clk, reset,*/A[14], B[14], Binv, carries[13], Op0, Op1, Y[14], carries[14], zeroes[14], errors[14]);
MyALU ALU13(/*clk, reset,*/A[13], B[13], Binv, carries[12], Op0, Op1, Y[13], carries[13], zeroes[13], errors[13]);
MyALU ALU12(/*clk, reset,*/A[12], B[12], Binv, carries[11], Op0, Op1, Y[12], carries[12], zeroes[12], errors[12]);
MyALU ALU11(/*clk, reset,*/A[11], B[11], Binv, carries[10], Op0, Op1, Y[11], carries[11], zeroes[11], errors[11]);
MyALU ALU10(/*clk, reset,*/A[10], B[10], Binv, carries[9], Op0, Op1, Y[10], carries[10], zeroes[10], errors[10]);
MyALU ALU9(/*clk, reset,*/A[9], B[9], Binv, carries[8], Op0, Op1, Y[9], carries[9], zeroes[9], errors[9]);
MyALU ALU8(/*clk, reset,*/A[8], B[8], Binv, carries[7], Op0, Op1, Y[8], carries[8], zeroes[8], errors[8]);
MyALU ALU7(/*clk, reset,*/A[7], B[7], Binv, carries[6], Op0, Op1, Y[7], carries[7], zeroes[7], errors[7]);
MyALU ALU6(/*clk, reset,*/A[6], B[6], Binv, carries[5], Op0, Op1, Y[6], carries[6], zeroes[6], errors[6]);
MyALU ALU5(/*clk, reset,*/A[5], B[5], Binv, carries[4], Op0, Op1, Y[5], carries[5], zeroes[5], errors[5]);
MyALU ALU4(/*clk, reset,*/A[4], B[4], Binv, carries[3], Op0, Op1, Y[4], carries[4], zeroes[4], errors[4]);
MyALU ALU3(/*clk, reset,*/A[3], B[3], Binv, carries[2], Op0, Op1, Y[3], carries[3], zeroes[3], errors[3]);
MyALU ALU2(/*clk, reset,*/A[2], B[2], Binv, carries[1], Op0, Op1, Y[2], carries[2], zeroes[2], errors[2]);
MyALU ALU1(/*clk, reset,*/A[1], B[1], Binv, carries[0], Op0, Op1, Y[1], carries[1], zeroes[1], errors[1]);
MyALU ALU0(/*clk, reset,*/A[0], B[0], Binv, Cin, Op0, Op1, Y[0], carries[0], zeroes[0], errors[0]);



// All ALUs must produce Zero for Zero to be true
assign Zero = zeroes[31] & zeroes[30] & 
              zeroes[29] & zeroes[28] & zeroes[27] & zeroes[26] & zeroes[25] &
              zeroes[24] & zeroes[23] & zeroes[22] & zeroes[21] & zeroes[20] &
              zeroes[19] & zeroes[18] & zeroes[17] & zeroes[16] & zeroes[15] &
              zeroes[14] & zeroes[13] & zeroes[12] & zeroes[11] & zeroes[10] &
              zeroes[9] & zeroes[8] & zeroes[7] & zeroes[6] & zeroes[5] &
              zeroes[4] & zeroes[3] & zeroes[2] & zeroes[1] & zeroes[0];


endmodule
 


module MyALU(//input logic clk,
	//input logic reset,
	input logic A,
	input logic B,
	input logic Binv,
	input logic Cin,
	input logic Op0,
	input logic Op1,
	output logic Y0,
	output logic Y1,
	output logic Zero,
	output logic Error);

  //always_ff@(posedge clk, posedge reset) 
   assign Error = Op1 & Op0;
   assign Zero = ~(( (~Op1 & ~Op0) & ( (Cin & ~A) | (A & B & ~Binv & ~Cin) | 
                                                (A & B & Binv & Cin) |
                                                (A & ~B & Binv & ~Cin) |
                                                (A & ~B & ~Binv & Cin) ) ) |
               ( (~Op1 & Op0) & ( (A & ~Cin) | (~A & ~B & ~Binv & Cin) |
                                               (~A & ~B & Binv & ~Cin) |
					       (~A & B & Binv & Cin) |
                                               (~A & B & ~Binv & ~Cin) ) ) |
               ( (Op1 & ~Op0) & ( (~A & ~B & ~Binv & Cin) |
				  (~A & ~B & Binv & ~Cin) |
				  (~A & B & Binv & Cin) |
				  (~A & B & ~Binv & ~Cin) |
				  (A & B & ~Binv  & Cin) |
				  (A & B & Binv & ~Cin) |
				  (A & ~B & Binv & Cin) |
				  (A & ~B & ~Binv & ~Cin) ) )
                   );

   assign Y0 = ( (~Op1 & ~Op0) & ( (Cin & ~A) | (A & B & ~Binv & ~Cin) | 
                                                (A & B & Binv & Cin) |
                                                (A & ~B & Binv & ~Cin) |
                                                (A & ~B & ~Binv & Cin) ) ) |
               ( (~Op1 & Op0) & ( (A & ~Cin) | (~A & ~B & ~Binv & Cin) |
                                               (~A & ~B & Binv & ~Cin) |
					       (~A & B & Binv & Cin) |
                                               (~A & B & ~Binv & ~Cin) ) ) |
               ( (Op1 & ~Op0) & ( (~A & ~B & ~Binv & Cin) |
				  (~A & ~B & Binv & ~Cin) |
				  (~A & B & Binv & Cin) |
				  (~A & B & ~Binv & ~Cin) |
				  (A & B & ~Binv  & Cin) |
				  (A & B & Binv & ~Cin) |
				  (A & ~B & Binv & Cin) |
				  (A & ~B & ~Binv & ~Cin) ) );

    assign Y1 = ( (A & ~Op1 & Op0 & Cin) | 
                                 (A & B & ~Binv & ~Op1 & Cin) |
                                 (A & ~B & Binv & ~Op1 & Cin) |
                                 (B & ~Binv & ~Op1 & Op0 & Cin) |
                                 (~A & ~B & Binv & ~Op1 & Op0 & Cin) |
				 (A & Op1 & ~Op0 & Cin) | 
                                 (A & B & ~Binv & Op1 & ~Op0) |
                                 (A & ~B & Binv & Op1 & ~Op0) |
                                 (B & ~Binv & Op1 & ~Op0 & Cin) |
                                 (~A & ~B & Binv & Op1 & ~Op0 & Cin) );
                                 
               

endmodule

module MyALU_MultiCycle(input logic clk,
	input logic reset,
	input logic A,
	input logic B,
	input logic Binv,
	input logic Cin,
	input logic Op0,
	input logic Op1,
	output logic Y0,
	output logic Y1,
	output logic Zero,
	output logic Error);

// We need 5 bits (4 down to 0) for states in our state machine (S0-S24)
typedef enum logic[4:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, 
S19, S20, S21, S22, S23, S24, S25} statetype ;

// Initialization of state variables
statetype state, nextstate;

// Flip Flop
always_ff@(posedge clk, posedge reset)
	if(reset) state <= S0;
	else state <= nextstate;

// State Diagram
always_comb
	case(state)
	S0: if(Op0) nextstate <= S2;
	    	else nextstate <= S1;
	S1: if(Op1) nextstate <= S8;
	    	else nextstate <= S4;
	S2: if(Op1) nextstate <= S3;
	    	else nextstate <= S12;
	S3: nextstate <= S0;
	S4: if(A) nextstate <= S5;
		else nextstate <= S19;
	S5: if(B) nextstate <= S7;
		else nextstate <= S6;
	S6: if(Binv) nextstate <= S20;
		else nextstate <= S19;
	S7: if(Binv) nextstate <= S19;
		else nextstate <= S20;
	S8: if(A) nextstate <= S20;
		else nextstate <= S9;
	S9: if(B) nextstate <= S10;
		else nextstate <= S11;
	S10: if(Binv) nextstate <= S19;
		else nextstate <= S20;
	S11: if(Binv) nextstate <= S20;
		else nextstate <= S19;
	S12: if(A) nextstate <= S14;
		else nextstate <= S13;
	S13: if(B) nextstate <= S16;
		else nextstate <= S15;
	S14: if(B) nextstate <= S18;
		else nextstate <= S17;
	S15: if(Binv) nextstate <= S20;
		else nextstate <= S19;
	S16: if(Binv) nextstate <= S19;
		else nextstate <= S20;
	S17: if(Binv) nextstate <= S21;
		else nextstate <= S20;
	S18: if(Binv) nextstate <= S20;
		else nextstate <= S21;
	S19: if(Cin) nextstate <= S23;
		else nextstate <= S22;
	S20: if(Cin) nextstate <= S24;
		else nextstate <= S23;
	S21: if(Cin) nextstate <= S25;
		else nextstate <= S24;
	S22: nextstate <= S0;
	S23: nextstate <= S0;
	S24: nextstate <= S0;
	S25: nextstate <= S0;
endcase

// Output logic: (Y0 = Y1 = 0) | (Zero = 1) in S22
//		 (Y0 = 1) & (Y1 = 0) in S23
//		 (Y0 = 0) & (Y1 = 1) in S24
//		 Y0 = Y1 = 1 in S25
//		 Error = 1 in S3
assign Y0 = (state == S23 || state == S25);
assign Y1 = (state == S24 || state == S25);
assign Zero = (state == S22);
assign Error = (state == S3);

endmodule