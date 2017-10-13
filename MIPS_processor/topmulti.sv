// This tests the entire MIPS processor, not just the controller.

// Use this on Project 5.

module testbench();


  logic        clk;

  logic        reset;


  logic [31:0] writedata, dataadr;

  logic        memwrite;


  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);

  
  // initialize test
  initial
    begin
      reset <= 1; # 22;
 reset <= 0;
    end


  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;

    end

  // check that 7 gets written to address 84
  always@(negedge clk)
    begin
      //if(memwrite) begin
        if(memwrite & dataadr === 84 & writedata === 7) begin
          $display("Simulation succeeded");

          $stop;

        end else if (memwrite & dataadr !== 80) begin
          $display("Simulation failed");

          $stop;
        end
      //end
    end
endmodule
