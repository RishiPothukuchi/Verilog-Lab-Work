module self_check_tb ();
	reg [7:0] d1, d2;
	reg [6:0] a1, a2;
	reg we1, we2, clk1, clk2;
	
	wire [7:0] q1, q2; 


Lab8 dut(q1, q2, a1, a2, d1, d2, we1, we2, clk1, clk2);

initial begin
d1 = 8'b11111111; d2 = 8'b11110000; a1 = 7'b1011000; a2 = 7'b1111000; we1 = 1'b1; we2 = 1'b1; clk1 = 1'b1; clk2 = 1'b0; #10;
if (q1 !== 8'b11111111 || q2 !== q2) $display("Test 1) we1 = 1, we2 = 1, d1 = 11111111, d2 = 11110000 -> failed.");
else $display("Test 1) we1 = 1, we2 = 1, d1 = 11111111, d2 = 11110000 -> success.");

d1 = 8'b00010000; d2 = 8'b11110000; a1 = 7'b100101; a2 = 7'b1111101; we1 = 1'b0; we2 = 1'b0; clk1 = 1'b1; clk2 = 1'b1; #10;
if (q1 !== q1 || q2 !== q2) $display("Test 2) we1 = 0, we2 = 0, d1 = 00010000, d2 = 11110000 -> failed.");
else $display("Test 2) we1 = 0, we2 = 0, d1 = 00010000, d2 = 11110000 -> success.");

d1 = 8'b11010101; d2 = 8'b11110110; a1 = 7'b1000111; a2 = 7'b1001101; we1 = 1'b0; we2 = 1'b1; clk1 = 1'b0; clk2 = 1'b0; #10;
if (q1 !== q1 || q2 !== q2) $display("Test 3) we1 = 0, we2 = 1, d1 = 11010101, d2 = 11110110 -> failed.");
else $display("Test 3) we1 = 0, we2 = 1, d1 = 11010101, d2 = 11110110 -> success.");

d1 = 8'b11000111; d2 = 8'b11010110; a1 = 7'b1101011; a2 = 7'b0001111; we1 = 1'b1; we2 = 1'b1; clk1 = 1'b1; clk2 = 1'b1; #10;
if (q1 !== 8'b11000111 || q2 !== 8'b11010110) $display("Test 4) we1 = 1, we2 = 1, d1 = 11000111, d2 = 11010110 -> failed.");
else $display("Test 4) we1 = 1, we2 = 1, d1 = 11000111, d2 = 11010110 -> success.");

end
endmodule
