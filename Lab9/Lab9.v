// Code your design here
module  state_machine(gry,clk,x,reset);
input  [1:0]  x; // input for cotrol 
output [2:0]  gry; // output led lights
input  clk,reset;
  reg [2:0]   gry;
parameter  Green=3'b100,Yellow=3'b010,Red=3'b001,black=3'b000;  // parameter for define the states
parameter  s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
reg  [2:0]  state;
reg  [2:0]  next_state;
//reg  [15:0]count1=0;
//reg  [15:0]count2=0;
reg  divclk=1;


reg [31:0] count=0;
always @(posedge clk)
begin
count=count+1;
//  divclk=count[0];
end

// Current sate
always  @(posedge clk or negedge reset)
begin
if  (~reset)
state  =  s0;
else
state  =  next_state;
end

// Next state

always  @(state  or  x )
begin
case  (state)
    s0: if  (x==2'b00  ||  x==2'b10)
            next_state  =  s0;
    else
     next_state  =  s1;
     s1: next_state  =  s3;
     //s2: next_state  =  s3;
     s3: next_state  =  s4;
      s4: if  (x==2'b10  ||  x==2'b00)
     next_state  =  s4;
     else
     next_state  =  s0;
     endcase
	 
end
// output stage
//

always  @(state)
begin
case  (state)
	s0:  gry=Green;
	s1:  gry=Yellow;
	//s2:  gry=black;
	s3:  gry=Yellow;
	s4:  gry=Red;
default: gry=black;

endcase
end

endmodule
