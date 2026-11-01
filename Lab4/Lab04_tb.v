// Code your design here
module lab04(In1, In2, In3, In4, out1);
// define of input and output
input In1, In2, In3, In4;
output out1;

// define of combinational function
assign  out1=
(In3&~In2&In1|~In4&~In2&In1|~In4&~In3&In2&~In1|In4&~In3&~In2&~In1);
// assign  o2= a | b;
//assign  o3= ~ a ;

endmodule