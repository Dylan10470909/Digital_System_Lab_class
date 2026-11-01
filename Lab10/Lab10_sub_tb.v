// Code your testbench here
// or browse Examples
// Verilog test 
// Verilog test 

module full_sub_4_TB;

// Inputs
// reg clk;
//   reg reset;
//   reg [1:0]  select; // for control signals
   reg [3:0] A, B; 
   reg       COUT; 
 
// Output
  wire [5:0]  D;  // output S
  wire        CIN; 
//   wire        counterdiv; 

// Call the module of lab 07
// 
//alu_fun  u1(clk, reset, alu_out, data_A, data_B);
  full_sub_4  u1(A,B,CIN,D,COUT);
 
  
// Initialize Inputs
  
// initial
//clk=0; 
//always
//#5 clk=~clk; // t=2 ns , 500 mhz
 
 initial  begin
 #0   COUT=0;   // reset the signal
 #10  A=10; B=8; 
 #50  COUT =1;
 #100
 #20 $finish;
 End

  always #10 begin
	A	=	A + 2;
	B	=	B + 1;
   end
		
initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(1); 
  end	 	 
	 
endmodule
