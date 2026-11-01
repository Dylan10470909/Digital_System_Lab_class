// Code your design here
// Lab 12-new: serigen
module lab12new(out,clk, reset,seriout);

//input [3:0] sel;
input clk, reset; 
output  seriout; 
  output   out;

//input In3; 
//input In4; 
//output out1;
  reg  [2:0] count; // 8 states, 3-bits
reg  seriout;
  
  reg    out;
parameter  hight=1,low=0;  // parameter for define the states
parameter  s0=3'd0,s1=3'd1,s2=3'd2;
reg  [2:0]  state;
reg  [2:0]  next_state;
  
  // 3-bit counter
  //
 always @(posedge clk or negedge reset)
  begin
   if (~ reset)
      count =0;
    else 
      count=count+1;
  end
  
  // Current sate
always  @(posedge clk or negedge reset)
begin
if  (~reset)
state  =  s0;
else
state  =  next_state;
end
       

always @(count)
begin
  case (count)  // MUX based combinational ckt
	  0:  seriout=0;
	  1:  seriout=0;
	  2 : seriout=1;
	  3 : seriout=1;
	  4 : seriout=0;
	  5 : seriout=1;
	  6 : seriout=0;
	  7 : seriout=0;
	 
	  default : seriout=0;
	  endcase
end
  

always  @(state  or seriout  )
begin
 
	 
    case  (state)
      s0: if  (seriout==1 )
            next_state  =  s0;
    else
     next_state  =  s1;
      s1: if  (seriout==1 )
       next_state  =  s2;
        else next_state  =  s1;
     s2:next_state  =  s0; 
      
       
     endcase
	 
end
// output stage
//

always  @(state)
begin
case  (state)
s0:  out=low;
s1:  out=low;
s2:  out=hight;


default: out=low;

endcase
end

endmodule
