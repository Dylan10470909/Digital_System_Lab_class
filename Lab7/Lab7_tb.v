// Verilog test

`timescale 1ns / 1ns

module lab07testbench;

// Inputs
   reg clk;
   reg reset;
   reg state;
   reg [4:0]counter_no;
  

// Output
   wire [7:0]  led;  // output from lab07 
//   wire        counterdiv; 

// Call the module of lab 07
// 

lab07  u1(clk, reset, led);
  
// Initialize Inputs
 
initial
clk=0; 
always
#2 clk=~clk; // t=2 ns , 500 mhz
 
 initial begin
 #0 reset=0;  // reset the signal
 #20 reset=1;
 #500 $finish;
 end
        
initial begin
    $dumpfile("dump.vcd");  
    $dumpvars(1); 
end        
       
endmodule


