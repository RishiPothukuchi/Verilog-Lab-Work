module testbench;
    reg [7:0] d1, d2;
    reg [6:0] a1, a2;
    reg we1, we2, clk;
    wire [7:0] q1, q2;

    Lab8 dut(.q1(q1), .q2(q2), .d1(d1), .d2(d2), .a1(a1), .a2(a2), .we1(we1), .we2(we2), .clk(clk));

    initial begin

        d1 = 8'h00; d2 = 8'h00;
        a1 = 7'h00; a2 = 7'h00;
        we1 = 1'b0; we2 = 1'b0;
        clk = 1'b0;

        #10 a1 = 7'h01; d1 = 8'hAA; we1 = 1'b1; #10; 
        #10 a1 = 7'h01; we1 = 1'b0; #10; 
        #10 a2 = 7'h02; d2 = 8'hBB; we2 = 1'b1; #10; 
        #10 a2 = 7'h02; we2 = 1'b0; #10; 

        #10 $finish;
    end

    always #5 clk = ~clk;

endmodule