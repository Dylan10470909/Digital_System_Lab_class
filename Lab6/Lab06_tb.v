// Verilog test 
 
`timescale 1ns / 1ns 
 
module lab06testbench; 
 
// Inputs 
   reg clk; 
   reg reset; 
   
 
// Output 
  wire [3:0]  counterup,counterdown; 
  wire        counterdiv;  
 
// Call the module of lab 06 
// 
  lab06  u1(clk, reset, counterup,counterdown,  counterdiv); 
   
// Initialize Inputs 
   
initial  
clk=0;  
always 
#5 clk=~clk; 
  
initial begin 
	#0 reset=0;  // reset the signal 
	#20 reset=1; 
	#1000 $finish; 
 end 
  
         
initial begin 
    $dumpfile("dump.vcd");   
    $dumpvars(1);  
end         
      
endmodule