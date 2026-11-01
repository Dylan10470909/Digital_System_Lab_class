module lab11newtestbench;

// Inputs
// reg clk;
//   reg reset;
//   reg [1:0]  select; // for control signals
   reg [3:0] A, B; 
   reg       CIN_A,COUT_S; 
 
// Output
  wire [5:0]  S,D;  // output S
  wire        COUT_A,CIN_S; 
//   wire        counterdiv; 

// Call the module of lab 11
// 
//
ALU_T  u1(A,B,CIN_A,S,COUT_A,COUT_S,CIN_S,D);
 
// Initialize Inputs
  
// initial
//clk=0; 
//always
//#5 clk=~clk; // t=10 ns , 100 Mhz
 
 initial
 begin 
 #0  CIN_A=0;  // reset the signal
 #0  COUT_S=0;   
 #10  A=10; B=8; 
 #50 COUT_S=1;
 #200
 #20 $finish;
 
 end
 
initial begin
  
    $dumpfile("dump.vcd");  
    $dumpvars(1); 
  end	 	 
  
 always #10 begin
	A	=	A + 2;
	B	=	B + 1;
    CIN_A =   CIN_A+1;
  end

	  
endmodule
