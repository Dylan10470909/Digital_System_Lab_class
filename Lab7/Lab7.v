module lab07 (clk,  reset, led);
//
input   clk, reset;    // reset signal:   enable: low
output  [7:0]led;    // led output with 8 bits

reg [7:0]led;   // define the led register with 8 bits
reg [4:0]counter_no;  
reg state;
//reg   [23:0]count;  // The count register is for dealy 
//
always @(posedge clk or negedge reset)    // at the rising edge 
begin
    if(~reset) begin  // the reset is low
         // inital setting, led=1
        counter_no=0;    
        led = 8'h01;
        state=0;
    end
    else  begin  // most of the time will enter this begin - end
        if(counter_no<2 && state==0) begin
			led = led << 1;// shift right one bit of the led rgister 
            if(led==8'h00)begin
                counter_no=counter_no+1;
                led = 8'h01;
			end
            if(counter_no==2) begin
                counter_no=0;
                state=1;
                led = 8'h80;
             end
        end
        
        if(counter_no<3&& state==1) begin
			led = led >> 1;  // shift right one bit of the led rgister
            if(led==0)begin
            counter_no=counter_no+1;
              led = 8'h80;
            end
            
            if(counter_no==3) begin;
                counter_no=0;
                state=0;
                led = 8'h01;
            end 
        end
    end   
 end

endmodule
