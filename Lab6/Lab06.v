// Loop, counter, divider design 
// input clk, reset 
// out: counter, counterdiv// 
module lab06(clk, reset, counterup,counterdown, counterdiv); 

input clk, reset; 
output  [3:0]   counterup,counterdown;  // 4 bit counter  
output  counterdiv;  // frequency divide by counter 

reg [3:0 ] counterup,counterdown; 
reg counterdiv; 

always @(posedge  clk   or  negedge reset) 
begin 
	if (~reset)  
		begin 
		counterup =4; 
		counterdown=9;   
		counterdiv=0; 
		end 
	else  
		begin  
		counterup =counterup+2; 
		counterdiv=counterup[0]; 
		counterdown =counterdown-2; 
		counterdiv=counterdown[0];   
		end  
end 

endmodule