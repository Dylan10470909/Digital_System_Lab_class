// Code youmk.. zxc 
// Lab 5 : Logic gate 
module lab05(In1, In2, In3, In4,out1); 
//input [3:0] sel; 
input In1; //LSB 
input In2; 
input In3; 
input In4; 
output out1; 
reg out1; 
always @(In4 or In3 or In2 or In1) 
begin 
case ({In4, In3, In2, In1}) // MSB : In4, LSB: In1 
4'b0000 : out1=1; 
4'b0001 : out1=1; 
4'b0010 : out1=1; 
4'b0011 : out1=0; 
4'b0100 : out1=0;      
4'b0101 : out1=1; 
4'b0110 : out1=0; 
4'b0111 : out1=0; 
4'b1000 : out1=1; 
4'b1001 : out1=1; 
4'b1010 : out1=1; 
4'b1011 : out1=0; 
4'b1100 : out1=0; 
4'b1101 : out1=0; 
4'b1110 : out1=0; 
4'b1111 : out1=0; 
default : out1=1; 
endcase 
end 
endmodule