module self_check_tb ();
	reg [7:0] d;
	reg [6:0] a;
	reg we, clk;
	
	wire [7:0] q; 


Lab8 dut(q, a, d, we, clk);
initial begin
d = 8'h00;
a = 7'h00;
we = 1'b0;
clk = 1'b0;

#10 a = 7'h01; d = 8'hAA; we = 1'b1; #10;
#10 a = 7'h01; we = 1'b0; #10
#10 a = 7'h02; d = 8'hBB; we = 1'b1; #10; 
#10 a = 7'h02; we = 1'b0; #10;

	#10 $finish;
end

	always #5 clk = ~clk;

	endmodule