module full_sub_4(A,B,CIN,D,COUT);
 
	input[3:0] A;
	input[3:0] B;
	input COUT;
    output[5:0] D;
	output CIN;
	wire[1:0] D0,D1,D2,D3;

  function signed[1:0] SUB;
		//port declaration
		 input A,COUT,B;
		//internal node signals declaration
		 reg D,CIN;
		 
		 begin
			 D=A^B^COUT;
			 CIN=(~A&(B^COUT))|(B&COUT);
             SUB={CIN,D};
		 end
	 
	 endfunction
 
     assign D0=SUB(A[0],B[0],COUT);   
     assign D1=SUB(A[1],B[1],D0[1]); //第二位求和
     assign D2=SUB(A[2],B[2],D1[1]); //第三位求和
     assign D3=SUB(A[3],B[3],D2[1]); //第三位求和
	 
     assign D={D3[0],D2[0],D1[0],D0[0]};
     assign CIN=D3[1];
 
 endmodule
