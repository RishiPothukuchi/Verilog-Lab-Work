module testVec_tb ();
	reg clk, reset, Ci, CoExp, PGExp, GGExp;
	reg [3:0] A, B, SumExp; 
	
	wire Co, PG, GG;
	wire [3:0] S;
	
	reg [31:0] vectornum, errors;
	reg [15:0] testvectors[10000:0];
	
	CLA4 dut(A, B, Ci, S, Co, PG, GG);

	always
		begin
		clk = 1; #5; clk = 0; #5;
		end
	initial
		begin
			$readmemb("C:/Users/rishi/SJSU/3rd Year (Spring Semester)/CMPE 125/Lab/Lab 5/Verilog Module/test_vectors.tv", testvectors);
			vectornum = 0; errors = 0;
			reset = 1; #1; reset = 0;
		end
	always @(posedge clk)
		begin
			#1; {A, B, Ci, SumExp, CoExp, PGExp, GGExp} = testvectors[vectornum];
		end
	
	always @(negedge clk)
		if (~reset) begin
			if (S !== SumExp || Co !== CoExp || PG != PGExp || GG != GGExp) begin
				$display("Error: inputs = A => %b, B => %b, Ci => %b", A, B, Ci);
				$display(" outputs = Sum => %b (%b expected), Co => %b (%b expected), PG => %b (%b expected), GG => %b (%b expected),", 
				S, SumExp, Co, CoExp, PG, PGExp, GG, GGExp);
				errors = errors + 1;
			end
			else begin
				$display("Success: inputs = A => %b, B => %b, Ci => %b", A, B, Ci);
				$display(" outputs = Sum => %b (%b expected), Co => %b (%b expected), PG => %b (%b expected), GG => %b (%b expected),", 
				S, SumExp, Co, CoExp, PG, PGExp, GG, GGExp);
			end
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 16'bx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
				$stop;
			end
		end
endmodule