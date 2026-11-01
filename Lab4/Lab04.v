// Code your testbench here
// or browse Examples

// Verilog test

`timescale 1ns / 1ns

module lab04testbench;

// Inputs
    reg In1;
    reg In2;
    reg In3;
    reg In4;

// Output
    wire out1;

// Bidirs

// Instantiate the UUT, MSB In4
    lab04 UUT (
        .In1( In1 ),
        .In2( In2 ),
        .In3( In3 ),
        .In4( In4 ),
        .out1( out1 )
    );

// Initialize Inputs

initial
begin
In1=0; In2=0; In3=0 ; In4=0;
#20 In1=1; In2=0; In3=0 ; In4=0;
#20 In1=0; In2=1; In3=0 ; In4=0;
#20 In1=1; In2=1; In3=0 ; In4=0;
#20 In1=0; In2=0; In3=1 ; In4=0;
#20 In1=1; In2=0; In3=1 ; In4=0;
#20 In1=0; In2=1; In3=1 ; In4=0;
#20 In1=1; In2=1; In3=1 ; In4=0;
#20 In1=0; In2=0; In3=0 ; In4=1;
#20 In1=1; In2=0; In3=0 ; In4=1;
#20 In1=0; In2=1; In3=0 ; In4=1;
#20 In1=1; In2=1; In3=0 ; In4=1;
#20 In1=0; In2=0; In3=1 ; In4=1;
#20 In1=1; In2=0; In3=1 ; In4=1;
#20 In1=0; In2=1; In3=1 ; In4=1;
#20 In1=1; In2=1; In3=1 ; In4=1;

end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
end

endmodule