// Code your design here 
// A MUX: 2 inputs, 1 output 
// 
/////////////////////////////////////Mux2to1 continuous assignment///////////////////////////// 
/* 
module mux2to1(a,b,o,sel);   
input a,b,sel; 
output o; 

assign o=(sel)?a:b; 

endmodule 
*/ 
////////////////////////////////////End of mux2to1//////////////////////// 

///////////////////////////////////////Mux16to1/////////////////////////// 

// No input of this MUX 
// 
module lab05(In1, In2, In3, In4,a,b,c,d,e,f,g); 

//input [3:0] sel; 
input In1; //LSB 
input In2;  
input In3;  
input In4;  
output a,b,c,d,e,f,g; 
reg  a,b,c,d,e,f,g; 

always @(In4 or In3 or In2 or In1) 
begin
	case ({In4, In3, In2, In1})  // MSB : In4, LSB: In1 
	4'b0000 :begin a=1;b=1;c=1;d=1;e=1;f=1;g=0; end 
	4'b0001 :begin a=0;b=1;c=1;d=0;e=0;f=0;g=0; end 
	4'b0010 :begin a=1;b=1;c=0;d=1;e=1;f=0;g=1; end 
	4'b0011 :begin a=1;b=1;c=1;d=1;e=0;f=0;g=1; end 
	4'b0100 :begin a=0;b=1;c=1;d=0;e=0;f=1;g=1; end 
	4'b0101 :begin a=1;b=0;c=1;d=1;e=0;f=1;g=1; end 
	4'b0110 :begin a=1;b=0;c=1;d=1;e=1;f=1;g=1; end 
	4'b0111 :begin a=1;b=1;c=1;d=0;e=0;f=1;g=0; end 
	4'b1000 :begin a=1;b=1;c=1;d=1;e=1;f=1;g=1; end 
	4'b1001 :begin a=1;b=1;c=1;d=0;e=1;f=1;g=1; end 
	4'b1011 :begin a=1;b=1;c=1;d=1;e=1;f=1;g=1; end 
	4'b1100 :begin a=1;b=0;c=0;d=1;e=1;f=1;g=0; end 
	4'b1101 :begin a=1;b=1;c=1;d=1;e=1;f=1;g=0; end 
	4'b1110 :begin a=1;b=0;c=0;d=1;e=1;f=1;g=1; end 
	4'b1111 :begin a=1;b=0;c=0;d=0;e=1;f=1;g=1; end 
	default :begin a=1;b=1;c=1;d=1;e=1;f=1;g=0; end 
	endcase 
end 

endmodule