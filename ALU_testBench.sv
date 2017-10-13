module testbench();
	// Place inputs here
	reg clk, reset, A, B, Op0, Op1, Cin, Binv;

	// Outputs
	wire Y0, Y1, Error, Zero;

	// A mycachecircuit instance
	proj3 ALU(clk, reset, A, B, Op0, Op1, Cin, Binv);

	// Test all combinations
	initial begin
		reset = 1; #100;
		reset = 0; 
		A = 0; B = 0; Op0 = 0; Op1 = 0; Cin = 0; Binv = 0; #500;  
		A = 0; B = 0; Op0 = 0; Op1 = 0; Cin = 0; Binv = 1; #500;
		A = 0; B = 0; Op0 = 0; Op1 = 0; Cin = 1; Binv = 0; #500;  
		A = 0; B = 0; Op0 = 0; Op1 = 0; Cin = 1; Binv = 1; #500;
		A = 0; B = 0; Op0 = 0; Op1 = 1; Cin = 0; Binv = 0; #800;  
		A = 0; B = 0; Op0 = 0; Op1 = 1; Cin = 0; Binv = 1; #800;
		A = 0; B = 0; Op0 = 0; Op1 = 1; Cin = 1; Binv = 0; #800;  
		A = 0; B = 0; Op0 = 0; Op1 = 1; Cin = 1; Binv = 1; #800;
		A = 0; B = 0; Op0 = 1; Op1 = 0; Cin = 0; Binv = 0; #700;  
		A = 0; B = 0; Op0 = 1; Op1 = 0; Cin = 0; Binv = 1; #700;
		A = 0; B = 0; Op0 = 1; Op1 = 0; Cin = 1; Binv = 0; #700;  
		A = 0; B = 0; Op0 = 1; Op1 = 0; Cin = 1; Binv = 1; #700;
		A = 0; B = 0; Op0 = 1; Op1 = 1; Cin = 0; Binv = 0; #300;  
		A = 0; B = 0; Op0 = 1; Op1 = 1; Cin = 0; Binv = 1; #300;
		A = 0; B = 0; Op0 = 1; Op1 = 1; Cin = 1; Binv = 0; #300;  
		A = 0; B = 0; Op0 = 1; Op1 = 1; Cin = 1; Binv = 1; #300;
		A = 0; B = 1; Op0 = 0; Op1 = 0; Cin = 0; Binv = 0; #500;  
		A = 0; B = 1; Op0 = 0; Op1 = 0; Cin = 0; Binv = 1; #500;
		A = 0; B = 1; Op0 = 0; Op1 = 0; Cin = 1; Binv = 0; #500;  
		A = 0; B = 1; Op0 = 0; Op1 = 0; Cin = 1; Binv = 1; #500;
		A = 0; B = 1; Op0 = 0; Op1 = 1; Cin = 0; Binv = 0; #900;  
		A = 0; B = 1; Op0 = 0; Op1 = 1; Cin = 0; Binv = 1; #900;
		A = 0; B = 1; Op0 = 0; Op1 = 1; Cin = 1; Binv = 0; #900;  
		A = 0; B = 1; Op0 = 0; Op1 = 1; Cin = 1; Binv = 1; #900;
		A = 0; B = 1; Op0 = 1; Op1 = 0; Cin = 0; Binv = 0; #700;  
		A = 0; B = 1; Op0 = 1; Op1 = 0; Cin = 0; Binv = 1; #700;
		A = 0; B = 1; Op0 = 1; Op1 = 0; Cin = 1; Binv = 0; #700;  
		A = 0; B = 1; Op0 = 1; Op1 = 0; Cin = 1; Binv = 1; #700;
		A = 0; B = 1; Op0 = 1; Op1 = 1; Cin = 0; Binv = 0; #300;  
		A = 0; B = 1; Op0 = 1; Op1 = 1; Cin = 0; Binv = 1; #300;
		A = 0; B = 1; Op0 = 1; Op1 = 1; Cin = 1; Binv = 0; #300;  
		A = 0; B = 1; Op0 = 1; Op1 = 1; Cin = 1; Binv = 1; #300;
		A = 1; B = 0; Op0 = 0; Op1 = 0; Cin = 0; Binv = 0; #700;  
		A = 1; B = 0; Op0 = 0; Op1 = 0; Cin = 0; Binv = 1; #700;
		A = 1; B = 0; Op0 = 0; Op1 = 0; Cin = 1; Binv = 0; #700;  
		A = 1; B = 0; Op0 = 0; Op1 = 0; Cin = 1; Binv = 1; #700;
		A = 1; B = 0; Op0 = 0; Op1 = 1; Cin = 0; Binv = 0; #800;  
		A = 1; B = 0; Op0 = 0; Op1 = 1; Cin = 0; Binv = 1; #800;
		A = 1; B = 0; Op0 = 0; Op1 = 1; Cin = 1; Binv = 0; #800;  
		A = 1; B = 0; Op0 = 0; Op1 = 1; Cin = 1; Binv = 1; #800;
		A = 1; B = 0; Op0 = 1; Op1 = 0; Cin = 0; Binv = 0; #500;  
		A = 1; B = 0; Op0 = 1; Op1 = 0; Cin = 0; Binv = 1; #500;  
		A = 1; B = 0; Op0 = 1; Op1 = 0; Cin = 1; Binv = 0; #500;  
		A = 1; B = 0; Op0 = 1; Op1 = 0; Cin = 1; Binv = 1; #500;  
		A = 1; B = 0; Op0 = 1; Op1 = 1; Cin = 0; Binv = 0; #300;  
		A = 1; B = 0; Op0 = 1; Op1 = 1; Cin = 0; Binv = 1; #300;
		A = 1; B = 0; Op0 = 1; Op1 = 1; Cin = 1; Binv = 0; #300;  
		A = 1; B = 0; Op0 = 1; Op1 = 1; Cin = 1; Binv = 1; #300;
		A = 1; B = 1; Op0 = 0; Op1 = 0; Cin = 0; Binv = 0; #700;  
		A = 1; B = 1; Op0 = 0; Op1 = 0; Cin = 0; Binv = 1; #700;
		A = 1; B = 1; Op0 = 0; Op1 = 0; Cin = 1; Binv = 0; #700;  
		A = 1; B = 1; Op0 = 0; Op1 = 0; Cin = 1; Binv = 1; #700;
		A = 1; B = 1; Op0 = 0; Op1 = 1; Cin = 0; Binv = 0; #800;  
		A = 1; B = 1; Op0 = 0; Op1 = 1; Cin = 0; Binv = 1; #900;
		A = 1; B = 1; Op0 = 0; Op1 = 1; Cin = 1; Binv = 0; #800;  
		A = 1; B = 1; Op0 = 0; Op1 = 1; Cin = 1; Binv = 1; #900;
		A = 1; B = 1; Op0 = 1; Op1 = 0; Cin = 0; Binv = 0; #500;  
		A = 1; B = 1; Op0 = 1; Op1 = 0; Cin = 0; Binv = 1; #500;
		A = 1; B = 1; Op0 = 1; Op1 = 0; Cin = 1; Binv = 0; #500;  
		A = 1; B = 1; Op0 = 1; Op1 = 0; Cin = 1; Binv = 1; #500;
		A = 1; B = 1; Op0 = 1; Op1 = 1; Cin = 0; Binv = 0; #300;  
		A = 1; B = 1; Op0 = 1; Op1 = 1; Cin = 0; Binv = 1; #300;
		A = 1; B = 1; Op0 = 1; Op1 = 1; Cin = 1; Binv = 0; #300;  
		A = 1; B = 1; Op0 = 1; Op1 = 1; Cin = 1; Binv = 1; #300;
	end

endmodule
