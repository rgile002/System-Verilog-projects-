
///////////////////////////////////////////////////////////////////////////
// Inputs: Always clk and reset
//         Others are for your particular application.
// Outputs: Always will depend on your application.
module project3(input logic clk,
                input logic reset,
		input logic A,
		input logic B,
		input logic Op0,
		input logic Op1,
		input logic Binv,
		input logic Cin,
		output logic Error,
		output logic Zero,
		output logic Y0,
		output logic Y1);

// What we are saying here is that we need two bits (1 down to 0)
// For states in our state machine
// Our states will be S0, S1, S2, S3
// Change this to accomodate how many states you have.
typedef enum logic[4:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23, S24, S25, S26, S27, S28, S29, S30} statetype;

// These will almost always be the same
statetype state, nextstate;

// Flip-flop for states (same for each)
// The flip-flop is triggered when clk goes to 1, or reset goes to 1
// Posedge = positive(1) edge for clk
always_ff@(posedge clk, posedge reset)
   if (reset) state <= S0;
   else state <= nextstate;

// State diagram here.
// Change for your state diagram.
always_comb
   case (state)
      S0: if (Op1) nextstate <= S2;
          else nextstate <= S1;
      S1: if (Op0) nextstate <= S8;
          else nextstate <= S4;
          
      S2: if (Op0) nextstate <= S3;
	  else nextstate <= S9;
	  
      S3:               nextstate <= S0;
      S4: if (A)   nextstate <= S5;
	  else nextstate <= S24;
	  
      S5: if (B)   nextstate <= S7;
	  else   nextstate <= S6;
	  
      S6: if (Binv)nextstate <= S25;
			else nextstate <= S24;
      S7: if (Binv)nextstate <= S24;
	  else nextstate <= S25;
      S8: if (A)   nextstate <= S25;
          else nextstate <= S5;
	  
      S9: if (A)   nextstate <= S17;
	  else   nextstate <= S10;
	  
      S10: if (B)   nextstate <= S14;
	   else   nextstate <= S11;
	  
      S11: if (Binv)nextstate <= S13;
	   else  nextstate <= S12;
	  
      S12: 	       nextstate <= S24;
      S13:	       nextstate <= S25;
      S14: if (Binv)nextstate <= S16;
	   else  nextstate <= S15;
	  
      S15:	       nextstate <= S13;
      S16:	       nextstate <= S12;
      S17: if (B)   nextstate <= S21;
	   else   nextstate <= S18;
	  
      S18: if (Binv)nextstate <= S20;
	   else   nextstate <= S19;
	  
      S19:	       nextstate <= S25;
      S20:	       nextstate <= S26;
      S21: if (Binv)nextstate <= S23;
	   else   nextstate <= S22;
	  
      S22:	       nextstate <= S26;
      S23:	       nextstate <= S19;
      S24: if (Cin) nextstate <= S28;
	   else nextstate <= S27;
	  
      S25: if (Cin) nextstate <= S29;
	   else nextstate <= S28;
	  
      S26: if (Cin) nextstate <= S30;
	   else nextstate <= S29;
	  
      S27:	       nextstate <= S0;
      S28:	       nextstate <= S0;
      S29:	       nextstate <= S0;
      S30:	       nextstate <= S0;

endcase

// Output logic: We hit if we reach S3
//               We miss if we reach S2.
assign Error = (state == S3);
assign  Zero = (state == S27);
assign  Y0 = (state == S28 || state == S30);
assign  Y1 = (state == S29 || state == S30);

endmodule
///////////////////////////////////////////////////////////////////////////
