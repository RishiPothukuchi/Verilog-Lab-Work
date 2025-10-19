module CLA4(A, B, Ci, S, Co, PG, GG);

input Ci; 
input [3:0] A, B;

output Co, PG, GG; 
output [3:0] S;

wire [3:1] C;
wire [3:0] G, P;

GPFullAdder Adder0(A[0], B[0], Ci, G[0], P[0], S[0]);
GPFullAdder Adder1(A[1], B[1], C[1], G[1], P[1], S[1]);
GPFullAdder Adder2(A[2], B[2], C[2], G[2], P[2], S[2]);
GPFullAdder Adder3(A[3], B[3], C[3], G[3], P[3], S[3]);

CLALogic Logic(G[3:0], P[3:0], Ci, C[3:1], Co, PG, GG);


endmodule


module GPFullAdder (Ai, Bi, Cin, G, P, Sum);

input Ai, Bi, Cin;
output G, P, Sum;

xor G1(P, Ai, Bi);
xor G2(Sum, P, Cin);
and G3(G, Ai, Bi);

endmodule



module CLALogic(G, P, Ci, C, Co, PG, GG);

input Ci; 
input [3:0] G, P;

output Co, PG, GG;
output [3:1] C;



wire C0AndP0, C1AndP1, C2AndP2,P3G2, P3P2G1, P3P2P1G0;


and G1(C0AndP0, P[0], Ci);
or G2(C[1], C0AndP0, G[0]);

and G3(C1AndP1, P[1], C[1]);
or G4(C[2], C1AndP1, G[1]);

and G5(C2AndP2, P[2], C[2]);
or G6(C[3], C2AndP2, G[2]);


and G7(PG, P[3], P[2], P[1], Ci);


and G8(P3G2, P[3], G[2]);
and G9(P3P2G1, P[3], P[2], G[1]);
and G10(P3P2P1G0, P[3], P[2], P[1], G[0]);
or G11(GG, G[3], P3G2, P3P2G1, P3P2P1G0);


or G12(Co, GG, PG);

endmodule



