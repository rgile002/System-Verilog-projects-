module testbench();   
logic        clk;   
logic        reset;   
logic [5:0]  op, funct;    
logic [3:0]  alucontrol;   
logic [1:0]  alusrcb, pcsrc;   
logic        zero, pcen, memwrite, irwrite, regwrite;   
logic        alusrca, iord, memtoreg, regdst; 

 
parameter   LW      = 6'b100011;  // Opcode for lw     
parameter   SW      = 6'b101011;  // Opcode for sw     
parameter   RTYPE   = 6'b000000;  // Opcode for R-type      
parameter   BEQ     = 6'b000100;  // Opcode for beq      
parameter   ADDI    = 6'b001000;  // Opcode for addi      
parameter   J       = 6'b000010;  // Opcode for j      
parameter   ADD     = 6'b100000;  // Funct for add      
parameter   SUB     = 6'b100010;  // Funct for sub      
parameter   AND     = 6'b100100;  // Funct for and      
parameter   OR      = 6'b100101;  // Funct for or      
parameter   SLT     = 6'b101010;  // Funct for slt     

// Controller to test
controller myController(clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst, alusrcb, pcsrc, alucontrol);     

always begin       
clk <= 1; # 5; 
clk <= 0; # 5;     
end   

// apply inputs
initial begin       
// reset controller       
reset <= 1; # 12; 
reset <= 0;       

// test lw       
op = LW; funct = 6'bx; zero = 1'bx;       #50;  
// test sw       
op = SW; funct = 6'bx; zero = 1'bx;       #40;      
// test add       
op = RTYPE; funct = ADD; zero = 1'bx;       #40;       
// test sub       
op = RTYPE; funct = SUB; zero = 1'bx;       #40;        
// test and       
op = RTYPE; funct = AND; zero = 1'bx;       #40;       
// test or       
op = RTYPE; funct = OR; zero = 1'bx;       #40;       
// test slt       
op = RTYPE; funct = SLT; zero = 1'bx;      #40;    
 // test beq taken       
op = BEQ; funct = 6'bx; zero = 1'b1;       #30;   
// test beq not taken       
op = BEQ; funct = 6'bx; zero = 1'b0;       #30;      
// test addi       
op = ADDI; funct = 6'bx; zero = 1'bx;       #40;      
// test j       
op = J; funct = 6'bx; zero = 1'bx;       #30;     
end 

endmodule 
