// Code your testbench here
// or browse Examples
// Verilog test 

`timescale 1ns / 1ns

module lab12newtestbench;

// Inputs
   reg clk, reset;
//
// output  
   wire seriout;
  wire   out; 



// Bidirs
  lab12new   u1(out,clk, reset,seriout);

  
// Initialize Inputs
 initial
clk=0;
always
#5 clk=~ clk; 
   
		
initial
begin
reset=0; 
#20 reset=1;
#400  $finish;

end
initial begin
  
    $dumpfile("dump.vcd");  
    $dumpvars(1); 
  end	 	 
	  
endmodule
