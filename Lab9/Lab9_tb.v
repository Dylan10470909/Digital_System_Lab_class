// Code your testbench here
// or browse Examples
// Verilog test 
// Verilog test 

module lab08testbench;

// Inputs
   reg clk;
   reg reset;
   reg [1:0]  x; // for control signals
  
// Output
   wire [2:0]  gry;  // output from lab07 
//   wire        counterdiv; 

// Call the module of lab 07
// 
  state_machine   u1(gry,clk,x,reset);
   
// Initialize Inputs
  
initial
clk=0; 
always
#2 clk=~clk; // t=2 ns , 500 mhz
 
 initial
 begin
 x=2'b00; 
 #0 reset=0;  // reset the signal
 #20 reset=1;
 #100 x=2'b11;  
 #100 x=2'b10; 
 #2000 $finish;
 
 end

 initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(1); 
  end	 	 
	  
endmodule
