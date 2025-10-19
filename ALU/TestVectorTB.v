module testVec_tb ();
	reg clk, reset, OverflowExp, ZeroExp;
	reg [31:0] A, B;
	reg [2:0] F;
	reg [31:0] YExp;
	
	wire [31:0] Y; 
	wire Overflow, Zero;
	
	reg [31:0] vectornum, errors;
	reg [100:0] testvectors[10000:0];
	
	Lab7 dut(A, B, F, Y, Overflow, Zero);

	always
		begin
		clk = 1; #5; clk = 0; #5;
		end
	initial
		begin
			$readmemb("C:/Users/rishi/SJSU/3rd Year (Spring Semester)/CMPE 125/Lab/Lab 7/Verilog Module/test_vectors-4.tv", testvectors);
			vectornum = 0; errors = 0;
			reset = 1; #1; reset = 0;
		end
	always @(posedge clk)
		begin
			#1; {A, B, F, YExp, OverflowExp, ZeroExp} = testvectors[vectornum];
		end
	
	always @(negedge clk)
		if (~reset) begin
			if (Y !== YExp || Overflow !== OverflowExp || Zero != ZeroExp) begin
				$display("Error: inputs = A => %b, B => %b, F => %b", A, B, F);
				$display(" outputs = Y => %b (%b expected), Overflow => %b (%b expected), Zero => %b (%b expected)", Y, YExp, Overflow, OverflowExp, Zero, ZeroExp);
				errors = errors + 1;
			end
			else begin
				$display("Success: inputs = A => %b, B => %b, F => %b", A, B, F);
				$display(" outputs = Y => %b (%b expected), Overflow => %b (%b expected), Zero => %b (%b expected)", Y, YExp, Overflow, OverflowExp, Zero, ZeroExp);
			end
			vectornum = vectornum + 1;
			if (testvectors[vectornum] === 101'bx) begin
				$display("%d tests completed with %d errors", vectornum, errors);
				$stop;
			end
		end
endmodule