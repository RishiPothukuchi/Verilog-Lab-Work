module Lab6 (N, D, Q, clk, reset, Y, A, B, C);
input N, D, Q, clk, reset;
output Y, A, B, C;
reg [2:0] state, nextState;

parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

always @ (posedge clk, posedge reset)
	if(reset) state <= S0;
	else state <= nextState;

always @ (*)
	case(state)
	S0: if(N && ~D && ~Q) 			nextState = S1;
		 else if(~N && D && ~Q)		nextState = S2;
		 else if(~N && ~D && Q)		nextState = S0;
		 else								nextState = S0;
		 
	S1: if(N && ~D && ~Q) 			nextState = S2;
		 else if(~N && D && ~Q)		nextState = S3;
		 else if(~N && ~D && Q)		nextState = S0;
		 else								nextState = S0;
	
	S2: if(N && ~D && ~Q) 			nextState = S3;
		 else if(~N && D && ~Q)		nextState = S4;
		 else if(~N && ~D && Q)		nextState = S0;
		 else								nextState = S0;
		
	S3: if(N && ~D && ~Q) 			nextState = S4;
		 else if(~N && D && ~Q)		nextState = S0;
		 else if(~N && ~D && Q)		nextState = S0;
		 else								nextState = S0;
	
	S4: if(N && ~D && ~Q) 			nextState = S0;
		 else if(~N && D && ~Q)		nextState = S0;
		 else if(~N && ~D && Q)		nextState = S0;
		 else								nextState = S0;
	
	default: 							nextState = S0;
	endcase
	
	
assign Y = (nextState == S0);
assign A = (((state == S1) && Q) || ((state == S3) && Q) || ((state == S4) && D));
assign B = (((state == S2) && Q) || ((state == S3) && Q));
assign C = ((state == S4) && Q);

endmodule

