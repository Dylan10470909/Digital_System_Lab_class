// Start of main code
// 
module sevensegment(clk,rst,led, SSCom, DisOut);
input clk, rst;
output [3:0] led;
output [3:0] SSCom;
output [7:0] DisOut; // Output to seven segment
//
led       u1(clk, rst, led, SSCom);
hextoseg  u2(led, DisOut);

endmodule
//

//

module led(clk, rst, led, SSCom);
//
input   clk, rst;    // input to the led module
output  [3:0]led;    // led output with 8 bits
output  [3:0]SSCom;  // this is the com enable signal for seven segment
reg [3:0]led;  // define the led register with 8 bits
reg [3:0]SSCom;  // define the SSCom register
reg [23:0]count;  // The count register is for dealy
reg [4:0]count_no;
reg state;
//

always @(posedge clk )    // at the rising edge
begin
    state=0;
    if(rst)  // the rst is high
    begin  // most of the time will enter this begin - end
	//////////////up////////////
        if(count_no<3 && state==0)  begin // test for the delay
		   	if(count == 24'hEB8D80) begin
				count_no = count_no+1; // clear the count, re-start
				led = led + 1;   // shift right one bit of the led rgister
               
				if(count_no==3) begin
				    count=0;
					count_no=0;
					state=1;
                end
			end 
			else begin
                 count = count + 1;  // delay time  + 1
            end
		end
	//////down///////////
        if(count_no<2 && state==1) begin // test for the delay
			if(count == 24'hEB8D80) begin
                count_no = count_no+1; // clear the count, re-start
                led = led - 1;   // shift right one bit of the led rgister

                if(count_no==2) begin
				    count=0;
                    count_no=0;
                    state=0;
                end
			end 
		    else begin
                 count = count + 1;  // delay time  + 1
            end
        end
	end	
	 ////////////////////////
    else begin                   // rst =0 , initail setting
         count = 0;
         led = 4'h0;
         SSCom = 4'hE;   // disable the SSCom
    end
end

endmodule

//
//  HEX convert to seven segment
// 
//
module hextoseg(din, seven_seg);
input   [3:0]din;
output  [7:0] seven_seg;
reg [7:0] seven_seg;

//  dot h g f e d c b a
//  low:  led on
//hexadecimal code converter seven segment code
always @(din)
begin
 case (din)
  0:  seven_seg<=8'b11000000;
  1:  seven_seg<=8'b11111001;
  2:  seven_seg<=8'b10100100;
  3:  seven_seg<=8'b10110000;
  4:  seven_seg<=8'b10011001;
  5:  seven_seg<=8'b10010010;
  6:  seven_seg<=8'b10000011;
  7:  seven_seg<=8'b11111000;
  8:  seven_seg<=8'b10000000;
  9:  seven_seg<=8'b10011000;
  10: seven_seg<=8'b10001000;
  11: seven_seg<=8'b10000011;
  12: seven_seg<=8'b11000110;
  13: seven_seg<=8'b10100001;
  14: seven_seg<=8'b10000110;
  15: seven_seg<=8'b10001110;
 
 endcase
end
endmodule
