// Code your testbench here
// or browse Examples
// Verilog test 
// Verilog test 

module lab10newtestbench;

// Inputs
// reg clk;
//   reg reset;
//   reg [1:0]  select; // for control signals
   reg [3:0] A, B; 
   reg       CIN; 

// Output
 wire [3:0]  S;  // output S
 wire        COUT; 
//   wire        counterdiv; 

// Call the module of lab 07
// 
//alu_fun  u1(clk, reset, alu_out, data_A, data_B);
full_adder_4  u1(A,B,CIN,S,COUT);
 
  
// Initialize Inputs
  
// initial
//clk=0; 
//always
//#5 clk=~clk; // t=2 ns , 500 mhz
 
 initial
 begin
 #0  CIN=0;   // reset the signal
 #10  A=10; B=8; 
 #10  A=12; B=1;  
 #200
 #20 $finish;
end

  always #10 begin
	A	=	A + 1;
	B	=	B + 1;
    CIN =   CIN+1;
  end

initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(1); 
  end	 	 
	   
endmodule