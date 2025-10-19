module testVec_tb ();
	reg clk, reset, N, D, Q, YExp, AExp, BExp, CExp;
	wire Y, A, B, C;
	
	reg [31:0] vectornum, errors;
	reg [6:0] testvectors[10000:0];
	
	Lab6 dut(N, D, Q, clk, reset, Y, A, B, C);

	always
		begin
		clk = 1; #5; clk = 0; #5;
		end
	initial
		begin
			$readmemb("C:/Users/rishi/SJSU/3rd Year (Spring Semester)/CMPE 125/Lab/Lab 6/Verilog Module/test_vectors.tv", testvectors);
			vectornum = 0; errors = 0;
			reset = 1; #1; reset = 0;
		end
	always @(posedge clk)
		begin
			#1; {N, D, Q, YExp, AExp, BExp, CExp} = testvectors[vectornum];
		end
	
	always @(negedge clk)
		if (~reset) begin
			if (Y !== YExp || A !== AExp || B != BExp || C != CExp) begin
				$display("Error: inputs = N => %b, D => %b, Q => %b", N, D, Q);
				$display(" outputs = Y => %b (%b expected), A => %b (%b expected), B => %b (%b expected), C => %b (%b expected),", 
				Y, YExp, A, AExp, B, BExp, C, CExp);
				errors = errors + 1;
			end
			else begin
				$display("Success: inputs = N => %b, D => %b, Q => %b", N, D, Q);
				$display(" outputs = Y => %b (%b expected), A => %b (%b expected), B => %b (%b expected), C => %b (%b expected),", 
				Y, YExp, A, AExp, B, BExp, C, CExp);
			end
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 7'bx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
				$stop;
			end
		end
endmodule