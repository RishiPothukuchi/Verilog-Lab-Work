module Lab8(q1, q2, a1, a2, d1, d2, we1, we2, clk1, clk2);
output[7:0] q1, q2;
input [7:0] d1, d2;
input [6:0] a1, a2;
input we1, we2, clk1, clk2;
reg [7:0] mem[127:0];
assign q1 = mem[a1];
assign q2 = mem[a2];
always @(posedge clk1, posedge clk2) begin
	if(clk1) begin
		if (we1) begin
			mem[a1] <= d1;
		end
	end
	if(clk2) begin
		if (we2) begin
			mem[a2] <= d2;
		end
	end


end
endmodule
