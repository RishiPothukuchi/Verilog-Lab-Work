module Lab7(A, B, F, Y, Overflow, Zero);
input [31:0] A, B;
input [2:0] F;
output reg [31:0] Y;
output Overflow, Zero;

wire [31:0] S, Bout;

assign Bout = F[2] ? ~B : B;
assign S = A + Bout + F[2];

always @ (*)
	case (F[1:0])
		2'b00: Y = A & Bout;
		2'b01: Y = A | Bout;
		2'b10: Y = S;
		2'b11: Y = S[31];
	endcase


//assign Overflow = (~A[31] && ~B[31] && Y[31]) || (A[31] && B[31] && ~Y[31]);
assign Overflow = ((~F[2] && F[1] && ~F[0] && ((~A[31] && ~B[31] && S[31]) || (A[31] && B[31] && ~S[31])))
						||(F[2] && F[1] && ~F[0] && ((A[31] && ~B[31] && ~S[31]) || (~A[31] && B[31] && S[31]))));
assign Zero = (Y == 32'b0);

endmodule

